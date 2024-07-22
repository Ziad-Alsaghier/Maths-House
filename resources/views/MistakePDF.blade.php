
@php
    $page_name = 'Mistakes';
@endphp
@section('title','Mistakes')
@include('Student.inc.header')

@section('page_content')

<style>
    .txMista {
        width: 100%;
        margin: 1rem 0 !important;
        text-align: center;
        font-family: sans-serif;
        font-weight: 600;
        font-size: 2rem;
        color: #cf202f;
    }

    .allMistakes {
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        row-gap: 20px;
        padding-top: 20px;
        overflow: hidden;
    }

    .mistake {
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        justify-content: center;
        row-gap: 20px;
        padding: 15px;
        border-radius: 20px;
        background: #c4c4c446;
    }

    .quesMisake {
        font-size: 1.2rem;
        font-weight: 500;
        color: #5c5a5a;
    }

    .imgMistake {
        width: auto;
        height: 300px;
        object-fit: cover;
        object-position: center;
        border-radius: 15px;
        cursor: pointer;
    }

    .imgMistakeModal {
        width: auto;
        height: auto;
        object-fit: cover;
        object-position: center;
        border-radius: 15px;
    }

    .footerMistake {
        width: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
        column-gap: 20px;
    }

    .viewMistake {
        border: none;
        background: #CF202F;
        padding: 6px 15px;
        border-radius: 20px;
        color: #fff;
        font-size: 1.1rem;
        font-weight: 500;
        cursor: pointer;
    }

    .parallelMistake {
        color: #CF202F !important;
        font-size: 1.1rem;
        font-weight: 500;
        cursor: pointer;
    }

    .q_ans_item {
        background: #00000087;
    }

    .modal-dialog {
        max-width: 70% !important;
    }

    .modal-backdrop.show {
        display: none !important;
    }
</style>

<h3 class="txMista">Mistakes</h3>
<div class="allMistakes app-email card my-3 mistakes_questions">
    @foreach ( $mistakes as $mistake )
        <div class="row g-0 mistake  p-3"> 
                @if ( !empty($mistake->question->question) )
                    <span class="quesMisake">{{$mistake->question->question}}</span>
                @endif
                @if ( !empty($mistake->question->q_url) )

                <img class="imgMistake"
                src="{{ asset('images/questions/' . $mistake->question->q_url) }}" data-bs-toggle="modal"
                data-bs-target="#kt_modal_edit{{$mistake->id}}{{$mistake->question->id}}" />

                @endif


        </div>
    @endforeach
</div>

@endsection

@include('Student.inc.footer')