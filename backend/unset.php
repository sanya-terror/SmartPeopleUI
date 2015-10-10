<?php
	session_start();
	session_unset();
	session_destroy();
	unset($_SESSION['login']);
	unset($_SESSION['password']);
	unset($_SESSION['id']);
	unset($_COOKIE['login']);
	setcookie('login', '', time()-1000);
	header('location: /index.php');
?>
