@php
    $page_name = 'Grade';
@endphp
@section('title', 'Lessons')
@include('Student.inc.header')
@include('Student.inc.menu')
@extends('Student.inc.nav')

@section('page_content')

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
                                        @if ($deg >= ($quizze->pass_score / $quizze->score) * 100)
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


                        <!-- Email View -->
                        <div class="col app-email-view flex-grow-0 bg-body" id="app-email-view">

                            <table class="table">
                                <tr>
                                    <td>Quizze : </td>
                                    <td>{{ $quizze->title }}</td>
                                </tr>
                                <tr>
                                    <td>Score : </td>
                                    <td>{{ $deg }} %</td>
                                </tr>
                                <tr>
                                    <td>Total Question : </td>
                                    <td>{{ $total_question }}</td>
                                </tr>
                                <tr>
                                    <td>Right Question : </td>
                                    <td>{{ $right_question }}</td>
                                </tr>
                                <tr>
                                    <td>Wrong Question : </td>
                                    <td>{{ $total_question - $right_question }}</td>
                                </tr>
                                <tr colspan="2">
                                    <td class="d-flex justify-content-center">
                                        <button class="btn btn-primary mistake_btn mx-2">
                                            View Mistakes
                                        </button>

                                        <form method="POST" action="{{route('stu_quize_pdf')}}">
                                            @csrf
                                            <input type="hidden" name="mistakes" value="{{json_encode($mistakes)}}">
                                            <button class="btn btn-info mx-2">
                                                Download Mistakes
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </table>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
</div>


<div class="app-email card my-3 d-none mistakes_questions">
    <div class="border-0">
        <div class="row g-0  p-3">
            @foreach ( $mistakes as $item )
                @if ( !empty($item->question) )
                {{$item->question}}
                @endif
                @if ( !empty($item->q_url) )
                <img style="width: 200px; height: 200px;"
                    src="{{ asset('images/questions/' . $item->q_url) }}" data-bs-toggle="modal"
                    data-bs-target="#kt_modal_edit{{ $item->id }}" />
    
                    <!-- Modal -->
                    <div class="modal fade" id="kt_modal_edit{{ $item->id }}" tabindex="-1"
                        aria-hidden="true" style="display: none;">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
        
                                    <h5 class="modal-title" id="modalCenterTitle">Show Question</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
        
                                <div class='p-3'>
                                    <img style="height: 70vh;" src="{{ asset('images/questions/' . $item->q_url) }}" />
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
                    @if ( $item->ans_type == 'MCQ' )
                        {{$item->mcq[0]->mcq_answers}}
                    @else 
                    {{$item->g_ans[0]->grid_ans}}
                    @endif
                    </b>
                    <br />
                    @foreach ( $item->q_ans as $q_ans )
                    @if ( !empty($q_ans->ans_video) )
                    <iframe  scrolling="no" allowfullscreen width="560" height="315" src="{{$q_ans->ans_video}}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                
                    @endif
                    @endforeach
                  </div>
                @foreach ( $item->q_ans as $q_ans)<div class="d-flex justify-content-center my-2">
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
        
                                    <h5 class="modal-title" id="modalCenterTitle">Show Question</h5>
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

                <a href="{{route('question_parallel', ['id' => $item->id])}}" class="btn btn-info my-2" >Solve Parallel</a>

                <hr />
            @endforeach
        </div>
    </div>
</div>

<script>
    let mistakes_questions = document.querySelector('.mistakes_questions');
    let mistake_btn = document.querySelector('.mistake_btn');
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
    mistake_btn.addEventListener('click', () => {
        mistakes_questions.classList.toggle('d-none');
    })
</script>

@endsection

@include('Student.inc.footer')
