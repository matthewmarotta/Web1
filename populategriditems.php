<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "grocerydatabase";


if (isset($_GET['category'])) {
   
    $category = $_GET['category'];
    
    
    $conn = new mysqli($servername, $username, $password, $dbname);

   
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sql = "SELECT image_url, category, name, price, quantity, availability FROM groceryitems WHERE category = ?";
    $stmt = $conn->prepare($sql);


    $stmt->bind_param("s", $category);
    $stmt->execute();
    $result = $stmt->get_result();
    
    $category_data = array();
    
    if ($result->num_rows > 0) {
       
       
        while ($row = $result->fetch_assoc()) {
            $category_data[] = $row;
        } 
        echo json_encode($category_data);
    } else {
        echo "0 results";
    }

    $stmt->close();
    $conn->close();
} else {
    echo "Category parameter not provided";
}

?>





























