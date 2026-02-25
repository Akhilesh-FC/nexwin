<?php $__env->startSection('admin'); ?>
<div class="container mt-4">

    <div class="card">
        <div class="card-header bg-dark text-white">
            <h5 class="mb-0">Send Notification (DEBUG MODE)</h5>
        </div>

        <div class="card-body">

            

            <form id="notifyForm">
                <?php echo csrf_field(); ?>

                <div class="mb-3">
                    <label>Purpose</label>
                    <input type="text" name="purpose" class="form-control"
                           placeholder="Enter purpose">
                </div>

                <div class="mb-3">
                    <label>Content</label>
                    <textarea name="content" class="form-control" rows="3"
                              placeholder="Enter content"></textarea>
                </div>

                <div class="mb-3">
                    <label>Send To</label>
                    <select name="send_to" id="send_to" class="form-control">
                        <option value="">-- Select --</option>
                        <option value="all">All Users</option>
                        <option value="single">Single User</option>
                    </select>
                </div>

                <div class="mb-3 d-none" id="userBox">
                    <label>User</label>
                    <select name="user_id" class="form-control">
                        <option value="">-- Select User --</option>
                        <?php $__currentLoopData = $users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $u): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($u->id); ?>">
                                <?php echo e($u->username); ?>

                            </option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </select>
                </div>

                <button type="submit" class="btn btn-success">
                    Send Notification
                </button>
            </form>

        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>


<?php $__env->startPush('scripts'); ?>
<script>
/* =======================
   GLOBAL DEBUG
========================== */
console.clear();
console.log('✅ notification_admin/index.blade.php JS LOADED');

/* =======================
   SHOW / HIDE USER BOX
========================== */
$('#send_to').on('change', function () {
    console.log('✅ send_to changed:', $(this).val());

    if ($(this).val() === 'single') {
        $('#userBox').removeClass('d-none');
    } else {
        $('#userBox').addClass('d-none');
    }
});

/* =======================
   FORM SUBMIT
========================== */
$('#notifyForm').on('submit', function (e) {
    e.preventDefault();

    console.log('✅ FORM SUBMITTED');

    let formData = $(this).serialize();
    console.log('📦 FORM DATA:', formData);

    $.ajax({
        url: "<?php echo e(route('notification.store')); ?>",
        type: "POST",
        data: formData,
        success: function (res) {
            console.log('✅ SERVER RESPONSE:', res);

            alert(res.message);

            if (res.status) {
                $('#notifyForm')[0].reset();
                $('#userBox').addClass('d-none');
            }
        },
        error: function (xhr) {
            console.error('❌ AJAX ERROR');
            console.log(xhr.responseText);
            alert('AJAX Error – check console');
        }
    });
});
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('admin.body.adminmaster', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /www/wwwroot/root.nexwin.vip/resources/views/notification_admin/index.blade.php ENDPATH**/ ?>