@php
$page_name = 'Chapter';
@endphp
@section('title', 'Chapters')
@include('Student.inc.header')
@include('Student.inc.menu')
@extends('Student.inc.nav')

@section('page_content')
<main class="main_wrapper overflow-hidden">
    <!-- dashboardarea__area__start  -->
    <div class="dashboardarea sp_bottom_100">

        <div class="dashboard">
            <div class=" full__width__padding">
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12">
                        <div class="dashboard__content__wraper">
                            <div class="row">


                                <div class="tab-content tab__content__wrapper aos-init aos-animate" id="myTabContent"
                                    data-aos="fade-up">


                                    <div class="tab-pane fade active show" id="projects__one" role="tabpanel"
                                        aria-labelledby="projects__one">
                                        <div class="row">
                                            @if($chapters)
                                            @foreach ($chapters as $item)
                                            @if ($course_id == $item->chapter->course_id)
                                            <div class="col-xl-4 col-lg-6 col-md-6 col-12">
                                                <div class="gridarea__wraper">
                                                    <div class="gridarea__img">
                                                        <a
                                                            href="{{ route('stu_lessons', ['id' => $item->chapter->id, 'L_id' => isset($item->chapter->lessons[0]->id) ?$item->chapter->lessons[0]->id : 0, 'idea' => isset($item->chapter->lessons[0]->ideas[0]->id)?$item->chapter->lessons[0]->ideas[0]->id : 0]) }}">
                                                            <img loading="lazy"
                                                                src="{{ asset('images/Chapters/' . $item->chapter->ch_url) }}"
                                                                alt="grid"></a>
                                                        <div class="gridarea__small__button">
                                                            <div class="grid__badge">Data &amp; Tech</div>
                                                        </div>
                                                        <div class="gridarea__small__icon">
                                                            <a href="#"><i class="icofont-heart-alt"></i></a>
                                                        </div>

                                                    </div>
                                                    <div class="gridarea__content">
                                                        <div class="gridarea__list">
                                                            <ul>
                                                                <li>
                                                                    <i class="icofont-book-alt"></i>
                                                                    {{ count($item->chapter->lessons) }}
                                                                    Lesson
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="gridarea__heading">
                                                            <h3><a
                                                                    href="{{ route('stu_lessons', ['id' => $item->chapter->id, 'L_id' => isset($item->chapter->lessons[0]->id) ? $item->chapter->lessons[0]->id : 0, 'idea' => isset($item->chapter->lessons[0]->ideas[0]->id)? $item->chapter->lessons[0]->ideas[0]->id : 0]) }}">
                                                                    {{ $item->chapter->chapter_name }}
                                                                </a></h3>
                                                        </div>
                                                        <div class="gridarea__bottom">


                                                        </div>
                                                    </div>


                                                </div>
                                            </div>
                                            @endif
                                            @endforeach
                                            @else
                                            <h1>Chapters Is Empty</h1>
                                            @endif



                                        </div>
                                    </div>





                                </div>




                            </div>
                        </div>

                    </div>


                </div>
            </div>
        </div>
    </div>
    <!-- dashboardarea__menu__end   -->




</main>

@endsection

@include('Student.inc.footer')