@php
    $page_name = 'Exam';
@endphp
@section('title', 'Packages')
@include('Student.inc.header')
@include('Student.inc.menu')
@extends('Student.inc.nav')

@section('page_content')
    <script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@4.1.4/dist/js/splide.min.js"></script>
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
            cursor: pointer;
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
            <a href="{{ route('package_checkout', ['id' => $item->id]) }}" class="package">
                <h3 class="packName texRed">{{ $item->name }}</h3>
                <span class="packDuration">Duration: {{ $item->duration }} days</span>
                <span class="packPrice">price: {{ $item->price }}$ </span>
                <span class="packNum">Number: {{ $item->number }}</span>
            </a>
        @endforeach
    </div>

    {{-- <div class="row g-4">
        @foreach ($package as $item)
            <a style="width: 0;" href="{{ route('package_checkout', ['id' => $item->id]) }}">
                <div class="col-xl-4 col-lg-6 col-md-6 py-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-2">
                                <h5 class="fw-normal">Price {{ $item->price }}$</h5>
                            </div>
                            <div class="d-flex justify-content-between align-items-end">
                                <div class="role-heading">
                                    <h4 class="mb-1">{{ $item->name }}</h4>
                                    <a href="javascript:;" data-bs-toggle="modal" data-bs-target="#addRoleModal"
                                        class="role-edit-modal"><small>Duration {{ $item->duration }}days</small></a>
                                    <br />
                                    <a href="javascript:;" data-bs-toggle="modal" data-bs-target="#addRoleModal"
                                        class="role-edit-modal"><small>Numbssser {{ $item->number }}</small></a>
                                </div>
                                <a href="javascript:void(0);" class="text-muted"><i class="bx bx-copy"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        @endforeach
    </div> --}}
@endsection

@include('Student.inc.footer')
