<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use App\Models\User;
use App\Models\Lesson;
use App\Models\SessionGroup;
use App\Models\SessionDay;
use App\Models\Chapter;
use App\Models\SessionAttendance;

class Session extends Model
{
    use HasFactory;
    
    protected $fillable = [
        'date', 
        'name',
        'link', 
        'material_link',
        'from', 
        'to', 
        'lesson_id', 
        'teacher_id', 
        'group_id',
        'type', 
        'duration', 
        'price',
        'access_dayes',
        'repeat',
    ];
 
    public function lesson()
    {
        return $this->belongsTo(Lesson::class, 'lesson_id')->with('chapterMyLive');
    }
 
    public function teacher()
    {
        return $this->belongsTo(User::class, 'teacher_id');
    }
 
    public function group()
    {
        return $this->belongsTo(SessionGroup::class, 'group_id');
    }
 
    public function users()
    {
        return $this->belongsToMany(User::class, 'session_students');
    }
 
    public function user_attend()
    {
        return $this->belongsToMany(User::class, 'session_attendance')
        ->where('user_id', auth()->user()->id);
    }
 
    public function stu_attend()
    {
        return $this->hasMany(SessionAttendance::class, 'session_id')
        ->where('user_id', auth()->user()->id);
    }
 
    public function users_attend()
    {
        return $this->belongsToMany(User::class, 'session_attendance');
    }
    public function category_session(){
        return $this->belongsToMany(Lesson::class, 'lesson_id')
            ->with('category')
            ->with('lesson')
            ->with('chapter');
    }

    public function days(){
        return $this->hasMany(SessionDay::class, 'session_id');
    } 


}
