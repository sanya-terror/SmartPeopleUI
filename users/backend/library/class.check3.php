<?php
	require_once($_SERVER['DOCUMENT_ROOT'] . '/backend/library/class.main.php');
	class error_auth extends mainprocessing	{
		public function __construct(){
			if ( @isset($_SESSION['wl']) ) {
				$this->WrongLogin();
			}
			if ( @isset($_SESSION['wp']) ) {
				$this->WrongPassword($_POST['rpt_pswd']);
			}
		}
		public function WrongLogin(){
			$this->password = $_SESSION['wl'];
			@$this->login = $this->RegularForLogin($_POST['rpt_login']);
			$connect = $this->ConnectDB();
			$result = $connect->query("select `login`, `password` from users where login='$this->login'");
			$myrow = $result->fetch_array();
			if (empty($myrow['login'])) {
				exit('Логин');
			}
			else {
				if ($myrow['login'] == $this->login and $myrow['password'] == $this->password){
					$this->CheckLoginAndPassword();
					unset ($_SESSION['wl']);
				}
				else {
					unset ($_SESSION['wl']);
					$_SESSION['wp'] = $this->login;
					exit('to password');
				}
			}
		}

		public function WrongPassword($var){
			$this->login = $this->RegularForLogin($_SESSION['wp']);
			$this->password = $this->RegularForPassword($var);
			$this->password = md5($this->password);
			$connect = $this->ConnectDB();
			$result = $connect->query("select `login`, `password` from users where login='$this->login' and password='$this->password'");
			$myrow = $result->fetch_array();
			if ( $this->password == $myrow['password'] ) {
				$this->CheckLoginAndPassword();
				unset ($_SESSION['wp']);
			}
			else echo "Пароль";
			exit;
		}

		private function CheckLoginAndPassword() {
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
		}
	}
	$index = new error_auth();
?>