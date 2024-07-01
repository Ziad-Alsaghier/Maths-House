<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\quizze;
use App\Models\Question;

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

}
