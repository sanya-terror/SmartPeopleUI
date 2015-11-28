<?php
	require_once($_SERVER['DOCUMENT_ROOT'] . '/backend/library/class.newpassword.php');
	$page = new newpassword;
	if (isset($_POST['login'])){
		$page->CreateAgreeCode();
	}
	else {
		$page->ChangePassword();
	}
?>