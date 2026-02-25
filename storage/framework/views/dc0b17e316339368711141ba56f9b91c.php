<?php $__env->startSection('admin'); ?>

<style>
    .game-section {
        padding: 30px 15px;
        background-color: #f5f5f5;
    }

    .game-title {
        text-align: center;
        font-size: 28px;
        font-weight: bold;
        margin-bottom: 30px;
        color: #343a40;
    }

    .game-grid {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 20px;
    }

    .game-card {
        width: 180px;
        height: 200px;
        background: #fff;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        text-align: center;
        text-decoration: none;
        color: #333;
        display: block; /* changed from flex */
        overflow: hidden;
        transition: all 0.3s ease-in-out;
    }

    .game-card:hover {
        transform: scale(1.05);
        box-shadow: 0 10px 20px rgba(0,0,0,0.2);
    }

    .game-image {
        width: 100%;
        height: 150px;
        object-fit: contain; /* full image fit */
        background: #f9f9f9;
        padding: 10px;
    }

    .game-name {
        padding: 15px 10px;
        font-size: 14px;
        font-weight: 500;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        margin: 0;
    }

    @media (max-width: 992px) {
        .game-card {
            width: 45%;
        }
    }

    @media (max-width: 576px) {
        .game-card {
            width: 90%;
        }
    }
</style>

<div class="container-fluid game-section">
    <h2 class="game-title">Game List</h2>

    <div class="game-grid">
        <?php
            $games = [
                ['name' => 'Wingo Game', 'url' => url('colour_prediction/1'), 'image' => 'https://root.winbhai.in/gamelist_image/wingo.png'],
['name' => 'Chicken Road Game', 'url' => '', 'image' => 'https://root.winbhai.in/gamelist_image/chicken_road.jpeg'],
                ['name' => 'Aviator Game', 'url' => '#', 'image' => 'https://root.winbhai.in/gamelist_image/aviator.webp'],
               
            ];
        ?>

        <?php $__currentLoopData = $games; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $game): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <a href="<?php echo e($game['url']); ?>" class="game-card">
                <img src="<?php echo e($game['image']); ?>" alt="<?php echo e($game['name']); ?>" class="game-image" loading="lazy">
                <div class="game-name" title="<?php echo e($game['name']); ?>"><?php echo e($game['name']); ?></div>
            </a>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </div>
</div>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.body.adminmaster', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /www/wwwroot/Newprojectadmin.codescarts.com/resources/views/games/gamelist.blade.php ENDPATH**/ ?>