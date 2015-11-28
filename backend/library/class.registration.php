<?php
	require_once($_SERVER['DOCUMENT_ROOT'] . '/backend/library/class.main.php');
	class register extends mainprocessing {
		function __construct(){
			@$this->login = $this->RegularForLogin($_POST['login']);
			$this->password1 = $this->RegularForPassword($_POST['password1']);
			$this->password2 = ($this->RegularForPassword($_POST['password2']));
			if ($this->password1 == $this->password2){
				$this->password2 = md5($this->password2);
			}
			else echo "Пароли не идентичны"."<br>";
			$this->name = $this->RegularForName($_POST['name']);
			$this->surname = $this->RegularForSurname($_POST['surname']);
			$this->sex = $this->CheckUserData($_POST['sex']);
			$this->regdate = date('d-m-y h:i:s');
		}
		protected function GenerateActivateCode($length = 20){
			$chars = 'abdefhiknrstyz23456789';
			$numChars = strlen($chars);
			$string = '';
			for ($i = 0; $i < $length; $i++)	{
				$string .= substr($chars, rand(1, $numChars) - 1, 1);
			}
			return $string;
		
		}
		
		public function mail(){
			$connect = $this->ConnectDB();
			$result = $connect->query("select login from users where login = '$this->login'");
			$myrow = $result->fetch_array();
			if (!empty($myrow['login'])) {
				exit(0);
				}
			require_once($_SERVER['DOCUMENT_ROOT'] . '/backend/library/class.sendmail.php');
			$this->activate = $this->GenerateActivateCode(20);
			$mail = new Mail("admin@smartpeople.in.ua");
			$mail->setFromName("admin@smartpeople.in.ua");
			if ($mail->send("$this->login", "Регистрация на сервисе smartpeople.in.ua", "<b>Здравствуйте, $this->surname $this->name </b> <br>Вы удачно заполнили форму регистрации и поэтому получили это письмо<br / >Ваш логин: $this->login<br />Пароль: $this->password1<br />Время регистрации $this->regdate<br />Для активации перейдите по следующей ссылке - http://smartpeople.in.ua/users/backend/login.php?login=$this->login&code=$this->activate")){
				echo "Вам отправлено сообщение на вашу почту $this->login\nАктивируйте ваш профиль";
				$connect->query("INSERT INTO users (login,password,regdate,name,surname,sex,`activate-code`) VALUES('$this->login','$this->password2','$this->regdate','$this->name','$this->surname','$this->sex','$this->activate')");
			}
			else {
				echo "Ошибка! Вы не зарегистрированы.<br />";
			}
		}
	} 
?>