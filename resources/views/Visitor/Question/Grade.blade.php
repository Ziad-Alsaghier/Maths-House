@php
    $page_name = 'Grade';
@endphp
@section('title', 'Lessons')
@include('Student.inc.header')
@include('Student.inc.menu')
@extends('Student.inc.nav')

@section('page_content')

<style>
    .list_cont {
        position: relative;
        width: 100%;
        display: flex;
        align-items: center;
        justify-content: flex-end;
        margin-bottom: 20px;
    }

    .list_cont>i {
        font-size: 30px;
        cursor: pointer;
    }

    .list_item {
        position: absolute;
        top: 0;
        right: 35px;
        border-radius: 10px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        background: #efefef;
        z-index: 10000;
        overflow: hidden;
    }

    .list_item>span {
        width: 100%;
        text-align: center;
        font-size: 1.3rem;
        padding: 10px 20px;
        color: #000;
        cursor: pointer;
        transition: all 0.2s ease-in-out;
    }

    .list_item>span:hover {
        background: #cacaca;
        color: #fff;

    }
</style>

<div class="app-email card my-3">
    <div class="border-0">
        <div class="row g-0">


            <!-- Emails List -->
            <div class="col app-emails-list">
                <div class="card shadow-none border-0">
                    <div class="card-body emails-list-header p-3 py-lg-3 py-2">
                        <!-- Email List: Search -->
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex align-items-center w-100">
                                <i class="bx bx-menu bx-sm cursor-pointer d-block d-lg-none me-3" data-bs-toggle="sidebar"
                                    data-target="#app-email-sidebar" data-overlay=""></i>
                                <div class="mb-0 mb-lg-2 w-100">
                                    <div class="d-flex justify-content-center">
                                        @if ( $ans )
                                            <button class="btn btn-success">
                                                Success
                                            </button>
                                        @else
                                            <button class="btn btn-danger">
                                                Faild
                                            </button>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr class="mx-n3 emails-list-header-hr">
                        <!-- Email List: Actions --> 
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>


<div class="app-email card my-3 mistakes_questions">
    <div class="border-0">
        <div class="row g-0  p-3"> 
            @if ( !empty($question->question) )
            {!! $question->question !!}
            @endif
            @if ( !empty($question->q_url) )
            <img style="width: 200px; height: 200px;"
                src="{{ asset('images/questions/' . $question->q_url) }}" data-bs-toggle="modal"
                data-bs-target="#kt_modal_edit{{ $question->id }}" />

                <!-- Modal -->
                <div class="modal fade" id="kt_modal_edit{{ $question->id }}" tabindex="-1"
                    aria-hidden="true" style="display: none;">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
    
                                <h5 class="modal-title" id="modalCenterTitle">Show Question</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
    
                            <div class='p-3'>
                                <img style="height: 70vh;" src="{{ asset('images/questions/' . $question->q_url) }}" />
                            </div>
    
                            <div class="modal-footer">
                                <button type="button" class="btn btn-label-secondary"
                                    data-bs-dismiss="modal">
                                    Close
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            @endif
            <button class="btn btn-primary ans_item_btn my-2">Show Video</button>
            <div class="ans_item d-none">
                <b> Answer :
                @if ( $question->ans_type == 'MCQ' )
                    {{$question->mcq[0]->mcq_answers}}
                @else 
                    {{$question->g_ans[0]->grid_ans}}
                @endif
                </b>
                <br />
                @foreach ( $question->q_ans as $q_ans )
                @if ( !empty($q_ans->ans_video) )
                
                <div class="list_cont">
                    <i class="fa-solid fa-ellipsis-vertical" id="iconList"></i>
                    <div class="list_item d-none">
                        @foreach ( $report_v as $report )
                            <span class="report_item">
                                <input type="hidden" class="report_val" value="{{$report}}" />
                                <input type="hidden" class="q_ans_id" value="{{$q_ans->id}}" />
                                {{$report->list}}
                            </span>
                        @endforeach
                    </div>
                </div>
                <iframe  scrolling="no" allowfullscreen width="560" height="315" src="{{$q_ans->ans_video}}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
            
                @endif
                @endforeach
                </div>
            @foreach ( $question->q_ans as $q_ans)
            <div class="d-flex justify-content-center my-2">
                <a href="{{asset('files/q_pdf/' . $q_ans->ans_pdf)}}" class="btn btn-success mx-2" download>Download Pdf {{$loop->iteration}}</a>
                
                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal"
                data-bs-target="#kt_modal_edit{{ $q_ans->id }}">
                    Show Answer
                </button>
                <!-- Modal -->
                <div class="modal fade" id="kt_modal_edit{{ $q_ans->id }}" tabindex="-1"
                    aria-hidden="true" style="display: none;">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">

                                <h5 class="modal-title" id="modalCenterTitle">View Answer</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>

                            <div class='p-3'>
                                <img style="height: 70vh;" src="{{asset('files/q_pdf/' . $q_ans->ans_pdf)}}" />
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-label-secondary"
                                    data-bs-dismiss="modal">
                                    Close
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            @endforeach

            <a href="{{route('question_parallel', ['id' => $question->id])}}" class="btn btn-info my-2" >Solve Parallel</a>

            <hr /> 
                
        </div>
    </div>
</div>

<script>
    let mistakes_questions = document.querySelector('.mistakes_questions');
    let ans_item_btn = document.querySelectorAll('.ans_item_btn');
    let ans_item = document.querySelectorAll('.ans_item');
    
    for (let i = 0, end = ans_item_btn.length; i < end; i++) {
        ans_item_btn[i].addEventListener('click', ( e ) => {
            for (let j = 0; j < end; j++) {
                if ( e.target == ans_item_btn[j] ) {
                    ans_item[j].classList.toggle('d-none');
                }
            }
        })
    }
    
        //___________________________________________________________________________________________
        let report_item = document.querySelectorAll('.report_item');
        let report_val = document.querySelectorAll('.report_val');
        let q_ans_id = document.querySelectorAll('.q_ans_id');
        let list_cont = document.querySelectorAll('.list_cont');
        let list_item = document.querySelectorAll('.list_item');

        for (let i = 0, end = list_cont.length; i < end; i++) {
            list_cont[i].addEventListener('click', ( e ) => { 
                for (let j = 0; j < end; j++) {
                    console.log( e.target );
                    if ( e.target == list_cont[j] || e.target.parentElement == list_cont[j] ) {
                        list_item[j].classList.toggle('d-none')
                    }
                }
            })
        }

        for (let i = 0, end = report_item.length; i < end; i++) {
            report_item[i].addEventListener('click', ( e ) => {
                for (let j = 0; j < end; j++) {
                    if ( report_item[j] == e.target ) {
                        console.log(parseInt(q_ans_id[j].value));
                        let  obj = report_val[j].value;
                        obj = JSON.parse(obj);
                        obj = {
                            'list_id' : obj.id,
                            'lesson_video_id' : q_ans_id[j].value,
                        }
                        $(".list_item").toggleClass("d-none")
                        
                        $.ajax("{{ route('report_video_q_api') }}", {
                            type: 'GET', // http method
                            data: {
                                obj: obj
                            }, // data to submit
                            success: function(data) {
                                console.log(data);
                            },
                        });
                    }
                }
            })
        }
</script>

@endsection

@include('Student.inc.footer')
