<?php $__env->startSection('admin'); ?>

<div class="container-fluid">
  <div class="row">
    <div class="col-md-12">
      <div class="white_shd full margin_bottom_30">

        <div class="full graph_head">
          <div class="heading1 margin_0 d-flex justify-content-between align-items-center">
            <h2>Banner List</h2>
            <button type="button"
                    class="btn btn-info"
                    data-toggle="modal"
                    data-target="#addBannerModal">
              Add Banner
            </button>
          </div>
        </div>

        <div class="table_section padding_infor_info">
          <div class="table-responsive-sm">
            <table class="table table-striped">
              <thead class="thead-dark">
                <tr>
                  <th>ID</th>
                  <th>Title</th>
                  <th>Image</th>
                  <th>Activity Image</th>
                  <th>Link</th>
                  <th>Active From</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <?php $__currentLoopData = $banner; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <tr>
                  <td><?php echo e($item->id); ?></td>
                  <td><?php echo e($item->title); ?></td>
                  <td>
                    <img src="<?php echo e($item->image); ?>" width="60">
                  </td>
                  <td>
                    <img src="<?php echo e($item->activity_image); ?>" width="60">
                  </td>
                  <td>
                    <?php echo e($item->link ?? '—'); ?>

                  </td>
                  <td>
                    <?php echo e($item->active_from ?? 'Immediate'); ?>

                  </td>
                  <td>
                    <i class="fa fa-edit"
                       style="font-size:24px; cursor:pointer;"
                       data-toggle="modal"
                       data-target="#editBannerModal<?php echo e($item->id); ?>"></i>

                    <a href="<?php echo e(route('banner.delete', $item->id)); ?>"
                       onclick="return confirm('Delete this banner?')">
                      <i class="fa fa-trash text-danger ml-2" style="font-size:24px;"></i>
                    </a>
                  </td>
                </tr>

                
                <div class="modal fade"
                     id="editBannerModal<?php echo e($item->id); ?>"
                     tabindex="-1">
                  <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">

                      <div class="modal-header">
                        <h5 class="modal-title">Edit Banner</h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                      </div>

                      <form action="<?php echo e(route('banner.update', $item->id)); ?>"
                            method="POST"
                            enctype="multipart/form-data">
                        <?php echo csrf_field(); ?>

                        <div class="modal-body">
                          <div class="form-group">
                            <label>Title</label>
                            <input type="text"
                                   class="form-control"
                                   name="title"
                                   value="<?php echo e($item->title); ?>">
                          </div>

                          <div class="form-group">
                            <label>Banner Link (Optional)</label>
                            <input type="text"
                                   class="form-control"
                                   name="link"
                                   value="<?php echo e($item->link); ?>">
                          </div>

                          <div class="form-group">
                            <label>Active From</label>
                            <input type="datetime-local"
                                   class="form-control"
                                   name="active_from"
                                   value="<?php echo e($item->active_from ? date('Y-m-d\TH:i', strtotime($item->active_from)) : ''); ?>">
                          </div>

                          <div class="form-group">
                            <label>Image</label>
                            <input type="file" name="image" class="form-control">
                          </div>

                          <div class="form-group">
                            <label>Activity Image</label>
                            <input type="file" name="activity_image" class="form-control">
                          </div>
                        </div>

                        <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                          <button type="submit" class="btn btn-primary">Update</button>
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
    </div>
  </div>
</div>


<div class="modal fade" id="addBannerModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <div class="modal-header">
        <h5 class="modal-title">Add Banner</h5>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <form action="<?php echo e(route('banner.store')); ?>"
            method="POST"
            enctype="multipart/form-data">
        <?php echo csrf_field(); ?>

        <div class="modal-body">

          <div class="form-group">
            <label>Title</label>
            <input type="text" class="form-control" name="title" required>
          </div>

          <div class="form-group">
            <label>Banner Link (Optional)</label>
            <input type="text" class="form-control" name="link"
                   placeholder="https://example.com">
          </div>

          <div class="form-group">
            <label>Active From (Optional)</label>
            <input type="datetime-local" class="form-control" name="active_from">
            <small class="text-muted">
              Blank chhoda to banner turant active hoga
            </small>
          </div>

          <div class="form-group">
            <label>Image</label>
            <input type="file" class="form-control" name="image" required>
          </div>

          <div class="form-group">
            <label>Activity Image</label>
            <input type="file" class="form-control" name="activity_image" required>
          </div>

        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Add Banner</button>
        </div>

      </form>
    </div>
  </div>
</div>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.body.adminmaster', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /www/wwwroot/root.nexwin.vip/resources/views/banner/index.blade.php ENDPATH**/ ?>