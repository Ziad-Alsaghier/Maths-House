
@php
    $page_name = 'Live';
    use Carbon\Carbon;
@endphp
@section('title','Live')
@include('Teacher.inc.header')
@include('Teacher.inc.menu')
@extends('Teacher.inc.nav')

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

<table class="table upcoming_tbl d-none">
    <thead>
        <th>#</th>
        <th>Name</th>
        <th>Date</th>
        <th>Day</th>
        <th>From</th> 
        <th>To</th>
        <th>Material</th>
        <th>Link</th>
    </thead>

    <tbody>
        @foreach( $sessions as $item )
        @if ( $item->date . ' ' . $item->from >= now() )
        <tr>
            <td>{{$loop->iteration}}</td>
            <td>{{$item->name}}</td>
            <td>{{$item->date}}</td>
            <td>{{$item->day}}</td>
            <td>{{$item->from}}</td>
            <td>{{$item->to}}</td>
            <td>
                <a href="{{ $item->teacher_material }}" class="btn btn-info">
                    Material 
                </a>
            </td>
            <td>
                <button class="btn btn-primary wallet_btn">
                    Attend 
                </button>

                @if ( $item->date == date('Y-m-d') && ( Carbon::now()->addMinutes(10)->format('H:i:s') >= $item->from ) )
                    
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
                        <a class="btn btn-success" href="{{route('use_live', ['id' => $item->id])}}">
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

<table class="table history_tbl d-none">
    <thead>
        <th>#</th>
        <th>Name</th>
        <th>Date</th>
        <th>Day</th>
        <th>From</th> 
        <th>To</th>
        <th>Statue</th>
    </thead>

    <tbody>
        @foreach( $sessions as $item )
        @if ( $item->date . ' ' . $item->from <= now() )
        <tr>
            <td>{{$loop->iteration}}</td>
            <td>{{$item->name}}</td>
            <td>{{$item->date}}</td>
            <td>{{$item->day}}</td>
            <td>{{$item->from}}</td>
            <td>{{$item->to}}</td>
            <td>
                {{count($item->user_attend) == 0 ? 'Missed' : 'Attend'}}</td>
        </tr>
        @endif
        @endforeach
    </tbody>
</table>


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
@endsection

@include('Teacher.inc.footer')
