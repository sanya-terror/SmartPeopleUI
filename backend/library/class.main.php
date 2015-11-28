<?php
	session_start();
	class mainprocessing {
		public function ConnectDB(){
			$result = new mysqli("steampay.mysql.ukraine.com.ua", "steampay_smart", "7dt35nbj", "steampay_smart");
			if (!$result){
				throw new Exception('Не удалось подключиться к базе данных.');
			}
			else{
				return $result;
			}
		}
		public function SessionMustDie(){
			unset($_SESSION['login']);
			unset($_SESSION['password']);
			unset($_SESSION['id']);
			$expire = time() - 3600;
			setcookie('login[1]', '', $expire, '/');
			setcookie('login[2]', '', $expire, '/');	
			session_destroy();
		}
		public function RegularForActivate($var){
			$res = "/^[0-9a-z]{20}$/i";
			if (preg_match($res, $var)) {
				return $this->CheckUserData($var);
			}
			else {
				echo "Код подтверждения активации не соответствует регулярному выражению <br />";
				exit();
			}
		}
		
		public function RegularForAgree($var){
			$res = "/^[0-9a-z]{8}$/i";
			if (preg_match($res, $var)) {
				return $this->CheckUserData($var);
			}
			else {
				echo "Код подтверждения не соответствует регулярному выражению <br />";
				exit();
			}
		}

		public function RegularForLogin($var){
			$res = "/^[a-z0-9_-]+(\.[a-z0-9_-]+)*@([0-9a-z][0-9a-z-]*[0-9a-z]\.)+([a-z]{2,4})$/i";
			if (preg_match($res, $var)) {
				return $this->CheckUserData($var);
			}
			else {
				echo "Логин введен не правильно <br />";
				exit();
			}
		}

		public function RegularForPassword($var){
			$res = "/^\w{6,18}$/";
			if (preg_match($res, $var)) {
				return $this->CheckUserData($var);
			}
			else {
				echo "Пароль не соответствует регулярному выражению<br />";
				exit();
			}
		}

		public function RegularForName($var){
			$res = "/^[a-z,A-Z,а-яіїєґ,А-ЯІЇЄҐ]{2,}$/u";
			if (preg_match($res, $var)) {
				return $this->CheckUserData($var);
			}
			else {
				echo "Имя пользователя не соответствует регулярному выражению<br />";
				exit();
			}
		}

		public function RegularForSurname($var){
			$res = "/^[a-z,A-Z,а-яіїєґ,А-ЯІЇЄҐ]{2,}$/u";
			if (preg_match($res, $var)) {
				return $this->CheckUserData($var);
			}
			else {
				echo "Фамилия не соответствует регулярному выражению<br />"; echo $var;
				exit();
			}
		}

		public function CheckUserData($var){
			$res = htmlspecialchars($var, ENT_QUOTES);
			$res = stripslashes($res);
			$res = trim($res);
			return addslashes($res);
		}

		public function CheckUserNumber($number){
		  $patt = '[[:alpha:]]|[[:punct:]]|[[:cntrl:]]|[[:space:]]';
		  $replace = '';
		  return @ ereg_replace($patt, $replace, $number);
		}
	}
?>