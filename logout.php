<?php
session_start();


if(isset($_SESSION['customer_id'])) {
session_destroy();
unset($_SESSION['customer_id']);
unset($_SESSION['f_name']); 
unset($_SESSION['l_name']); 
unset($_SESSION['username']);
unset($_SESSION['logged_in_time']);


header("Location: sign-in.php");
exit;
} else {
header("Location: sign-in.php");
exit;
}



?>