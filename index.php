<?php
 if(!isset($_SESSION)) 
 { 
     session_start(); 
 } 

if(!isset($_SESSION['customer_id']) || !isset($_SESSION['logged_in_time'])){
 //User not logged in. Redirect them back to the sign-in.php page.
 header('Location: sign-in.php');
 exit;
}
 
function __autoload($class)
{
require_once "classes/$class.php";
}
$cat = 0;
if(isset($_POST['category']))
{
    $cat = $_POST['category'];
}




?>


<!doctype html>
<html class="no-js " lang="en">


<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<meta name="description" content="Online Menu Ordering App">

<title>:: Aero Bootstrap4 Admin ::</title>
<link rel="icon" href="favicon.ico" type="image/x-icon">
<!-- Favicon-->
<link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
<!-- Custom Css -->
<link rel="stylesheet" href="assets/css/style.min.css">
</head>

<body class="theme-blush">

<!-- Page Loader -->
<div class="page-loader-wrapper">
    <div class="loader">
        <div class="m-t-30"><img class="zmdi-hc-spin" src="assets/images/loader.svg" width="48" height="48" alt="Aero"></div>
        <p>Please wait...</p>
    </div>
</div>

<!-- Overlay For Sidebars -->
<div class="overlay"></div>

<!-- Main Search -->
<div id="search">
    <button id="close" type="button" class="close btn btn-primary btn-icon btn-icon-mini btn-round">x</button>
    <form>
        <input type="search" value="" placeholder="Search..." />
        <button type="submit" class="btn btn-primary">Search</button>
    </form>
</div>



<?php include_once('navbar.php') ?>

<section class="content">
    <div class="body_scroll">
        <div class="block-header">
            <div class="row">
                <div class="col-lg-7 col-md-6 col-sm-12">
                    <h2>Product</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html"><i class="zmdi zmdi-home"></i> Cena's Food Hub</a></li>
                        <li class="breadcrumb-item">Menu</li>
                        <li class="breadcrumb-item active">Product</li>
                    </ul>
                    <button class="btn btn-primary btn-icon mobile_menu" type="button"><i class="zmdi zmdi-sort-amount-desc"></i></button>
                </div>
                <div class="col-lg-5 col-md-6 col-sm-12">                
                    <button class="btn btn-primary btn-icon float-right right_icon_toggle_btn" type="button"><i class="zmdi zmdi-arrow-right"></i></button>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row clearfix">
            <div class="card">
                        <div class="body">
                        <form class="card auth_form" id="userAction" method="post"> 
                            <ul class="nav nav-tabs">
                            <button class="btn btn-lg btn-outline-info mr-4" style="background-color:#fff !important;color:#888;border-radius:30px;border: 1px solid #888;" name="category" value="0" onclick='gotoAction("category");'>All</button>
                            <button class="btn btn-lg btn-outline-info mr-4" style="background-color:#fff !important;color:#888;border-radius:30px;border: 1px solid #888;" name="category" value="1" onclick='gotoAction("category");'>Burgers</button>
                            <button class="btn btn-lg btn-outline-info mr-4" style="background-color:#fff !important;color:#888;border-radius:30px;border: 1px solid #888;" name="category" value="2" onclick='gotoAction("category");'>Beverages</button>
                            <button class="btn btn-lg btn-outline-info mr-4" style="background-color:#fff !important;color:#888;border-radius:30px;border: 1px solid #888;" name="category" value="3" onclick='gotoAction("category");'>Combo Meal</button>

                            <!-- <li class="nav-item"><a class="nav-link " data-toggle="tab" href="#all">All</a></li> -->
                              
                            </ul>
                        </form>
                        </div>
                    </div>
                  
                <?php
                    $rest = new Restaurant();
                    $rows = $rest->productList($cat);
                    foreach($rows as $row)
                    {
                ?>
                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6">
                    <div class="card">
                        <div class="body product_item">
                            <span class="label onsale">Sale!</span>
                            <img src="<?php echo $row['img_directory'] ?>" 
                            alt="Product" class="img-fluid cp_img" />
                            <div class="product_details">
                                <a href="product-detail.php?read=<?php echo $row['fooditem_ID']; ?>"><?php echo $row['name'] ?></a>
                                <ul class="product_price list-unstyled">
                                    <li class="new_price"> <?php echo $row['unit']. " ".$row['price']; ?></li>
                                 
                                </ul>                                
                            </div>
                            <div class="action">
                                <div class="row">
                                    <div class="col-md-6">
                                        <a href="product-detail.php?read=<?php echo $row['fooditem_ID']; ?>" class="btn btn-info waves-effect"><i class="zmdi zmdi-eye"></i></a>
                                    </div>
                                    <div class="col-md-6">
                                        <select class="form-control show-tick ms select2" data-placeholder="Select">
                                            <?php
                                                for($i=0; $i<=10; $i++)
                                                    {

                                                        echo "<option value=".$i.">".$i."</option>";
                                                    }
                                            ?> 
                                        </select>
                                    </div>
                                    <div class="col-md-12">
                                        <a href="javascript:void(0);" class="btn btn-primary waves-effect">ADD TO CART</a>
                                    </div>
                                </div>
                                <!-- <button class="btn btn-primary waves-effect" id="addToCart" name="addToCart" value="<?php echo $row['fooditem_ID']; ?> onclick="addToCart();">Add To Cart</button> -->
                            </div>
                        </div>
                    </div>                
                </div>
                <?php
                    }
                ?>
               
            </div>
        </div>
    </div>
</section>
<script>
    function gotoAction(action_name) {
    document.getElementById('userAction').action;
   if(action_name == "category"){
       document.getElementById('userAction').action = "index.php";
       document.getElementById('userAction').submit();
   }

   function addToCart(){
    $.ajax({
        type: "POST",
        url: "index.php", 
        data: "values=" + $("#addToCart");        
    });

    }
</script>
<!-- Jquery Core Js --> 
<script src="assets/bundles/libscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js --> 
<script src="assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js --> 

<script src="assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js --> 
</body>


</html>