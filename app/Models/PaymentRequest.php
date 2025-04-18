<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use App\Models\PaymentMethod;
use App\Models\Chapter;
use App\Models\User;
use App\Models\PaymentOrder;
use App\Models\PaymentPackageOrder;

class PaymentRequest extends Model
{
    use HasFactory;

    protected $fillable = [
        'payment_method_id',
        'transaction_id',
        'user_id',
        'price',
        'image',
        'module',
        'state',
        'rejected_reason'
    ];

    public function package_order(){
        return $this->hasMany(PaymentPackageOrder::class, 'payment_request_id');
    }

    public function chapters_order(){
        return $this->hasMany(PaymentOrder::class, 'payment_request_id');
    }

    public function payment_method(){
        return $this->belongsTo(PaymentMethod::class);
    }

    public function method(){
        return $this->belongsTo(PaymentMethod::class, 'payment_method_id');
    }

    public function user(){
        return $this->belongsTo(User::class, 'user_id');
    }

    public function order(){
        return $this->belongsToMany(Chapter::class, 'payment_orders');
    }
    public function getUpdatedAtAttribute($date){
    return date('d-m-Y',strtotime($date));
    }
}
