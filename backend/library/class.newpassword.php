<?php
	require_once($_SERVER['DOCUMENT_ROOT'] . '/backend/library/class.main.php');
	$connect = $this->ConnectDB();
	$result = $connect->query("SELECT * from users");
	$myrow = $result->fetch_array();
	print_r($myrow);
	exit();
	class newpassword extends mainprocessing{
		public function __construct()	{
			if (isset($_POST['login'])) $this->login = $this->RegularForLogin($_POST['login']);
			if (isset($_POST['agree'])) $this->agree = $this->RegularForAgree($_POST['agree']);
		}
		public function CreateAgreeCode(){
			$connect = $this->ConnectDB();
			@$result = $connect->query("SELECT * from users where login ='$this->login'");
			if (!$result) {
				throw new Exception('Не удается выполнить запрос к базе данных.');
				exit;
			}
			$myrow = $result->fetch_array();
			if (empty($myrow['id']))	{
			echo 'vasya';
			exit();
			}
			
			
			ob_start();                                                                 //Всё классно, и понеслась моча по трубам
			require_once($_SERVER['DOCUMENT_ROOT'] . '/view/template/hide_form.tpl');   //подключаем тплку
			$html = ob_get_contents();													//записываем содержимое в БУФЕ(Р)Т 
			ob_end_clean();																//тут мы разочаровываемся в жизни и перестаём записывать всякую хуйню в буфер
			echo $html;																	//выводим это говно на экран
		
			$this->agree = rand(100,999);
			$_SESSION['agree'] = $this->agree;
			$result2 = $connect->query("UPDATE users SET agree = '$this->agree' WHERE login = '$this->login'");
			$surname = $myrow['surname'];
			$name = $myrow['name'];
			$message = "<b>Здравствуйте, $surname $name </b> <br>Вы запросили восстановление пароля на сайте smartpeople.in.ua<br / >Код подтверждения смены пароля : $this->agree<br />";
			$from = "admin@smartpeople.in.ua";
			$subject = "Востановление пароля на сервисе smartpeople.in.ua";
			$subject = "=?utf-8?B?".base64_encode($subject)."?=";
			$headers = "From : $from\r\nReply-to: $from\r\nContent-type: text/html";
			if (isset($this->login, $this->agree))	{
				mail($this->login, $subject, $message, $headers);
				$_SESSION['tempagree'] = $myrow['login'];
			}
		}
		public function GenerateNewPassword($length = 8){
			$chars = 'abdefhiknrstyz23456789';
			$numChars = strlen($chars);
			$string = '';
			for ($i = 0; $i < $length; $i++)	{
				$string .= substr($chars, rand(1, $numChars) - 1, 1);
			}
			return $string;
		}
		public function ChangePassword(){
			$connect = $this->ConnectDB();
			if (isset($_SESSION['tempagree']))	{
				$this->login = $_SESSION['tempagree'];
				@$result = $connect->query("SELECT * from users where login ='$this->login' and agree='$this->agree'");
				if (!$result)	{
					throw new Exception('Не удается выполнить запрос к базе данных.');
					exit;
				}
			}
			else {
				header("refresh:0;url=unset.php");
				exit('Вы не выполнили предыдущие действия');
			}					
			$myrow = $result->fetch_array();
			if (@$this->agree == $myrow['agree']){} else {
				$answer = 0;
				echo $answer;
				exit();
			}
			
			ob_start();                                                            			
			require_once($_SERVER['DOCUMENT_ROOT'] . '/view/template/error_auth_form.tpl'); 
			$html = ob_get_contents(); 
			ob_end_clean();										
			echo $html;																	
			
			$this->password = $this->GenerateNewPassword(8);
			$this->password2 = md5($this->password);
			$connect = $this->ConnectDB();
			$result2 = $connect->query("UPDATE users SET password = '$this->password2', agree = '' WHERE login = '$this->login'");
			$surname = $myrow['surname'];
			$name = $myrow['name'];
			$message = "<b>Здравствуйте, $surname $name </b> <br>Вы запросили восстановление пароля на сайте smartpeople.in.ua<br / >Ваш логин : $this->login<br />Ваш пароль: $this->password<br>";
			$from = "admin@smartpeople.in.ua";
			$subject = "Востановление пароля на сервисе smartpeople.in.ua";
			$subject = "=?utf-8?B?".base64_encode($subject)."?=";
			$headers = "From : $from\r\nReply-to: $from\r\nContent-type: text/html";
			if (isset($this->login, $this->agree))	{
				mail($this->login, $subject, $message, $headers);
				$_SESSION['re_auth'] = "2";
				$_SESSION['re_auth_time'] = time();
				header('location: /auth.php');
				exit();
			}	
		}
	}
?>