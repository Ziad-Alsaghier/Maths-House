
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
	                <li class="list-inline-item list_s"><a href="#" class="btn flaticon-user" data-toggle="modal" data-target="#exampleModalCenter"> <span class="dn-lg">Login/Register</span></a></li>
	                <li class="list-inline-item list_s">
	                	<div class="cart_btn">
							<ul class="cart">
								<li>
									<a href="#" class="btn cart_btn flaticon-shopping-bag"><span>5</span></a>
									<ul class="dropdown_content">
										<li class="list_content">
											<a href="#">
												<img class="float-left" src="http://via.placeholder.com/50x50" alt="50x50">
												<p>Dolar Sit Amet</p>
												<small>1 × $7.90</small>
												<span class="close_icon float-right"><i class="fa fa-plus"></i></span>
											</a>
										</li>
										<li class="list_content">
											<a href="#">
												<img class="float-left" src="http://via.placeholder.com/50x50" alt="50x50">
												<p>Lorem Ipsum</p>
												<small>1 × $7.90</small>
												<span class="close_icon float-right"><i class="fa fa-plus"></i></span>
											</a>
										</li>
										<li class="list_content">
											<a href="#">
												<img class="float-left" src="http://via.placeholder.com/50x50" alt="50x50">
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
						 	<a id="search-button-listener" class="mk-search-trigger mk-fullscreen-trigger" href="#">
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
		        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		      	</div>
	    		<ul class="sign_up_tab nav nav-tabs" id="myTab" role="tablist">
				  	<li class="nav-item">
				    	<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Login</a>
				  	</li>
				  	<li class="nav-item">
				    	<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Register</a>
				  	</li>
				</ul>
				<div class="tab-content" id="myTabContent">
				  	<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
						<div class="login_form">
							<form action="#">
								<div class="heading">
									<h3 class="text-center">Login to your account</h3>
									<p class="text-center">Don't have an account? <a class="text-thm" href="#">Sign Up!</a></p>
								</div>
								 <div class="form-group">
							    	<input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email Address">
								</div>
								<div class="form-group">
							    	<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
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
										<button type="submit" class="btn btn-block color-white bgc-fb"><i class="fa fa-facebook float-left mt5"></i> Facebook</button>
									</div>
									<div class="col-lg">
										<button type="submit" class="btn btn-block color-white bgc-gogle"><i class="fa fa-google float-left mt5"></i> Google</button>
									</div>
								</div>
							</form>
						</div>
				  	</div>
				  	<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
						<div class="sign_up_form">
							<div class="heading">
								<h3 class="text-center">Create New Account</h3>
								<p class="text-center">Have an account? <a class="text-thm" href="#">Login</a></p>
							</div>
							<form action="#">
								<div class="form-group">
							    	<input type="text" class="form-control" id="exampleInputName1" placeholder="Username">
								</div>
								 <div class="form-group">
							    	<input type="email" class="form-control" id="exampleInputEmail2" placeholder="Email Address">
								</div>
								<div class="form-group">
							    	<input type="password" class="form-control" id="exampleInputPassword2" placeholder="Password">
								</div>
								<div class="form-group">
							    	<input type="password" class="form-control" id="exampleInputPassword3" placeholder="Confirm Password">
								</div>
								<div class="form-group custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input" id="exampleCheck2">
									<label class="custom-control-label" for="exampleCheck2">Want to become an instructor?</label>
								</div>
								<button type="submit" class="btn btn-log btn-block btn-thm2">Register</button>
								<hr>
								<div class="row mt40">
									<div class="col-lg">
										<button type="submit" class="btn btn-block color-white bgc-fb"><i class="fa fa-facebook float-left mt5"></i> Facebook</button>
									</div>
									<div class="col-lg">
										<button type="submit" class="btn btn-block color-white bgc-gogle"><i class="fa fa-google float-left mt5"></i> Google</button>
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
		    <a href="#" class="mk-fullscreen-close" id="mk-fullscreen-close-button"><i class="fa fa-times"></i></a>
		    <div id="mk-fullscreen-search-wrapper">
		      <form method="get" id="mk-fullscreen-searchform">
		        <input type="text" value="" placeholder="Search courses..." id="mk-fullscreen-search-input">
		        <i class="flaticon-magnifying-glass fullscreen-search-icon"><input value="" type="submit"></i>
		      </form>
		    </div>
		</div>
	</div>

	<!-- Main Header Nav For Mobile -->
		@include('Visitor.inc.mobile_menu')

	<!-- Inner Page Breadcrumb -->
	<section class="inner_page_breadcrumb">
		<div class="container">
			<div class="row" style="width: 100%;">
				<div class="col-xl-6 offset-xl-3 text-center">
					<div class="breadcrumb_content">
						<h4 class="breadcrumb_title">Contact Us</h4>
						<ol class="breadcrumb">
						    <li class="breadcrumb-item"><a href="#">Home</a></li>
						    <li class="breadcrumb-item active" aria-current="page">Contact Us</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- How It's Work -->
	<section class="our-contact">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-lg-4">
					<div class="contact_localtion text-center">
						<div class="icon"><span class="flaticon-placeholder-1"></span></div>
						<h4>Our Location</h4>
						<p>Collin Street West, Victor 8007, Australia.</p>
					</div>
				</div>
				<div class="col-sm-6 col-lg-4">
					<div class="contact_localtion text-center">
						<div class="icon"><span class="flaticon-phone-call"></span></div>
						<h4>Our Location</h4>
						<p class="mb0">Mobile: (+096) 468 235 <br> Fax: (+096) 468 235</p>
					</div>
				</div>
				<div class="col-sm-6 col-lg-4">
					<div class="contact_localtion text-center">
						<div class="icon"><span class="flaticon-email"></span></div>
						<h4>Write Some Words</h4>
						<p>Info@edumy.com</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="h600" id="map-canvas"></div>
				</div>
				<div class="col-lg-6 form_grid">
					<h4 class="mb5">Send a Message</h4>
					<p>Ex quem dicta delicata usu, zril vocibus maiestatis in qui.</p>
		            <form class="contact_form" id="contact_form" action="{{route('contact_msg')}}" method="POST" novalidate="novalidate">
						<div class="row">
                            @csrf
			                <div class="col-sm-12">
			                    <div class="form-group">
			                    	<label for="exampleInputName">Full Name</label>
									<input id="form_name" name="name" class="form-control" required="required" type="text">
								</div>
			                </div>
			                <div class="col-sm-12">
			                    <div class="form-group">
			                    	<label for="exampleInputEmail">Your Email</label>
			                    	<input id="form_email" name="email" class="form-control required email" required="required" type="email">
			                    </div>
			                </div>
			                <div class="col-sm-12">
			                    <div class="form-group">
			                    	<label for="exampleInputSubject">Subject</label>
				                    <input id="form_subject" name="subject" class="form-control required" required="required" type="text">
								</div>
			                </div>
			                <div class="col-sm-12">
	                            <div class="form-group">
	                            	<label for="exampleInputEmail1">Your Message</label>
	                                <textarea id="form_message" name="message" class="form-control required" rows="5" required="required"></textarea>
	                            </div>
			                    <div class="form-group ui_kit_button mb0">
				                    <button class="btn dbxshad btn-lg btn-thm circle">Send</button>
                                    <button type="reset" class="btn dbxshad btn-lg btn-thm3 circle">
                                        Clear
                                    </button>
			                    </div>
			                </div>
		                </div>
		            </form>
				</div>
			</div>
		</div>
	</section>

<a class="scrollToHome" href="#"><i class="flaticon-up-arrow-1"></i></a>
</div>

@include('Visitor.inc.footer')