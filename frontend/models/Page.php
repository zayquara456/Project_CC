<?php
require_once 'models/Model.php';
class Product extends Model {
 
   public function getByNameCate($a)
  {
    $obj_select = $this->connection
      ->prepare("SELECT categories.* FROM categories WHERE categories.id = $a");

    $obj_select->execute();
    $product =  $obj_select->fetch(PDO::FETCH_ASSOC);
    return $product;
  }
	
	public function getAllPagination($arr_params,$a)
    {
        $limit = $arr_params['limit'];
        $page = $arr_params['page'];
        $start = ($page - 1) * $limit;
        $obj_select = $this->connection
            ->prepare("SELECT products.*, categories.name AS category_name FROM products 
                        INNER JOIN categories ON categories.id = products.category_id
                        WHERE products.category_id = $a
                        ORDER BY products.updated_at DESC, products.created_at DESC
                        LIMIT $start, $limit
                        ");

        $arr_select = [];
        $obj_select->execute($arr_select);
        $products = $obj_select->fetchAll(PDO::FETCH_ASSOC);

        return $products;
    }

    /**
     * Tính tổng số bản ghi đang có trong bảng products
     * @return mixed
     */
    public function countTotal($a)
    {
        $obj_select = $this->connection->prepare("SELECT COUNT(id) FROM products WHERE products.category_id = $a ");
        $obj_select->execute();

        return $obj_select->fetchColumn();
    }
}

