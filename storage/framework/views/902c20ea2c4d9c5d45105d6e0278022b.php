<?php $__env->startSection('admin'); ?>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="white_shd full margin_bottom_30">

                
                <div class="full graph_head">
                    <div class="heading1 margin_0 d-flex justify-content-between align-items-center">
                        <h2>OTP Pack History</h2>

                        
                        <form method="GET">
                            <select name="per_page" class="form-control"
                                    onchange="this.form.submit()">
                                <option value="10" <?php echo e($perPage == 10 ? 'selected' : ''); ?>>10</option>
                                <option value="25" <?php echo e($perPage == 25 ? 'selected' : ''); ?>>25</option>
                                <option value="50" <?php echo e($perPage == 50 ? 'selected' : ''); ?>>50</option>
                                <option value="100" <?php echo e($perPage == 100 ? 'selected' : ''); ?>>100</option>
                            </select>
                        </form>
                    </div>
                </div>

                
                <div class="table_section padding_infor_info">
                    <div class="table-responsive-sm">
                        <table class="table table-bordered table-striped">
                            <thead class="thead-dark">
                                <tr>
                                    <th>#</th>
                                   
                                    <th>Mobile Number</th>
                                    <th>Used At</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $__empty_1 = true; $__currentLoopData = $history; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $row): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                    <tr>
                                        <td><?php echo e($history->firstItem() + $key); ?></td>
                                        
                                        <td><?php echo e($row->mobile); ?></td>
                                        <td><?php echo e(date('d-m-Y h:i A', strtotime($row->used_at))); ?></td>
                                    </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                                    <tr>
                                        <td colspan="4" class="text-center text-danger">
                                            No OTP Pack History Found
                                        </td>
                                    </tr>
                                <?php endif; ?>
                            </tbody>
                        </table>
                    </div>

                    
                    <div class="d-flex justify-content-between align-items-center mt-3">
                        <div>
                            Showing
                            <?php echo e($history->firstItem()); ?>

                            to
                            <?php echo e($history->lastItem()); ?>

                            of
                            <?php echo e($history->total()); ?>

                            entries
                        </div>

                        <div>
                            <?php echo e($history->links('pagination::bootstrap-4')); ?>

                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.body.adminmaster', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /www/wwwroot/root.nexwin.vip/resources/views/otp_pack/history.blade.php ENDPATH**/ ?>