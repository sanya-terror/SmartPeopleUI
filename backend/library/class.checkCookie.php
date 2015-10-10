<?php
	require_once($_SERVER['DOCUMENT_ROOT'] . '/backend/library/class.main.php');
	class checkCookie extends mainprocessing{
		public function CheckCookie(){
			if (isset($_COOKIE['login'])){
				$check = $_COOKIE['login'];
			}
			else{
				header('location: /unset.php');
				exit();
			}
			$connect = $this->ConnectDB();
			$result = $connect->query("select * from users where hash = '$check'");
			$myrow = $result->fetch_array();
			if ($myrow['hash'] == $check){
				if ((md5(md5($myrow['id'])).':'.md5($myrow['login']).':'.md5($_SERVER['HTTP_USER_AGENT']).md5('smartpeople.in.ua')) == $myrow['hash']){
					$hash2 = md5(md5($_SERVER ['HTTP_USER_AGENT']).md5('smartpeople.in.ua'));
					$checklogin = $myrow['login'];
					$result2 = $connect->query("UPDATE users SET hash2 = '$hash2' WHERE login = '$checklogin'");
					$_SESSION['checksession'] = 'Hi, my dear friend';
					$this->checksession();
					$_SESSION['login'] = $myrow['login'];
					$_SESSION['password'] = $myrow['password'];
					$_SESSION['id'] = $myrow['id'];
					$_SESSION['name'] = $myrow['name'];
					$_SESSION['surname'] = $myrow['surname'];
					$_SESSION['avatar'] = $myrow['avatar'];
				}
				else{
					session_start();
					$_SESSION['re_auth'] = "1";
					$_SESSION['re_auth_time'] = time();
					header('location: /backend/auth.php');
					exit();
				}
			}
			else {
				session_start();
				$_SESSION['re_auth'] = "1";
				$_SESSION['re_auth_time'] = time();
				header('location: /auth.php');
				exit();
			}
			if (!$myrow['activate'] == "1") {
				header("refresh:3;url=/auth.php"); $_SESSION['re_auth'] = "1";
				$_SESSION['re_auth_time'] = time();
				exit ('Активируйте профиль');
			}
		}
	}
?>