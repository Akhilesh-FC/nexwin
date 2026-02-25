<?php $__env->startSection('admin'); ?>
<div class="container mt-4">

    <h3>Revenue Management</h3>

    <?php if(session('success')): ?>
        <div class="alert alert-success mt-2">
            <?php echo e(session('success')); ?>

        </div>
    <?php endif; ?>

    <table class="table table-bordered mt-3">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Revenue</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody>
            <?php $__currentLoopData = $data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <tr>
                <td><?php echo e($item->id); ?></td>
                <td>
                    <form action="<?php echo e(route('revenues.update')); ?>" method="POST" class="d-flex">
                        <?php echo csrf_field(); ?>
                        <input type="hidden" name="id" value="<?php echo e($item->id); ?>">
                        <input type="number" step="0.01" name="revenue" value="<?php echo e($item->revenue); ?>" class="form-control" required>

                        <button type="submit" class="btn btn-primary ms-2">
                            Update
                        </button>
                    </form>
                </td>
                <td>
                    <button class="btn btn-success" disabled>Editable</button>
                </td>
            </tr>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </tbody>
    </table>

</div>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.body.adminmaster', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /www/wwwroot/root.nexwin.vip/resources/views/revenues/index.blade.php ENDPATH**/ ?>