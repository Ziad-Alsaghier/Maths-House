@include('Visitor.inc.header')
@include('Visitor.inc.menu')
@include('success')
<style>
    .table td {
        padding: .50rem;
        font-weight: 600;
        color: #787878 !important;
    }

    .form-control:focus {
        color: #B8B8B8 !important;
        background-color: #fff;
        border-color: none !important;
        outline: 0;
        box-shadow: none !important;
    }

    .footerCardd {
        display: flex;
        flex-direction: column;
        row-gap: 20px;
    }

    .secApplayCoupone {
        background: #fff;
        width: 100%;
        height: 55px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        column-gap: 5px;
        border-radius: 10px;
        border: 2px solid #CF202F;
        overflow: hidden;
    }

    .secApplayCoupone img {
        width: 10% !important;
    }

    .secApplayCoupone input {
        width: 50% !important;
        height: 100%;
        border: none;
        padding: 20px;
        outline: none;
    }

    .secApplayCoupone button {
        width: 35% !important;
        height: 100%;
        font-size: 1.2rem;
        font-weight: 600;
        border: none;
        outline: none;
        background: #FDF4F5;
        padding: 10px;
        color: #CF202F;
        cursor: pointer;
    }

    .UpdateCard {
        background: #fff;
        color: #CF202F;
        font-size: 1.5rem;
        font-weight: 600;
        width: 100%;
        height: 55px;
        border: none;
        outline: none;
        border-radius: 10px;
        border: 3px solid #CF202F;
        cursor: pointer;
    }

    .sideTotal {
        padding: 15px;
        background: #FDF4F5;
        text-align: center;
        border-radius: 15px;
    }

    .btnCheckout {
        background: #CF202F;
        color: #fff;
        font-size: 1.5rem;
        font-weight: 600;
        padding: 12px 0;
        border-radius: 10px;
        width: 100%;
        border: none;
        outline: none;
        cursor: pointer;
        transition: all 0.3s ease-in-out;
    }

    .btnCheckout:hover {
        background: #fff;
        color: #CF202F;
        border: 3px solid #CF202F;

    }
</style>
<div class="wrapper">
    <div class="preloader"></div>


    <!-- Main Header Nav For Mobile -->
    @include('Visitor.inc.mobile_menu')



    <!-- Shop Checkouts Content -->
    <section class="shop-checkouts">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-8 col-xl-8">
                    <div>
                        <form action="#">
                            <table class="table col-12  mt-2">
                                <thead>
                                    <tr>
                                        <th class="col-4"
                                            style="border-top: none !important; color: #CF202F;font-size: 1.1rem; "
                                            scope="col">Chapters</th>
                                        <th class="col-3"
                                            style="border-top: none !important; color: #CF202F;font-size: 1.1rem; "
                                            scope="col">Duration</th>
                                            <th class="col-2"
                                                style="border-top: none !important; color: #CF202F;font-size: 1.1rem; "
                                                scope="col">Price</th>
                                                <th class="col-3"
                                                    style="border-top: none !important; color: #CF202F;font-size: 1.1rem; "
                                                    scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($chapters as $chapter)
                                    <tr>
                                        <td scope="row">
                                            <div class="d-flex align-items-center">

                                                <img width="132px" height="96px" style="border-radius: 10px"
                                                src="{{ asset('images/Chapters/' . $chapter->ch_url) }}" />
                                                <span class="ml-3">
                                                    {{ $chapter->chapter_name }}
                                                </span>
                                            </div>
                                        </td>
                                        <td>

                                            <select name="chapter_duration" class="form-control chapter_duration">
                                                @php
                                                    $min = $chapter->price[0];
                                                    foreach ($chapter->price as $item) {
                                                        if ($item->duration < $min->duration) {
                                                            $min = $item;
                                                        }
                                                    }
                                                @endphp
                                                <option value="{{ $min->id }}">
                                                    {{ $min->duration }} Days
                                                </option>
                                                @foreach ($chapter->price as $item)
                                                    <option value="{{ $item->id }}">
                                                        {{ $item->duration }} Days
                                                    </option>
                                                @endforeach
                                            </select>
                                        </td>
                                        <input type="hidden" class="chapters_price"
                                            value="{{ json_encode($chapter->price) }}" />
                                        <input type="hidden" class="ch_price" name="ch_price[]"
                                            value="{{ $chapter->ch_price }}" />
                                        <input type="hidden" class="ch_price_discount"
                                            name="ch_price_discount[]" />
                                        <input type="hidden" class="chapter_data" name="chapter[]"
                                            value="{{ json_encode($chapter) }}" />
                                        <td class="tbl_chapter_price">
                                            {{ $chapter->ch_price }}$
                                        </td>
                                        <td>
                                            <a href="{{ route('remove_course_package', ['id' => $chapter->id]) }}"
                                                class="btn btn-danger">
                                                Remove
                                            </a>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>

                        </form>
                    </div>
                    <div style="margin-top: 3rem;">
                        <div>
                            <h3 style="margin-bottom: 2rem !important; color: #6D6D6D">Do you have a discount code?</h3>
                            <form method="POST" action="{{ route('use_promocode') }}" class="form-inline">
                                @csrf
                                {{-- <input name="promo_code" class="form-control" type="search" placeholder="Coupon Code"
                                    aria-label="Search">
                                <button class="btn btn2">Apply Coupon</button>
                                <button type="button" class="btn btn3">Update Cart</button> --}}

                                <div class="footerCardd">
                                    <div class="secApplayCoupone">
                                        <img src="{{ asset('images/payment/DiscountIcon.svg') }}" alt="">
           
                                        <input name="promo_code" class="form-control" type="search"
                                        placeholder="Coupon Code" aria-label="Search">
                                    <button class="btn btn2">Apply Coupon</button>
                                    <button type="button" class="btn btn3">Update Cart</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-xl-4">
                    <div class="sideTotal mb30">
                        <h3 style="color: #CF202F">Cart Totals</h3>
                        <ul>
                            <li>
                                <p>Total <span class="float-right totals color-orose">
                                        @if (isset($chapter_discount) && $chapter_discount != null && $chapter_discount != 0)
                                            <del> ${{ $chapters_price }} </del>
                                            <span class="text-success ch_total_discount">
                                                ${{ $chapter_discount }}
                                            </span>
                                        @else
                                            <span class="text-success ch_total_discount">
                                                ${{ $chapters_price }}
                                            </span>
                                        @endif
                                    </span></p>
                            </li>
                        </ul>
                    </div>
                    <form method="POST" action="{{ route('check_out') }}">
                        @csrf
                        @if (isset($chapter_discount) && $chapter_discount != null && $chapter_discount != 0)
                            <input type="hidden" class="chapters_pricing" name="chapters_pricing"
                            value="{{ $chapter_discount }}" />
                        @else
                            <input type="hidden" class="chapters_pricing" name="chapters_pricing"
                                value="{{ $chapters_price }}" />
                        @endif
                        <button class="btn dbxshad btn-lg btn-thm3 circle btn-block">Proceed To Checkout</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <input type="hidden" class="price_arr" value="{{ json_encode(@$price_arr) }}" />
    <a class="scrollToHome" href="#"><i class="flaticon-up-arrow-1"></i></a>
</div>


<script>
    let chapter_duration = document.querySelectorAll('.chapter_duration');
    let chapters_price = document.querySelectorAll('.chapters_price');
    let tbl_chapter_price = document.querySelectorAll('.tbl_chapter_price');
    let ch_price = document.querySelectorAll('.ch_price');
    let total_price = document.querySelector('.total_price');
    let course_price = document.querySelector('.course_price');

    for (let i = 0, end = chapter_duration.length; i < end; i++) {
        chapter_duration[i].addEventListener('change', (e) => {
            for (let j = 0; j < end; j++) {
                if (e.target == chapter_duration[j]) {
                    let money = chapters_price[j];
                    let discount = 0;
                    money = money.value;
                    money = JSON.parse(money);
                    money.forEach(element => {
                        if (element.id == chapter_duration[j].value) {
                            discount = element.discount;
                            money = element.price;
                        }
                    });
                    if (discount != 0 && discount != null) {
                        let total = money - (money * discount / 100);
                        tbl_chapter_price[j].innerHTML = `
						 <del>${money}$</del>
						 <span class="text-success">
							${total}$	
						</span>
						`;
                        course_price.value = total;
                        total_price.innerHTML = `
						 <del>${money}$</del>
						 <span>
							${total}$	
						</span>`;
                        ch_price[j].value = total;
                    } else {
                        tbl_chapter_price[j].innerHTML = `
						${money}$
						`;
                        course_price.value = money;
                        total_price.innerHTML = `${money}$`;
                        ch_price[j].value = money;
                    }
                }
            }
        })
    }
</script>
@include('Visitor.inc.footer')

