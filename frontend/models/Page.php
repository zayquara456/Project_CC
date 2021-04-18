<?php
require_once 'models/Model.php';
class Product extends Model {
 
 public function getProductInCate($a) {
 
    $sql_select = "SELECT products.*, categories.name 
          AS category_name FROM products
          INNER JOIN categories ON products.category_id = categories.id
          WHERE products.status = 1 AND products.category_id = $a";
    $obj_select = $this->connection->prepare($sql_select);
    $obj_select->execute();

    $products = $obj_select->fetchAll(PDO::FETCH_ASSOC);
    return $products;
  }
  /**
   * Lấy thông tin sản phẩm theo id
   * @param $id
   * @return mixed
   */
   public function getByNameCate($a)
  {
    $obj_select = $this->connection
      ->prepare("SELECT categories.* FROM categories WHERE categories.id = $a");

    $obj_select->execute();
    $product =  $obj_select->fetch(PDO::FETCH_ASSOC);
    return $product;
  }
}

