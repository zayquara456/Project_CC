<?php
//views/homes/index.php
require_once 'helpers/Helper.php';
?>
<!--    PRODUCT-->
<div class="product-wrap">
    <div class="product container">
      <?php if (!empty($products)): ?>
          <h1 class="post-list-title">
              <a href="danh-sach-san-pham.html" class="link-category-item">Sản phẩm mới nhất</a>
          </h1>
          <div class="link-secondary-wrap row">
            <?php foreach ($products AS $product):
              $slug = Helper::getSlug($product['title']);
              $product_link = "san-pham/$slug/" . $product['id'] . ".html";
                $product_cart_add = "them-vao-gio-hang/" . $product['id'] . ".html";
              ?>
                <div class="service-link col-md-3 col-sm-6 col-xs-12">
                    <a href="<?php echo $product_link; ?>">
                        <img class="secondary-img img-responsive" title="<?php echo $product['title'] ?>"
                             src="../backend/assets/uploads/<?php echo $product['avatar'] ?>"
                             alt="<?php echo $product['title'] ?>"/>
                        <span class="shop-title">
                        <?php echo $product['title'] ?>
                    </span>
                    </a>
                    <span class="shop-price">
                            <?php echo "<b>".number_format($product['price'], '0', '', '.')." VNĐ"."</b>" ?>
                </span>

                    <span class="add-to-cart"
                          data-id="<?php echo $product['id']; ?>">
                        <a href="#" style="color: inherit">Thêm vào giỏ</a>
                    </span>
                </div>
            <?php endforeach; ?>
          </div>
      <?php endif; ?>
    </div>
</div>
<!--    END PRODUCT-->

<!--NEWS-->
<div class="news-wrap">
    <div class="news container">
        <h1 class="post-list-title">
            <a href="/news.html" class="link-category-item">Tin mới nhất</a>
        </h1>
        <div class="row">
            <?php if(!empty($news)){
                foreach($news as $items){ 
                    $slug = Helper::getSlug($items['title']);
                    $items_link = "chi-tiet-news/$slug/" . $items['id'] . ".html";?>
                    <div class="col-md-4 col-sm-4 col-xs-12 category-two-item">
                        <a href="<?php echo $items_link; ?>" class="two-item-link-heading">
                            <span class="new-image-content">
                                <img src="../backend/assets/images/<?php echo $items['avatar'] ?>"
                                    title="<?php echo $items['title'] ?>"
                                    alt="<?php echo $items['title'] ?>"
                                    class="post-image-avatar img-responsive">
                            </span>
                        </a>
                        <div class="news-content-wrap">
                            <h3 class="category-heading timeline-post-title">
                                <a href="<?php echo $items_link; ?>"><?php echo $items['title'] ?></a>
                            </h3>
                            <div class="news-description"><?php echo $items['summary'] ?></div>
                        </div>
                    </div>
                <?php }
            } ?>
        </div>
    </div>
</div>
<!--END NEWS-->