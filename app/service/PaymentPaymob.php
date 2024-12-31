<?php

namespace App\service;

use App\Http\Requests\payment\PaymentPaymobRequest;
use App\service\order\placeOrder;
use GuzzleHttp\Psr7\Request;
use Illuminate\Support\Facades\Http;

trait PaymentPaymob
{
    // This Trait About Srvic Payment Paymob
    use placeOrder;

   public function credit($user,$payment_method,$course,$price,$module,$commision = Null)
    {
        $data = [
            'paymentMethod'=>$payment_method,
            'items'=>['course'=>$course],
            'amount'=>$price,
            'user'=>$user,
        ];
        //this fucntion that send all below function data to paymob and use it for routes;
         $user = auth()->user();
         $tokens = $this->getToken();
          $order = $this->createOrder( $data , $tokens, $user,$module,$commision);
         $amount_cents = $order->amount_cents;
        $paymentToken = $this->getPaymentToken($user, $amount_cents, $order, $tokens);
        $items = $order;
        //    $items = $order['order'];
        $paymentLink = "https://accept.paymob.com/api/acceptance/iframes/" . env('PAYMOB_IFRAME_ID') . '?payment_token=' . $paymentToken;
        //  redirect($paymentLink);
        return redirect($paymentLink);
        // return Redirect::away('https://accept.paymob.com/api/acceptance/iframes/'.env('PAYMOB_IFRAME_ID').'?payment_token='.$paymentToken);
    }
     public function getToken() {
     //this function takes api key from env.file and get token from paymob accept
     $response = Http::post('https://accept.paymob.com/api/auth/tokens', [
     'api_key' => env('PAYMOB_API_KEY')
     ]);
     return $response->object()->token;
     }
      public function createOrder( $data,$tokens,$user,$module,$commision) {
        
        //This function takes last step token and send new order to paymob dashboard
        // in This Function We Make Order For Returned Token 
        // $amount = new Checkoutshow; here you add your checkout controller
        // $total = $amount->totalProductAmount(); total amount function from checkout controller
        //here we add example for test only
       $placeOrder = $this->placeOrder($data,$user,$module,$commision);
        if($placeOrder ){
            $order = $placeOrder['orderItems'];
            $items = $order['items'];
            $total = $order['total'];
            $payment = $placeOrder['payment'];
        }
    
        // $items = [
        //     [ "name"=> "ASC1515",
        //         "amount_cents"=> "500000",
        //         "description"=> "Smart Watch",
        //         "quantity"=> "1"
        //     ],
        //     [
        //         "name"=> "ERT6565",
        //         "amount_cents"=> "200000",
        //         "description"=> "Power Bank",
        //         "quantity"=> "1"
        //     ]
        // ];
        // $data = $items;
          $data = [
            "auth_token" =>   $tokens,
            "delivery_needed" =>"false",
            "amount_cents"=> $total * 100 ,
            "currency"=> "EGP",
            "items"=> $items,
            "payment"=> $payment,
        ];
         
        $response = Http::post('https://accept.paymob.com/api/ecommerce/orders', $data);
         $response = $response->object();
        $paymentTransaction =  $response->id;
        $payment->update(['transaction_id' => $paymentTransaction]); // Make Transaction For Payment Request
       return  $response;
    }

       public function getPaymentToken($user,$total_amount,$order, $token)
    {
        //this function to add details to paymob order dashboard and you can fill this data from your Model Class as below
        // $amountt = new Checkoutshow;
        // $totall = $amountt->totalProductAmount();
        // $todayDate = Carbon::now();
        // $dataa = Order::where('user_id',Auth::user()->id)->whereDate('created_at',$todayDate)->orderBy('created_at','desc')->first();

        //we just added dummy data for test
        //all data we fill is required for paymob
        $billingData = [
            "apartment" => '45', //example $dataa->appartment
            "email" => $user->email, //example $dataa->email
            "floor" => '7',
            "first_name" => $user->name,
            "street" => "NA",
            "building" => "NA",
            "phone_number" => $user->phone,
            "shipping_method" => "NA",
            "postal_code" => "NA",
            "city" => "Alexandria",
            "country" => "Egypt",
            "last_name" => "mohamed",
            "state" => "0"
        ];
        
         $data = [
            "auth_token" => $token,
            "amount_cents" => $total_amount,
            "expiration" => 3600,
            "order_id" => $order->id, // this order id created by paymob
            "billing_data" => $billingData,
            "currency" => "EGP",
            "integration_id" => env('PAYMOB_INTEGRATION_ID')
        ];
         $response = Http::post('https://accept.paymob.com/api/acceptance/payment_keys', $data);
        return $response->object()->token;
    }
    
    private function generateUniqueTransactionId($payment_id,$order_id)
    {
            $payment = $this->payment->find($payment_id);
        $updatePayment = $payment->update(['transaction_id' => $order_id]);
        return $payment;
    }

    
}
