<?php $__env->startSection('admin'); ?>
<div class="container mt-4">
    <h4>Admin Notifications</h4>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>#</th>
                <th>Title</th>
                <th>Status</th>
                <th>Date</th>
            </tr>
        </thead>

        <tbody>
        <?php $__currentLoopData = $notifications; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $n): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <tr class="<?php echo e($n->status == 0 ? 'table-warning' : ''); ?>">
                <td><?php echo e($key + 1); ?></td>

                <td>
                    <a href="<?php echo e(route('admin.notification.view', $n->id)); ?>">
                        <?php echo e($n->title); ?>

                    </a>
                </td>

                <td>
                    <?php echo e($n->status == 0 ? 'Unread' : 'Read'); ?>

                </td>

                <td><?php echo e($n->created_at); ?></td>
            </tr>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </tbody>
    </table>
</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.body.adminmaster', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /www/wwwroot/root.nexwin.vip/resources/views/admin/notifications/list.blade.php ENDPATH**/ ?>