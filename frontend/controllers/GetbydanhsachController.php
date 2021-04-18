<?php
require_once 'controllers/Controller.php';
require_once 'models/Page.php';

class GetbydanhsachController extends Controller {
  public function index() {
	  $idofcate = $_GET['cateid'];
    $product_model = new Product();
	$productofcate = $product_model->getProductInCate($idofcate);
	$nameofcate = $product_model->getByNameCate($idofcate);

    $this->content = $this->render('views/products/page.php', [
      'productofcate' => $productofcate,
	  'nameofcate' => $nameofcate
    ]);
    require_once 'views/layouts/main.php';
  }
}