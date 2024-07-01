
@php
    $page_name = 'Quiestion Answer';
@endphp
@section('title','Chapters')
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
        margin-right: 25px
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

<div>
    <b> Answer :
    @if ( isset($question->ans_type )&& $question->ans_type == 'MCQ' )
        {{@$question->mcq[0]->mcq_answers}}
    @else
        {{@$question->g_ans[0]->grid_ans}}
    @endif
    </b>
    <br />

    
    @if ( isset($question->q_ans) )
    @foreach ( $question->q_ans as $q_ans )
    @if ( !empty($q_ans->ans_video) )
    <div class="list_cont">
        <i class="fa-solid fa-ellipsis-vertical" id="iconList"></i>
        <div class="list_item d-none">
            @foreach ( $reports as $report )
            <span class="report_item">
                <input type="hidden" class="report_val" value="{{$report}}" />
                <input type="hidden" class="q_ans_val" value="{{$q_ans}}" />
                {{$report->list}}
            </span>
        @endforeach
        </div>
    </div>
    <iframe width="560" height="315" src="{{$q_ans->ans_video}}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

    @endif
    @endforeach
  </div>
@foreach ( $question->q_ans as $q_ans)
<div class="d-flex ">
    <a href="{{asset('files/q_pdf/' . $q_ans->ans_pdf)}}" class="btn btn-success m-2" download>Download Pdf {{$loop->iteration}}</a>

    <button class="btn btn-primary m-2" data-bs-toggle="modal"
    data-bs-target="#kt_modal_edit{{$q_ans->id}}" >
    Show Answer
    </button>

    <!-- Modal -->
    <div class="modal fade" id="kt_modal_edit{{$q_ans->id}}" tabindex="-1"
        aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">

                    <h5 class="modal-title" id="modalCenterTitle">Show Question</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>

                <div class='p-3'>
                    <img style="height: 70vh;" src="{{ asset('files/q_pdf/' . $q_ans->ans_pdf) }}" />
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
@endif

<script>
    $(document).ready(function() {
        console.log("first")
        $(".accordion-button").click(function() {
            console.log("ssss", $(this).closest(".accordion-item").find(".accordion-collapse")
                .toggleClass("collapse"))
        })
        $("#iconList").click(function() {
            console.log("ssss")
            $(".list_item").toggleClass("d-none")
        })
    }) 

    //___________________________________________________________________________________________
    let report_item = document.querySelectorAll('.report_item');
    let report_val = document.querySelectorAll('.report_val');
    let q_ans_val = document.querySelectorAll('.q_ans_val');

    for (let i = 0, end = report_item.length; i < end; i++) {
        report_item[i].addEventListener('click', ( e ) => {
            for (let j = 0; j < end; j++) {
                if ( report_item[j] == e.target ) {
                    let  report_obj = report_val[j].value;
                    report_obj = JSON.parse(report_obj);
                    let q_ans_obj = q_ans_val[j].value;
                    q_ans_obj = JSON.parse(q_ans_obj);

                    obj = {
                        'list_id' : report_obj.id,
                        'q_video_id' : q_ans_obj.id
                    }
                    $(".list_item").toggleClass("d-none")
                    
                    $.ajax("{{ route('report_q_video_api') }}", {
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
