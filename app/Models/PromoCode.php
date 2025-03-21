<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use App\Models\PromoChapter;
use App\Models\PromoPackage;
use App\Models\PromoCourse;
use App\Models\PromoUser;

class PromoCode extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'starts',
        'ends',
        'num_usage',
        'code',
        'discount',
    ];

    public function course()
    {
        return $this->hasMany(PromoCourse::class, 'promo_id');
    }

    public function chapter()
    {
        return $this->hasMany(PromoChapter::class, 'promo_id');
    }

    public function package()
    {
        return $this->hasMany(PromoPackage::class, 'promo_id');
    }

    public function users()
    {
        return $this->hasMany(PromoUser::class, 'promo_id');
    }
}
