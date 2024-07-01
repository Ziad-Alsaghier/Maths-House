@include('Visitor.inc.header')
@include('Visitor.inc.menu')
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

<!-- Hero Page Exams -->
<section class="heroSec">
    <div class="mainContent">
        <div class="leftContent">
            <h3>Exams</h3>
            <p>Designed by experts in mathematics education
                to ensure accuracy and reliability
            </p>
        </div>
        <div class="rightContent">
            <img src="{{ asset('images/HeroBackground/Exam Hero.png') }}" alt="Exams">
        </div>
    </div>
    <div class="footerSec">
        <img src="{{ asset('images/HeroBackground/sat.png') }}" alt="photo">
        <img src="{{ asset('images/HeroBackground/collegeBoard.png') }}" alt="photo">
        <img src="{{ asset('images/HeroBackground/act.png') }}" alt="photo">
        <img src="{{ asset('images/HeroBackground/est.png') }}" alt="photo">
    </div>
</section>

<form action="{{ route('filter_exam') }}" method="GET">
    <div style="padding: 100px 100px 0 100px">
        <div class="d-flex my-2">
            <select name="cate_id" class="form-control mx-2 cate_sel">
                <option disabled selected>
                    Select Category ...
                </option>
                @foreach ($categories as $item)
                    <option value="{{ $item->id }}">
                        {{ $item->cate_name }}
                    </option>
                @endforeach
            </select>

            <input type="hidden" class="courses_data" value="{{ $courses }}" />

            <select class="form-control mx-2 course_sel" name="course_id">
                <option disabled selected>
                    Select Course ...
                </option>
            </select>


        </div>

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
            <select class="form-control mx-2" name="code_id">
                <option disabled selected>
                    Select Exam Code ...
                </option>
                @foreach ($exam_code as $item)
                    <option value="{{ $item->id }}">
                        {{ $item->exam_code }}
                    </option>
                @endforeach
            </select>

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

    let cate_sel = document.querySelector('.cate_sel');
    let course_sel = document.querySelector('.course_sel');
    let courses_data = document.querySelector('.courses_data');
    courses_data = courses_data.value;
    courses_data = JSON.parse(courses_data);

    cate_sel.addEventListener('change', () => {
        course_sel.innerHTML = `
            <option disabled selected>
                Select Course ...
            </option>
            `;
        courses_data.forEach(item => {
            if (cate_sel.value == item.category_id) {
                course_sel.innerHTML += `
                <option value="${item.id}">
                    ${item.course_name}
                </option>
                `;
            }
        });
    });
</script>
@include('Visitor.inc.footer')
