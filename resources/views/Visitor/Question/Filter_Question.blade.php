
@include('Visitor.inc.header')
@include('Visitor.inc.menu')
@include('success')

<form action="{{route('v_filter_question')}}" method="GET">
    <div style="padding: 100px 100px 0 100px">
        <div class="d-flex my-2">
            <select class="form-control sel_category mx-2" name="category_id">
                <option disabled selected>
                    Select Category ...
                </option>
                @foreach ( $categories as $category )
                    @if ( @$data['category_id'] == $category->id )
                    <option value="{{$category->id}}" selected>
                        {{$category->cate_name}}
                    </option>
                    @else
                    <option value="{{$category->id}}">
                        {{$category->cate_name}}
                    </option>
                    @endif
                @endforeach
            </select>
            <select class="form-control mx-2 sel_course" name="course_id">
                <option disabled selected>
                    Select Course ...
                </option>
                @foreach ( $courses as $course )
                    @if( @$data['category_id'] == $course->category_id )
                    @if ( @$data['course_id'] == $course->id )
                    <option value="{{$course->id}}" selected>
                        {{$course->course_name}}
                    </option>
                    @else
                    <option value="{{$course->id}}">
                        {{$course->course_name}}
                    </option>
                    @endif
                    @endif
                @endforeach
            </select>
        </div>
        <input type="hidden" value="{{ $categories }}" class="category" />
        <input type="hidden" value="{{ $courses }}" class="course" />

        <div class="d-flex my-2">
            <select class="form-control mx-2" name="year">
                <option disabled selected>
                    Select Year ...
                </option>
                @for ($i = date('Y'); $i > 1950; $i--)
                    @if ( @$data['year'] == $i )
                    <option value="{{$i}}" selected>
                        {{$i}}
                    </option>
                    @else
                    <option value="{{$i}}">
                        {{$i}}
                    </option>
                    @endif
                @endfor
            </select>
            <select class="form-control mx-2" name="month">
                <option disabled selected>
                    Select Month ...
                </option>
                @for ($i = 1; $i <= 12; $i++)
                    @if ( @$data['month'] == $i )
                    <option value="{{$i}}" selected>
                        {{date('M', ($i - 1)* 31 * 24 * 60 *60)}}
                    </option>
                    @else
                    <option value="{{$i}}">
                        {{date('M', ($i - 1)* 31 * 24 * 60 *60)}}
                    </option>
                    @endif
                @endfor
            </select>
            <input class="form-control mx-2" value="{{@$data['section']}}" name="section" placeholder="Section" />
        </div>
        
        <div class="d-flex my-2">
            <select name="q_code" class="form-control mx-2">
                <option selected value="">
                    Select Code ...
                </option>
                @foreach ( $codes as $item )
                @if ( @$data['q_code'] == $item->id )
                <option value="{{$item->id}}" selected>
                    {{$item->exam_code}}
                </option>
                @else
                <option value="{{$item->id}}">
                    {{$item->exam_code}}
                </option>
                @endif
                @endforeach
            </select>
            <input class="form-control mx-2" value="{{@$data['q_num']}}" name="q_num" placeholder="Question Number" />

            <button class="btn btn-primary mx-2 px-4">
                Search
            </button>
        </div>
    </div>
</form>

<table class="table">
    @foreach ( $q_items as $item )
    <tr>
        <td class="px-5">
            <div style="font-size: 19px; color:black;font-weight: bold;" type="button" class="btn btn-primary wallet_btn" data-bs-toggle="modal" data-bs-target="#modalCenter">
                {{date('M', ($item->month - 1)* 31 * 24 * 60 *60)}}
                {{$item->year}}
                Section : {{$item->section}}
                Code : {{$item->q_code}}
                QNumber : {{$item->q_num}}
            </div> 

            <div class="modal show_wallet fade show d-none" id="modalCenter" tabindex="-1" style="display: block;" aria-modal="true" role="dialog">
                <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="modalCenterTitle">Question</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Start Question ??

                    </div>
                    <div class="modal-footer">
                    <button type="button" class="btn btn-label-secondary close_wallet_btn" data-bs-dismiss="modal">
                        Close
                    </button>
                    <a class="btn btn-success"  href="{{route('q_page', ['id' => $item->id])}}">
                        Start
                    </a>
                    </div>
                </div>
                </div>
            </div>
        </td>
    </tr>
    @endforeach
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

    
let sel_category = document.querySelector('.sel_category');
let sel_course = document.querySelector('.sel_course');
let category = document.querySelector('.category');
let course = document.querySelector('.course');
course = course.value;
course = JSON.parse(course);

sel_category.addEventListener('change', () => {
    sel_course.innerHTML = `
    <option disabled selected>
        Select Course ...
    </option>`;
    course.forEach(element => {
        if (sel_category.value == element.category_id) {
            sel_course.innerHTML += `
            <option value="${element.id}">
                ${element.course_name}
            </option>`;
        }
    });
})
</script>
@include('Visitor.inc.footer')