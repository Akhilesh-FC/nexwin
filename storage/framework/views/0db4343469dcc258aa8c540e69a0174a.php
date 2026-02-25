<?php $__env->startSection('admin'); ?>

<div class="container-fluid">


<div class="card mb-4">
  <div class="card-header d-flex justify-content-between">
    <h4>Categories</h4>
    <button class="btn btn-primary"
            data-bs-toggle="modal"
            data-bs-target="#addCatModal">
      + Add Category
    </button>
  </div>

  <div class="card-body">
    <table class="table table-bordered">
      <?php $__currentLoopData = $categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $c): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
      <tr>
        <td><?php echo e($c->name); ?></td>
        <td width="120">
          <button class="btn btn-warning btn-sm"
                  data-bs-toggle="modal"
                  data-bs-target="#editCat<?php echo e($c->id); ?>">
            Edit
          </button>
        </td>
      </tr>

      
      <div class="modal fade" id="editCat<?php echo e($c->id); ?>" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
          <form method="POST" action="<?php echo e(route('admin.category.update',$c->id)); ?>" class="modal-content">
            <?php echo csrf_field(); ?>
            <div class="modal-header">
              <h5>Edit Category</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
              <input class="form-control" name="name" value="<?php echo e($c->name); ?>">
            </div>
            <div class="modal-footer">
              <button class="btn btn-primary">Update</button>
            </div>
          </form>
        </div>
      </div>
      <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </table>
  </div>
</div>


<div class="modal fade" id="addCatModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <form method="POST" action="<?php echo e(route('admin.category.store')); ?>" class="modal-content">
      <?php echo csrf_field(); ?>
      <div class="modal-header">
        <h5>Add Category</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <input class="form-control" name="name" placeholder="Category Name">
      </div>
      <div class="modal-footer">
        <button class="btn btn-success">Save</button>
      </div>
    </form>
  </div>
</div>


<div class="card mb-4">
  <div class="card-header d-flex justify-content-between">
    <h4>Languages</h4>
    <button class="btn btn-primary"
            data-bs-toggle="modal"
            data-bs-target="#addLangModal">
      + Add Language
    </button>
  </div>

  <div class="card-body">
    <table class="table table-bordered">
      <?php $__currentLoopData = $languages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $l): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
      <tr>
        <td><?php echo e($l->name); ?></td>
        <td width="120">
          <button class="btn btn-warning btn-sm"
                  data-bs-toggle="modal"
                  data-bs-target="#editLang<?php echo e($l->id); ?>">
            Edit
          </button>
        </td>
      </tr>

      
      <div class="modal fade" id="editLang<?php echo e($l->id); ?>" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
          <form method="POST" action="<?php echo e(route('admin.language.update',$l->id)); ?>" class="modal-content">
            <?php echo csrf_field(); ?>
            <div class="modal-header">
              <h5>Edit Language</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
              <input class="form-control" name="name" value="<?php echo e($l->name); ?>">
            </div>
            <div class="modal-footer">
              <button class="btn btn-primary">Update</button>
            </div>
          </form>
        </div>
      </div>
      <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </table>
  </div>
</div>


<div class="modal fade" id="addLangModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <form method="POST" action="<?php echo e(route('admin.language.store')); ?>" class="modal-content">
      <?php echo csrf_field(); ?>
      <div class="modal-header">
        <h5>Add Language</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <input class="form-control" name="name" placeholder="Language Name">
      </div>
      <div class="modal-footer">
        <button class="btn btn-success">Save</button>
      </div>
    </form>
  </div>
</div>


<div class="card">
  <div class="card-header">
    <h4>Add Category Language Media</h4>
  </div>

  <div class="card-body">
    <form method="POST" action="<?php echo e(route('admin.media.store')); ?>" class="row g-2 mb-3">
      <?php echo csrf_field(); ?>
      <div class="col-md-3">
        <select name="category_id" class="form-control">
          <?php $__currentLoopData = $categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $c): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <option value="<?php echo e($c->id); ?>"><?php echo e($c->name); ?></option>
          <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </select>
      </div>
      <div class="col-md-3">
        <select name="language_id" class="form-control">
          <?php $__currentLoopData = $languages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $l): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <option value="<?php echo e($l->id); ?>"><?php echo e($l->name); ?></option>
          <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </select>
      </div>
      <div class="col-md-3">
        <input name="image_url" class="form-control" placeholder="Image URL">
      </div>
      <div class="col-md-3">
        <input name="video_url" class="form-control" placeholder="Video URL">
      </div>
      <div class="col-md-12">
        <button class="btn btn-success mt-2">Add Media</button>
      </div>
    </form>

    <table class="table table-striped">
      <?php $__currentLoopData = $media; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $m): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
      <tr>
        <td><?php echo e($m->category); ?></td>
        <td><?php echo e($m->language); ?></td>
        <td><img src="<?php echo e($m->image_url); ?>" width="60"></td>
        <td><?php echo e($m->video_url); ?></td>
        <td width="220">
          <form method="POST" action="<?php echo e(route('admin.media.update',$m->id)); ?>" class="d-inline">
            <?php echo csrf_field(); ?>
            <input name="image_url" value="<?php echo e($m->image_url); ?>" class="form-control mb-1">
            <input name="video_url" value="<?php echo e($m->video_url); ?>" class="form-control mb-1">
            <button class="btn btn-primary btn-sm">Update</button>
          </form>

          <form method="POST" action="<?php echo e(route('admin.media.delete',$m->id)); ?>" class="d-inline">
            <?php echo csrf_field(); ?>
            <button class="btn btn-danger btn-sm mt-1">Delete</button>
          </form>
        </td>
      </tr>
      <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </table>

  </div>
</div>

</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.body.adminmaster', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /www/wwwroot/root.nexwin.vip/resources/views/categorylanguage/index.blade.php ENDPATH**/ ?>