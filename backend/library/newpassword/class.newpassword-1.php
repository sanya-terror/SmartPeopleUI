<?php
	require_once($_SERVER['DOCUMENT_ROOT'] . '/backend/library/class.main.php');

	class newpassword extends mainprocessing{
		public function __construct()	{
			if (isset($_POST['login'])) $this->login = $this->RegularForLogin($_POST['login']);
			
			$this->connect = $this->ConnectDB();
			$result = $this->connect->query("SELECT * from users where login ='$this->login'");
			$this->dbresult = $result->fetch_array();
			if ($result) {
				if (empty($this->dbresult['id'])){
					exit('0');
				}
			}
			else {
				throw new Exception('Не удается выполнить запрос к базе данных.');
				exit;
			}
			$this->SendAgreeCode();
		}
			
		protected function GenerateCode($length = 8){
			$chars = 'abdefhiknrstyz23456789';
			$numChars = strlen($chars);
			$string = '';
			for ($i = 0; $i < $length; $i++){
				$string .= substr($chars, rand(1, $numChars) - 1, 1);
			}
			return $string;
		
		}
		
		protected function SendAgreeCode() {
			require($_SERVER['DOCUMENT_ROOT'] . '/backend/library/class.sendmail.php');

			$this->login = $this->dbresult['login'];
			$this->name = $this->dbresult['surname'];
			$this->surname = $this->dbresult['name'];
		
			$this->AgreeCode = $this->GenerateCode(8);
			$mail = new Mail("admin@smartpeople.in.ua");
			$mail->setFromName("admin@smartpeople.in.ua");
			$mail->send("$this->login", "Востановление пароля на сервисе smartpeople.in.ua", "<b>Здравствуйте, $this->surname $this->name </b> <br>Вы запросили восстановление пароля на сайте smartpeople.in.ua<br / >Код подтверждения смены пароля : $this->AgreeCode");		
			@$result = $this->connect->query("UPDATE users SET agree = '$this->AgreeCode' WHERE login = '$this->login'");
			echo json_encode(array(
				"form_header" => "На ваш Email был отправлен код подтверждения", 
				"message" => "Пожалуйста, введите код для восстановления доступа",
				"label" => "Ваш код:",
				"button_value" => "Восстановить", 
				"input_name" => "agree",
				"placeholder" => "XXXXXXXX",
				"newClass" => "code",
				"user_hash" => "78f7g8dfg6787gfgdf"
			));
			$_SESSION['TempAgree'] = $this->login;
		}
	
	}
	$firststage = new newpassword();
?>