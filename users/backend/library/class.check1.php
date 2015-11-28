<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/backend/library/class.main.php');
class login_user extends mainprocessing	{

public function __construct(){

			if (@isset($_GET['code'])) {
			$this->code = $_GET['code'];
			$this->login = $this->RegularForActivate($_GET['code']);
			$this->login = $_GET['login'];
			$this->login = $this->RegularForLogin($_GET['login']);

			$connect = $this->ConnectDB();
			$result = $connect->query("select `activate-code`,`activate` from users where login='$this->login'");
			$myrow = $result->fetch_array();
			if ($this->code == $myrow['activate-code']) {
			$result = $connect->query("UPDATE users SET `activate` = '1',`activate-code` = '' WHERE login = '$this->login'");
			}


			if ($this->code == $myrow['activate-code']) {
				echo 'Вы успешно активировали свой профиль'."<br>";
				$this->connect = $this->ConnectDB();
				$result = $this->connect->query("select `id`, `name`, `surname` from users where login='$this->login'");
				$row = $result->fetch_array();
				$secret = md5(md5($row['id'])).':'.md5($this->login).':'.md5($_SERVER ['HTTP_USER_AGENT']).md5('smartpeople.in.ua');
				$expire = time()+(4*60*60);
				setcookie('login[1]', $secret, $expire, '/');
				setcookie('login[2]', $row['id'], $expire, '/');		
				$result = $this->connect->query("UPDATE users SET hash = '$secret' where login='$this->login'");
				header("refresh:1;url=http://smartpeople.in.ua/users/index.php");
				}
				exit();
				}
				
	$this->SessionMustDie();
	if (isset($_POST['login'])) {$this->login = $this->RegularForLogin($_POST['login']);} else {
	header("refresh:0;url=/index.php");
	exit();
	}
	if (isset($_POST['password']))	{
	$this->password = $this->RegularForPassword($_POST['password']);
	$this->password = md5($this->password);
	$this->LoginOrPassword();
	
									}
									else {exit('нету поста пароль');}
	}

		public function LoginOrPassword(){
			$this->connect = $this->ConnectDB();
			$result = $this->connect->query("select `login`, `password` from users where login='$this->login'");
			$row = $result->fetch_array();
			if (empty($row['login'])) {
			session_start();
			$_SESSION['wl'] = $this->password;
			header("refresh:0;url=http://smartpeople.in.ua/index.php?page=auth_error&error_type=login");
			exit;
				}
			if ($this->password !== $row['password'])
			{
			session_start();
			$_SESSION['wp'] = $this->login;
			header("refresh:0;url=http://smartpeople.in.ua/index.php?page=auth_error&error_type=password");
			exit();
			}
			$this->CheckLoginAndPassword();
		}
	
	
	
		public function CheckLoginAndPassword() {
		$this->connect = $this->ConnectDB();
		$result = $this->connect->query("select * from users where login='$this->login' and password='$this->password'");
		if (!$result) {
		throw new Exception('Не удается выполнить запрос к базе данных.'); exit;
		}
		$row = $result->fetch_array();
		$secret = md5(md5($row['id'])).':'.md5($row['login']).':'.md5($_SERVER ['HTTP_USER_AGENT']).md5('smartpeople.in.ua');
		if (isset($_POST['remember'])){
				$expire = time()+(31*24*60*60);
				}
				else {
					$expire = time()+(4*60*60);
					}
				setcookie('login[1]', $secret, $expire, '/');
				setcookie('login[2]', $row['id'], $expire, '/');
				
		$result = $this->connect->query("UPDATE users SET hash = '$secret' where login='$this->login' and password='$this->password'");	
		header("refresh:0;url=http://smartpeople.in.ua/users/index.php");							
		}
		}										

?>