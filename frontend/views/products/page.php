<?php
//views/homes/index.php
require_once 'helpers/Helper.php';?>
<!--    PRODUCT-->
<div class="product-wrap">
    <div class="product container">
          <h1 class="post-list-title">
		<?php if (!empty($nameofcate)):?>
              <a href="danh-sach-san-pham.html" class="link-category-item"><?php echo $nameofcate['name'] ?></a>
          </h1>
          <div class="link-secondary-wrap row">
            <?php foreach ($productofcate AS $product):
              $slug = Helper::getSlug($product['title']);
              $product_link = "san-pham/$slug/" . $product['id'] . ".html";
                $product_cart_add = "them-vao-gio-hang/" . $product['id'] . ".html";?>
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
                </div>	   <?php endforeach; ?>
		  <?php endif; ?>
          </div>
		
    </div>
	<?php echo $pages; ?>
</div>
<!--    END PRODUCT-->