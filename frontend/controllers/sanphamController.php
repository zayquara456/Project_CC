<?php
require_once 'controllers/Controller.php';
require_once 'models/Product.php';

class SanPhamController extends Controller {
  public function index() {
    $product_model = new Product();
    $products = $product_model->getProductInHomePage();
	$danhmuc = $product_model->getProductInCate();
	$productfill = $product_model->getProductInStore();

    $this->content = $this->render('views/homes/sanpham.php', [
      'products' => $products,
	  'danhmuc' => $danhmuc,
	  'productfill' => $productfill
    ]);
    require_once 'views/layouts/main.php';
  }
}