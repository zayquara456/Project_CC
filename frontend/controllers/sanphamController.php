<?php
require_once 'controllers/Controller.php';
require_once 'models/Product.php';

class SanPhamController extends Controller {
  public function index() {
    $product_model = new Product();
    $products = $product_model->getProductInHomePage();
	$danhmuc = $product_model->getProductInCate();

    $this->content = $this->render('views/homes/sanpham.php', [
      'products' => $products,
	  'danhmuc' => $danhmuc
    ]);
    require_once 'views/layouts/main.php';
  }
}