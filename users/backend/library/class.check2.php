<?php
	require_once($_SERVER['DOCUMENT_ROOT'] . '/backend/library/class.main.php');
	class checkCookie extends mainprocessing{
		public function checkcookies(){	
			if (!isset($_COOKIE['login'])){
				header('location: /backend/unset.php');exit;
			}
			$connect = $this->ConnectDB();
			$hash = ($_COOKIE['login'][1]);
			$id = ($_COOKIE['login'][2]);
			$result = $connect->query("select * from users where `id` = '$id' and `hash` = '$hash'");
			$row = $result->fetch_array();
			if ($row['hash'] == $hash){
				if ((md5(md5($row['id'])).':'.md5($row['login']).':'.md5($_SERVER['HTTP_USER_AGENT']).md5('smartpeople.in.ua')) == $row['hash']){
					$hash2 = md5(md5($_SERVER ['HTTP_USER_AGENT']).md5('smartpeople.in.ua'));
					$checklogin = $row['login'];
					$result2 = $connect->query("UPDATE users SET hash2 = '$hash2' WHERE login = '$checklogin'");
					$_SESSION['login'] = $row['login'];
				}
				else{
					header('location: index.php');
					exit;
				}
			}
			else{

				header('location: ../index.php');
				exit;
			}
			if (!$row['activate'] == "1") {
				exit ('Активируйте профиль');
			}			
		}
	}
	new checkCookie();
?>