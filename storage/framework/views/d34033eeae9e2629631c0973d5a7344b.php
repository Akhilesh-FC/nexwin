<?php $__env->startSection('admin'); ?>

<style>
.card-box {
    border-radius: 15px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
}
.qr-img {
    width: 150px;
    height: auto;
    border-radius: 10px;
}
</style>

<div class="container mt-5">

<?php if(session('message')): ?>
<div class="alert alert-success">
    <?php echo e(session('message')); ?>

</div>
<?php endif; ?>

<div class="row">

<!-- ================= OPTION 1 ================= -->
<div class="col-md-6 mb-4">
<div class="card card-box">
<div class="card-header bg-primary text-white">
    <h5 class="mb-0">Option 1 - UPI Payment</h5>
</div>
<div class="card-body text-center">

<img src="<?php echo e($option1->qr_code); ?>" class="qr-img mb-3">

<p><strong>UPI Address:</strong></p>
<p><?php echo e($option1->upi_address); ?></p>

<button class="btn btn-warning"
        data-toggle="modal"
        data-target="#updateOption1">
    Update
</button>

</div>
</div>
</div>


<!-- ================= OPTION 2 ================= -->
<div class="col-md-6 mb-4">
<div class="card card-box">
<div class="card-header bg-success text-white">
    <h5 class="mb-0">Option 2 - Bank Payment</h5>
</div>
<div class="card-body text-center">

<img src="<?php echo e($option2->qr_code); ?>" class="qr-img mb-3">

<p><strong>Wallet Address:</strong> <?php echo e($option2->wallet_address); ?></p>
<p><strong>Account Number:</strong> <?php echo e($option2->account_number); ?></p>
<p><strong>IFSC Code:</strong> <?php echo e($option2->ifsc_code); ?></p>
<p><strong>Account Name:</strong> <?php echo e($option2->account_name); ?></p>
<p><strong>Account Type:</strong> <?php echo e($option2->account_type); ?></p>

<button class="btn btn-warning"
        data-toggle="modal"
        data-target="#updateOption2">
    Update
</button>

</div>
</div>
</div>

</div>
</div>


<!-- ================= OPTION 1 MODAL ================= -->
<div class="modal fade" id="updateOption1">
<div class="modal-dialog">
<div class="modal-content">

<div class="modal-header bg-primary text-white">
<h5>Update UPI</h5>
<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>

<form action="<?php echo e(route('manual_qr.update',1)); ?>"
      method="POST"
      enctype="multipart/form-data">
<?php echo csrf_field(); ?>

<div class="modal-body">

<div class="form-group">
<label>UPI Address</label>
<input type="text"
       name="upi_address"
       class="form-control"
       value="<?php echo e($option1->upi_address); ?>">
</div>

<div class="form-group">
<label>QR Image</label>
<input type="file"
       name="image"
       class="form-control">
</div>

</div>

<div class="modal-footer">
<button class="btn btn-success">Update</button>
<button type="button"
        class="btn btn-secondary"
        data-dismiss="modal">Close</button>
</div>

</form>
</div>
</div>
</div>


<!-- ================= OPTION 2 MODAL ================= -->
<div class="modal fade" id="updateOption2">
<div class="modal-dialog">
<div class="modal-content">

<div class="modal-header bg-success text-white">
<h5>Update Bank Details</h5>
<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>

<form action="<?php echo e(route('manual_qr.update',2)); ?>"
      method="POST"
      enctype="multipart/form-data">
<?php echo csrf_field(); ?>

<div class="modal-body">

<div class="form-group">
<label>Wallet Address</label>
<input type="text"
       name="wallet_address"
       class="form-control"
       value="<?php echo e($option2->wallet_address); ?>">
</div>

<div class="form-group">
<label>Account Number</label>
<input type="text"
       name="account_number"
       class="form-control"
       value="<?php echo e($option2->account_number); ?>">
</div>

<div class="form-group">
<label>IFSC Code</label>
<input type="text"
       name="ifsc_code"
       class="form-control"
       value="<?php echo e($option2->ifsc_code); ?>">
</div>

<div class="form-group">
<label>Account Name</label>
<input type="text"
       name="account_name"
       class="form-control"
       value="<?php echo e($option2->account_name); ?>">
</div>

<div class="form-group">
<label>Account Type</label>
<input type="text"
       name="account_type"
       class="form-control"
       value="<?php echo e($option2->account_type); ?>">
</div>

<div class="form-group">
<label>QR Image</label>
<input type="file"
       name="image"
       class="form-control">
</div>

</div>

<div class="modal-footer">
<button class="btn btn-success">Update</button>
<button type="button"
        class="btn btn-secondary"
        data-dismiss="modal">Close</button>
</div>

</form>
</div>
</div>
</div>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.body.adminmaster', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /www/wwwroot/root.nexwin.vip/resources/views/manual_qr/index.blade.php ENDPATH**/ ?>