
@php
    $page_name = 'Question History';
@endphp
@section('title','Chapters')
@include('Student.inc.header')
@include('Student.inc.menu')
@extends('Student.inc.nav')

@section('page_content')

<table class="table">
    <thead>
        <th style="border: 1px solid #ccc"></th>
        <th style="border: 1px solid #ccc"></th>
        <th colspan="3" style="border: 1px solid #ccc">Quiz 1</th> 
        <th colspan="3" style="border: 1px solid #ccc">Quiz 2</th>
        <th colspan="3" style="border: 1px solid #ccc">Quiz 3</th>
        <th colspan="3" style="border: 1px solid #ccc">Quiz 4</th>
        <th colspan="3" style="border: 1px solid #ccc">Quiz 5</th>
        <th colspan="3" style="border: 1px solid #ccc">Quiz 6</th>
    </thead>

    <tbody>
        <tr>
            <td style="border: 1px solid #ccc">Chapter</td>
            <td style="border: 1px solid #ccc">Lesson</td>
            <td style="border: 1px solid #ccc">Score</td>
            <td style="border: 1px solid #ccc">Time</td>
            <td style="border: 1px solid #ccc">View Mistake</td>
            <td style="border: 1px solid #ccc">Score</td>
            <td style="border: 1px solid #ccc">Time</td>
            <td style="border: 1px solid #ccc">View Mistake</td>
            <td style="border: 1px solid #ccc">Score</td>
            <td style="border: 1px solid #ccc">Time</td>
            <td style="border: 1px solid #ccc">View Mistake</td>
            <td style="border: 1px solid #ccc">Score</td>
            <td style="border: 1px solid #ccc">Time</td>
            <td style="border: 1px solid #ccc">View Mistake</td>
            <td style="border: 1px solid #ccc">Score</td>
            <td style="border: 1px solid #ccc">Time</td>
            <td style="border: 1px solid #ccc">View Mistake</td>
            <td style="border: 1px solid #ccc">Score</td>
            <td style="border: 1px solid #ccc">Time</td>
            <td style="border: 1px solid #ccc">View Mistake</td>
        </tr>
    </tbody>
</table>


@endsection

@include('Student.inc.footer')