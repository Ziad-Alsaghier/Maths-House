
@include('Visitor.inc.header')
@include('Visitor.inc.menu')
<div class="wrapper">
	<div class="preloader"></div>


	<!-- Inner Page Breadcrumb -->
	<section class="inner_page_breadcrumb">
		<div class="container">
			<div class="row" style="width: 100%;">
				<div class="col-xl-6 offset-xl-3 text-center">
					<div class="breadcrumb_content">
						<h4 class="breadcrumb_title">Course</h4>
						<ol class="breadcrumb">
						    <li class="breadcrumb-item"><a href="#">Home</a></li>
						    <li class="breadcrumb-item active" aria-current="page">Course</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>

	@include('success')
	<!-- Courses List 2 -->
	<section class="courses-list2 pb40">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-lg-8 col-xl-9">
					<div class="row courses_list_heading style2">
						<div class="col-xl-4 p0">
							<div class="instructor_search_result style2">
								<p class="mt10 fz15"><span class="color-dark pr10">85 </span> results <span class="color-dark pr10">1,236</span> Video Tutorials</p>
							</div>
						</div>
						<div class="col-xl-8 p0">
							<div class="candidate_revew_select style2 text-right">
								<ul class="mb0">
									<li class="list-inline-item">
										<select class="selectpicker show-tick">
											<option>Newly published</option>
											<option>Recent</option>
											<option>Old Review</option>
										</select>
									</li>
									<li class="list-inline-item">
										<div class="candidate_revew_search_box course fn-520">
											<form class="form-inline my-2 my-lg-0">
										    	<input class="form-control mr-sm-2" type="search" placeholder="Search our instructors" aria-label="Search">
										    	<button class="btn my-2 my-sm-0" type="submit"><span class="flaticon-magnifying-glass"></span></button>
										    </form>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="row courses_container style2">
                        @foreach( $courses as $course )
						<div class="col-lg-12 p0 wallet_btn">
							<div class="courses_list_content">
								<div class="top_courses list">
									<div class="details">
									<div class="thumb">
										<img class="img-whp" src="{{asset('images/courses/' . $course->course_url)}}" alt="t1.jpg">
										<div class="overlay">
                                        <i style="font-size: 27px;" class="fa-solid fa-cart-plus cart_btn text-light m-3"></i> 
											<div class="tc_preview_course" href="{{route('v_dia_exam', ['id' => $course->id]) }}">Preview Course</div>
										</div>
									</div>
								</div>
                                    
									<div href="{{route('v_dia_exam', ['id' => $course->id]) }}" class="details">
										<div class="tc_content">
											<p>
                                                {{$course->teacher->name}}
                                            </p>
											<h5>
                                                {{$course->course_name}}
                                            </h5>
											<p>
                                                {{$course->course_des}}
                                            </p>
										</div>   
									</div>
								</div>
							</div>
						</div>
						<div class="modal show_wallet fade show d-none" id="modalCenter" tabindex="-1" style="display: block;" aria-modal="true" role="dialog">
							<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
								<h5 class="modal-title" id="modalCenterTitle">Exam</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									Start Exam ??
			
								</div>
								<div class="modal-footer">
								<button type="button" class="btn btn-label-secondary close_wallet_btn" data-bs-dismiss="modal">
									Close
								</button>
								<a class="btn btn-success" href="{{route('v_dia_exam', ['id' => $course->id]) }}">
									Start
								</a>
								</div>
							</div>
							</div>
						</div>
                        @endforeach
					</div>
			</div>
		</div>
	</section>
	@include('Visitor.inc.mobile_menu')

<a class="scrollToHome" href="#"><i class="flaticon-up-arrow-1"></i></a>
</div>


<script>
    let wallet_btn = document.querySelectorAll('.wallet_btn');
    let show_wallet = document.querySelectorAll('.show_wallet');
    let btn_close = document.querySelectorAll('.btn-close');
    let close_wallet_btn = document.querySelectorAll('.close_wallet_btn');

    for (let i = 0, end = wallet_btn.length; i < end; i++) {
        wallet_btn[i].addEventListener('click', ( e ) => {
            for (let j = 0; j < end; j++) {
                if ( e.target == wallet_btn[j] ||  e.target.parentElement == wallet_btn[j] 
				||  e.target.parentElement.parentElement == wallet_btn[j]||  
				e.target.parentElement.parentElement.parentElement == wallet_btn[j]||  
				e.target.parentElement.parentElement.parentElement.parentElement == wallet_btn[j]||  
				e.target.parentElement.parentElement.parentElement.parentElement.parentElement == wallet_btn[j] ) {
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
</script>
@include('Visitor.inc.footer')