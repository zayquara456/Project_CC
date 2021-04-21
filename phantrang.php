<!DOCTYPE html>
<html>
    <head>
        <title>Ví dụ phân trang trong PHP và MySQL</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <?php
$conn = mysqli_connect('localhost','root','','test');
$result = mysqli_query($conn, 'select count(id) as total from products');
$row = mysqli_fetch_assoc($result);
$total_records = $row['total'];
$current_page = isset($_GET['page']) ? $_GET['page'] : 1;
$limit = 12;
$total_page = ceil($total_records / $limit);
if ($current_page > $total_page){
$current_page = $total_page;}
else if ($current_page < 1){
$current_page = 1;}
$start = ($current_page - 1) * $limit;
$result = mysqli_query($conn, "SELECT * FROM products LIMIT $start, $limit");?>
        <div>
            <?php 
while ($row = mysqli_fetch_assoc($result)){
echo '<li>' . $row['title'] . '</li>';
}?>
        </div>
        <div class="pagination">
           <?php 
if ($current_page > 1 && $total_page > 1){
echo '<a href="index.php?page='.($current_page-1).'">Prev</a> | ';}
for ($i = 1; $i <= $total_page; $i++){
if ($i == $current_page){
echo '<span>'.$i.'</span> | ';
}
else{
echo '<a href="index.php?page='.$i.'">'.$i.'</a> | ';
}
}
if ($current_page < $total_page && $total_page > 1){
echo '<a href="index.php?page='.($current_page+1).'">Next</a> | ';
}?>
        </div>
    </body>
</html>