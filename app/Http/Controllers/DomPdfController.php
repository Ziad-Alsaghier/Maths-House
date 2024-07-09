<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\quizze;
use App\Models\Question;
use App\Models\DiagnosticExamsHistory;
use App\Models\DiagnosticExam;

use PDF;

class DomPdfController extends Controller
{
    
    public function stu_quize_pdf( Request $req ){
        $mistakes = $req->mistakes;
        $mistakes = json_decode($mistakes); 

        $data = [
            'mistakes' => $mistakes,
        ];
        $pdf = PDF::loadView('ExamQuestionsPDF', $data);
        return $pdf->download('Exam.pdf');
    }

    public function exam_pdf( Request $req )
    {
        $data = json_decode($req->questions);
        $arr = [];
        foreach ( $data as $item ) {
            $arr[] = $item->q_id;
        }
        $data = $arr;
        
        $data = Question::whereIn('id', $data)
        ->with('g_ans')
        ->with('mcq')
        ->orderBy('q_num')
        ->get(); 
        $data = [
            'Questions' => $data,
        ];
        
        $pdf = PDF::loadView('ExamReportPDF', $data); 
        // Optionally, you can save the PDF to a file or stream it to the browser
        // Save the PDF to a file:
        // $pdf->save(storage_path('invoices/invoice.pdf'));

        // Stream the PDF to the browser:
        return $pdf->stream('ExamReportPDF.pdf');

        // Download the PDF:
        return $pdf->download('ExamReportPDF.pdf');
    }

    public function dia_exam_report_pdf( $id ){
        // Fetch the data
        $data = DiagnosticExamsHistory::where('id', $id)->first();
        $exam = DiagnosticExam::where('id', $data->diagnostic_exams_id)->first();
        $exam_time = $exam->time;
    
        // Parse exam time
        $exam_time_parts = explode('H', $exam_time);
        $e_hours = isset($exam_time_parts[0]) ? intval($exam_time_parts[0]) : 0;
        $e_minutes = isset($exam_time_parts[1]) ? intval($exam_time_parts[1]) : 0;
    
        // Parse data time
        $data_time = explode(':', $data->time);
        $hours = isset($data_time[0]) ? intval($data_time[0]) : 0;
        $minutes = isset($data_time[1]) ? intval($data_time[1]) : 0;
        $seconds = isset($data_time[2]) ? intval($data_time[2]) : 0;
    
        // Calculate the times in seconds
        $e_time = $e_hours * 60 * 60 + $e_minutes * 60;
        $time = $hours * 60 * 60 + $minutes * 60 + $seconds;
        $delay = $e_time - $time;
        $color = false;

        // Determine delay status
        if ($delay == 0) {
            $delay = 'On Time';
        } else {
            $delay = $delay;
            $h = intval($delay / (60 * 60));
            $delay = $delay - $h * 60 * 60;
            $m = intval($delay / 60);
            $s = $delay - $m * 60;
            if ( $delay > 0 ) {
                $color = true;
            }            
            $delay = "Delay $h Hours $m Minutes $s Seconds";
        }
    
        // Prepare the data to be passed to the view
        $report = [
            'date' => $data->date,
            'time' => $data->time,
            'delay' => $delay,
            'color' => $color
        ];
    
        // Generate the PDF
        $pdf = PDF::loadView('DiaExam', compact('report'));
        
        // Optionally, save the PDF to a file
        // $pdf->save(storage_path('invoices/invoice.pdf'));
    
        // Stream the PDF to the browser
        return $pdf->stream('DiaExam.pdf');
    }

}
