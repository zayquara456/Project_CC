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
    require_once 'views/layouts/main.php';
  }
  
  public function detail(){
    $id = isset($_GET['id']) ? $_GET['id'] : "";
    $news_model = new News();
    $news = $news_model->getNewsById($id);
    $this->content = $this->render('views/news/detail.php', [
      'news' => $news,
    ]);
    require_once 'views/layouts/main.php';
  }
}