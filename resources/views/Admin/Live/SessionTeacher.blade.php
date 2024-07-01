@php
    function fun_admin()
    {
        return 'admin';
    }
@endphp
<x-default-layout>
    @section('title', 'Teacher Session')
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
        <th>Teacher</th>
        <th>Name</th>
        <th>Date</th> 
        <th>From</th> 
        <th>To</th>
    </thead>

    <tbody>
        @foreach( $sessions as $item )
        @if ( $item->date >= now() )
        <tr>
            <td>{{$loop->iteration}}</td>
            <td>{{$item->teacher->name}}</td>
            <td>{{$item->name}}</td>
            <td>{{$item->date}}</td>
            <td>{{$item->from}}</td>
            <td>{{$item->to}}</td>
        </tr>
        @endif
        @endforeach
    </tbody>
</table>

<table class="table history_tbl d-none">
    <thead>
        <th>#</th>
        <th>Teacher</th>
        <th>Name</th>
        <th>Date</th> 
        <th>From</th> 
        <th>To</th>
        <th>Statue</th>
    </thead>

    <tbody>
        @foreach( $sessions as $item )
        @if ( $item->date <= now() )
        <tr>
            <td>{{$loop->iteration}}</td>
            <td>{{$item->teacher->name}}</td>
            <td>{{$item->name}}</td>
            <td>{{$item->date}}</td>
            <td>{{$item->from}}</td>
            <td>{{$item->to}}</td>
            <td>
                @php
                    $attend = false;   
                @endphp
                @foreach ( $item->users_attend as $element )
                    @if ( $element->position == 'teacher' )
                    @php
                        $attend = true;
                    @endphp
                    @endif
                @endforeach
                {{$attend ? 'Attend' : 'Missed'}}
            </td>
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

</x-default-layout>
