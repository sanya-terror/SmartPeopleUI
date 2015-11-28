<?php
	require($_SERVER['DOCUMENT_ROOT'] . '/users/backend/library/class.check2.php');
	require($_SERVER['DOCUMENT_ROOT'] . '/backend/library/class.template.php');
	class userpage extends checkCookie{
		public function __construct(){
			if (isset($_COOKIE['login'])) {$this->checkcookies($_COOKIE['login']);} else {
			header("refresh:0;url=http://smartpeople.in.ua/index.php");exit;
			}
				if (isset($_SESSION['login'])) {
					$this->login = $this->RegularForLogin($_SESSION['login']);
					$this->connect = $this->ConnectDB();
					@$result = $this->connect->query("select `name`, `surname` from users where login='$this->login'");
					$row = $result->fetch_array();
					echo 'Добро пожаловать'.' '.$row['surname'].' '.$row['name']."<br>Вроде бы всё работает <br>";
				}
			else {
				$this->SessionMustDie();
				header("refresh:0;url=http://smartpeople.in.ua/index.php");
			}
			if (isset($_GET['logout'])) {
				$this->SessionMustDie();
				header("refresh:0;url=http://smartpeople.in.ua/index.php");	
			}
			echo "<a href='index.php?logout'>Выйти</a>";
		}
	}
	new userpage();
?>