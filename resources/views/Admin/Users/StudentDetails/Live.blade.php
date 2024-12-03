
@php
    function fun_admin()
    {
        return 'admin';
    }
    $iter = 1;
@endphp
<x-default-layout> 
    @error('name')
        <div class="alert alert-danger">
            {{ $message }}
        </div>
    @enderror
    @error('email')
        <div class="alert alert-danger">
            {{ $message }}
        </div>
    @enderror
    @error('phone')
        <div class="alert alert-danger">
            {{ $message }}
        </div>
    @enderror
    @error('parent_email')
        <div class="alert alert-danger">
            {{ $message }}
        </div>
    @enderror
    @error('parent_phone')
        <div class="alert alert-danger">
            {{ $message }}
        </div>
    @enderror
    @section('title', 'Live')
    @include('success')
    
        
	<head>
<base href="../" />
		<meta charset="utf-8" />
		<meta name="description" content="The most advanced Bootstrap 5 Admin Theme with 40 unique prebuilt layouts on Themeforest trusted by 100,000 beginners and professionals. Multi-demo, Dark Mode, RTL support and complete React, Angular, Vue, Asp.Net Core, Rails, Spring, Blazor, Django, Express.js, Node.js, Flask, Symfony & Laravel versions. Grab your copy now and get life-time updates for free." />
		<meta name="keywords" content="metronic, bootstrap, bootstrap 5, angular, VueJs, React, Asp.Net Core, Rails, Spring, Blazor, Django, Express.js, Node.js, Flask, Symfony & Laravel starter kits, admin themes, web design, figma, web development, free templates, free admin themes, bootstrap theme, bootstrap template, bootstrap dashboard, bootstrap dak mode, bootstrap button, bootstrap datepicker, bootstrap timepicker, fullcalendar, datatables, flaticon" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta property="og:locale" content="en_US" />
		<meta property="og:type" content="article" />
		<meta property="og:title" content="Metronic - The World's #1 Selling Bootstrap Admin Template - Metronic by KeenThemes" />
		<meta property="og:url" content="https://keenthemes.com/metronic" />
		<meta property="og:site_name" content="Metronic by Keenthemes" />
		<link rel="canonical" href="https://preview.keenthemes.com/metronic8" />
		<link rel="shortcut icon" href="{{asset('assets/media/logos/favicon.ico')}}" />
		<!--begin::Fonts(mandatory for all pages)-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700" />
		<!--end::Fonts-->
		<!--begin::Vendor Stylesheets(used for this page only)-->
		<link href="{{asset('assets/plugins/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css" />
		<!--end::Vendor Stylesheets-->
		<!--begin::Global Stylesheets Bundle(mandatory for all pages)-->
		<link href="{{asset('assets/plugins/global/plugins.bundle.css')}}" rel="stylesheet" type="text/css" />
		<link href="{{asset('assets/css/style.bundle.css')}}" rel="stylesheet" type="text/css" />
		<!--end::Global Stylesheets Bundle-->
		<script>// Frame-busting to prevent site from being loaded within a frame without permission (click-jacking) if (window.top != window.self) { window.top.location.replace(window.self.location.href); }</script>
	</head>
	<!--end::Head-->
	<!--begin::Body-->
	<body id="kt_app_body" data-kt-app-layout="dark-sidebar" data-kt-app-header-fixed="true" data-kt-app-sidebar-enabled="true" data-kt-app-sidebar-fixed="true" data-kt-app-sidebar-hoverable="true" data-kt-app-sidebar-push-header="true" data-kt-app-sidebar-push-toolbar="true" data-kt-app-sidebar-push-footer="true" data-kt-app-toolbar-enabled="true" class="app-default">
		<div class="app-main flex-column flex-row-fluid" id="kt_app_main">
            <!--begin::Content wrapper-->
            <div class="d-flex flex-column flex-column-fluid">
                <!--begin::Toolbar-->
                <div id="kt_app_toolbar" class="app-toolbar py-3 py-lg-6">
                    <!--begin::Toolbar container-->
                    <div id="kt_app_toolbar_container" class="app-container container-xxl d-flex flex-stack">
                        <!--begin::Page title-->
                        <div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
                            <!--begin::Title-->
                            <h1 class="page-heading d-flex text-gray-900 fw-bold fs-3 flex-column justify-content-center my-0">Student</h1>
                            <!--end::Title-->
                            <!--begin::Breadcrumb-->
                            <ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1">
                                <!--begin::Item-->
                                <li class="breadcrumb-item text-muted">
                                    <a href="index.html" class="text-muted text-hover-primary">Student</a>
                                </li>
                                <!--end::Item-->
                                <!--begin::Item-->
                                <li class="breadcrumb-item">
                                    <span class="bullet bg-gray-500 w-5px h-2px"></span>
                                </li>
                                <!--end::Item-->
                                <!--begin::Item-->
                                <li class="breadcrumb-item text-muted">Profile</li>
                                <!--end::Item-->
                            </ul>
                            <!--end::Breadcrumb-->
                        </div>
                        <!--end::Page title-->
                        <!--begin::Actions-->
                        <div class="d-flex align-items-center gap-2 gap-lg-3">
                           
                            <!--begin::Primary button-->
                            <a href="#" class="btn btn-sm fw-bold btn-primary" data-bs-toggle="modal" data-bs-target="#kt_modal_create_question">Create</a>
                            <!--end::Primary button-->
                        </div>
                        <!--end::Actions-->
                    </div>
                    <!--end::Toolbar container-->
                </div>
                <!--end::Toolbar-->
                <!--begin::Content-->
                <div id="kt_app_content" class="app-content flex-column-fluid">
                    <!--begin::Content container-->
                    <div id="kt_app_content_container" class="app-container container-xxl">
                        <!--begin::Navbar-->
                        <div class="card mb-5 mb-xl-10">
                            <div class="card-body pt-9 pb-0">
                                <!--begin::Details-->
                                <div class="d-flex flex-wrap flex-sm-nowrap">
                                    <!--begin: Pic-->
                                    <div class="me-7 mb-4">
                                        <div class="symbol symbol-100px symbol-lg-160px symbol-fixed position-relative">
                                            <img src="{{asset('images/users/' . $user->image)}}" alt="image">
                                            <div class="position-absolute translate-middle bottom-0 start-100 mb-6 bg-success rounded-circle border border-4 border-body h-20px w-20px"></div>
                                        </div>
                                    </div>
                                    <!--end::Pic-->
                                    <!--begin::Info-->
                                    <div class="flex-grow-1">
                                        <!--begin::Title-->
                                        <div class="d-flex justify-content-between align-items-start flex-wrap mb-2">
                                            <!--begin::User-->
                                            <div class="d-flex flex-column">
                                                <!--begin::Name-->
                                                <div class="d-flex align-items-center mb-2">
                                                    <span href="#" class="text-gray-900 text-hover-primary fs-2 fw-bold me-1">
                                                        
                                                        {{ $user->f_name . ' ' . $user->l_name . ' (' . $user->nick_name . ')' }}
                                                    </span>
                                                    <a href="#">
                                                        <i class="ki-duotone ki-verify fs-1 text-primary">
                                                            <span class="path1"></span>
                                                            <span class="path2"></span>
                                                        </i>
                                                    </a>
                                                </div>
                                                <!--end::Name-->
                                                <!--begin::Info-->
                                                <div class="fw-semibold fs-6 mb-4 pe-2">
                                                    <span href="#" class="d-flex align-items-center text-gray-500 text-hover-primary me-5 mb-2">
                                                    <i class="ki-duotone ki-profile-circle fs-4 me-1">
                                                        <span class="path1"></span>
                                                        <span class="path2"></span>
                                                        <span class="path3"></span>
                                                    </i>{{$user->phone}}</span> 
                                                    <span href="#" class="d-flex align-items-center text-gray-500 text-hover-primary mb-2">
                                                    <i class="ki-duotone ki-sms fs-4">
                                                        <span class="path1"></span>
                                                        <span class="path2"></span>
                                                    </i>{{$user->email}}</span>
                                                </div>
                                                <!--end::Info-->
                                            </div>
                                            <!--end::User-->
                                            <!--begin::Actions-->
                                            <div class="d-flex my-4">  <!--begin::Menu-->
                                                <div class="me-0">
                                                    <button class="btn btn-sm btn-icon btn-bg-light btn-active-color-primary" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">
                                                        <i class="ki-solid ki-dots-horizontal fs-2x"></i>
                                                    </button>
                                                    <!--begin::Menu 3-->
                                                    <div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg-light-primary fw-semibold w-200px py-3" data-kt-menu="true">
                                                        <!--begin::Heading-->
                                                        <div class="menu-item px-3">
                                                            <div class="menu-content text-muted pb-2 px-3 fs-7 text-uppercase">
                                                                Profile
                                                            </div>
                                                        </div>
                                                        <!--end::Heading-->
                                                        <!--begin::Menu item-->
                                                        <div class="menu-item px-3">
                                                            <div href="#" class="menu-link px-3" data-bs-toggle="modal"
                                                            data-bs-target="#modalCenterEdit{{$user->id}}">
                                                                Edit
                                                        </div>
                                                        </div>

                                                        <!--end::Menu item-->
                                                        <!--begin::Menu item-->
                                                        <div class="menu-item px-3">
                                                            <div href="#" class="menu-link flex-stack px-3" data-bs-toggle="modal"
                                                            data-bs-target="#modalDeleteEdit{{ $user->id }}">
                                                                Delete
                                                            </div>
                                                        </div>
                                                        <!--end::Menu item-->   
                                                    </div>
                                                    <!--end::Menu 3-->
                                                </div>
                                                <!--end::Menu-->
                                            </div>
                                            <!--end::Actions-->
                                        </div>
                                        <!--end::Title-->
                                        <!--begin::Stats--> 
                                        <!--end::Stats-->
                                    </div>
                                    <!--end::Info-->
                                </div>
                                <!--end::Details-->

                                
                            <!-- Modal -->
                            <form method="POST" action="{{ route('stu_edit') }}">
                                @csrf
                                <div class="modal fade" id="modalCenterEdit{{$user->id}}" tabindex="-1"
                                    aria-hidden="true" style="display: none;">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">

                                                <h5 class="modal-title" id="modalCenterTitle">Edit Student</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                            </div>

                                            <div class="my-2 px-3">
                                                <label>
                                                    Nick Name
                                                </label>
                                                <input class='form-control' name="nick_name"
                                                    value="{{ $user->nick_name }}" placeholder="Nick Name" />
                                            </div>

                                            <div class="my-2 px-3">
                                                <label>
                                                    E-mail
                                                </label>
                                                <input class='form-control' name="email"
                                                    value="{{ $user->email }}" placeholder="E-mail" />
                                            </div>

                                            <div class="my-2 px-3">
                                                <label>
                                                    Password
                                                </label>
                                                <input class='form-control' name="password" type="password" 
                                                autocomplete="new-password" placeholder="Password" />
                                            </div>

                                            <div class="my-2 px-3">
                                                <label>
                                                    Phone
                                                </label>
                                                <input class='form-control' name="phone"
                                                    value="{{ $user->phone }}" placeholder="Phone" />
                                            </div>
                                            
                                            <div class="my-2 px-3">
                                                <label for="student_activation">
                                                    Active
                                                </label>
                                                <br />
                                                <input id="student_activation" name="state" class="form-check-input" type="checkbox" value="1" {{$user->state == 'Show' ? 'checked' : null}} />
                                            </div>

                                            <div class="my-2 px-3">
                                                <label>
                                                    Parent Phone
                                                </label>
                                                <input class='form-control' name="parent_phone"
                                                    value="{{ $user->parent_phone }}" placeholder="Parent Phone" />
                                            </div>

                                            <div class="my-2 px-3">
                                                <label>
                                                    Parent E-mail
                                                </label>
                                                <input class='form-control' name="parent_email"
                                                    value="{{ $user->parent_email }}" placeholder="Parent E-mail" />
                                            </div>

                                            <input type="hidden" value="{{ $user->id }}" name="user_id" />
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-label-secondary"
                                                    data-bs-dismiss="modal">
                                                    Close
                                                </button>
                                                <button class="btn btn-primary">Submit</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>


                            <!-- Modal -->
                            <div class="modal fade" id="modalDeleteEdit{{ $user->id }}" tabindex="-1"
                                aria-hidden="true" style="display: none;">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">

                                            <h5 class="modal-title" id="modalCenterTitle">Edit Role</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>

                                        <div class='p-3'>
                                            Are You Sure To Delete
                                            <span class='text-danger'>
                                                {{ $user->nick_name }} ??
                                            </span>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-label-secondary"
                                                data-bs-dismiss="modal">
                                                Close
                                            </button>
                                            <a href="{{ route('del_student', ['id' => $user->id]) }}"
                                                class="btn btn-danger">Delete</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--end::Action-->
                            
                            <!-- Modal -->
                            <div class="modal fade" id="kt_modal_create_question" tabindex="-1" aria-hidden="true">
                                <!--begin::Modal dialog-->
                                <div class="modal-dialog modal-fullscreen p-9">
                                    <!--begin::Modal content-->
                                    <div class="modal-content modal-rounded">
                                        <!--begin::Modal header-->
                                        <div class="modal-header py-7 d-flex justify-content-between">
                                            <!--begin::Modal title-->
                                            <h2>Add Student</h2>
                                            <!--end::Modal title-->
                                            <!--begin::Close-->
                                            <div class="btn btn-sm btn-icon btn-active-color-primary" data-bs-dismiss="modal">
                                                <i class="ki-duotone ki-cross fs-1">
                                                    <span class="path1"></span>
                                                    <span class="path2"></span>
                                                </i>
                                            </div>
                                            <!--end::Close-->
                                        </div>
                                        <!--begin::Modal header-->
                                        <!--begin::Modal body-->
                                        <div class="modal-body scroll-y m-5">
                                            <!--begin::Stepper-->
                                            <div class="stepper stepper-links d-flex flex-column" id="kt_modal_create_campaign_stepper">
                                                <!--begin::Form-->
                                                
                                                <form class="px-3" method="POST" 
                                                action="{{route('student_add')}}">
                                                    <!--begin::Step 1-->
                                                    <div class="current" data-kt-stepper-element="content">
                                                        <!--begin::Wrapper-->
                                                        <div class="w-100">
                                                            @csrf
                                                            <div>
                                                                <div class='my-3'>
                                                                    <label>First Name</label>
                                                                    <input class='form-control' name="f_name" placeholder="First Name" />
                                                                </div>
                                                                <div class='my-3'>
                                                                    <label>Last Name</label>
                                                                    <input class='form-control' name="l_name" placeholder="Last Name" />
                                                                </div>
                                                                <div class='my-3'>
                                                                    <label>Nick Name</label>
                                                                    <input class='form-control' name="nick_name"
                                                                        placeholder="Nick Name" />
                                                                </div>
                                                                <div class='my-3'>
                                                                    <label>E-mail</label>
                                                                    <input class='form-control' name="email" placeholder="E-mail" />
                                                                </div>
                                                                <div class='my-3'>
                                                                    <label>Phone</label>
                                                                    <input class='form-control' name="phone" placeholder="Phone" />
                                                                </div>
                                                                <div class='my-3'>
                                                                    <label>Parent E-mail</label>
                                                                    <input class='form-control' name="parent_email" placeholder="Parent E-mail" />
                                                                </div>
                                                                <div class='my-3'>
                                                                    <label>Parent Phone</label>
                                                                    <input class='form-control' name="parent_phone" placeholder="Parent Phone" />
                                                                </div>
                                                                <div class='my-3'>
                                                                    <label>Password</label>
                                                                    <input class='form-control' type="password" name="password" placeholder="Password" />
                                                                </div> 
                                                                {{--  End Page One --}}
                                                            </div>
                                
                                                        </div>
                                                        <!--end::Wrapper-->
                                                    </div>
                                                    <!--end::Step 1-->
                                                    <!--begin::Actions-->
                                                    <div class="d-flex flex-stack pt-10">
                                                        <!--begin::Wrapper-->
                                                        <div class="me-2">
                                                            <button type="button" class="btn btn-lg btn-light-primary me-3"
                                                                data-kt-stepper-action="previous">
                                                                <i class="ki-duotone ki-arrow-left fs-3 me-1">
                                                                    <span class="path1"></span>
                                                                    <span class="path2"></span>
                                                                </i>Back</button>
                                                        </div>
                                                        <!--end::Wrapper-->
                                                        <!--begin::Wrapper-->
                                                        <div>
                                                            <button class="btn btn-lg btn-primary">
                                                                Submit
                                                            </button>
                                                            <button class='btn btn-danger' type="reset">
                                                                Clear
                                                            </button>
                                                        </div>
                                                        <!--end::Wrapper-->
                                                    </div>
                                                    <!--end::Actions-->
                                                </form>
                                                <!--end::Form-->
                                            </div>
                                            <!--end::Stepper-->
                                        </div>
                                        <!--begin::Modal body-->
                                    </div>
                                </div>
                            </div>
                            

                                <!--begin::Navs-->
                                <ul class="nav nav-stretch nav-line-tabs nav-line-tabs-2x border-transparent fs-5 fw-bold">
                                   
                                    <!--begin::Nav item-->
                                    <li class="nav-item mt-2">
                                        <a class="nav-link text-active-primary ms-0 me-10 py-5" href="{{route('stu_details', ['id' => $user->id])}}">Student</a>
                                    </li>
                                    <!--end::Nav item-->
                                    <!--begin::Nav item-->
                                    <li class="nav-item mt-2">
                                        <a class="nav-link text-active-primary ms-0 me-10 py-5" href="{{route('stu_parent_details', ['id' => $user->id])}}">Parent</a>
                                    </li>
                                    <!--begin::Nav item-->
                                    <li class="nav-item mt-2">
                                        <a class="nav-link text-active-primary ms-0 me-10 py-5" href="{{route('stu_academic', ['id' => $user->id])}}">Academic</a>
                                    </li>
                                    <!--end::Nav item-->
                                    <!--begin::Nav item-->
                                    <li class="nav-item mt-2">
                                        <a class="nav-link text-active-primary ms-0 me-10 py-5 active" href="{{route('stu_live_content', ['id' => $user->id])}}">Live Content</a>
                                    </li>
                                    <!--end::Nav item-->
                                </ul>
                                <!--begin::Navs-->
                            </div>
                        </div>
                        <!--end::Navbar-->
                        <!--begin::details View-->
                        <div class="d-flex">
                            @foreach ( $courses_names as $course )
                                <a href="{{route('stu_live_course_content', ['id' => $user->id, 'course_id' => $course->id])}}" class="card mb-5 mb-xl-10" id="kt_profile_details_view">
                                    <!--begin::Card header-->
                                    <div class="card-header cursor-pointer">
                                        <!--begin::Card title-->
                                        <div class="card-title m-0">
                                            <h3 class="fw-bold m-0">
                                                {{$course->course_name}}
                                            </h3>
                                        </div>
                                        <!--end::Card title--> 
                                    </div>
                                    <!--begin::Card header--> 
                                </a>
                            @endforeach
                        </div>
                        <!--end::details View-->  
                    </div>
                    <!--end::Content container-->
<table id="kt_profile_overview_table" class="table table-row-bordered table-row-dashed gy-4 align-middle fw-bold dataTable no-footer">
    <thead class="fs-7 text-gray-500 text-uppercase">
        <tr>
            <th class="min-w-250px sorting sorting_desc" tabindex="0" aria-controls="kt_profile_overview_table" rowspan="1" colspan="1" aria-label="Manager: activate to sort column ascending" style="width: 336.359px;" aria-sort="descending">#</th>
            <th class="min-w-150px sorting" tabindex="0" aria-controls="kt_profile_overview_table" rowspan="1" colspan="1" aria-label="Date: activate to sort column ascending" style="width: 205.188px;">Course</th>
            <th class="min-w-150px sorting" tabindex="0" aria-controls="kt_profile_overview_table" rowspan="1" colspan="1" aria-label="Date: activate to sort column ascending" style="width: 205.188px;">Chapter</th>
            <th class="min-w-150px sorting" tabindex="0" aria-controls="kt_profile_overview_table" rowspan="1" colspan="1" aria-label="Date: activate to sort column ascending" style="width: 205.188px;">Lesson</th>
            <th class="min-w-150px sorting" tabindex="0" aria-controls="kt_profile_overview_table" rowspan="1" colspan="1" aria-label="Date: activate to sort column ascending" style="width: 205.188px;">State</th>
            <th class="min-w-150px sorting" tabindex="0" aria-controls="kt_profile_overview_table" rowspan="1" colspan="1" aria-label="Date: activate to sort column ascending" style="width: 205.188px;">Actions</th>
    </thead>
    <tbody class="fs-6">
        @foreach( $courses as $course )
            @foreach($course->chapter as $chapter)
                @foreach($chapter->lessons as $lesson)
                    <tr class="odd">
                        <td class="sorting_1">
                            {{$iter++}}
                        </td>
                        <td class="sorting_1">
                            {{$course->course_name}}
                        </td>
                        <td class="sorting_1">
                            {{$chapter->chapter_name}}
                        </td>
                        <td class="sorting_1">
                            {{$lesson->lesson_name}}
                        </td>
                        <td class="sorting_1">
                            {{!empty($lesson->live_lesson($user->id)->first()) ? 'attend' : 'Waitting'}}
                        </td>
                        <td class="sorting_1">
                            <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal"
                                data-bs-target="#modalCenter{{ $lesson->id }}">
                                Edit
                            </button>
                            <!-- Modal -->


                            <form method="POST" id="form-edit{{ $lesson->id }}"
                                action="{{route('live_attend', ['user_id' => $user->id, 'lesson_id' => $lesson->id])}}" class="mx-auto w-100 mw-600px pt-15 pb-10"
                                novalidate="novalidate" enctype="multipart/form-data">
                                @csrf
                                <div class="modal fade" id="modalCenter{{ $lesson->id }}" tabindex="-1"
                                    aria-hidden="true" style="display: none;">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content px-2">
                                            <input type="hidden" value="{{ $lesson->id }}" name="chapter_id" />

                                            <div class="modal-header">
                                                <h5 class="modal-title" id="modalCenterTitle">Edit Chapter</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                            </div>

                                            <div class="info_section p-3" id="info_section{{ $lesson->id }}">
                                                @if ( empty($lesson->live_lesson($user->id)->first()) )
                                                <input id="attend{{$lesson->id}}" class="form-check-input" type="checkbox" value="Attend" name="attend" />
                                                <input type="hidden" name="old_state" value="Waitting" />
                                                @else
                                                <input id="attend{{$lesson->id}}" class="form-check-input" type="checkbox" value="Attend" name="attend" checked="checked" />
                                                <input type="hidden" name="old_state" value="Attend" />
                                                @endif
                                                <label for="attend{{$lesson->id}}">
                                                    Attend
                                                </label>
                                            </div>

                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-label-secondary"
                                                    data-bs-dismiss="modal">
                                                    Close
                                                </button>
                                                <button class="btn btn-primary">Submit</button>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </form> 
                        </td>

                    </tr>
                @endforeach
            @endforeach
        @endforeach
    </tbody>
</table>
                </div>
                <!--end::Content-->
            </div>
            <!--end::Content wrapper--> 
        </div>
		<!--end::Modal - Invite Friend-->
		<!--end::Modals-->
		<!--begin::Javascript-->
		<script>var hostUrl = "assets/";</script>
		<!--begin::Global Javascript Bundle(mandatory for all pages)-->
		<script src="{{asset('assets/plugins/global/plugins.bundle.js')}}"></script>
		<script src="{{asset('assets/js/scripts.bundle.js')}}"></script>
		<!--end::Global Javascript Bundle-->
		<!--begin::Vendors Javascript(used for this page only)-->
		<script src="{{asset('assets/plugins/custom/datatables/datatables.bundle.js')}}"></script>
		<!--end::Vendors Javascript-->
		<!--begin::Custom Javascript(used for this page only)-->
		<script src="{{asset('assets/js/custom/pages/user-profile/general.js')}}"></script>
		<script src="{{asset('assets/js/widgets.bundle.js')}}"></script>
		<script src="{{asset('assets/js/custom/widgets.js')}}"></script>
		<script src="{{asset('assets/js/custom/apps/chat/chat.js')}}"></script>
		<script src="{{asset('assets/js/custom/utilities/modals/upgrade-plan.js')}}"></script>
		<script src="{{asset('assets/js/custom/utilities/modals/create-app.js')}}"></script>
		<script src="{{asset('assets/js/custom/utilities/modals/offer-a-deal/type.js')}}"></script>
		<script src="{{asset('assets/js/custom/utilities/modals/offer-a-deal/details.js')}}"></script>
		<script src="{{asset('assets/js/custom/utilities/modals/offer-a-deal/finance.js')}}"></script>
		<script src="{{asset('assets/js/custom/utilities/modals/offer-a-deal/complete.js')}}"></script>
		<script src="{{asset('assets/js/custom/utilities/modals/offer-a-deal/main.js')}}"></script>
		<script src="{{asset('assets/js/custom/utilities/modals/users-search.js')}}"></script>
		<!--end::Custom Javascript-->
		<!--end::Javascript-->
    
    </body>

</x-default-layout>