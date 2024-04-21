$(document).ready(function() {
    $(".category li").click(function() {
        var category = $(this).attr("id");
        $.get("http://localhost/WebsiteProject/populategriditems.php?category=" + category, function(data){
            var items = JSON.parse(data);
            for (var i = 0; i < items.length; i++) {
                $("#grid-image" + (i + 1)).attr("src", items[i].image_url);
                $("#category-header").html("<h2>" + items[i].category + "</h2>");
                $("#item-description" + (i + 1)).html("<p>" + items[i].name + "</p>");
                $("#item-price" + (i + 1)).html("<p>" + "$" + items[i].price + "</p>");
                $("#item-availability" + (i + 1)).html(function() {    
                    if(items[i].availability == 1) {
                        return "<p>Status: In Stock</p>";
                    } else {
                        return "<p>Status: Out Of Stock </p>";
                    }
                    });
            }
        });
    });
});

$(document).ready(function() {
    $("#carousel-descriptions h3").click(function() {
        var category = $(this).attr("id");
        $.get("http://localhost/WebsiteProject/populategriditems.php?category=" + category, function(data){
            var items = JSON.parse(data);
            for (var i = 0; i < items.length; i++) {
                $("#grid-image" + (i + 1)).attr("src", items[i].image_url);
                $("#category-header").html("<h2>" + items[i].category + "</h2>");
                $("#item-description" + (i + 1)).html("<p>" + items[i].name + "</p>");
                $("#item-price" + (i + 1)).html("<p>" + "$" + items[i].price + "</p>");
                $("#item-availability" + (i + 1)).html(function() {    
                    if(items[i].availability == 1) {
                        return "<p>Status: In Stock</p>";
                    } else {
                        return "<p>Status: Out Of Stock </p>";
                    }
                    });
            }
        });
    });
});




    var totalAmount1 = 0.00;
    var totalAmount2 = 0.00;
/*add or removes items to the cart*/
$(document).ready(function() {

    function processDataForPHP(imageUrl, itemName, itemPrice, quantity) {
        // Construct item object
        var itemData = {
            imageUrl: imageUrl,
            itemName: itemName,
            itemPrice: itemPrice.toFixed(2),
            quantity: quantity
        };
    
        // Convert item object to JSON string
        var jsonData = JSON.stringify(itemData);
    
        // Send data to PHP using AJAX
        $.ajax({
            url: "cart.php",
            type: "POST",
            data: { jsonData: jsonData }, // Send JSON data
            success: function(response) {
                console.log("Item added to cart:", response);
            },
            error: function(xhr, status, error) {
                console.error("Error adding item to cart:", error);
            }
        });
    }
    

    // Add to cart functionality
    $(".add-to-cart-button").click(function() {
        var $gridItem = $(this).closest(".grid-item");
        var imageUrl = $gridItem.find(".grid-image").attr("src");
        var itemName = $gridItem.find(".item-description").text();
        var itemPrice = parseFloat($gridItem.find(".item-price").text().replace("$", "")); 

        totalAmount1 += itemPrice;
        totalAmount2 += itemPrice;

        $("#total1").text("Total: $" + totalAmount1.toFixed(2));
        $("#total2").text("$" + totalAmount2.toFixed(2));

        var $existingCartItem = $(".cart-item:contains('" + itemName + "')");
        
        if ($existingCartItem.length) {
            var $quantityElement = $existingCartItem.find('.cart-item-quantity');
            var quantity = parseInt($quantityElement.text()) + 1;
            $quantityElement.text(quantity); 
            var totalPrice = itemPrice * quantity;
            $existingCartItem.find('.cart-item-price').text("$" + totalPrice.toFixed(2));
            processDataForPHP(imageUrl, itemName, itemPrice, quantity);
        } else {
            var $quantityElement = $existingCartItem.find('.cart-item-quantity');
            var quantity = parseInt($quantityElement.text())
            var $newCartItem = $('<div class="cart-item">' +
                                    '<img src="' + imageUrl + '" class="cart-image">' +
                                    '<p class="cart-item-name">' + itemName + '</p>' +
                                    '<p class="cart-item-price">$' +  itemPrice.toFixed(2) + '</p>' + 
                                    '<p class="cart-item-quantity">1</p>' +
                                    '<i class="fa fa-times remove-item"></i>' +
                                '</div>').data({
                                    'imageUrl': imageUrl,
                                    'itemName': itemName
                                });
        
            $(".cart-grid").prepend($newCartItem);
            processDataForPHP(imageUrl, itemName, itemPrice, quantity);
        }   
        
    });

    
   // $(".remove-item").click(function() did not work{}
   // so I had to change it to the following because the remove item button is dynamcially created everytime so
   //the parent item needs to be accessed to ensure tis fucntionaloty can be applied once the button is created
    $(".cart-grid").on("click", ".remove-item", function() {
        var $cartItem = $(this).closest(".cart-item");
        var $quantityElement = $cartItem.find('.cart-item-quantity');
        var quantity = parseInt($quantityElement.text());
        var itemPrice = parseFloat($cartItem.find(".cart-item-price").text().replace("$", "")) / quantity;
        
        var imageUrl = $cartItem.data('imageUrl');
        var itemName = $cartItem.data('itemName');
        
        // Decrement quantity
        if (quantity > 0) {  
            quantity -= 1;
            $quantityElement.text(quantity);

            // Update total price for the removed item
            var totalPrice = itemPrice * quantity;
            $cartItem.find('.cart-item-price').text("$" + totalPrice.toFixed(2));
            
            // Update total amount
            totalAmount1 -= itemPrice;
            totalAmount2 -= itemPrice;
            $("#total1").text("Total: $" + totalAmount1.toFixed(2));
            $("#total2").text("$" + totalAmount2.toFixed(2));
            processDataForPHP(imageUrl, itemName, itemPrice, quantity); //offending element causes cart-item 
            //to remain after quantity=0
        } 
        
        // Remove item from cart if quantity becomes 0
        if (quantity == 0) {
            $cartItem.remove();
            processDataForPHP("", "", 0, 0);
        } 
    });


    $(".clear-button").click(function() {
        var $items =  $(".cart-grid").find('.cart-item');
        $items.remove();
        totalAmount1 = 0.00;
        totalAmount2 = 0.00;
        $("#total1").text("Total: $" + totalAmount1.toFixed(2));
        $("#total2").text("$" + totalAmount2.toFixed(2));
        processDataForPHP("", "", 0, 0);
    });
});


































