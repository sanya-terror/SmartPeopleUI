<?php
	header("Content-Type: text/html; charset=utf-8");
	require_once($_SERVER['DOCUMENT_ROOT'] . '/backend/library/class.registration.php');
	require_once($_SERVER['DOCUMENT_ROOT'] . '/backend/library/class.main.php');
	$res = new register();
	$res->mail();
?>