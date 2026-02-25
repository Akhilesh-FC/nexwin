<?php $__env->startSection('admin'); ?>

<div class="container py-4">
  <div class="card shadow-lg border-0 rounded-4">
    <div class="card-header bg-primary text-white text-center fs-4 fw-semibold">
      Pay Modes List
    </div>
    <div class="card-body">
      <?php if(session('success')): ?>
        <div class="alert alert-success"><?php echo e(session('success')); ?></div>
      <?php endif; ?>

      <table class="table table-bordered align-middle text-center">
        <thead class="table-dark">
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Image</th>
            <th>Status</th>
            <!--<th>Type</th>-->
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <?php $__currentLoopData = $payModes; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $mode): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
          <tr>
            <td><?php echo e($mode->id); ?></td>
            <td><?php echo e($mode->name); ?></td>
            <td>
              <?php if($mode->image): ?>
                <img src="<?php echo e($mode->image); ?>" alt="<?php echo e($mode->name); ?>" width="60" class="rounded-3 border">
              <?php else: ?>
                <span class="text-muted">No Image</span>
              <?php endif; ?>
            </td>
           <td>
              <form action="<?php echo e(route('paymode_show.toggleStatus', $mode->id)); ?>"
                    method="POST">
                <?php echo csrf_field(); ?>
                <div class="form-check form-switch d-flex justify-content-center">
                  <input class="form-check-input"
                         type="checkbox"
                         onchange="this.form.submit()"
                         <?php echo e($mode->status == 1 ? 'checked' : ''); ?>>
                </div>
              </form>
            </td>

            <!--<td><?php echo e(ucfirst($mode->type)); ?></td>-->
            <td>
              <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#updateImageModal<?php echo e($mode->id); ?>">
                Update Image
              </button>
            </td>
          </tr>

          <!-- Modal -->
          <div class="modal fade" id="updateImageModal<?php echo e($mode->id); ?>" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
              <div class="modal-content rounded-4">
                <div class="modal-header bg-primary text-white">
                  <h5 class="modal-title">Update Image - <?php echo e($mode->name); ?></h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form action="<?php echo e(route('paymode_show.updateImage', $mode->id)); ?>" method="POST" enctype="multipart/form-data">
                  <?php echo csrf_field(); ?>
                  <div class="modal-body text-center">
                    <?php if($mode->image): ?>
                      <img src="<?php echo e(asset('uploads/paymodes/'.$mode->image)); ?>" width="100" class="rounded mb-3 border">
                    <?php endif; ?>
                    <input type="file" name="image" class="form-control mb-3" required>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Update</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
          <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </tbody>
      </table>
      
      
      <hr class="my-4">

<div class="card mt-4 border-0 shadow-sm rounded-4">
  <div class="card-header bg-success text-white text-center fs-5 fw-semibold">
    WhatsApp Deposit Number
  </div>

  <div class="card-body text-center">
    <h4 class="mb-3 text-dark">
      <?php echo e($whatsappDeposit ?? 'Not Available'); ?>

    </h4>

    <button class="btn btn-outline-success"
            data-bs-toggle="modal"
            data-bs-target="#whatsappDepositModal">
      Update Number
    </button>
  </div>
</div>

<!-- ✅ Update Modal -->
<div class="modal fade" id="whatsappDepositModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content rounded-4">
      <div class="modal-header bg-success text-white">
        <h5 class="modal-title">Update WhatsApp Deposit Number</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <form action="<?php echo e(route('update.whatsapp.deposit')); ?>" method="POST">
        <?php echo csrf_field(); ?>
        <div class="modal-body">
          <input type="text"
                 name="whatsapp_number"
                 class="form-control"
                 value="<?php echo e($whatsappDeposit); ?>"
                 required>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
          <button type="submit" class="btn btn-success">Update</button>
        </div>
      </form>
    </div>
  </div>
</div>

      
      
    </div>
  </div>
</div>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.body.adminmaster', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /www/wwwroot/Newprojectadmin.codescarts.com/resources/views/paymode/index.blade.php ENDPATH**/ ?>