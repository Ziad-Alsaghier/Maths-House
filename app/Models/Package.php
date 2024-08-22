<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use App\Models\User;

class Package extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'module',
        'course_id',
        'number',
        'price',
        'duration',
    ];
    
    public function users()
    {
        return $this->belongsToMany(User::class, 'user_packages');
    }

}
