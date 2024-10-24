
@php
  function fun_admin(){
    return 'admin';
  }
@endphp
<x-default-layout>
    @section('title','Payout') 
    @include('success')
    <!--begin::Modal body-->
    <form action="{{route('filter_payment')}}" method="GET">
        <div class="modal-body scroll-y m-5">
            <div class="d-flex align-items-center">
            <!--begin::Input group-->
            <div class="mb-10 fv-row w-300px mx-2"> 
                <!--begin::Label-->
                <label class="required form-label mb-3">Payment Method</label>
                <!--end::Label-->
                <!--begin::Input-->
                <select name="payment_id" class="form-control sel_cate">
                    <option disabled selected>
                        Select Payment Method
                    </option>
                    @foreach($payments as $payment)
                    <option {{@$data['payment_id'] == $payment->id ? 'selected' : ''}} value="{{$payment->id}}">
                        {{$payment->payment}}
                    </option>
                    @endforeach
                </select>
                <!--end::Input-->
            </div>
            <!--end::Input group--> 
            <!--begin::Input group-->
            <div class="mb-10 fv-row w-300px mx-2"> 
                <!--begin::Label-->
                <label class="required form-label mb-3">Date From</label>
                <!--end::Label-->
                <!--begin::Input-->
                <input value="{{@$data['date_from']}}" class="form-control" type="date" name="date_from" />
                <!--end::Input-->
            </div>
            <!--end::Input group--> 
            
            <!--begin::Input group-->
            <div class="mb-10 fv-row w-300px mx-2"> 
                <!--begin::Label-->
                <label class="required form-label mb-3">Date To</label>
                <!--end::Label-->
                <!--begin::Input-->
                <input class="form-control" value="{{@$data['date_to']}}" type="date" name="date_to" />
                <!--end::Input-->
            </div>
            <!--end::Input group--> 
            
            <button class="btn btn-primary">
                Filter
            </button>
            </div>

        </div>
    </form>
        <!--begin::Modal body-->

<table id="kt_profile_overview_table" class="table table-row-bordered table-row-dashed gy-4 align-middle fw-bold dataTable no-footer">
    <thead class="fs-7 text-gray-500 text-uppercase">
        <tr>
            <th class="min-w-250px sorting sorting_desc" tabindex="0" aria-controls="kt_profile_overview_table" rowspan="1" colspan="1" aria-label="Manager: activate to sort column ascending" style="width: 336.359px;" aria-sort="descending">Date</th>
            <th class="min-w-150px sorting" tabindex="0" aria-controls="kt_profile_overview_table" rowspan="1" colspan="1" aria-label="Date: activate to sort column ascending" style="width: 205.188px;">Name</th>
            <th class="min-w-150px sorting" tabindex="0" aria-controls="kt_profile_overview_table" rowspan="1" colspan="1" aria-label="Date: activate to sort column ascending" style="width: 205.188px;">Organization</th>
            <th class="min-w-150px sorting" tabindex="0" aria-controls="kt_profile_overview_table" rowspan="1" colspan="1" aria-label="Date: activate to sort column ascending" style="width: 205.188px;">Amount</th>
            <th class="min-w-150px sorting" tabindex="0" aria-controls="kt_profile_overview_table" rowspan="1" colspan="1" aria-label="Date: activate to sort column ascending" style="width: 205.188px;">Payment Method</th>
            <th class="min-w-150px sorting" tabindex="0" aria-controls="kt_profile_overview_table" rowspan="1" colspan="1" aria-label="Date: activate to sort column ascending" style="width: 205.188px;">Action</th>
    </thead>
    <tbody class="fs-6">
        @foreach( $payouts as $item )
        <tr>
            <td>{{$item->date}}</td>
            <td>{{$item->user->user->name}}</td>
            <td>{{$item->user->organization}}</td>
            <td>{{$item->amount}}</td>
            <td>{{$item->payment_m->payment}}</td>
            <td>
                <div class="mt-3">
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#Accept{{$item->id}}">
                    Accept
                </button>
                <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#Reject{{$item->id}}">
                    Rejected
                </button>

                <!-- Modal -->
                <div class="modal fade" id="Reject{{$item->id}}" tabindex="-1" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                        
                        <h5 class="modal-title" id="modalCenterTitle">Delete Payment</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div> 
                        
                        <div class='p-3'>
                        Are You Sure Reject This Response
                        <span class='text-danger'>
                            {{$item->amount}} to {{$item->user->name}} ??
                        </span>
                        </div>

                        <form action="{{route('reject_payout', ['id'=>$item->id])}}" method="POST">
                            <input class="form-control" name="rejected_reason" placeholder="Rejected Reason" />
                            @csrf
                            <div class="modal-footer">
                            <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">
                                Close
                            </button>
                            <button class="btn btn-danger">Reject</button>
                            </div>
                        </form>
                    </div>
                    </div>
                </div>
                </div>

                <!-- Modal -->
                <div class="modal fade" id="Accept{{$item->id}}" tabindex="-1" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                        
                        <h5 class="modal-title" id="modalCenterTitle">Accept</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div> 
                        
                        <div class='p-3'>
                        Are You Sure Accept This Response
                        <span class='text-success'>
                            {{$item->amount}} to {{$item->user->name}} ??
                        </span>
                        </div>

                        <div class="modal-footer">
                        <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">
                            Close
                        </button>
                        <a href="{{route('accept_payout', ['id'=>$item->id])}}" class="btn btn-success">Accept</a>
                        </div>
                    </div>
                    </div>
                </div>
                </div>

            </td>
        </tr>
        @endforeach
    
    </tbody>
</table>
</x-default-layout>