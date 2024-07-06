@include('Visitor.inc.header')
@include('Visitor.inc.menu')
<div class="wrapper">
    <div class="preloader"></div>

    <!-- Main Header Nav -->
    <header class="header-nav menu_style_home_one navbar-scrolltofixed stricky main-menu">
        <div class="container-fluid">
            <!-- Ace Responsive Menu -->
            <nav>
                <!-- Menu Toggle btn-->
                <div class="menu-toggle">
                    <img class="nav_logo_img img-fluid" src="images/header-logo.png" alt="header-logo.png">
                    <button type="button" id="menu-btn">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <a href="#" class="navbar_brand float-left dn-smd">
                    <img class="logo1 img-fluid" src="images/header-logo.png" alt="header-logo.png">
                    <img class="logo2 img-fluid" src="images/header-logo2.png" alt="header-logo2.png">
                    <span>edumy</span>
                </a>
                <!-- Responsive Menu Structure-->
                <!--Note: declare the Menu style in the data-menu-style="horizontal" (options: horizontal, vertical, accordion) -->
                <ul id="respMenu" class="ace-responsive-menu" data-menu-style="horizontal">
                    <li>
                        <a href="#"><span class="title">Home</span></a>
                        <!-- Level Two-->
                        <ul>
                            <li><a href="index.html">Home 1</a></li>
                            <li><a href="index2.html">Home 2</a></li>
                            <li><a href="index3.html">Home 3</a></li>
                            <li><a href="index4.html">Home 4</a></li>
                            <li><a href="index5.html">Home 5</a></li>
                            <li><a href="index6.html">Home - University</a></li>
                            <li><a href="index7.html">Home College</a></li>
                            <li><a href="index8.html">Home Kindergarten</a></li>

                            <li>
                                <a href="#"><span class="title">Update New Homepages</span></a>
                                <!-- Level Two-->
                                <ul>
                                    <li><a href="index9.html">New Home 01</a></li>
                                    <li><a href="index10.html">New Home 02</a></li>
                                    <li><a href="index11.html">New Home 03</a></li>
                                    <li><a href="index12.html">New Home 04</a></li>
                                    <li><a href="index13.html">New Home 05</a></li>
                                </ul>
                            </li>

                        </ul>
                    </li>
                    <li>
                        <a href="#"><span class="title">Courses</span></a>
                        <!-- Level Two-->
                        <ul>
                            <li>
                                <a href="#">Courses List</a>
                                <!-- Level Three-->
                                <ul>
                                    <li><a href="page-course-v1.html">Courses v1</a></li>
                                    <li><a href="page-course-v2.html">Courses v2</a></li>
                                    <li><a href="page-course-v3.html">Courses v3</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">Courses Single</a>
                                <!-- Level Three-->
                                <ul>
                                    <li><a href="page-course-single-v1.html">Single V1</a></li>
                                    <li><a href="page-course-single-v2.html">Single V2</a></li>
                                    <li><a href="page-course-single-v3.html">Single V3</a></li>
                                    <li><a href="page-course-single-v4.html">New Single V4</a></li>
                                    <li><a href="page-course-single-v5.html">New Single V5</a></li>
                                    <li><a href="page-course-single-v6.html">New Single V6</a></li>
                                    <li><a href="page-course-single-v7.html">New Single V7</a></li>
                                </ul>
                            </li>
                            <li><a href="page-instructors.html">Instructors</a></li>
                            <li><a href="page-instructors-single.html">Instructor Single</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><span class="title">Events</span></a>
                        <ul>
                            <li><a href="page-event.html">Event List</a></li>
                            <li><a href="page-event-single.html">Event Single</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><span class="title">Pages</span></a>
                        <ul>
                            <li>
                                <a href="#"><span class="title">Shop Pages</span></a>
                                <ul>
                                    <li><a href="page-shop.html">Shop</a></li>
                                    <li><a href="page-shop-single.html">Shop Single</a></li>
                                    <li><a href="page-shop-cart.html">Cart</a></li>
                                    <li><a href="page-shop-checkout.html">Checkout</a></li>
                                    <li><a href="page-shop-order.html">Order</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#"><span class="title">User Admin</span></a>
                                <ul>
                                    <li><a href="page-dashboard.html">Dashboard</a></li>
                                    <li><a href="page-my-courses.html">My Courses</a></li>
                                    <li><a href="page-my-order.html">My Order</a></li>
                                    <li><a href="page-my-message.html">My Message</a></li>
                                    <li><a href="page-my-review.html">My Review</a></li>
                                    <li><a href="page-my-bookmarks.html">My Bookmarks</a></li>
                                    <li><a href="page-my-listing.html">My Listing</a></li>
                                    <li><a href="page-my-setting.html">My Setting</a></li>
                                </ul>
                            </li>
                            <li><a href="page-about.html">About Us</a></li>
                            <li><a href="page-gallery.html">Gallery</a></li>
                            <li><a href="page-gallery2.html">Video Gallery</a></li>
                            <li><a href="page-faq.html">Faq</a></li>
                            <li><a href="page-login.html">LogIn</a></li>
                            <li><a href="page-login2.html">New LogIn V2</a></li>
                            <li><a href="page-login3.html">New LogIn V3</a></li>
                            <li><a href="page-login4.html">New LogIn V4</a></li>
                            <li><a href="page-register.html">Register</a></li>
                            <li><a href="page-pricing.html">Membership</a></li>
                            <li><a href="page-error.html">404 Page</a></li>
                            <li><a href="page-terms.html">Terms and Conditions</a></li>
                            <li><a href="page-become-instructor.html">Become an Instructor</a></li>
                            <li><a href="page-ui-element.html">UI Elements</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><span class="title">Blog</span></a>
                        <ul>
                            <li><a href="page-blog-v1.html">Blog List 1</a></li>
                            <li><a href="page-blog-grid.html">Blog List 2</a></li>
                            <li><a href="page-blog-list.html">Blog List 3</a></li>
                            <li><a href="page-blog-list2.html">New Blog List 4</a></li>
                            <li><a href="page-blog-list3.html">New Blog List 5</a></li>
                            <li><a href="page-blog-list4.html">New Blog List 6</a></li>
                            <li><a href="page-blog-single.html">Single Post</a></li>
                        </ul>
                    </li>
                    <li class="last">
                        <a href="page-contact.html"><span class="title">Contact</span></a>
                    </li>
                </ul>
                <ul class="sign_up_btn pull-right dn-smd mt20">
                    <li class="list-inline-item list_s"><a href="#" class="btn flaticon-user"
                            data-toggle="modal" data-target="#exampleModalCenter"> <span
                                class="dn-lg">Login/Register</span></a></li>
                    <li class="list-inline-item list_s">
                        <div class="cart_btn">
                            <ul class="cart">
                                <li>
                                    <a href="#" class="btn cart_btn flaticon-shopping-bag"><span>5</span></a>
                                    <ul class="dropdown_content">
                                        <li class="list_content">
                                            <a href="#">
                                                <img class="float-left" src="http://via.placeholder.com/50x50"
                                                    alt="50x50">
                                                <p>Dolar Sit Amet</p>
                                                <small>1 × $7.90</small>
                                                <span class="close_icon float-right"><i class="fa fa-plus"></i></span>
                                            </a>
                                        </li>
                                        <li class="list_content">
                                            <a href="#">
                                                <img class="float-left" src="http://via.placeholder.com/50x50"
                                                    alt="50x50">
                                                <p>Lorem Ipsum</p>
                                                <small>1 × $7.90</small>
                                                <span class="close_icon float-right"><i class="fa fa-plus"></i></span>
                                            </a>
                                        </li>
                                        <li class="list_content">
                                            <a href="#">
                                                <img class="float-left" src="http://via.placeholder.com/50x50"
                                                    alt="50x50">
                                                <p>Is simply</p>
                                                <small>1 × $7.90</small>
                                                <span class="close_icon float-right"><i class="fa fa-plus"></i></span>
                                            </a>
                                        </li>
                                        <li class="list_content">
                                            <h5>Subtotal: $57.70</h5>
                                            <a href="#" class="btn btn-thm cart_btns">View cart</a>
                                            <a href="#" class="btn btn-thm3 checkout_btns">Checkout</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="list-inline-item list_s">
                        <div class="search_overlay">
                            <a id="search-button-listener" class="mk-search-trigger mk-fullscreen-trigger"
                                href="#">
                                <span id="search-button"><i class="flaticon-magnifying-glass"></i></span>
                            </a>
                        </div>
                    </li>
                </ul><!-- Button trigger modal -->
            </nav>
        </div>
    </header>
    <!-- Modal -->
    <div class="sign_up_modal modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                </div>
                <ul class="sign_up_tab nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab"
                            aria-controls="home" aria-selected="true">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab"
                            aria-controls="profile" aria-selected="false">Register</a>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="home" role="tabpanel"
                        aria-labelledby="home-tab">
                        <div class="login_form">
                            <form action="#">
                                <div class="heading">
                                    <h3 class="text-center">Login to your account</h3>
                                    <p class="text-center">Don't have an account? <a class="text-thm"
                                            href="#">Sign Up!</a></p>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control" id="exampleInputEmail1"
                                        placeholder="Email Address">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" id="exampleInputPassword1"
                                        placeholder="Password">
                                </div>
                                <div class="form-group custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="exampleCheck1">
                                    <label class="custom-control-label" for="exampleCheck1">Remember me</label>
                                    <a class="tdu btn-fpswd float-right" href="#">Forgot Password?</a>
                                </div>
                                <button type="submit" class="btn btn-log btn-block btn-thm2">Login</button>
                                <hr>
                                <div class="row mt40">
                                    <div class="col-lg">
                                        <button type="submit" class="btn btn-block color-white bgc-fb"><i
                                                class="fa fa-facebook float-left mt5"></i> Facebook</button>
                                    </div>
                                    <div class="col-lg">
                                        <button type="submit" class="btn btn-block color-white bgc-gogle"><i
                                                class="fa fa-google float-left mt5"></i> Google</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                        <div class="sign_up_form">
                            <div class="heading">
                                <h3 class="text-center">Create New Account</h3>
                                <p class="text-center">Have an account? <a class="text-thm" href="#">Login</a>
                                </p>
                            </div>
                            <form action="#">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="exampleInputName1"
                                        placeholder="Username">
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control" id="exampleInputEmail2"
                                        placeholder="Email Address">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" id="exampleInputPassword2"
                                        placeholder="Password">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" id="exampleInputPassword3"
                                        placeholder="Confirm Password">
                                </div>
                                <div class="form-group custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="exampleCheck2">
                                    <label class="custom-control-label" for="exampleCheck2">Want to become an
                                        instructor?</label>
                                </div>
                                <button type="submit" class="btn btn-log btn-block btn-thm2">Register</button>
                                <hr>
                                <div class="row mt40">
                                    <div class="col-lg">
                                        <button type="submit" class="btn btn-block color-white bgc-fb"><i
                                                class="fa fa-facebook float-left mt5"></i> Facebook</button>
                                    </div>
                                    <div class="col-lg">
                                        <button type="submit" class="btn btn-block color-white bgc-gogle"><i
                                                class="fa fa-google float-left mt5"></i> Google</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal Search Button Bacground Overlay -->
    <div class="search_overlay dn-992">
        <div class="mk-fullscreen-search-overlay" id="mk-search-overlay">
            <a href="#" class="mk-fullscreen-close" id="mk-fullscreen-close-button"><i
                    class="fa fa-times"></i></a>
            <div id="mk-fullscreen-search-wrapper">
                <form method="get" id="mk-fullscreen-searchform">
                    <input type="text" value="" placeholder="Search courses..."
                        id="mk-fullscreen-search-input">
                    <i class="flaticon-magnifying-glass fullscreen-search-icon"><input value=""
                            type="submit"></i>
                </form>
            </div>
        </div>
    </div>

    <!-- Main Header Nav For Mobile -->
    @include('Visitor.inc.mobile_menu')


    @include('success')
    <!-- Shop Checkouts Content -->
    <section class="shop-checkouts">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-8 col-xl-8">
                </div>
                <div class="col-lg-4 col-xl-4">
                    <div class="order_sidebar_widget mb30">
                        <h4 class="title">Your Order</h4>
                        <ul>
                            <li class="subtitle">
                                <p>Product <span class="float-right">Total</span></p>
                            </li>
                            @foreach ($chapters as $chapter)
                                <li>
                                    <p>{{ $chapter->chapter_name }} <span
                                            class="float-right">{{ $chapter->ch_price }}</span></p>
                                </li>
                            @endforeach
                            <li class="subtitle">
                                <p>Subtotal <span class="float-right">Subtotal</span></p>
                            </li>
                            <li class="subtitle">
                                <p>Total <span class="float-right totals color-orose">${{ $price }}</span></p>
                            </li>
                        </ul>
                    </div>
                    <form action="{{ route('payment_money') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="payment_widget">
                            <div class="ui_kit_checkbox style2">
                                @foreach ($payment_methods as $item)
                                    <div class="custom-control custom-checkbox my-3">
                                        <input type="radio" name="payment_method_id" value="{{ $item->id }}"
                                            class="custom-control-input payment_method_radio"
                                            id="customCheck80{{ $item->id }}" checked />
                                        <label class="custom-control-label"
                                            for="customCheck80{{ $item->id }}">{{ $item->payment }}
                                            <img style="height:50px; width:70px;"
                                                src="{{ asset('images/payment/' . $item->logo) }}" class="pr15" />
                                        </label>

                                    </div>

                                    <input type="file" id="reset_img{{ $item->id }}" name="image[]"
                                        class="form-control d-none" />
                                    <label class="upload_img d-none" style="cursor: pointer;" for="reset_img">
                                        <div class="bt_details">
                                            <p>
                                                {{ $item->description }}
                                            </p>
                                        </div>
                                        <label for="reset_img{{ $item->id }}" class="btn btn-info">
                                            <i class="fa-solid fa-upload mr-2"></i>
                                            Upload Reseipt
                                        </label>
                                    </label>
                                @endforeach

                                <div class="custom-control custom-checkbox">
                                    <input type="radio" name="payment_method_id" value="Wallet"
                                        class="custom-control-input payment_method_radio" id="customCheck80"
                                        checked />
                                    <label class="custom-control-label" for="customCheck80">
                                        <h3>
                                            Using Wallet
                                        </h3>
                                    </label>

                                </div>
                                <script>
                                    let payment_method_radio = document.querySelectorAll('.payment_method_radio');
                                    let upload_img = document.querySelectorAll('.upload_img');
                                    for (let i = 0, end = payment_method_radio.length; i < end; i++) {
                                        payment_method_radio[i].addEventListener('change', (e) => {
                                            for (let j = 0; j < end; j++) {
                                                if (e.target == payment_method_radio[j]) {
                                                    upload_img[j].classList.remove('d-none');
                                                } else {
                                                    upload_img[j].classList.add('d-none');
                                                }
                                            }
                                        })
                                    }
                                </script>
                            </div>
                        </div>
                        <div class="ui_kit_button payment_widget_btn">
                            <button class="btn dbxshad btn-lg btn-thm3 circle btn-block">Place Order</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>


    <a class="scrollToHome" href="#"><i class="flaticon-up-arrow-1"></i></a>
</div>
@include('Visitor.inc.footer')
