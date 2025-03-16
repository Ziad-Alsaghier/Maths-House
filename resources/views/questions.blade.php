<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Styled Table</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }

        table.styled-table {
            width: 100%;
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 18px;
            text-align: left;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
            border-radius: 5px;
            overflow: hidden;
        }

        table.styled-table thead tr {
            background-color: #009879;
            color: #ffffff;
            text-align: left;
            font-weight: bold;
        }

        table.styled-table th,
        table.styled-table td {
            padding: 12px 15px;
        }

        table.styled-table tbody tr {
            border-bottom: 1px solid #dddddd;
        }

        table.styled-table tbody tr:nth-of-type(even) {
            background-color: #f3f3f3;
        }

        table.styled-table tbody tr:last-of-type {
            border-bottom: 2px solid #009879;
        }

        table.styled-table tbody tr:hover {
            background-color: #f1f1f1;
        }

        table .delay {
            color: #ff0000;
        }

        table .not_delay {
            color: #009879;
        }
    </style>
</head>

<body>
    <table>
        <thead>
            <tr>
                <th>Question</th>
                <th>Answer</th>
                <th>Score</th>
            </tr>
            @foreach($questions as $question)
            <tr>
                <td>{{ $question->question }}</td>
                @if (!empty($question->q_url))
                    <img src="{{ asset($question->q_url) }}" />
                @endif
                <td>{{ $question->answer }}</td> 
            </tr>
            @endforeach

        </thead>
    </table>
</body>

</html>