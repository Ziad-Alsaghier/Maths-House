<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ReportQuestionList extends Model
{
    use HasFactory;
    
    protected $fillable = [
        'list',
    ];
}
