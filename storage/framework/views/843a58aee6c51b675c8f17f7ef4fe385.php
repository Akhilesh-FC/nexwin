<?php $__env->startSection('admin'); ?>
<div class="container-fluid mt-4">
    <div class="card shadow-lg border-0">
       <div class="card-header text-white d-flex justify-content-between align-items-center"
     style="background: linear-gradient(90deg, #6cb2eb 0%, #3490dc 100%);">
    <h5 class="mb-0">USDT Withdraw Conversion Rate</h5>
    <a href="<?php echo e(route('dashboard')); ?>" class="btn btn-outline-light btn-sm">← Back</a>
</div>


        <div class="card-body">
            <?php if(session('success')): ?>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <?php echo e(session('success')); ?>

                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
            <?php endif; ?>

            <form action="<?php echo e(route('usdt_conversion.update')); ?>" method="POST" class="mt-3">
                <?php echo csrf_field(); ?>
                <div class="row mb-4">
                    <div class="col-md-6">
                        <label class="form-label fw-bold">Conversion Name</label>
                        <input type="text" name="name" class="form-control" value="<?php echo e($conversion->name); ?>" readonly>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label fw-bold">Conversion Rate (Amount)</label>
                        <div class="input-group">
                            <input type="text" name="amount" class="form-control" value="<?php echo e($conversion->amount); ?>" required>
                            <div class="input-group-append">
                                <span class="input-group-text bg-success text-white fw-bold">USDT</span>
                            </div>
                        </div>
                        <?php $__errorArgs = ['amount'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                            <small class="text-danger"><?php echo e($message); ?></small>
                        <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                    </div>
                </div>

                <div class="text-end">
                    <button type="submit" class="btn btn-primary px-4">
                        <i class="fa fa-save me-2"></i> Update Rate
                    </button>
                </div>
            </form>
        </div>

        <div class="card-footer text-muted text-center small">
            Last Updated: <?php echo e(\Carbon\Carbon::parse($conversion->updated_at)->format('d M Y, h:i A')); ?>

        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.body.adminmaster', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /www/wwwroot/Newprojectadmin.codescarts.com/resources/views/usdt_qr/index.blade.php ENDPATH**/ ?>