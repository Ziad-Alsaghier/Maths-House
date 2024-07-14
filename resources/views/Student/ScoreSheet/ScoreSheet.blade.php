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
            <span class="col-5" style="color: #787878;font-size: 1.4rem;font-weight: 600">Student:
                {{ auth()->user()->f_name . ' ' . auth()->user()->l_name . '(' . auth()->user()->nick_name . ')' }}</span>
            <span class="col-6" style="color: #787878;font-size: 1.4rem;font-weight: 600">Course: SAT</span>
        </div>
        <div class="col-12 d-flex align-items-center justify-content-start gap-5">

            <select class="selCourse mx-2"
                style="width: 20%;font-size: 1.4rem;font-weight: 600; border: none;border-radius: 0;" name="Course_Course"
                id="selCourse">
                <option selected disabled>Select Course</option>
                @foreach ($courses as $item)
                    <option value="{{ $item->id }}">{{ $item->course_name }}</option>
                @endforeach
            </select>
            <select class="selChapter mx-2"
                style="width: 20%;font-size: 1.4rem;font-weight: 600; border: none;border-radius: 0;" name="Course_Chapter"
                id="selChapter">
                <option value="">Select Chapter</option>
            </select>
            <select class="selLesson mx-2"
                style="width: 20%;font-size: 1.4rem;font-weight: 600; border: none;border-radius: 0;" name="Course_Lesson"
                id="selLesson">
                <option value="">Select Lesson</option>
            </select>
            <input type="hidden" value="{{ $courses }}" class="course_data" />
            <input type="hidden" value="{{ $chapters }}" class="chapter_data" />
            <input type="hidden" value="{{ $lessons }}" class="lesson_data" />
        </div>
        <div class="col-12">
            <div class="col-12 d-flex align-items-center justify-content-center">
                <table class="table col-12  mt-2">
                    <thead>
                        <tr>
                            <th class="col-2" style="border-top: none !important; color: #CF202F;font-size: 1.1rem; "
                                scope="col">QUIZZES </th>
                            <th class="col-2" style="border-top: none !important; color: #CF202F;font-size: 1.1rem; "
                                scope="col">Score</th>
                            <th class="col-2" style="border-top: none !important; color: #CF202F;font-size: 1.1rem; "
                                scope="col">Time</th>
                            <th class="col-2" style="border-top: none !important; color: #CF202F;font-size: 1.1rem; "
                                scope="col">Date</th>
                            <th class="col-3" style="border-top: none !important; color: #CF202F;font-size: 1.1rem; "
                                scope="col">Mistakes</th>
                            <th class="col-3" style="border-top: none !important; color: #CF202F;font-size: 1.1rem; "
                                scope="col">Reports</th>
                        </tr>
                    </thead>
                    <tbody id="myTable">
                        {{-- <tr>
                            <td style="padding-top: 15px !important">QUIZ 1</td>
                            <td style="padding-top: 15px !important">20/16</td>
                            <td style="padding-top: 15px !important">20M</td>
                            <td style="padding-top: 15px !important">16/6/2024</td>
                            <td><a class="conBtn" href="student_quizzes/id">View Mistakes</a></td>
                            <td><a class="conBtn" href="">Report</a></td>
                        </tr> --}}
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        let course_data = document.querySelector('.course_data');
        let chapter_data = document.querySelector('.chapter_data');
        let lesson_data = document.querySelector('.lesson_data');

        let selCourse = document.querySelector('#selCourse');
        let selChapter = document.querySelector('#selChapter');
        let selLesson = document.querySelector('#selLesson');

        course_data = JSON.parse(course_data.value);
        chapter_data = JSON.parse(chapter_data.value);
        lesson_data = JSON.parse(lesson_data.value);

        selCourse.addEventListener('change', () => {
            selChapter.innerHTML = `<option selected disabled>
            Select Chapter</option>`;

            chapter_data.forEach(element => {
                if (element.course_id == selCourse.value) {
                    selChapter.innerHTML += `
                <option value="${element.id}">${element.chapter_name}</option>`;
                }
            });
        });

        selChapter.addEventListener('change', () => {
            selLesson.innerHTML = `<option selected disabled>
            Select Lesson</option>`;

            lesson_data.forEach(element => {
                if (element.chapter_id == selChapter.value) {
                    selLesson.innerHTML += `
                <option value="${element.id}">${element.lesson_name}</option>`;
                }
            });
        });
        $(document).ready(function() {
            $("#selLesson").change(function() {

                var lessonID = $(this).val()
                $.ajax({
                    url: "{{ route('lesson_score_sheet') }}",
                    type: "GET",
                    data: {
                        lesson_id: lessonID
                    },
                    success: function(data) {
                        console.log(data)
                        console.log(data.data)

                        $(data.data).each((index, ele) => {
                            console.log("ele", ele)
                            var newRow = `<tr>
                                <td style="padding-top: 15px !important">${ele.quizze.title}</td>
                                <td style="padding-top: 15px !important">${ele.quizze.score +"/"+ele.score }</td>
                                <td style="padding-top: 15px !important">${ele.time}</td>
                                <td style="padding-top: 15px !important">${ele.date}</td>
                                <td><a class="conBtn" href="MyCourses/Mistakes/${ele.id}">View Mistakes</a></td>
                                <td><a class="conBtn" href="Quiz/Report/${ele.id}">Report</a></td>
                            </tr>`;

                            $("#myTable").append(newRow)
                        })

                    }
                })
            })
        })
    </script>

@endsection

@include('Student.inc.footer')
{{-- route('lesson_score_sheet') 
    data : {lesson_id : 1}
    MyCourses/Mistakes/1
    Quiz/Report/1

--}}
