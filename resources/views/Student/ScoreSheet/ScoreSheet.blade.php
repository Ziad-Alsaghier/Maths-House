@php
    $page_name = 'Question History';
    $chapter_name = null;
    $ch_id = [];
@endphp
@section('title', 'Chapters')
@include('Student.inc.header')
@include('Student.inc.menu')
@extends('Student.inc.nav')

@section('page_content')

    <style>
        .table {
            background: #fff !important;
        }

        .table td {
            font-weight: 600;
            color: #787878 !important;
        }

        .selCourse,
        .selChapter,
        .selLesson {
            background-color: transparent !important;
            color: #CF202F !important;
            cursor: pointer;
        }

        .selCourse:focus,
        .selChapter:focus,
        .selLesson:focus {
            color: #CF202F !important;
            background-color: transparent !important;
            border-color: none !important;
            outline: 0;
            box-shadow: none !important;
        }

        .conBtn {
            width: 100% !important;
            background: #FEF5F3 !important;
            color: #CF202F !important;
            font-size: 1.2rem;
            font-weight: 600;
            padding: 5px 20px;
            border: none;
            outline: none;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
        }

        .conBtn:hover {
            background: #CF202F !important;
            color: #FEF5F3 !important;
        }
    </style>
    <div class="col-12 mt-3 d-flex flex-column align-items-center gap-4">
        <div class="col-12 d-flex align-items-center justify-content-center">
            <span style="font-size: 1.6rem;font-weight: 600;color: #CF202F">Score Sheet</span>
        </div>
        <div class="col-12 d-flex align-items-center justify-content-start gap-2">
            <span class="col-5" style="color: #787878;font-size: 1.4rem;font-weight: 600">Student: Amal Mansour</span>
            <span class="col-6" style="color: #787878;font-size: 1.4rem;font-weight: 600">Course: SAT</span>
        </div>
        <div class="col-12 d-flex align-items-center justify-content-start gap-5">

            <select class="selCourse mx-2"
                style="width: 20%;font-size: 1.4rem;font-weight: 600; border: none;border-radius: 0;" name="Course_Course"
                id="selCourse">
                <option selected disabled>Select Course ...</option>
                @foreach ( $courses as $item )
                    <option value="{{$item->id}}">{{$item->course_name}}</option>
                @endforeach
            </select>
            <select class="selChapter mx-2"
                style="width: 20%;font-size: 1.4rem;font-weight: 600; border: none;border-radius: 0;" name="Course_Chapter"
                id="selChapter">
                <option value="">Select Chapter ...</option>
            </select>
            <select class="selLesson mx-2"
                style="width: 20%;font-size: 1.4rem;font-weight: 600; border: none;border-radius: 0;" name="Course_Lesson"
                id="selLesson">
                <option value="">Select Lesson ...</option>
            </select>
            <input type="hidden" value="{{$courses}}" class="course_data" />
            <input type="hidden" value="{{$chapters}}" class="chapter_data" />
            <input type="hidden" value="{{$lessons}}" class="lesson_data" />
        </div>
        <div class="col-12">
            <div class="col-12 d-flex align-items-center justify-content-center">
                <table class="table col-12  mt-2">
                    <thead>
                        <tr>
                            <th class="col-2" style="border-top: none !important; color: #CF202F;font-size: 1.1rem; "
                                scope="col">QUIZZES </th>
                            <th class="col-2" style="border-top: none !important; color: #CF202F;font-size: 1.1rem; "
                                scope="col">score </th>
                            <th class="col-2" style="border-top: none !important; color: #CF202F;font-size: 1.1rem; "
                                scope="col">time</th>
                            <th class="col-2" style="border-top: none !important; color: #CF202F;font-size: 1.1rem; "
                                scope="col">Date</th>
                            <th class="col-3" style="border-top: none !important; color: #CF202F;font-size: 1.1rem; "
                                scope="col">Mistakes</th>
                            <th class="col-3" style="border-top: none !important; color: #CF202F;font-size: 1.1rem; "
                                scope="col">Reports</th>
                        </tr>
                    </thead>
                    <tbody id="myTable">
                        <tr>
                            <td style="padding-top: 15px !important">QUIZ 1</td>
                            <td style="padding-top: 15px !important">20/16</td>
                            <td style="padding-top: 15px !important">20M</td>
                            <td style="padding-top: 15px !important">16/6/2024</td>
                            <td><a class="conBtn" href="">View Mistakes</a></td>
                            <td><a class="conBtn" href="">Report</a></td>
                        </tr>
                        <tr>
                            <td style="padding-top: 15px !important">QUIZ 1</td>
                            <td style="padding-top: 15px !important">20/16</td>
                            <td style="padding-top: 15px !important">20M</td>
                            <td style="padding-top: 15px !important">16/6/2024</td>
                            <td><a class="conBtn" href="">View Mistakes</a></td>
                            <td><a class="conBtn" href="">Report</a></td>
                        </tr>
                        <tr>
                            <td style="padding-top: 15px !important">QUIZ 1</td>
                            <td style="padding-top: 15px !important">20/16</td>
                            <td style="padding-top: 15px !important">20M</td>
                            <td style="padding-top: 15px !important">16/6/2024</td>
                            <td><a class="conBtn" href="">View Mistakes</a></td>
                            <td><a class="conBtn" href="">Report</a></td>
                        </tr>
                        <tr>
                            <td style="padding-top: 15px !important">QUIZ 1</td>
                            <td style="padding-top: 15px !important">20/16</td>
                            <td style="padding-top: 15px !important">20M</td>
                            <td style="padding-top: 15px !important">16/6/2024</td>
                            <td><a class="conBtn" href="">View Mistakes</a></td>
                            <td><a class="conBtn" href="">Report</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    {{-- <table class="table">
    <thead>
        <th style="border: 1px solid #ccc"></th>
        <th style="border: 1px solid #ccc"></th>
        <th colspan="5" style="border: 1px solid #ccc">Quiz 1</th> 
        <th colspan="5" style="border: 1px solid #ccc">Quiz 2</th>
        <th colspan="5" style="border: 1px solid #ccc">Quiz 3</th>
        <th colspan="5" style="border: 1px solid #ccc">Quiz 4</th>
        <th colspan="5" style="border: 1px solid #ccc">Quiz 5</th>
        <th colspan="5" style="border: 1px solid #ccc">Quiz 6</th>
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

        @foreach ($payment_req as $item)
            @foreach ($item->chapters_order as $element)
                    @if (!in_array($element->chapter->id, $ch_id) && $element->chapter->chapter_name != $chapter_name)
                 
                    <tr>
                        <td rowspan="{{count($element->chapter->lessons)}}" style="border: 1px solid #ccc">{{$element->chapter->chapter_name}}</td>
                    @endif
                    @if (!in_array($element->chapter->id, $ch_id))
                        
                    @foreach ($element->chapter->lessons as $value)
                        <td style="border: 1px solid #ccc" raw="2">{{$value->lesson_name}}</td>
                        @foreach ($value->quizze as $quiz)
                            @php
                                $student_quizzes = DB::table('student_quizzes')
                                ->where('student_id', auth()->user()->id)
                                ->where('quizze_id', $quiz->id)
                                ->orderByDesc('id')
                                ->first();
                            @endphp
                            <td style="border: 1px solid #ccc">{{@$student_quizzes->score}}</td>
                            <td style="border: 1px solid #ccc">{{@$student_quizzes->time}}</td>
                            @if (!empty($student_quizzes->id))
                            <td style="border: 1px solid #ccc">{{\Carbon\Carbon::parse($student_quizzes->created_at)->format('d-m-Y')}}</td>
                            @endif
                            <td style="border: 1px solid #ccc">
                                @if (!empty($student_quizzes->id))
                                <a href="{{route('quizze_mistakes', ['id' => $student_quizzes->id])}}" class="btn btn-primary mistake_btn">
                                    View Mistakes
                                </a>
                                @endif
                            </td>
                            <td style="border: 1px solid #ccc">
                                @if (!empty($student_quizzes->id))
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
</table> --}}

<script>
    let course_data = document.querySelector('.course_data');
    let chapter_data = document.querySelector('.chapter_data');
    let lesson_data = document.querySelector('.lesson_data');

    let selCourse = document.querySelector('.selCourse');
    let selChapter = document.querySelector('.selChapter');
    let selLesson = document.querySelector('.selLesson');

    course_data = JSON.parse(course_data.value);
    chapter_data = JSON.parse(chapter_data.value);
    lesson_data = JSON.parse(lesson_data.value);

    selCourse.addEventListener('change', () => {
        selChapter.innerHTML = `<option selected disabled>
            Select Chapter ...</option>`;
        
        chapter_data.forEach( element => {
            if ( element.course_id == selCourse.value ) {
                selChapter.innerHTML += `
                <option value="${element.id}">${element.chapter_name}</option>`;   
            }
        });
    });

    selChapter.addEventListener('change', () => {
        selLesson.innerHTML = `<option selected disabled>
            Select Lesson ...</option>`;
        
        lesson_data.forEach( element => {
            if ( element.chapter_id == selChapter.value ) {
                selLesson.innerHTML += `
                <option value="${element.id}">${element.lesson_name}</option>`;   
            }
        });
    });
</script>

@endsection

@include('Student.inc.footer')
{{-- route('lesson_score_sheet') 
    data : {lesson_id : 1}
--}}