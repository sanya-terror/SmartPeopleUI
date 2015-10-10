<?php
	require_once($_SERVER['DOCUMENT_ROOT'] . '/backend/library/class.main.php');
	class page_user extends mainprocessing	{
		public function __construct(){
			if (isset($_POST['login'])) {
				$this->login = $this->RegularForLogin($_POST['login']);
			}
			if (isset($_POST['password'])){
				$this->password = $this->RegularForPassword($_POST['password']);
				$this->password = md5($this->password);
			}
		}
		public function CheckLoginAndPassword() {
			if (!isset($_COOKIE['login'])) {
				if (!isset($_POST['login'])) {
					header("refresh:0;url=index.php");
					exit;
				}
				$conn = $this->ConnectDB();
				$result = $conn->query("select * from users where login='$this->login' and password='$this->password'");
				if (!$result) {
					throw new Exception('Не удается выполнить запрос к базе данных.');
					exit;
				}
				$myrow = $result->fetch_array();
				$secret = md5(md5($myrow['id'])).':'.md5($myrow['login']).':'.md5($_SERVER ['HTTP_USER_AGENT']).md5('smartpeople.in.ua');
				if (isset($_POST['remember'])){
					$expire = time()+(31*24*60*60);
				}
				else {
					$expire = time()+(4*60*60);
				}
				setcookie('login', $secret, $expire, '/'); 
				$result2 = $conn->query("UPDATE users SET hash = '$secret' where login='$this->login' and password='$this->password'");
			}
		}
	}
?>