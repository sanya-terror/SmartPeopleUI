<?php
	require_once($_SERVER['DOCUMENT_ROOT'] . '/backend/library/class.page.user.php');
	require_once($_SERVER['DOCUMENT_ROOT'] . '/backend/library/class.checkCookie.php');
	$page = new page_user();
	$page = $page->CheckLoginAndPassword();
	header("refresh:0;url=../users/index.php");
?>