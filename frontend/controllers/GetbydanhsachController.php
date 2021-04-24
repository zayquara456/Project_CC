<?php
require_once 'controllers/Controller.php';
require_once 'models/Page.php';
require_once 'models/Pagination.php';

class GetbydanhsachController extends Controller {
  public function index() {
	$idofcate = $_GET['cateid'];
    $product_model = new Product();
	$nameofcate = $product_model->getByNameCate($idofcate);
	$count_total = $product_model->countTotal($idofcate);
	  $arr_params = [
        'total' => $count_total,
        'limit' => 12,
        'query_string' => 'page',
        'controller' => 'Getbydanhsach',
        'full_mode' => false,
        'query_additional' => $query_additional,
        'page' => isset($_GET['page']) ? $_GET['page'] : 1,
		  'cateid' => $idofcate
    ];
	  $productofcate = $product_model->getAllPagination($arr_params,$idofcate);
    $pagination = new Pagination($arr_params);

    $pages = $pagination->getPagination();

    $this->content = $this->render('views/products/page.php', [
      'productofcate' => $productofcate,
	  'nameofcate' => $nameofcate,
		'pages' => $pages
    ]);
    require_once 'views/layouts/main.php';
  }
}