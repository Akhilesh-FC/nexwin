@extends('admin.body.adminmaster')

@section('admin')

<div class="container-fluid">
  <div class="row">
    <div class="col-md-12">
      <div class="white_shd full margin_bottom_30">
         <div class="full graph_head">
            <div class="heading1 margin_0 d-flex">
               <h2>Gift List</h2>
               <button type="button" class="btn btn-info"
                   data-toggle="modal"
                   data-target="#exampleModalCenter"
                   style="margin-left:650px;">
                   Add Gift
               </button> 
            </div>
         </div>

         <div class="table_section padding_infor_info">
            <div class="table-responsive-sm">
               <table id="example" class="table table-striped" style="width:100%">
                  <thead class="thead-dark">
                     <tr>
                        <th>Id</th>
                        <th>Code</th>
                        <th>Amount</th>
                        <th>Percenatge</th>
                        <th>Number People</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Date</th>
                        <th>Expire Date</th>
                        <th>Type(Loss/Win)</th>
                        <th>Action</th>
                     </tr>
                  </thead>
                  <tbody>
                    @foreach($gifts as $item)
                     <tr>
                        <td>{{ $item->id }}</td>
                        <td>{{ $item->code }}</td>
                        <td>{{ $item->amount }}</td>
                         <td>{{ $item->percentage }}</td>
                        <td>{{ $item->number_people }}</td>
                        <td>{{ $item->title }}</td>
                        <td>{{ $item->description }}</td>
                        <td>{{ $item->datetime }}</td>
                        <td>{{ $item->expire_date }}</td>
                       <td>
                            @if($item->type == 1)
                                Loss
                            @elseif($item->type == 2)
                                Win
                            @else
                                -
                            @endif
                        </td>
                        <td>
                           <!-- UPDATE BUTTON -->
                           <button class="btn btn-warning btn-sm"
                               data-toggle="modal"
                               data-target="#editModal{{ $item->id }}">
                               Update
                           </button>
                        
                           <!-- DELETE BUTTON -->
                           <a href="{{ route('gift.delete',$item->id) }}"
                              class="btn btn-danger btn-sm"
                              onclick="return confirm('Are you sure to delete?')">
                              Delete
                           </a>
                        </td>

                     </tr>
                     
                     
                     
                     <!-- UPDATE MODAL -->
<div class="modal fade" id="editModal{{ $item->id }}" tabindex="-1">
 <div class="modal-dialog modal-dialog-centered">
  <div class="modal-content">

   <div class="modal-header">
     <h5 class="modal-title">Update Gift</h5>
     <button type="button" class="close" data-dismiss="modal">
        <span>&times;</span>
     </button>
   </div>

   <form action="{{ route('gift.update',$item->id) }}" method="POST">
    @csrf

    <div class="modal-body">
     <div class="row">

      <div class="form-group col-md-6">
        <label>Amount</label>
        <input type="text" name="amount" class="form-control"
        value="{{ $item->amount }}">
      </div>

      <div class="form-group col-md-6">
        <label>Percentage</label>
        <input type="text" name="percentage" class="form-control"
        value="{{ $item->percentage }}">
      </div>

      <div class="form-group col-md-6">
        <label>Number People</label>
        <input type="text" name="number_people" class="form-control"
        value="{{ $item->number_people }}">
      </div>

      <div class="form-group col-md-6">
        <label>Title</label>
        <input type="text" name="title" class="form-control"
        value="{{ $item->title }}">
      </div>

      <div class="form-group col-md-6">
        <label>Description</label>
        <input type="text" name="description" class="form-control"
        value="{{ $item->description }}">
      </div>

      <div class="form-group col-md-6">
        <label>Expire Date</label>
        <input type="date" name="expire_date"
        class="form-control"
        value="{{ $item->expire_date }}">
      </div>

      <div class="form-group col-md-6">
        <label>Type</label>
        <select name="type" class="form-control">

          <option value="1"
          {{ $item->type==1?'selected':'' }}>Loss</option>

          <option value="2"
          {{ $item->type==2?'selected':'' }}>Win</option>

        </select>
      </div>

     </div>
    </div>

    <div class="modal-footer">
      <button type="submit" class="btn btn-success">
         Update
      </button>
    </div>

   </form>

  </div>
 </div>
</div>
                     
                     
                     
                     @endforeach
                  </tbody>
               </table>
            </div>
         </div>
      </div>
    </div>
  </div>
</div> 

{{-- ✅ ADD GIFT MODAL --}}
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog">
   <div class="modal-dialog modal-dialog-centered" role="document">
     <div class="modal-content">

       <div class="modal-header">
         <h5 class="modal-title">Add Gift</h5>
         <button type="button" class="close" data-dismiss="modal">
           <span>&times;</span>
         </button>
       </div>

       <form action="{{ route('gift.store') }}" method="POST">
         @csrf

         <div class="modal-body">
           <div class="container-fluid">
             <div class="row">

               <div class="form-group col-md-6">
                 <label>Amount</label>
                 <input type="text" class="form-control" name="amount"
                        placeholder="Enter amount">
               </div>
               
               <div class="form-group col-md-6">
                 <label>Percentage</label>
                 <input type="text" class="form-control" name="percentage"
                        placeholder="Enter percentage">
               </div>

               <div class="form-group col-md-6">
                 <label>Number People</label>
                 <input type="text" class="form-control" name="number_people"
                        placeholder="Enter number_people">
               </div>
               
               <div class="form-group col-md-6">
                 <label>Title</label>
                 <input type="text" class="form-control" name="title"
                        placeholder="Enter title">
               </div>
               
                <div class="form-group col-md-6">
                 <label>Description</label>
                 <input type="text" class="form-control" name="description"
                        placeholder="Enter description">
               </div>
               
                <div class="form-group col-md-6">
                  <label>Expire Date</label>
                  <input type="date"
                         class="form-control"
                         name="expire_date"
                         min="{{ date('Y-m-d') }}"
                         required>
                </div>
                
                               <div class="form-group col-md-6">
                  <label>Type (Loss / Win)</label>
                  <select class="form-control" name="type" required>
                    <option value="">-- Select Type --</option>
                    <option value="1">Loss</option>
                    <option value="2">Win</option>
                  </select>
                </div>

                
                


               {{-- ✅ NEW: GIFT CODE INPUT --}}
               <div class="form-group col-md-12">
                 <label>Gift Code (Optional)</label>
                 <input type="text" class="form-control" name="code"
                        placeholder="Leave blank to auto-generate code">
                 <small class="text-muted">
                     Agar blank chhoda to system automatically code generate karega
                 </small>
               </div>
               
              
             </div>
           </div>
         </div>

         <div class="modal-footer">
           <button type="button" class="btn btn-secondary" data-dismiss="modal">
             Close
           </button>
           <button type="submit" class="btn btn-primary">
             Submit
           </button>
         </div>

       </form>
     </div>
   </div>
</div>

@endsection
