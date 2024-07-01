@include('Visitor.inc.header')
@include('Visitor.inc.menu')
@include('success')
<style>
    .heroSec {
        width: 100%;
        height: 87vh;
        padding: 0 !important;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: space-evenly;
        background: #fff;
        overflow: hidden;
    }

    .mainContent {
        width: 90%;
        display: flex;
        align-items: center;
        justify-content: space-between;
        column-gap: 20px;
    }

    .mainContent .leftContent {
        width: 50%;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        justify-content: center;
        row-gap: 20px;
    }

    .mainContent .leftContent>h3 {
        font-size: 4rem !important;
        font-weight: 700 !important;
        margin-bottom: 0 !important;
        color: #CF202F;
    }

    .mainContent .leftContent>p {
        font-size: 1.5rem !important;
        font-weight: 600 !important;
        margin-bottom: 0 !important;
        color: #727272;
    }

    .mainContent .rightContent {
        width: 50%;
        display: flex;
        align-items: center;
        justify-content: flex-end;
    }

    .mainContent .rightContent img {
        max-width: 75% !important;
    }

    .footerSec {
        width: 90%;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .footerSec>img {
        border-radius: 5px !important;
        object-fit: cover !important;
        object-position: center !important;
    }
</style>



<!-- Hero Question Page -->
<section class="heroSec">
    <div class="mainContent">
        <div class="leftContent">
            <h3>Questions</h3>
            <p>Use these questions to review the material
                and assess your understanding of the concepts
            </p>
        </div>
        <div class="rightContent">
            <img src="{{ asset('images/HeroBackground/Questions Hero.png') }}" alt="Courses">
        </div>
    </div>
    <div class="footerSec">
        <img src="{{ asset('images/HeroBackground/sat.png') }}" alt="photo">
        <img src="{{ asset('images/HeroBackground/collegeBoard.png') }}" alt="photo">
        <img src="{{ asset('images/HeroBackground/act.png') }}" alt="photo">
        <img src="{{ asset('images/HeroBackground/est.png') }}" alt="photo">
    </div>
</section>


<form action="{{ route('v_filter_question') }}" method="GET">
    <div style="padding: 100px 100px 0 100px">
        <div class="d-flex my-2">
            <select class="form-control sel_category mx-2" name="category_id">
                <option disabled selected>
                    Select Category ...
                </option>
                @foreach ($categories as $category)
                    <option value="{{ $category->id }}">
                        {{ $category->cate_name }}
                    </option>
                @endforeach
            </select>
            <select class="form-control mx-2 sel_course" name="course_id">
                <option disabled selected>
                    Select Course ...
                </option>
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
                    <option value="{{ $i }}">
                        {{ $i }}
                    </option>
                @endfor
            </select>
            <select class="form-control mx-2" name="month">
                <option disabled selected>
                    Select Month ...
                </option>
                @for ($i = 1; $i <= 12; $i++)
                    <option value="{{ $i }}">
                        {{ date('M', ($i - 1) * 31 * 24 * 60 * 60) }}
                    </option>
                @endfor
            </select>
            <input class="form-control mx-2" name="section" placeholder="Section" />
        </div>

        <div class="d-flex my-2">
            <select name="q_code" class="form-control mx-2">
                <option selected value="">
                    Select Code ...
                </option>
                @foreach ($codes as $item)
                    <option value="{{ $item->id }}">
                        {{ $item->exam_code }}
                    </option>
                @endforeach
            </select>
            <input class="form-control mx-2" name="q_num" placeholder="Question Number" />

            <button class="btn btn-primary mx-2 px-4">
                Search
            </button>
        </div>
    </div>
</form>


@foreach ($popup as $item)
    <div class="modal show_popup fade show " id="modalCenter" tabindex="-1" style="display: block;" aria-modal="true"
        role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalCenterTitle">Exam</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <img style="width: 100%; height: 200px;"
                        src="{{ asset('images/MarketingPopup/' . $item->image) }}" />

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-label-secondary close_popup_btn" data-bs-dismiss="modal">
                        Close
                    </button>
                </div>
            </div>
        </div>
    </div>
@endforeach
<script>
    let show_popup = document.querySelectorAll('.show_popup');
    let btn_close = document.querySelectorAll('.btn-close');
    let close_popup_btn = document.querySelectorAll('.close_popup_btn');

    for (let i = 0, end = btn_close.length; i < end; i++) {

        btn_close[i].addEventListener('click', (e) => {
            for (let j = 0; j < end; j++) {
                if (e.target == show_popup[j]) {
                    show_popup[j].classList.add('d-none');
                }
            }
        })
        close_popup_btn[i].addEventListener('click', (e) => {
            for (let j = 0; j < end; j++) {
                if (e.target == close_popup_btn[j]) {
                    show_popup[j].classList.add('d-none');
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
