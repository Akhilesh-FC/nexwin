<?php $__env->startSection('admin'); ?>

<div class="container mt-4">

    <h3 class="mb-4">Game Subcategory Sliders</h3>

    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Image</th>
                <th>Updated At</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody>

        <?php $__currentLoopData = $sliders; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <tr>
                <td><?php echo e($item->id); ?></td>

                <td>
                    <img src="<?php echo e($item->image); ?>" 
                         width="80" height="80">
                </td>

                <td><?php echo e($item->updated_at); ?></td>

                <td>
                    <button class="btn btn-primary btn-sm"
                            onclick="openEditModal(<?php echo e($item->id); ?>, '<?php echo e($item->image); ?>')">
                        Edit
                    </button>
                </td>
            </tr>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

        </tbody>
    </table>

</div>


<!-- UPDATE MODAL -->
<!-- UPDATE MODAL -->
<div class="modal fade" id="editModal" tabindex="-1">
    <div class="modal-dialog">
        <form id="updateForm" method="POST" enctype="multipart/form-data">
            <?php echo csrf_field(); ?>

            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title">Update Slider Image</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">

                    <input type="hidden" id="slider_id" name="id">

                    <div class="mb-3">
                        <label class="form-label">Current Image</label><br>
                        <img id="previewImg" src="" width="120">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Choose New Image</label>
                        <input type="file" name="image" class="form-control" id="imageInput" required>
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Update</button>
                </div>

            </div>
        </form>
    </div>
</div>



<script>
function openEditModal(id, image) {
    let baseUrl = "https://root.winbhai.in/public/game_subcat_sliders/";
    document.getElementById("slider_id").value = id;
    document.getElementById("previewImg").src = baseUrl + image;

    new bootstrap.Modal(document.getElementById('editModal')).show();
}

document.getElementById("updateForm").addEventListener("submit", function(e){
    e.preventDefault();

    let formData = new FormData(this);

    fetch("<?php echo e(route('game_slider_img.update')); ?>", {
        method: "POST",
        body: formData,
        headers: {
            'X-CSRF-TOKEN': '<?php echo e(csrf_token()); ?>'
        }
    })
    .then(res => res.json())
    .then(data => {
        alert(data.message);
        if (data.status === 200) {
            location.reload();
        }
    })
    .catch(err => console.log(err));
});
</script>




<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.body.adminmaster', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /www/wwwroot/root.nexwin.vip/resources/views/game_silder_img/index.blade.php ENDPATH**/ ?>