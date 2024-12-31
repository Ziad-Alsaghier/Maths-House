<?php

namespace App\service\order;

use App\Models\Chapter;
use App\Models\Payment;
use App\Models\Commission;
use App\service\ExpireDate;
use App\Models\PaymentRequest;
use App\Models\AffilateRequest;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Http\Exceptions\HttpResponseException;

trait placeOrder
{
    // This Traite About Place Order
    protected $paymentRequest = ['payment_method_id', 'user_id', 'payment', 'price'];
    protected $orderRequest = ['user_id', 'cart'];
    protected $priceCycle;
    public function __construct(
        private PaymentRequest $payment,
        private Chapter $chapter,
    ) {}

    public function placeOrder($data, $user, $module, $commision)
    {
       
        //   User Data
        $user_id = $user->id; // User ID
        $newPayment['user_id'] = $user_id;
        //   User Data

        // Start Make Payment
        $data;
        $orderItems = $data['items']; // Items Can be [ Chapters | Course | Package ]
        $price = $data['amount']; // Get Course Or Chapter or Package Prices
        $paymentRequest = $data['paymentMethod'];
        $paymentRequest->first();
        $newPayment = [
            'payment_method_id' => $paymentRequest->id,
            'module' => $module,
            'price' => $price,
            'state' => 'inprogress',
            'user_id' => $user_id,
        ];

        // Start Make New Payment Request  

        try {
            $payment = $this->payment->create($newPayment); // Start Make Payment
            //  Affiliate Commission
            if (!empty(Cookie::get('affilate'))) {
                $commision = 0;
                $commision = Commission::where('name', 'Chapter')
                    ->where('user_id', floatval(Cookie::get('affilate')))
                    ->where('state', 1)
                    ->first();
                $commision = empty($commision) ? 0 : $commision->precentage;
                $price = $price * $commision / 100;
                AffilateRequest::create([
                    'affilate_id' => floatval(Cookie::get('affilate')),
                    'service' => $module,
                    'earned' => $commision,
                    'payment_req_id' => $payment->id
                ]);
            }
            //  Affiliate Commission
        } catch (\Throwable $th) {
            throw new HttpResponseException(response()->json(['error' => 'Payment processing failed'], 500));
        }
        // End Make Payment

        // Start Make Order For Payment

        try {
            $cart = $orderItems ?? null; // Check Cart
            if (isset($cart['course'])) {
                    $order =  $this->createOrdersForItems($orderItems, $payment,$price,$module);

                // Array to store created orders for response
            }
        } catch (\Throwable $th) {
            throw new HttpResponseException(response()->json(['error' => 'Order processing failed'], 500));
            
        }
        
        return [
            'payment' => $payment,
            'orderItems' => $order,
        ];
    }
    public function courseDuration($course, $price)
    {
        foreach ($course->prices as $item) {
            if ($item->price == $price) {
                $duration = $item->duration;
                return $duration;
            }
        }
        return false;
    }


    private function createOrdersForItems($orderItems, $payment,$price,$service)
    {
 try {
            $cart = $orderItems ?? null; // Check Cart
            $orderData = []; // Array to store the data to return

            if (isset($cart['course'])) {
                $course = $cart['course'];

                // Retrieve chapters related to the course
                $chapters = $this->chapter->where('course_id', $course->id)->get();

                // Calculate duration
                $duration = $this->courseDuration($course, $price);

                // Iterate through chapters and create payment orders
                foreach ($chapters as $chapter) {
                    $chapterOrder = $chapter->paymentOrder()->create([
                        'payment_request_id' => $payment->id,
                        'chapter_id' => $chapter->id,
                        'duration' => $duration,
                        'state' => 0
                    ]);
                    // Collect data for response
                    $orderData[] = [
                        'name' => $chapter->chapter_name,
                        'amount_cents' => $price , // Assuming $price is per chapter
                        'description' =>"Total Price Is $price And Services Is $service",
                        'quantity' => 1, // Assuming quantity is 1 per chapter
                    ];
                }

                return [
                    'items'=>$orderData
                    ,'total'=>floatval($price)
                ]; 
             
            }

            return response()->json(['message' => 'No course found in the cart.'], 400);

        } catch (\Throwable $th) {
            // Log the error for debugging purposes
            Log::error('Order processing failed', ['error' => $th->getMessage()]);

            throw new HttpResponseException(response()->json(['error' => 'Order processing failed'], 500));
        }
    }



    public function payment_approve($payment)
    {
        if ($payment) {
            $payment->update(['status' => 'approved']);
            return true;
        }
        return false;
    }
    public function order_success($payment)
    {
        $payment_approved = $this->payment_approve($payment);
        // Retrieve orders related to the payment
        $orders = $payment->orders;
        $user = $payment->user;
        // Collect unique IDs for batch fetching
        $domainIds = $orders->whereNotNull('domain_id')->pluck('domain_id', 'price_cycle')->unique();
        $extraIds = $orders->whereNotNull('extra_id')->pluck('extra_id', 'price_cycle')->unique();
        $planIds = $orders->whereNotNull('plan_id')->pluck('plan_id')->unique();
        $plan_price_cycle = $orders->whereNotNull('price_cycle')->pluck('price_cycle')->unique();
        // Approved Domains
        if ($domainIds->isNotEmpty()) {
            $date = now();
            $renueDate = $date->addYear();

            $this->domain->whereIn('id', $domainIds)->update(['price_status' => true, 'renewdate' => $renueDate]);
        }
        if ($planIds->isNotEmpty()) {
            $expireDate = $this->getExpireDateTime($plan_price_cycle, now());
            $packate_cycle = $this->package_cycle($plan_price_cycle, now());
            foreach ($planIds as $key => $plan_id) {
                $user->update([
                    'plan_id' => $plan_id,
                    'expire_date' => $expireDate,
                    'package' => $packate_cycle,
                ]);
            }
        }
        // Update Order And Put Expire Date
        foreach ($orders as $order) {
            $priceCycle = $order->price_cycle;
            $expireDate = $this->getOrderDateExpire($priceCycle, now());
            $order->update(['expire_date' => $expireDate]);
        }
        // End Approved Domains   
        // Fetch all required services in batch only if IDs are present
        $domains = $domainIds->isNotEmpty() ? $this->domain->whereIn('id', $domainIds)->get()->keyBy('id') : collect();
        $extras = $extraIds->isNotEmpty() ? $this->extra->whereIn('id', $extraIds)->get()->keyBy('id') : collect();
        $plans = $planIds->isNotEmpty() ? $this->plan->whereIn('id', $planIds)->get()->keyBy('id') :
            collect();
        $createdOrders = $orders->map(function ($order) use ($domains, $extras, $plans) {
            $newService = [];

            if ($order->domain_id !== null) {
                $newService['domain'] = $domains->find($order->domain_id);
            }
            if ($order->extra_id !== null) {
                $newService['extra'] = $extras->find($order->extra_id);
            }
            if ($order->plan_id !== null) {
                $newService['plan'] = $plans->find($order->plan_id);
            }

            return $newService;
        });

        return $orders;
    }
}
