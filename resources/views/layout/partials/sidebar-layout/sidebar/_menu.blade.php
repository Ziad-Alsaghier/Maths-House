<style>
	.btn {
		min-width: 100px;
		margin-top: 3px;
	}
</style>
@if ( fun_admin() == 'admin' )
<!--begin::sidebar menu-->
<div class="app-sidebar-menu overflow-hidden flex-column-fluid">
	<!--begin::Menu wrapper-->
	<div id="kt_app_sidebar_menu_wrapper" class="app-sidebar-wrapper hover-scroll-overlay-y my-5" data-kt-scroll="true"
		data-kt-scroll-activate="true" data-kt-scroll-height="auto"
		data-kt-scroll-dependencies="#kt_app_sidebar_logo, #kt_app_sidebar_footer"
		data-kt-scroll-wrappers="#kt_app_sidebar_menu" data-kt-scroll-offset="5px" data-kt-scroll-save-state="true">
		<!--begin::Menu-->
		<div class="menu menu-column menu-rounded menu-sub-indention px-3 fw-semibold fs-6" id="#kt_app_sidebar_menu"
			data-kt-menu="true" data-kt-menu-expand="false">

			<!--begin:Menu item-->
			<div data-kt-menu-trigger="click"
				class="menu-item menu-accordion {{ request()->routeIs('user-management.*') ? 'here show' : '' }}">
				<!--begin:Menu link-->
				<a class=" {{ request()->routeIs('dashboard') ? 'active' : '' }}" href="{{ route('dashboard') }}">

					<span class="menu-link">
						<span class="menu-icon">{!! getIcon('element-11', 'fs-2') !!}</span>
						<span class="menu-title">Dashboards</span>
					</span>
				</a>
			</div>

			{{-- <div data-kt-menu-trigger="click"
				class="menu-item menu-accordion {{ request()->routeIs('dashboard') ? '' : 'here show' }}">
				<span class="menu-link">
					<span class="menu-icon">{!! getIcon('element-11', 'fs-2') !!}</span>
					<span class="menu-title">Users</span>
					<span class="menu-arrow"></span>
				</span>

				<ul class="menu-sub menu-sub-accordion">
					<li class="menu-item">
						<span class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">
								<a class="menu-link" style="padding: 0 !important"
									href="{{ route('dashboard') }}">Admines</a>
							</span>
							<span class="menu-arrow"></span>

						</span>
						<ul class="d-none" id="menu-admins">
							<li class="">
								<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
									href="{{ route('dashboard') }}">
									<span class="menu-bullet">
										<span class="bullet bullet-dot"></span>
									</span>
									<span class="menu-title">Admins</span>
								</a>
							</li>
							<li class="" id="menu-admins">
								<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
									href="{{ route('dashboard') }}">
									<span class="menu-bullet">
										<span class="bullet bullet-dot"></span>
									</span>
									<span class="menu-title">Roles</span>
								</a>
							</li>
						</ul>
					</li>
					<li class="menu-item">
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('dashboard') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Students</span>
						</a>
					</li>
					<li class="menu-item">
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('dashboard') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Teachers</span>
						</a>
					</li>
				</ul>
			</div> --}}

			@can('Admin')
			<div data-kt-menu-trigger="click"
				class="menu-item menu-accordion {{ request()->routeIs('user-management.*') ? 'here show' : '' }}">
				<!--begin:Menu link-->
				<span class="menu-link">
					<span class="menu-icon">{!! getIcon('element-11', 'fs-2') !!}</span>
					<span class="menu-title">Admin</span>
					<span class="menu-arrow"></span>
				</span>
				<!--end:Menu link-->
				<!--begin:Menu sub-->
				<div class="menu-sub menu-sub-accordion">
					<!--begin:Menu item-->
					<div class="menu-item">
						<!--begin:Menu link-->
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('admins_list') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Admins</span>
						</a>
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('role_admins_list') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Admin Roles</span>
						</a>
						<!--end:Menu link-->
					</div>
					<!--end:Menu item-->
				</div>
				<!--end:Menu sub-->
			</div>
			@endcan

			@can('Users')
			<div data-kt-menu-trigger="click"
				class="menu-item menu-accordion {{ request()->routeIs('user-management.*') ? 'here show' : '' }}">
				<!--begin:Menu link-->
				<span class="menu-link">
					<span class="menu-icon">{!! getIcon('element-11', 'fs-2') !!}</span>
					<span class="menu-title">Users</span>
					<span class="menu-arrow"></span>
				</span>
				<!--end:Menu link-->
				<!--begin:Menu sub-->
				<div class="menu-sub menu-sub-accordion">
					<!--begin:Menu item-->
					<div class="menu-item">
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('student') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Students</span>
						</a>
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('teacher') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Teachers</span>
						</a>
						<!--end:Menu link-->
					</div>
					<!--end:Menu item-->
				</div>
				<!--end:Menu sub-->
			</div>
			@endcan

			@can('Courses')
			<div data-kt-menu-trigger="click"
				class="menu-item menu-accordion {{ request()->routeIs('user-management.*') ? 'here show' : '' }}">
				<!--begin:Menu link-->
				<span class="menu-link">
					<span class="menu-icon">{!! getIcon('element-11', 'fs-2') !!}</span>
					<span class="menu-title">Courses</span>
					<span class="menu-arrow"></span>
				</span>
				<!--end:Menu link-->
				<!--begin:Menu sub-->
				<div class="menu-sub menu-sub-accordion">
					<!--begin:Menu item-->
					<div class="menu-item">
						<!--begin:Menu link-->
						<a class="menu-link " href="{{ route('category') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Categories</span>
						</a>
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('courses') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Courses</span>
						</a>
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('chapter') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Chapters</span>
						</a>
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('lesson') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Lessons</span>
						</a>
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('question') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Questions</span>
						</a>
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('quizze') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Quiz</span>
						</a>
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('dia_exam') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Diagnostic Exam</span>
						</a>
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('exam') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Exam</span>
						</a>


					</div>
					<!--end:Menu item-->
				</div>
				<!--end:Menu sub-->
			</div>
			@endcan

			@can('Live')
			<div data-kt-menu-trigger="click"
				class="menu-item menu-accordion {{ request()->routeIs('user-management.*') ? 'here show' : '' }}">
				<!--begin:Menu link-->
				<span class="menu-link">
					<span class="menu-icon">{!! getIcon('element-11', 'fs-2') !!}</span>
					<span class="menu-title">Live</span>
					<span class="menu-arrow"></span>
				</span>
				<!--end:Menu link-->
				<!--begin:Menu sub-->
				<div class="menu-sub menu-sub-accordion">
					<!--begin:Menu item-->
					<div class="menu-item">
						<!--begin:Menu link-->
						<a class="menu-link " href="{{ route('sessions') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Sessions</span>
						</a>
						<a class="menu-link " href="{{ route('session_g') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Groups</span>
						</a>
						<a class="menu-link " href="{{ route('ad_academic') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Academic</span>
						</a>
						<a class="menu-link " href="{{ route('private_request') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Private Request</span>
						</a>
						<a class="menu-link " href="{{ route('ad_private_requests') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Private Sessions</span>
						</a>
						<a class="menu-link " href="{{ route('cancelation') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Cancelation</span>
						</a>
						<a class="menu-link " href="{{ route('teacher_session') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Teacher Sessions</span>
						</a>
					</div>
				</div>
			</div>
			@endcan

			@can('Packages')
			<div data-kt-menu-trigger="click"
				class="menu-item menu-accordion {{ request()->routeIs('user-management.*') ? 'here show' : '' }}">
				<!--begin:Menu link-->
				<span class="menu-link">
					<span class="menu-icon">{!! getIcon('element-11', 'fs-2') !!}</span>
					<span class="menu-title">Packages</span>
					<span class="menu-arrow"></span>
				</span>
				<!--end:Menu link-->
				<!--begin:Menu sub-->
				<div class="menu-sub menu-sub-accordion">
					<!--begin:Menu item-->
					<div class="menu-item">
						<!--begin:Menu link-->
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('admin_packages') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Packages</span>
						</a>
						<!--begin:Menu link-->
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('add_stu_package') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Add to Package</span>
						</a>
						<!--begin:Menu link-->
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('package_history') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">History</span>
						</a>

					</div>
					<!--end:Menu item-->
				</div>
				<!--end:Menu sub-->
			</div>
			@endcan

			@can('ReportIssues')
			<div data-kt-menu-trigger="click"
				class="menu-item menu-accordion {{ request()->routeIs('user-management.*') ? 'here show' : '' }}">
				<!--begin:Menu link-->
				<span class="menu-link">
					<span class="menu-icon">{!! getIcon('element-11', 'fs-2') !!}</span>
					<span class="menu-title">Report Issues</span>
					<span class="menu-arrow"></span>
				</span>
				<!--end:Menu link-->
				<!--begin:Menu sub-->
				<div class="menu-sub menu-sub-accordion">
					<!--begin:Menu item-->
					<div class="menu-item">
						<!--begin:Menu link-->
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('admin_question_list_report') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Question Reports List</span>
						</a>
						<!--begin:Menu link-->
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('admin_question_action_report') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Question Reports Action</span>
						</a>
						<!--begin:Menu link-->
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('admin_video_report_list') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Videos Reports List</span>
						</a>
						<!--begin:Menu link-->
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('admin_video_action_report') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Videos Reports Action</span>
						</a>

					</div>
					<!--end:Menu item-->
				</div>
				<!--end:Menu sub-->
			</div>
			@endcan

			@can('Reports')
			<div data-kt-menu-trigger="click"
				class="menu-item menu-accordion {{ request()->routeIs('user-management.*') ? 'here show' : '' }}">
				<!--begin:Menu link-->
				<span class="menu-link">
					<span class="menu-icon">{!! getIcon('element-11', 'fs-2') !!}</span>
					<span class="menu-title">Reports</span>
					<span class="menu-arrow"></span>
				</span>
				<!--end:Menu link-->
				<!--begin:Menu sub-->
				<div class="menu-sub menu-sub-accordion">
					<!--begin:Menu item-->
					<div class="menu-item">
						<!--begin:Menu link-->
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('ad_live_report') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Live Report</span>
						</a>
						<!--begin:Menu link-->
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('ad_grade_report') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Grade Report</span>
						</a>
						<!--begin:Menu link-->
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('ad_payment_report') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Payment Report</span>
						</a>
						<!--begin:Menu link-->
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('ad_course_report') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Course Report</span>
						</a>
						<!--begin:Menu link-->
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('ad_question_report') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Exam Report</span>
						</a>
						<!--begin:Menu link-->
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('ad_score_sheet_report') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Score Sheet Report</span>
						</a>

					</div>
					<!--end:Menu item-->
				</div>
				<!--end:Menu sub-->
			</div>
			@endcan

			@can('Settings')
			<div data-kt-menu-trigger="click"
				class="menu-item menu-accordion {{ request()->routeIs('user-management.*') ? 'here show' : '' }}">
				<!--begin:Menu link-->
				<span class="menu-link">
					<span class="menu-icon">{!! getIcon('element-11', 'fs-2') !!}</span>
					<span class="menu-title">Settings</span>
					<span class="menu-arrow"></span>
				</span>
				<!--end:Menu link-->
				<!--begin:Menu sub-->
				<div class="menu-sub menu-sub-accordion">
					<!--begin:Menu item-->
					<div class="menu-item">
						<!--begin:Menu link-->
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('exam_score_sheet') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Raw Score</span>
						</a>
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('course_setting') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Exam Code</span>
						</a>
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('currency') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Currency</span>
						</a>
						<a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
							href="{{ route('logout_users') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Logout Users</span>
						</a>

					</div>
					<!--end:Menu item-->
				</div>
				<!--end:Menu sub-->
			</div>
			@endcan
			<!--end:Menu link-->


			@can('Payment')
			<div data-kt-menu-trigger="click"
				class="menu-item menu-accordion {{ request()->routeIs('user-management.*') ? 'here show' : '' }}">
				<!--begin:Menu link-->
				<span class="menu-link">
					<span class="menu-icon">{!! getIcon('element-11', 'fs-2') !!}</span>
					<span class="menu-title">Payment</span>
					<span class="menu-arrow"></span>
				</span>
				<!--end:Menu link-->
				<!--begin:Menu sub-->
				<div class="menu-sub menu-sub-accordion">
					<!--begin:Menu item-->
					<div class="menu-item">
						<!--begin:Menu link-->
						<a class="menu-link " href="{{ route('pendding_payment') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title"> Pendding Payment </span>
						</a>
						<!--begin:Menu link-->
						<a class="menu-link " href="{{ route('wallet_pendding') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title"> Wallet Pendding </span>
						</a>
						<!--begin:Menu link-->
						<a class="menu-link " href="{{ route('payment_request') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title"> Payment History</span>
						</a>
						<!--begin:Menu link-->
						<a class="menu-link " href="{{ route('wallet_history') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title"> Wallet History</span>
						</a>
						<!--begin:Menu link-->
						<a class="menu-link " href="{{ route('payment') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Payment Method</span>
						</a>
					</div>
				</div>
			</div>
			@endcan

			@can('Slider')
			<div data-kt-menu-trigger="click"
				class="menu-item menu-accordion {{ request()->routeIs('user-management.*') ? 'here show' : '' }}">
				<!--begin:Menu link-->
				<span class="menu-link">
					<span class="menu-icon">{!! getIcon('element-11', 'fs-2') !!}</span>
					<span class="menu-title">Slider</span>
					<span class="menu-arrow"></span>
				</span>
				<!--end:Menu link-->
				<!--begin:Menu sub-->
				<div class="menu-sub menu-sub-accordion">
					<!--begin:Menu item-->
					<div class="menu-item">
						<!--begin:Menu link-->
						<a class="menu-link " href="{{ route('slider_imgs') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Slider</span>
						</a>
					</div>
				</div>
			</div>
			@endcan

			@can('Affilate')
			<div data-kt-menu-trigger="click"
				class="menu-item menu-accordion {{ request()->routeIs('user-management.*') ? 'here show' : '' }}">
				<!--begin:Menu link-->
				<span class="menu-link">
					<span class="menu-icon">{!! getIcon('element-11', 'fs-2') !!}</span>
					<span class="menu-title">Affilate</span>
					<span class="menu-arrow"></span>
				</span>
				<!--end:Menu link-->
				<!--begin:Menu sub-->
				<div class="menu-sub menu-sub-accordion">
					<!--begin:Menu item-->
					<div class="menu-item">
						<!--begin:Menu link-->
						<a class="menu-link " href="{{ route('commission') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Commissions</span>
						</a>
						<!--end:Menu link-->
						<!--begin:Menu link-->
						<a class="menu-link " href="{{ route('m_users') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Users</span>
						</a>
						<!--end:Menu link-->
						<!--begin:Menu link-->
						<a class="menu-link " href="{{ route('payout_r') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Payment Requests</span>
						</a>
						<!--end:Menu link-->
					</div>
				</div>
			</div>
			@endcan

			@can('isMarketing')
			<div data-kt-menu-trigger="click"
				class="menu-item menu-accordion {{ request()->routeIs('user-management.*') ? 'here show' : '' }}">
				<!--begin:Menu link-->
				<span class="menu-link">
					<span class="menu-icon">{!! getIcon('element-11', 'fs-2') !!}</span>
					<span class="menu-title">Marketing</span>
					<span class="menu-arrow"></span>
				</span>
				<!--end:Menu link-->
				<!--begin:Menu sub-->
				<div class="menu-sub menu-sub-accordion">
					<!--begin:Menu item-->
					<div class="menu-item">
						<!--begin:Menu link-->
						<a class="menu-link " href="{{ route('marketing_popup') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Popup</span>
						</a>
						<!--end:Menu link-->
						<!--begin:Menu link-->
						<a class="menu-link " href="{{ route('promo_code') }}">
							<span class="menu-bullet">
								<span class="bullet bullet-dot"></span>
							</span>
							<span class="menu-title">Promo Codes</span>
						</a>
						<!--end:Menu link-->
					</div>
				</div>
			</div>
			@endcan

			<!--end:Menu item-->
			<div class="menu-item">
				<!--begin:Menu link-->
				<a class="menu-link {{ request()->routeIs('user-management.users.*') ? 'active' : '' }}"
					href="{{ route('logout') }}">
					<span class="menu-icon">{!! getIcon('abstract-28', 'fs-2') !!}</span>
					<span class="menu-title">Logout</span>
				</a>
				<!--end:Menu link-->
			</div>
			<!--end:Menu item-->
		</div>
		<!--end::Menu-->
	</div>
	<!--end::Menu wrapper-->
</div>
<!--end::sidebar menu-->
@endif