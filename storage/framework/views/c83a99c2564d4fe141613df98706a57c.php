<?php $__env->startSection('admin'); ?>

<div class="container py-4">

    <?php if(session('success')): ?>
        <div class="alert alert-success"><?php echo e(session('success')); ?></div>
    <?php endif; ?>
    
    
    <div class="d-flex justify-content-end mb-3">
    <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addCouponModal">
        + Add New Coupon
    </button>
</div>

    <div class="card shadow border-0">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0">Manage Coupons</h4>
        </div>

        <div class="card-body">

            <table class="table table-bordered text-center align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Coupon Code</th>
                        <th>Percentage</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                    <?php $__currentLoopData = $coupons; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $coupon): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <tr>
                        <td><?php echo e($coupon->id); ?></td>
                        <td><?php echo e($coupon->title); ?></td>
                        <td><span class="badge bg-info"><?php echo e($coupon->coupon_code); ?></span></td>
                        <td><?php echo e($coupon->percentage); ?>%</td>
                        <td><?php echo e($coupon->description); ?></td>

                        <td>
                            <?php if($coupon->status == 1): ?>
                                <span class="badge bg-success">Active</span>
                            <?php else: ?>
                                <span class="badge bg-danger">Inactive</span>
                            <?php endif; ?>

                            <form action="<?php echo e(route('coupons.toggle', $coupon->id)); ?>" method="POST" class="mt-2">
                                <?php echo csrf_field(); ?>
                                <button class="btn btn-sm 
                                    <?php if($coupon->status==1): ?> btn-danger <?php else: ?> btn-success <?php endif; ?>">
                                    <?php if($coupon->status==1): ?> Disable <?php else: ?> Activate <?php endif; ?>
                                </button>
                            </form>
                        </td>

                        <td>
                            <!-- Edit Button -->
                            <button class="btn btn-sm btn-primary" data-bs-toggle="modal"
                                data-bs-target="#editModal<?php echo e($coupon->id); ?>">
                                Edit
                            </button>
                            <!-- Delete Button -->
                            <button class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal<?php echo e($coupon->id); ?>">
                                Delete
                            </button>

                        </td>
                    </tr>

                    <!-- EDIT MODAL -->
                    <div class="modal fade" id="editModal<?php echo e($coupon->id); ?>" tabindex="-1">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content rounded-3">
                                
                                <div class="modal-header bg-primary text-white">
                                    <h5 class="modal-title">Edit Coupon - <?php echo e($coupon->title); ?></h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>

                                <form action="<?php echo e(route('coupons.update', $coupon->id)); ?>" method="POST">
                                    <?php echo csrf_field(); ?>

                                    <div class="modal-body">

                                        <div class="mb-3">
                                            <label class="form-label">Title</label>
                                            <input type="text" name="title" class="form-control"
                                                value="<?php echo e($coupon->title); ?>">
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">Coupon Code</label>
                                            <input type="text" name="coupon_code" class="form-control"
                                                value="<?php echo e($coupon->coupon_code); ?>">
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">Percentage (%)</label>
                                            <input type="number" name="percentage" class="form-control"
                                                value="<?php echo e($coupon->percentage); ?>">
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">Description</label>
                                            <textarea name="description" class="form-control"
                                                rows="2"><?php echo e($coupon->description); ?></textarea>
                                        </div>

                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Update</button>
                                    </div>

                                </form>

                            </div>
                        </div>
                    </div>
                    
                    
                    
      

<!-- ADD COUPON MODAL -->
<div class="modal fade" id="addCouponModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content rounded-3">

            <div class="modal-header bg-success text-white">
                <h5 class="modal-title">Add New Coupon</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <form action="<?php echo e(route('coupons.store')); ?>" method="POST">
                <?php echo csrf_field(); ?>

                <div class="modal-body">

                    <div class="mb-3">
                        <label class="form-label">Coupon Title</label>
                        <input type="text" name="title" class="form-control" placeholder="Enter Coupon Title" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Coupon Code</label>
                        <input type="text" name="coupon_code" class="form-control" placeholder="Ex: FIRST10" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Percentage (%)</label>
                        <input type="number" name="percentage" class="form-control" placeholder="Ex: 10" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Description</label>
                        <textarea name="description" class="form-control" rows="2" placeholder="Ex: 10% bonus on first deposit"></textarea>
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success">Add Coupon</button>
                </div>

            </form>

        </div>
    </div>
</div>




<!-- DELETE MODAL -->
<div class="modal fade" id="deleteModal<?php echo e($coupon->id); ?>" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content rounded-3">

            <div class="modal-header bg-danger text-white">
                <h5 class="modal-title">Delete Coupon</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body text-center">
                <p class="fs-5">Are you sure you want to delete this coupon?</p>
                <p class="fw-bold text-danger"><?php echo e($coupon->title); ?> (<?php echo e($coupon->coupon_code); ?>)</p>
            </div>

            <form action="<?php echo e(route('coupons.delete', $coupon->id)); ?>" method="POST">
                <?php echo csrf_field(); ?>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </div>
            </form>

        </div>
    </div>
</div>


                    
                    
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </tbody>

            </table>

        </div>
    </div>

</div>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.body.adminmaster', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /www/wwwroot/root.nexwin.vip/resources/views/coupons/index.blade.php ENDPATH**/ ?>