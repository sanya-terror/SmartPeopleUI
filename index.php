<?php
	require_once($_SERVER['DOCUMENT_ROOT'] . '/backend/library/class.template.php');
	if (isset($_SESSION['login'])) {
		header("Location: users/index.php");
	}
	if (isset($_GET['page'])){
		$index = new template();
		switch ($_GET['page']) {
			case 'about':
				$index->SetPageConfig(array("title"=>"О сайте", "header"=>"header", "content"=>"links", "footer"=>"footer"));
				break;
			case 'learning':
				$index->SetPageConfig(array("title"=>"Как заставить себя учиться", "header"=>"header", 
											"content"=>"links", "footer"=>"footer"));
				break;
			case 'forgot':
				$index->SetPageConfig(array("title"=>"Восстановление доступа", "header"=>"header", "content"=>"forgot", 
											"footer"=>"footer", "form"=>'restore_form'));
				break;
				case 'change':
				session_start();
				$index->SetPageConfig(array("title"=>"Изменение пароля", "header"=>"header", "content"=>"change_pswd", 
											"footer"=>"footer"));
				if (@!isset($_SESSION['access2nextpage'])) {
					header("refresh:0;url=/index.php");
					exit;
				}
				unset($_SESSION['access2nextpage']);
				break;
			case 'auth_error':{
				$title = "Ошибка авторизации";					
				switch (@$_GET['error_type']){
					case 'login':
						session_start();
						if (!isset($_SESSION['wl'])) {
						header('location: /index.php');
						}
						$index->SetPageConfig(array("title"=>"$title", "header"=>"header", "content"=>"error_auth", "footer"=>"footer",
						"conf" => array("1" =>"Такой учетной записи нет в базе данных ", 
										"2" =>"Проверте правильность ввода",
										"3" =>"Электронная почта:",
										"4" =>"Введите Email",
										"5" =>"login",
										"6" =>"text")));
						break;
					case 'password': 
					session_start();
					if (!isset($_SESSION['wp'])) {
						header('location: /index.php');
						}
						$index->SetPageConfig(array("title"=>"$title", "header"=>"header", "content"=>"error_auth", "footer"=>"footer",
						"conf" => array("1" =>"Неверный пароль", 
										"2" =>"Убедитесь, что у вас раскладка клавиатуры \"eng\" и не включен Caps Lock",
										"3" =>"Пароль:",
										"4" =>"Введите пароль",
										"5" =>"pswd",
										"6" =>"password")));
						break;
					default: 
						header('location: /index.php');
						break;	
				}
			}
		}
		$index->page();
	}
	else{
		$index = new template();
		$index->SetPageConfig(array("title"=>"Добро пожаловать", "header"=>"header", "content"=>"main_content", "footer"=>"footer"));
		$index->page();
	}
?>
