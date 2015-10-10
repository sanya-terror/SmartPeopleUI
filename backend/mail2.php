<?php
	require_once($_SERVER['DOCUMENT_ROOT'] . '/backend/library/class.newpassword.php');
	$page2 = new newpassword;
	$page2->ChangePassword();
?>