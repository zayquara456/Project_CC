<?php
require_once 'models/Model.php';
class News extends Model {
  public function getAll() {
    $sql_select_all = "SELECT * FROM news WHERE `status` = 1";
    $obj_select_all = $this->connection->prepare($sql_select_all);
    $obj_select_all->execute();
    $news = $obj_select_all->fetchAll(PDO::FETCH_ASSOC);
    return $news;
  }

  public function getNewsNearest() {
    $sql = "SELECT * FROM news WHERE `status` = 1 Order By news.id Desc Limit 3";
    $obj = $this->connection->prepare($sql);
    $obj->execute();
    $news = $obj->fetchAll(PDO::FETCH_ASSOC);
    return $news;
  }

  public function getNewsById($id){
    $sql = "SELECT * FROM news WHERE `status` = 1 AND news.id = $id";
    $obj = $this->connection->prepare($sql);
    $obj->execute();
    $news = $obj->fetchAll(PDO::FETCH_ASSOC);
    return $news;
  }
}