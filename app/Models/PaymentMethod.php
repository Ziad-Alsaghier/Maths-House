<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PaymentMethod extends Model
{
    use HasFactory;

    protected $table = 'payment_method';

    protected $fillable = [
        'payment',
        'description',
        'logo',
        'statue',
    ];


     public function getCreatedAtAttribute($date){
     return date('d-m-Y',strtotime($date));
     }

       public function getUpdatedAtAttribute($date){
       return date('d-m-Y',strtotime($date));
       }
}
