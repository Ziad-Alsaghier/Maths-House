<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use App\Models\Question;

class StudentQuizzeMistake extends Model
{
    use HasFactory;
    
    protected $fillable = [
        'question_id', 
        'student_quizze_id',  
    ];

    public function question()
    {
        return $this->belongsTo(Question::class, 'question_id');
    }
}
