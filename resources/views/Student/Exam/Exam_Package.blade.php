@php
    $page_name = 'Exam';
@endphp
@section('title', 'Packages')
@include('Student.inc.header')
@include('Student.inc.menu')
@extends('Student.inc.nav')

@section('page_content')
    <script src="
                                                    https://cdn.jsdelivr.net/npm/@splidejs/splide@4.1.4/dist/js/splide.min.js
                                                    "></script>
    <link href="
https://cdn.jsdelivr.net/npm/@splidejs/splide@4.1.4/dist/css/splide.min.css
" rel="stylesheet">

    <!-- Link to the file hosted on your server, -->
    <link rel="stylesheet" href="path-to-the-file/splide.min.css">


    <!-- or link to the CDN -->
    <link rel="stylesheet" href="url-to-cdn/splide.min.css">
    <style>
        .texRed {
            color: #CF202F;
            margin-bottom: 0 !important;
        }

        .allPackages {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: flex-start;
            gap: 20px;
        }

        .package {
            width: calc(100% / 3.3);
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            /* background: red; */
            border-radius: 15px;
            padding: 15px;
            box-shadow: 0px 0px 15px -3px rgba(0, 0, 0, 0.1);
        }

        .package>span {
            color: #6D6D6D;
            font-size: 1.3rem;
            font-weight: 600
        }
    </style>


    <div class="col-12 d-flex align-items-center justify-content-center">
        <h3 class="texRed mt-3">
            Package Details
        </h3>
    </div>
    <div class="col-12 allPackages">
        @foreach ($package as $item)
            <a ref="{{ route('package_checkout', ['id' => $item->id]) }}" class="package">
                <h3 class="packName texRed">{{ $item->name }}</h3>
                <span class="packDuration">Duration: {{ $item->duration }} days</span>
                <span class="packPrice">price: {{ $item->price }} $</span>
                <span class="packNum">Number: {{ $item->number }}</span>
            </a>
        @endforeach
    </div>
@endsection

@include('Student.inc.footer')
