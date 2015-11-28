<?php
	require_once($_SERVER['DOCUMENT_ROOT'] . '/backend/library/class.main.php');
	class AgreeNewPswd extends mainprocessing{
		public function __construct(){
			$this->connect = $this->ConnectDB();
			if (@isset($_POST['agree'])) {
				$this->agree = $this->RegularForAgree($_POST['agree']);
				if (isset($_SESSION['TempAgree']))	{
					$this->login = $_SESSION['TempAgree'];
					$this->result = $this->connect->query("SELECT * from users where login ='$this->login' and agree='$this->agree'");
					$this->dbresult = $this->result->fetch_array();
					if (!$this->result)	{
						exit('Не удается выполнить запрос к базе данных.');
					}
				}
				else {
					exit('Вы не выполнили предыдущие действия');
				}	
				if ($this->agree == $this->dbresult['agree']){} 
				else {
					$securityXD = ($this->connect->query("UPDATE users SET agree = '' WHERE login = '$this->login'"));
					exit('0');
				}
				$codeofsuccess = rand(10, 100);
				$codeofsuccess2 = ($this->connect->query("UPDATE users SET `session-forgot` = '$codeofsuccess' WHERE login = '$this->login'"));
				$_SESSION['access2nextpage'] = rand(10,100);
				$_SESSION['agree'] = $codeofsuccess;
				exit('1');
			}

			if (isset($_SESSION['agree'])) {
				if($_SESSION['agree'] > 0) {
					$this->SessionForgot = $_SESSION['agree'];
				}
				else { 
					echo $_SESSION['agree']."<br>";
					exit('В коде проверки не только цифры');
				}
			}
			else {
				exit('Неудачная проверка предыдущих действий');
			}
			$this->login = $this->RegularForLogin($_SESSION['TempAgree']);
			$this->result = $this->connect->query("SELECT * from users where login ='$this->login' and `session-forgot` ='$this->SessionForgot'");
			$this->dbresult = $this->result->fetch_array();
			if ($this->SessionForgot == $this->dbresult['session-forgot']){} 
			else exit('Ошибка');
			if (@isset($_POST['new-pswd'])) $this->password1 = $this->RegularForPassword($_POST['new-pswd']);
			if (@isset($_POST['rpt-pswd'])) $this->password2 = $this->RegularForPassword($_POST['rpt-pswd']);
			if (!$this->password1 == $this->password2) {
				exit('Пароли не совпали');
			}
			$this->password2 = md5($this->password2);
			$this->changePassword();
		}
		protected function ChangePassword(){
			require($_SERVER['DOCUMENT_ROOT'] . '/backend/library/class.sendmail.php');
			$surname = $this->dbresult['surname'];
			$name = $this->dbresult['name'];
			$success = $this->connect->query("UPDATE users SET password = '$this->password2', agree = '' WHERE login = '$this->login'");
			$mail = new Mail("admin@smartpeople.in.ua");
			$mail->setFromName("admin@smartpeople.in.ua");
			$mail->send("$this->login", "Востановление пароля на сервисе smartpeople.in.ua", "<b>Здравствуйте, $surname $name </b> <br>Вы запросили восстановление пароля на сайте smartpeople.in.ua<br / >Ваш новый пароль : $this->password1");
			$result = $this->connect->query("select `id`, `name`, `surname` from users where login='$this->login'");
			$row = $result->fetch_array();
			$secret = md5(md5($row['id'])).':'.md5($this->login).':'.md5($_SERVER ['HTTP_USER_AGENT']).md5('smartpeople.in.ua');
			$expire = time()+(4*60*60);
			setcookie('login[1]', $secret, $expire, '/');
			setcookie('login[2]', $row['id'], $expire, '/');		
			$result = $this->connect->query("UPDATE users SET hash = '$secret' where login='$this->login'");
			exit();
		}
	}
	$newpswd2 = new AgreeNewPswd();
?>