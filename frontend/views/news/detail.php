<?php
require_once 'helpers/Helper.php';
?>
<!--NEWS DETAIL-->
<div class="content">
    <?php if(!empty($news)){
        foreach($news as $items){ ?>
            <div class="news-content-wrap">
                <h2><a href="<?php echo $items_link; ?>"><?php echo $items['title'] ?></a></h2>
                <div class="news-description"><?php echo $items['summary'] ?></div>
            </div>
            <span class="new-image-content">
                <img src="../backend/assets/images/<?php echo $items['avatar']?>"
                    title="<?php echo $items['title'] ?>"
                    alt="<?php echo $items['title'] ?>"
                    class="img-730px">
            </span>
            <div class="news-content-wrap">
                <div class="news-description txt-left margin-top-bottom-10">
                    <?php echo $items['content'] ?>
                </div>
            </div>
        <?php }
    } ?>
    <p id="scroll" class="d-none"><i class="fas fa-angle-up"></i></p>
</div>
<!--END NEWS DETAIL-->

