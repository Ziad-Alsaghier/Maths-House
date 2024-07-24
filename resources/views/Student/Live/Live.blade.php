
@php
    $page_name = 'Live';
    use Carbon\Carbon;
@endphp
@section('title','Live')
@include('Student.inc.header')
@include('Student.inc.menu')
@extends('Student.inc.nav')

@section('page_content')

@include('success')
<div class="my-3 d-flex justify-content-center">
    <button class="btn btn-primary upcoming_btn mx-2" style="width: 180px; height: 45px;">
        Upcoming
    </button>
    <button class="btn btn-primary history_btn mx-2" style="width: 180px; height: 45px;">
        History
    </button>
</div>


<div class="upcoming_tbl d-none">
    {{-- <form method="GET" action="{{route('filter_live')}}"> 
        <input type="hidden" name="tbl_name" value="upcoming_tbl" />
        <div class="pb-2 d-flex">
            <select name="category_id" class="form-control sel_category mx-2">
                <option disabled selected>
                    Select Category ...
                </option>
                @foreach ($categories as $category)
                    <option {{ @$data['category_id'] == $category->id ? 'selected' : '' }} value="{{ $category->id }}">
                        {{ $category->cate_name }}
                    </option>
                @endforeach
            </select>
    
            <select name="course_id" class="form-control sel_course_items mx-2">
                <option disabled selected>
                    Select Course ...
                </option>
                @foreach ($courses as $course)
                    @if (@$data['course_id'] == $course->id)
                        <option value="{{ $course->id }}" selected>
                            {{ $course->course_name }}
                        </option>
                    @elseif(@$data['category_id'] == $course->category_id)
                        <option value="{{ $course->id }}">
                            {{ $course->course_name }}
                        </option>
                    @endif
                @endforeach
            </select>
    
            <input type="hidden" value="{{ $courses }}" class="course" /> 
        </div>
           <div class="pb-2 d-flex">
            <select name="teacher_id" class="form-control mx-2">
                <option disabled selected>
                    Select Teacher ...
                </option>
                @foreach ($teachers as $teacher)
                    <option {{ @$data['teacher_id'] == $teacher->id ? 'selected' : '' }} value="{{ $teacher->id }}">
                        {{ $teacher->nick_name }}
                    </option>
                @endforeach
            </select>
    
            <input type="date" name="date" value="{{@$data['date']}}" class="form-control" />
    
            <input type="hidden" value="{{ $courses }}" class="course" />
            <button class="btn btn-primary mx-2">
                Submit
            </button>
        </div>
        
    </form> --}}

    <table class="table">
        <thead>
            <th>#</th>
            <th>Name</th>
            <th>Date</th> 
            <th>Course</th> 
            <th>Teacher</th> 
            <th>From</th> 
            <th>To</th>
            <th>Link</th>
        </thead>

        <tbody>
            @foreach( $sessions as $item )
            
            @if ( $item->session->date > date('Y-m-d') || ($item->session->date == date('Y-m-d') && $item->session->to >= date('H:i:s')) )
            <tr>
                <td>{{$loop->iteration}}</td>
                <td>{{$item->session->lesson->lesson_name}}</td>
                <td>{{$item->session->date}}</td>
                <td>{{$item->session->lesson->chapter->course->course_name}}</td>
                <td>{{$item->session->teacher->nick_name}}</td>
                <td>{{$item->session->from}}</td>
                <td>{{$item->session->to}}</td>
                <td>
                    <button class="btn btn-primary wallet_btn">
                        Attend 
                    </button>

                    @if ( $item->session->date == date('Y-m-d') && ( Carbon::now()->addMinutes(10)->format('H:i:s') >= $item->session->from ) )
                        
                    <div class="modal show_wallet fade show d-none" id="modalCenter" tabindex="-1" style="display: block;" aria-modal="true" role="dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                            <h5 class="modal-title" id="modalCenterTitle">Session</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Are you sure to attend now ?
                            </div>
                            <div class="modal-footer">
                            <button type="button" class="btn btn-label-secondary close_wallet_btn" data-bs-dismiss="modal">
                                Close
                            </button>
                            <a class="btn btn-success" href="{{route('use_live', ['id' => $item->session->id])}}">
                                Start
                            </a>
                            </div>
                        </div>
                        </div>
                    </div>
                    @else    
                    <div class="modal show_wallet fade show d-none" id="modalCenter" tabindex="-1" style="display: block;" aria-modal="true" role="dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                            <h5 class="modal-title" id="modalCenterTitle">Session</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                You can't attend this session right now please come again later
                            </div>
                            <div class="modal-footer">
                            <button type="button" class="btn btn-label-secondary close_wallet_btn" data-bs-dismiss="modal">
                                Close
                            </button>
                            </div>
                        </div>
                        </div>
                    </div>
                    @endif
                </td>
            </tr>
            @endif
            @endforeach
        </tbody>
    </table>
</div>

<div class="history_tbl d-none">
    <table class="table">
        <thead>
            <th>#</th>
            <th>Name</th>
            <th>Date</th> 
            <th>From</th> 
            <th>To</th>
            <th>Statue</th>
        </thead>

        <tbody>
            @foreach( $sessions as $item )
            @if ( $item->session->date < date('Y-m-d') || 
            ($item->session->date == date('Y-m-d') && $item->session->to <= date('H:i:s')) )
            <tr>
                <td>{{$loop->iteration}}</td>
                <td>{{$item->session->lesson->lesson_name}}</td>
                <td>{{$item->session->date}}</td>
                <td>{{$item->session->from}}</td>
                <td>{{$item->session->to}}</td>
                <td>
                    {{count($item->session->user_attend) == 0 ? 'Missed' : 'Attend'}}</td>
            </tr>
            @endif
            @endforeach
        </tbody>
    </table>
</div>


<script>
    let wallet_btn = document.querySelectorAll('.wallet_btn');
    let show_wallet = document.querySelectorAll('.show_wallet');
    let btn_close = document.querySelectorAll('.btn-close');
    let close_wallet_btn = document.querySelectorAll('.close_wallet_btn');

    for (let i = 0, end = wallet_btn.length; i < end; i++) {
        wallet_btn[i].addEventListener('click', ( e ) => {
            for (let j = 0; j < end; j++) {
                if ( e.target == wallet_btn[j] ) {
                    show_wallet[j].classList.remove('d-none');
                }
            }
        })
        btn_close[i].addEventListener('click', ( e ) => {
            for (let j = 0; j < end; j++) {
                if ( e.target == show_wallet[j] ) {
                    show_wallet[j].classList.add('d-none');
                }
            }
        })
        close_wallet_btn[i].addEventListener('click', ( e ) => {
            for (let j = 0; j < end; j++) {
                if ( e.target == close_wallet_btn[j] ) {
                    show_wallet[j].classList.add('d-none');
                }
            }
        })
    }
</script>
<script>
    let upcoming_btn = document.querySelector('.upcoming_btn');
    let history_btn = document.querySelector('.history_btn');
    let upcoming_tbl = document.querySelector('.upcoming_tbl');
    let history_tbl = document.querySelector('.history_tbl');

    upcoming_btn.addEventListener('click', () => {
        console.log(7685);
        upcoming_tbl.classList.toggle('d-none');
        history_tbl.classList.add('d-none');
    });

    history_btn.addEventListener('click', () => {
        console.log(786);
        history_tbl.classList.toggle('d-none');
        upcoming_tbl.classList.add('d-none');
    });
</script>

<script>
    let sel_category = document.querySelector('.sel_category');
    let sel_course_items = document.querySelector('.sel_course_items');
    let course = document.querySelector('.course');
    course = course.value;
    course = JSON.parse(course);

    sel_category.addEventListener('change', () => {
        sel_course_items.innerHTML = `
    <option disabled selected>
        Select Course ...
    </option>`;
        course.forEach(element => {
            if (sel_category.value == element.category_id) {
                sel_course_items.innerHTML += `
      <option value="${element.id}">
          ${element.course_name}
      </option>`;
            }
        });
    })
</script>
@endsection

@include('Student.inc.footer')
