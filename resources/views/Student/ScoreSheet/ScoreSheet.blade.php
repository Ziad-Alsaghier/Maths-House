
@php
    $page_name = 'Question History';
    $chapter_name = null;
    $ch_id = [];
@endphp
@section('title','Chapters')
@include('Student.inc.header')
@include('Student.inc.menu')
@extends('Student.inc.nav')

@section('page_content')

<table class="table">
    <thead>
        <th style="border: 1px solid #ccc"></th>
        <th style="border: 1px solid #ccc"></th>
        <th colspan="4" style="border: 1px solid #ccc">Quiz 1</th> 
        <th colspan="4" style="border: 1px solid #ccc">Quiz 2</th>
        <th colspan="4" style="border: 1px solid #ccc">Quiz 3</th>
        <th colspan="4" style="border: 1px solid #ccc">Quiz 4</th>
        <th colspan="4" style="border: 1px solid #ccc">Quiz 5</th>
        <th colspan="4" style="border: 1px solid #ccc">Quiz 6</th>
    </thead>

    <tbody>
        <tr>
            <td style="border: 1px solid #ccc">Chapter</td>
            <td style="border: 1px solid #ccc">Lesson</td>
            <td style="border: 1px solid #ccc">Score</td>
            <td style="border: 1px solid #ccc">Time</td>
            <td style="border: 1px solid #ccc">Date</td>
            <td style="border: 1px solid #ccc">View Mistake</td>
            <td style="border: 1px solid #ccc">Report</td>
            <td style="border: 1px solid #ccc">Score</td>
            <td style="border: 1px solid #ccc">Time</td>
            <td style="border: 1px solid #ccc">Date</td>
            <td style="border: 1px solid #ccc">View Mistake</td>
            <td style="border: 1px solid #ccc">Report</td>
            <td style="border: 1px solid #ccc">Score</td>
            <td style="border: 1px solid #ccc">Time</td>
            <td style="border: 1px solid #ccc">Date</td>
            <td style="border: 1px solid #ccc">View Mistake</td>
            <td style="border: 1px solid #ccc">Report</td>
            <td style="border: 1px solid #ccc">Score</td>
            <td style="border: 1px solid #ccc">Time</td>
            <td style="border: 1px solid #ccc">Date</td>
            <td style="border: 1px solid #ccc">View Mistake</td>
            <td style="border: 1px solid #ccc">Report</td>
            <td style="border: 1px solid #ccc">Score</td>
            <td style="border: 1px solid #ccc">Time</td>
            <td style="border: 1px solid #ccc">Date</td>
            <td style="border: 1px solid #ccc">View Mistake</td>
            <td style="border: 1px solid #ccc">Report</td>
            <td style="border: 1px solid #ccc">Score</td>
            <td style="border: 1px solid #ccc">Time</td>
            <td style="border: 1px solid #ccc">Date</td>
            <td style="border: 1px solid #ccc">View Mistake</td>
            <td style="border: 1px solid #ccc">Report</td>
        </tr>

        @foreach ( $payment_req as $item )
            @foreach ($item->chapters_order as $element)
                    @if ( !in_array($element->chapter->id, $ch_id) && $element->chapter->chapter_name != $chapter_name )
                 
                    <tr>
                        <td rowspan="{{count($element->chapter->lessons)}}" style="border: 1px solid #ccc">{{$element->chapter->chapter_name}}</td>
                    @endif
                    @if ( !in_array($element->chapter->id, $ch_id) )
                        
                    @foreach ( $element->chapter->lessons as $value )
                        <td style="border: 1px solid #ccc" raw="2">{{$value->lesson_name}}</td>
                        @foreach ( $value->quizze as $quiz )
                            @php
                                $student_quizzes = DB::table('student_quizzes')
                                ->where('student_id', auth()->user()->id)
                                ->where('quizze_id', $quiz->id)
                                ->orderByDesc('id')
                                ->first();
                            @endphp
                            <td style="border: 1px solid #ccc">{{@$student_quizzes->score}}</td>
                            <td style="border: 1px solid #ccc">{{@$student_quizzes->time}}</td>
                            @if( !empty($student_quizzes->id) )
                            <td style="border: 1px solid #ccc">{{\Carbon\Carbon::parse($student_quizzes->created_at)->format('d-m-Y')}}</td>
                            @endif
                            <td style="border: 1px solid #ccc">
                                @if( !empty($student_quizzes->id) )
                                <a href="{{route('quizze_mistakes', ['id' => $student_quizzes->id])}}" class="btn btn-primary mistake_btn">
                                    View Mistakes
                                </a>
                                @endif
                            </td>
                            <td style="border: 1px solid #ccc">
                                @if( !empty($student_quizzes->id) )
                                <a href="{{route('quizze_report', ['id' => $student_quizzes->id])}}" class="btn btn-primary mistake_btn">
                                    Report
                                </a>
                                @endif
                            </td>
                        @endforeach
                    </tr>
                    @endforeach
                    @endif  

                @php
                $chapter_name = null;
                $ch_id[] = $element->chapter->id;
                @endphp
            @endforeach
        @endforeach
    </tbody>
</table>


@endsection

@include('Student.inc.footer')