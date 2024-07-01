@php
    function fun_admin()
    {
        return 'admin';
    }
@endphp
<x-default-layout>
    @error('name')
        <div class="alert alert-danger">
            {{ $message }}
        </div>
    @enderror
    @error('teacher_id')
        <div class="alert alert-danger">
            {{ $message }}
        </div>
    @enderror
    @section('title', 'Groups')
    @include('success')
    <!-- Button trigger modal -->
    <link rel="canonical" href="https://preview.keenthemes.com/metronic8" />
    <link rel="shortcut icon" href="{{ asset('assets/media/logos/favicon.ico') }}" />
    <!--begin::Fonts(mandatory for all pages)-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700" />
    <!--end::Fonts-->
    <!--begin::Vendor Stylesheets(used for this page only)-->
    <link href="{{ asset('assets/plugins/custom/datatables/datatables.bundle.css') }}" rel="stylesheet" type="text/css" />
    <!--end::Vendor Stylesheets-->
    <!--begin::Global Stylesheets Bundle(mandatory for all pages)-->
    <link href="{{ asset('assets/plugins/global/plugins.bundle.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('assets/css/style.bundle.css') }}" rel="stylesheet" type="text/css" />
    <!--end::Global Stylesheets Bundle-->
    <div class="my-3">

        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addModalCenter">
            Add New Group
        </button>
    </div>
    <script>
        var defaultThemeMode = "light";
        var themeMode;
        if (document.documentElement) {
            if (document.documentElement.hasAttribute("data-bs-theme-mode")) {
                themeMode = document.documentElement.getAttribute("data-bs-theme-mode");
            } else {
                if (localStorage.getItem("data-bs-theme") !== null) {
                    themeMode = localStorage.getItem("data-bs-theme");
                } else {
                    themeMode = defaultThemeMode;
                }
            }
            if (themeMode === "system") {
                themeMode = window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light";
            }
            document.documentElement.setAttribute("data-bs-theme", themeMode);
        }
    </script>

    <!-- Modal -->
    <form method="POST" action="{{ route('g_session_add') }}">
        @csrf
        <div class="modal fade" id="addModalCenter" tabindex="-1" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">

                        <h5 class="modal-title" id="modalCenterTitle">Add Group</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="px-2">

                        <div class="my-2">
                            <label>
                                Group Name
                            </label>
                            <input class="form-control" name="name" placeholder="Group Name" />
                        </div>
                        <div class="s_days">
                            <div class="my-2 d-flex align-items-center s_days_item">
                                <label class="mx-2">
                                    Days
                                </label>
                                <select name="day[]" class="form-control">
                                    <option selected disabled>Select Day</option>
                                    <option value="Sat">
                                        Sat
                                    </option>
                                    <option value="Sun">
                                        Sun
                                    </option>
                                    <option value="Mon">
                                        Mon
                                    </option>
                                    <option value="Tues">
                                        Tues
                                    </option>
                                    <option value="Wed">
                                        Wed
                                    </option>
                                    <option value="Thurs">
                                        Thurs
                                    </option>
                                    <option value="Fri">
                                        Fri
                                    </option>
                                </select>
                                <label class="mx-2">
                                    From
                                </label>
                                <input type="time" class="form-control" name="from[]" placeholder="From" />
                                <label class="mx-2">
                                    To
                                </label>
                                <input type="time" class="form-control" name="to[]" placeholder="To" />

                            </div>

                        </div>
                        <div class="newDays"></div>
                        <div id="addDayNew">
                            <i style="color:#00ff00; font-size:20px;cursor: pointer;" class="fa fa-plus"></i>
                        </div>
                    </div>

                    <div class="my-2">

                        <select name="teacher_id" class="form-control">
                            <option selected disabled>Select Teacher...</option>
                            @foreach ($teachers as $teacher)
                                <option value="{{ $teacher->id }}">
                                    {{ $teacher->nick_name }}
                                </option>
                            @endforeach
                        </select>
                    </div>

                    
                    <div class="mb-10 fv-row">
                        <label>
                            Students
                        </label>
                        <div class="select2-danger" data-select2-id="33">
                            <div class="position-relative" data-select2-id="443">
                                <select id="select2Dangeradd" name="stu_id[]"
                                    class="select2 form-select select2-hidden-accessible"
                                    multiple=""
                                    data-select2-id="select2Dangeradd"
                                    tabindex="-1" aria-hidden="true">
                                    @foreach ($students as $student)
                                        <option value="{{ $student->id }}">
                                            {{ $student->nick_name }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="my-2">
                        <label class="form-check form-switch form-check-custom form-check-solid">
                            <input class="form-check-input" name="state" type="checkbox" value="1"
                                checked="checked">
                            <span class="form-check-label fw-semibold text-muted">Active</span>
                        </label>
                    </div>
                    <script>
                        let add_day = document.querySelector('.add_day');
                        let remove_day = document.querySelectorAll('.remove_day');
                        let s_days = document.querySelector('.s_days');
                        let s_days_item = document.querySelector('.s_days_item');
                        add_day.addEventListener('click', () => {
                            s_days.innerHTML += s_days_item.outerHTML;
                        });
                        for (let i = 0, end = remove_day.length; i < end; i++) {
                            remove_day[i].addEventListener('click', (e) => {
                                e.target.parentElement.parentElement.remove();
                            });
                        }
                    </script>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">
                            Close
                        </button>
                        <button class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <table id="kt_profile_overview_table"
        class="table table-row-bordered table-row-dashed gy-4 align-middle fw-bold dataTable no-footer">
        <thead class="fs-7 text-gray-500 text-uppercase">
            <th class="min-w-250px sorting sorting_desc" tabindex="0" aria-controls="kt_profile_overview_table"
                rowspan="1" colspan="1" aria-label="Manager: activate to sort column ascending"
                style="width: 336.359px;" aria-sort="descending">#</th>
            <th class="min-w-150px sorting" tabindex="0" aria-controls="kt_profile_overview_table" rowspan="1"
                colspan="1" aria-label="Date: activate to sort column ascending" style="width: 205.188px;">Group
                Name</th>
            <th class="min-w-150px sorting" tabindex="0" aria-controls="kt_profile_overview_table" rowspan="1"
                colspan="1" aria-label="Date: activate to sort column ascending" style="width: 205.188px;">No. of
                Students</th>
            <th class="min-w-150px sorting" tabindex="0" aria-controls="kt_profile_overview_table" rowspan="1"
                colspan="1" aria-label="Date: activate to sort column ascending" style="width: 205.188px;">Dayes
            </th>
            <th class="min-w-150px sorting" tabindex="0" aria-controls="kt_profile_overview_table" rowspan="1"
                colspan="1" aria-label="Date: activate to sort column ascending" style="width: 205.188px;">From
            </th>
            <th class="min-w-150px sorting" tabindex="0" aria-controls="kt_profile_overview_table" rowspan="1"
                colspan="1" aria-label="Date: activate to sort column ascending" style="width: 205.188px;">To</th>
            <th class="min-w-150px sorting" tabindex="0" aria-controls="kt_profile_overview_table" rowspan="1"
                colspan="1" aria-label="Date: activate to sort column ascending" style="width: 205.188px;">Teacher
            </th>
            <th class="min-w-150px sorting" tabindex="0" aria-controls="kt_profile_overview_table" rowspan="1"
                colspan="1" aria-label="Date: activate to sort column ascending" style="width: 205.188px;">Statues
            </th>
            <th class="min-w-150px sorting" tabindex="0" aria-controls="kt_profile_overview_table" rowspan="1"
                colspan="1" aria-label="Date: activate to sort column ascending" style="width: 205.188px;">Action
            </th>
        </thead>
        <tbody class="fs-6">
            @foreach ($session_g as $item)
                <tr>
                    <td>
                        {{ $loop->iteration }}
                    </td>
                    <td>
                        {{ $item->name }}
                    </td>
                    <td>
                        {{ count($item->student) }}
                    </td>
                    <td>
                        @foreach ($item->days as $element)
                            {{ $element->day }}
                            <br />
                        @endforeach
                    </td>
                    <td>
                        @foreach ($item->days as $element)
                            {{ $element->from }}
                            <br />
                        @endforeach
                    </td>
                    <td>
                        @foreach ($item->days as $element)
                            {{ $element->to }}
                            <br />
                        @endforeach
                    </td>
                    <td>
                        {{ $item->teacher->nick_name }}
                    </td>
                    <td>
                        {{ $item->teacher->nick_name }}
                    </td>
                    <td>
                        {{$item->state ? 'Active': 'Hidden'}}
                    </td>
                    <td>
                        <div class="mt-3">
                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal"
                                data-bs-target="#modalCenter{{ $item->id }}">
                                Edit
                            </button>
                            <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal"
                                data-bs-target="#modalDelete{{ $item->id }}">
                                Delete
                            </button>

                            <!-- Modal -->
                            <form method="POST" action="{{ route('g_session_edit') }}">
                                @csrf
                                <div class="modal fade" id="modalCenter{{ $item->id }}" tabindex="-1"
                                    aria-hidden="true" style="display: none;">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">

                                                <h5 class="modal-title" id="modalCenterTitle">Edit Group</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                            </div>
                                            <div class="px-2">

                                                <div class="my-2">
                                                    <label>
                                                        Group Name
                                                    </label>
                                                    <input class="form-control" name="name"
                                                        value="{{ $item->name }}" placeholder="Group Name" />
                                                </div>
                                                <div class="s_e_days">
                                                    @foreach ($item->days as $element)
                                                        <div class="my-2 d-flex align-items-center s_e_days_item">
                                                            <label class="mx-2">
                                                                Days
                                                            </label>
                                                            <select name="day[]" class="form-control">
                                                                <option value="{{ $element->day }}">
                                                                    {{ $element->day }}
                                                                </option>
                                                                <option value="Sat">
                                                                    Sat
                                                                </option>
                                                                <option value="Sun">
                                                                    Sun
                                                                </option>
                                                                <option value="Mon">
                                                                    Mon
                                                                </option>
                                                                <option value="Tues">
                                                                    Tues
                                                                </option>
                                                                <option value="Wed">
                                                                    Wed
                                                                </option>
                                                                <option value="Thurs">
                                                                    Thurs
                                                                </option>
                                                                <option value="Fri">
                                                                    Fri
                                                                </option>
                                                            </select>
                                                            <label class="mx-2">
                                                                From
                                                            </label>
                                                            <input type="time" class="form-control"
                                                                value="{{ $element->from }}" name="from[]"
                                                                placeholder="From" />
                                                            <label class="mx-2">
                                                                To
                                                            </label>
                                                            <input type="time" class="form-control"
                                                                value="{{ $element->to }}" name="to[]"
                                                                placeholder="To" />

                                                            <div class="remove_e_day">
                                                                <i style="color:#ff0000; font-size:20px; cursor: pointer;"
                                                                    class="fa fa-minus mx-2"></i>
                                                            </div>
                                                        </div>
                                                    @endforeach

                                                </div>
                                                <div class="add_e_day">
                                                    <i style="color:#00ff00; font-size:20px;cursor: pointer;"
                                                        class="fa fa-plus"></i>
                                                </div>
                                            </div>

                                            <div class="my-2">

                                                <select name="teacher_id" class="form-control">
                                                    <option value="{{ $item->teacher->id }}">
                                                        {{ $item->teacher->nick_name }}
                                                    </option>
                                                    @foreach ($teachers as $teacher)
                                                        <option value="{{ $teacher->id }}">
                                                            {{ $teacher->nick_name }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <div class="mb-10 fv-row">
                                                <label>
                                                    Students
                                                </label>
                                                <div class="select2-danger" data-select2-id="33">
                                                    <div class="position-relative" data-select2-id="443">
                                                        <select id="select2Danger{{ $item->id }}" name="stu_id[]"
                                                            class="select2 form-select select2-hidden-accessible"
                                                            multiple=""
                                                            data-select2-id="select2Danger{{ $item->id }}"
                                                            tabindex="-1" aria-hidden="true">
                                                           
                                                            @foreach ($students as $student)
                                                                
                                                            <option value="{{ $student->id }}" 
                                                                @selected(in_array($student->id, json_decode($item->students->pluck('id'))))
                                                                data-select2-id="{{ $student->id }}">
                                                                {{ $student->nick_name }}</option>
                                                            {{-- @if ( in_array($student->id, json_decode($item->student->pluck('id'))) )
                                                                    <option value="{{ $student->id }}" selected
                                                                    data-select2-id="{{ $student->id }}">
                                                                    {{ $student->nick_name }}</option>
                                                                @else
                                                                    <option value="{{ $student->id }}"
                                                                    data-select2-id="{{ $student->id }}">
                                                                    {{ $student->nick_name }}</option>
                                                                @endif --}}
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="my-2">
                                                <label
                                                    class="form-check form-switch form-check-custom form-check-solid">
                                                    <input class="form-check-input" name="state" type="checkbox"
                                                        value="1" {{ $item->state == 1 ? 'checked' : null }}>
                                                    <span class="form-check-label fw-semibold text-muted">Active</span>
                                                </label>
                                            </div>

                                            <input type="hidden" value="{{ $item->id }}" name="id" />
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
                            <div class="modal fade" id="modalDelete{{ $item->id }}" tabindex="-1"
                                aria-hidden="true" style="display: none;">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">

                                            <h5 class="modal-title" id="modalCenterTitle">Delete Session</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>

                                        <div class='p-3'>
                                            Are You Sure To Delete
                                            <span class='text-danger'>
                                                {{ $item->name }} ?
                                            </span>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-label-secondary"
                                                data-bs-dismiss="modal">
                                                Close
                                            </button>
                                            <a href="{{ route('del_session_g', ['id' => $item->id]) }}"
                                                class="btn btn-danger">Delete</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            @endforeach
            {{$session_g->links()}}
        </tbody>
    </table>

    <script>
        let add_e_day = document.querySelectorAll('.add_e_day');
        let remove_e_day = document.querySelectorAll('.remove_e_day');
        let s_e_days = document.querySelectorAll('.s_e_days');
        let s_e_days_item = document.querySelectorAll('.s_e_days_item');
        for (let i = 0, end = add_e_day.length; i < end; i++) {
            add_e_day[i].addEventListener('click', (e) => {
                for (let j = 0; j < end; j++) {
                    if (e.target == add_e_day[j] || e.target.parentElement == add_e_day[j]) {
                        s_e_days[j].innerHTML += s_e_days_item[j].outerHTML;
                    }
                }
            });
        }
        for (let i = 0, end = remove_e_day.length; i < end; i++) {
            remove_e_day[i].addEventListener('click', (e) => {
                e.target.parentElement.parentElement.remove();
            });
        }
    </script>


    <!--end::Modal - Invite Friend-->
    <!--end::Modals-->
    <!--begin::Javascript-->
    <script>
        var hostUrl = "assets/";
    </script>
    <!--begin::Global Javascript Bundle(mandatory for all pages)-->
    <script src="{{ asset('assets/plugins/global/plugins.bundle.js') }}"></script>
    <script src="{{ asset('assets/js/scripts.bundle.js') }}"></script>
    <!--end::Global Javascript Bundle-->
    <!--begin::Vendors Javascript(used for this page only)-->
    <script src="{{ asset('assets/plugins/custom/datatables/datatables.bundle.js') }}"></script>
    <!--end::Vendors Javascript-->
    <!--begin::Custom Javascript(used for this page only)-->
    <script src="{{ asset('assets/js/widgets.bundle.js') }}"></script>
    <script src="{{ asset('assets/js/custom/widgets.js') }}"></script>
    <script src="{{ asset('assets/js/custom/apps/chat/chat.js') }}"></script>
    <script src="{{ asset('assets/js/custom/utilities/modals/upgrade-plan.js') }}"></script>
    <script src="{{ asset('assets/js/custom/utilities/modals/create-app.js') }}"></script>
    <script src="{{ asset('assets/js/custom/utilities/modals/new-target.js') }}"></script>
    <script src="{{ asset('assets/js/custom/utilities/modals/users-search.js') }}"></script>
    <!--end::Custom Javascript-->
    <!--end::Javascript-->

    <script>
        $(document).ready(() => {
            $("#addDayNew").click(() => {
                var new_day = `<div class="s_days">
                            <div class="my-2 d-flex align-items-center s_days_item">
                                <label class="mx-2">
                                    Days
                                </label>
                                <select name="day[]" class="form-control">
                                    <option selected disabled>Select Day</option>
                                    <option value="Sat">
                                        Sat
                                    </option>
                                    <option value="Sun">
                                        Sun
                                    </option>
                                    <option value="Mon">
                                        Mon
                                    </option>
                                    <option value="Tues">
                                        Tues
                                    </option>
                                    <option value="Wed">
                                        Wed
                                    </option>
                                    <option value="Thurs">
                                        Thurs
                                    </option>
                                    <option value="Fri">
                                        Fri
                                    </option>
                                </select>
                                <label class="mx-2">
                                    From
                                </label>
                                <input type="time" class="form-control" name="from[]" placeholder="From" />
                                <label class="mx-2">
                                    To
                                </label>
                                <input type="time" class="form-control" name="to[]" placeholder="To" />

                            </div>

                        </div>`;

                  $(".newDays").append(new_day);
            })
        })
    </script>
    </script>
    <!-- build:js assets/vendor/js/core.js -->
    <script src="{{asset('assets/vendor/libs/jquery/jquery.js')}}"></script>
    <script src="{{asset('assets/vendor/libs/popper/popper.js')}}"></script>
    <script src="{{asset('assets/vendor/js/bootstrap.js')}}"></script>
    <script src="{{asset('assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js')}}"></script>

    <script src="{{asset('assets/vendor/libs/hammer/hammer.js')}}"></script>

    <script src="{{asset('assets/vendor/libs/i18n/i18n.js')}}"></script>
    <script src="{{asset('assets/vendor/libs/typeahead-js/typeahead.js')}}"></script>

    <script src="{{asset('assets/vendor/js/menu.js')}}"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="{{asset('assets/vendor/libs/select2/select2.js')}}"></script>
    <script src="{{asset('assets/vendor/libs/tagify/tagify.js')}}"></script>
    <script src="{{asset('assets/vendor/libs/bootstrap-select/bootstrap-select.js')}}"></script>
    <script src="{{asset('assets/vendor/libs/typeahead-js/typeahead.js')}}"></script>
    <script src="{{asset('assets/vendor/libs/bloodhound/bloodhound.js')}}"></script>

    <!-- Main JS -->
    <script src="{{asset('assets/js/main.js')}}"></script>

    <!-- Page JS -->
    <script src="{{asset('assets/js/forms-selects.js')}}"></script>
    <script src="{{asset('assets/js/forms-tagify.js')}}"></script>
    <script src="{{asset('assets/js/forms-typeahead.js')}}"></script>

</x-default-layout>
