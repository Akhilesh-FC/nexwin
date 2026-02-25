<?php $__env->startSection('admin'); ?>

<style>
/* ✅ Modal image styling */
.modal-img {
    width: 100%;
    height: auto;
    border-radius: 10px;
}
.table th, .table td {
    text-align: center;
    vertical-align: middle;
}
</style>

<div class="container-fluid mt-4">
    <div class="row">
        <div class="col-md-12">
            <div class="white_shd full margin_bottom_30 shadow-sm rounded bg-white p-3">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="font-weight-bold text-dark">📋 Manual Deposit List</h4>
                </div>

                <div class="table_section">
                    <div class="table-responsive">
                        <table id="example" class="table table-striped table-bordered">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Id</th>
                                    <th>User Id</th>
                                    <th>User Name</th>
                                    <th>Mobile</th>
                                    <th>Order Id</th>
                                    <th>INR Amount</th>
                                    <th>Screenshot</th>
                                    <th>UTR Number</th>
                                    <th>Status</th>
                                    <th>Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $__currentLoopData = $deposits; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <tr>
                                    <td><?php echo e($item->id); ?></td>
                                    <td><?php echo e($item->userid); ?></td>
                                    <td><?php echo e($item->uname); ?></td>
                                    <td><?php echo e($item->mobile); ?></td>
                                    <td><?php echo e($item->order_id); ?></td>
                                    <td><?php echo e($item->cash); ?></td>

                                    <!-- ✅ Screenshot View Button -->
                                    <td>
                                        <?php if($item->typeimage): ?>
                                            <button class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#imageModal<?php echo e($item->id); ?>">
                                                View
                                            </button>
                                        <?php else: ?>
                                            <span class="text-muted">No Image</span>
                                        <?php endif; ?>
                                    </td>
                                     <td><?php echo e($item->transaction_id); ?></td>

                                    <!-- ✅ Dropdown Status -->
                                    <td>
                                        <?php if($item->status == 1): ?>
                                        <div class="dropdown">
                                            <button class="btn btn-warning dropdown-toggle" type="button" id="dropdownMenuButton<?php echo e($item->id); ?>" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Pending
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton<?php echo e($item->id); ?>">
                                                <a class="dropdown-item text-success" href="<?php echo e(route('manual_success', $item->id)); ?>">Mark as Success</a>
                                                <a class="dropdown-item text-danger" href="<?php echo e(route('manual_reject', $item->id)); ?>">Reject</a>
                                            </div>
                                        </div>
                                        <?php elseif($item->status == 2): ?>
                                        <button class="btn btn-success">Success</button>
                                        <?php elseif($item->status == 3): ?>
                                        <button class="btn btn-danger">Rejected</button>
                                        <?php else: ?>
                                        <span class="badge badge-secondary">Unknown</span>
                                        <?php endif; ?>
                                    </td>

                                    <td><?php echo e($item->created_at); ?></td>
                                </tr>

                                <!-- ✅ Image Preview Modal -->
                                <div class="modal fade" id="imageModal<?php echo e($item->id); ?>" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel<?php echo e($item->id); ?>" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="imageModalLabel<?php echo e($item->id); ?>">Deposit Screenshot</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body text-center">
                                                <img src="<?php echo e($item->typeimage); ?>" class="modal-img" alt="Deposit Screenshot">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- ✅ Bootstrap + jQuery for dropdown and modal -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.body.adminmaster', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /www/wwwroot/root.nexwin.vip/resources/views/manual_deposit/deposit.blade.php ENDPATH**/ ?>