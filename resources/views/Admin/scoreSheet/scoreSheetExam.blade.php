@php
function fun_admin()
{
return 'admin';
}
$chapter_name = null;
$ch_id = [];
@endphp
<x-default-layout>
    @section('title', 'Report ScoreSheet Exam')
    <div class="col-12 mt-3 d-flex flex-column align-items-center gap-4">


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
                        <tr>
                            <td style="padding-top: 15px !important">QUIZ 1</td>
                            <td style="padding-top: 15px !important">20/16</td>
                            <td style="padding-top: 15px !important">20M</td>
                            <td style="padding-top: 15px !important">16/6/2024</td>
                            <td><a class="conBtn" href="student_quizzes/id">View Mistakes</a></td>
                            <td><a class="conBtn" href="">Report</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</x-default-layout>
{{-- route('lesson_score_sheet')
data : {lesson_id : 1}
MyCourses/Mistakes/1
Quiz/Report/1

--}}