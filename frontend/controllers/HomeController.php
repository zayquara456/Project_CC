<?php
require_once 'controllers/Controller.php';
require_once 'models/Product.php';
require_once 'models/News.php';

class HomeController extends Controller {
  public function index() {
    $product_model = new Product();
    $products = $product_model->getProductInHomePage();
    $news_model = new News();
    $news = $news_model->getNewsNearest();

    $this->content = $this->render('views/homes/index.php', [
      'products' => $products,
      'news' => $news,
    ]);
    require_once 'views/layouts/main.php';
  }
}