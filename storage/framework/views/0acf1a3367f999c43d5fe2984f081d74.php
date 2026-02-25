<?php $__env->startSection('admin'); ?>
<div class="container mt-4">

    <h4><?php echo e($notification->title); ?></h4>

    <div class="alert alert-info">
        <?php echo $notification->message; ?>

    </div>

    <p>
        <strong>Created:</strong> <?php echo e($notification->created_at); ?>

    </p>

    <a href="<?php echo e(route('admin.notifications')); ?>"
       class="btn btn-secondary">
        ← Back to Notifications
    </a>

</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.body.adminmaster', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /www/wwwroot/root.nexwin.vip/resources/views/admin/notifications/view.blade.php ENDPATH**/ ?>