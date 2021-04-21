<?php
require_once 'controllers/Controller.php';
require_once 'models/News.php';

class NewsController extends Controller {
  public function index() {
    $news_model = new News();
    $news = $news_model->getAll();

    $this->content = $this->render('views/news/index.php', [
        'news' => $news,
    ]);
    // print_r($products);
    require_once 'views/layouts/main.php';
  }
  
  public function detail(){
    $this->content = $this->render('views/news/index.php', [

    ]);
    require_once 'views/layouts/main.php';
  }
}