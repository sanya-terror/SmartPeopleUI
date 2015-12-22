$(document).on("ready", function () {
	
// Объект регулярных выражений
	var regExp = {
		"mail": /^[a-z0-9_-]+(\.[a-z0-9_-]+)*@([0-9a-z][0-9a-z-]*[0-9a-z]\.)+([a-z]{2,4})$/i,
		"passw": /^\w{6,18}$/,
		"name": /^[a-z,A-Z,а-яіїєґ,А-ЯІЇЄҐ]{2,20}$/,
		"code": /^[0-9a-z]{8}$/i
	};
	
// Массив сообщений об ошибке
	var messageArray = [
		"Неверно указано имя",
		"Неверно указана фамилия",
		"Неверный формат Email",
		"Неверный формат пароля",
		"Пароли не совпадают",
		"Пол не указан",
		"Неверный формат кода"
	];
	
// Объявляем выборку элементов
	var loginForm = $("#loginForm"),
		current_email = loginForm.find("#current_email"),
		current_password = loginForm.find("#current_password"),
		warning_email = loginForm.find("#warning_email"),
		warning_password = loginForm.find("#warning_password"),
		entry = loginForm.find(".input-wrapper input[type='submit']"),
		key_1, key_2; // Логин и Пароль
		
// Функция валидации полей формы
	var validate = function(value, validator, toDefault, success, error) {
		if (value === "") {
			return toDefault();
		}
		else if (regExp[validator].test(value)) {
			return success();
		} 
		else {
			return error();
		}
	}
	
// Функция вывода подсказки ввода пароля
	var pswdMessage = function (value) {		
		if (value < 6) {
			return "Слишком короткий пароль";
		}
		else if (value > 18) {
			return "Слишком длинный пароль";
		}
		else {
			return messageArray[3];
		}
	};
/*---------------------------------------------------Код отвечающий за проверку формы входа--------------------------------------------*/

// Функция проверки формы
	var checkFormEntry = function (element, validator, msg1, msg2, help) {
		return validate(element.val(), validator, function(){
			help.html(msg2).removeClass("red");
			return false;
		}, function() {
			help.html(msg2).removeClass("red");
			return true;
		}, function() {
			help.html(msg1).addClass("red");
			return false;
		});
	};
	
// Проверка логина
	current_email.change( function () {
			key_1 = checkFormEntry($(this), "mail", messageArray[2], "Электронная почта", warning_email);
		});
// Проверка пароля
	current_password.change( function () {
			key_2 = checkFormEntry($(this), "passw", pswdMessage($(this).val().length), "Пароль", warning_password);
		});
// Функция отправки формы
	entry.on("click", function () {
		current_email.trigger('change');
		current_password.trigger('change');
		if (!key_1 || !key_2){
			alert("Пожалуйста, заполните форму входа");
			return false;
		}
		else {
			loginForm.submit();
		} 
	});
	
/*--------------------------------------------Код отвечающий за проверку формы регистрации---------------------------------------------*/

// Объявляем выборку элементов
	var registration = $("#registration"),
		name = registration.find(".name"),
		surname = registration.find(".surname"),
		email = $(".email"),
		password1 = $(".password1"),
		password2 = $(".password2"),
		reg_button = registration.find("#reg_button"),
		target = $(".target"),
		sex = registration.find(".sex input[type='radio']"),
		$loaderGif = $('.gif'),
		$errorSign = $('.error_sign'),
		rKey_1 = rKey_2 = rKey_3 = rKey_4 = rKey_5 = rKey_6 = false;
	
//Код отвечающий за проверку форм имени и фамилии и email
	function dataValidator (element, validator, field) {	
		if (validator == "passw"){
			$("input", password2).trigger("blur");
		}
		return validate(element.val(), validator, function(){
			element.addClass("new_width");
			field.addClass("warrning");
			$('.error_sign', field).show();
			return false;
		}, function() {
			element.removeClass("new_width");
			field.removeClass("warrning");
			$('.error_sign', field).hide();
			return true;
		}, function() {
			element.addClass("new_width");
			field.addClass("warrning");
			$('.error_sign', field).show();
			return false;
		});
	}
	
//Код отвечающий за проверку паролей на совпадение
	function comparePassword (element, field) {
		var value_1 = $("input", password1).val(),
			value_2 = $("input", password2).val();

		if (value_1 === value_2 && value_1 === "") {
			element.removeClass("new_width");
			field.removeClass("warrning");
			$('.error_sign', password2).hide();
			return false;
		}
		else if (value_1 != value_2) {
			element.addClass("new_width");
			field.addClass("warrning");
			$('.error_sign', password2).show();
			return false;
		}
		else {
			element.removeClass("new_width");
			field.removeClass("warrning");
			$('.error_sign', password2).hide();
			return true;
		}
	}
	
	$("input", name).blur(function () {rKey_1 = dataValidator($(this), "name", name);}); // Проверка имени
	
	$("input", surname).blur(function () {rKey_2 = dataValidator($(this), "name", surname);}); // Проверка фамилии

	$("input", email).blur(function () {rKey_3 = dataValidator($(this), "mail", email); }); // Проверка электронной почты
	
	$("input", password1).blur( function () {rKey_4 =  dataValidator($(this), "passw", password1);}); // Проверка пароля 1
	
	$("input", password2).blur( function () {rKey_5 = comparePassword($(this), password2);}); // Проверка пароля 2
	
	sex.change( function () {rKey_6 = sex.is(':checked');}); // Проверка пароля 2
	
// Функция вывода сообщения об ошибке при клике на иконку
	$errorSign.each(function(i, array){
		if (i == 3) {			
			$(this).mouseover(function(){
				$(this).attr("title", pswdMessage($("input", password1).val().length)).
					tooltip({
						position: { my: "right+30 bottom-25", at: "center top",
							using: function( position, feedback ) {
							  $( this ).css( position );
							  $( "<div>" )
								.addClass( "arrow" )
								.addClass( feedback.vertical )
								.addClass( feedback.horizontal )
								.appendTo( this );
							}
						},
						hide: { effect: "fade", duration: 500, delay: 400 }
					});
			return true;
			});
		}
		$(this).attr("title", messageArray[i]).
				tooltip({
					position: { my: "right+30 bottom-25", at: "center top",
						using: function( position, feedback ) {
						  $( this ).css( position );
						  $( "<div>" )
							.addClass( "arrow" )
							.addClass( feedback.vertical )
							.addClass( feedback.horizontal )
							.appendTo( this );
						}
					},
					hide: { effect: "fade", duration: 500, delay: 400 }
				});
	});
	
// Функция отправки формы
	reg_button.click( function () {
debugger;		
		target.trigger("blur");
		if(!rKey_6){
			$('.error_sign', ".sex_border").show();
		}
		else{
			$('.error_sign', ".sex_border").hide();
		}
		if (!rKey_1 || !rKey_2 || !rKey_3 || !rKey_4 || !rKey_5 || !rKey_6){
			alert("Заполните форму регистрации");
			return false;
		}
		else {
			registration.one('submit', function (e) {
				e.preventDefault();
				send_Reg_Form();
			});
		}
	});
	
//Фоновое получение ответа сервера
	function send_Reg_Form() {
		var form_data = registration.serialize();
		$.ajax({
			url: "./backend/reg.php",
			type: "POST",
			data: form_data,
			dataType: "html",
			beforeSend: function() {		
				$loaderGif.show();
			},
			success: function (data) {				
				$loaderGif.hide();
				if (!data) {
					alert ("Извините, но данный логин уже зарегистрирован");
					rKey_6 = false;
					registration.trigger('reset');
					return false;
				}
				else {
					alert("Поздравляем с успешной регистрацией. Вам на почту было отправлено письмо для активации профиля.");
					rKey_6 = false;
					registration.trigger('reset');
					return true;
				}
			},
			error: function(){
				alert("Превышено время ожидания запроса");
			}
		});
	}
	
/*-----------------------------------------------Код формы восстановления------------------------------------------------------------*/ 
	
// Объявляем выборку объектов
	var rEmail = $(".rEmail"),
		code = $(".code"),
		restore_form = $("#restore_form"),
		hide_form = $("#hide_form"),
		next = $("#next"),
		restore_button = $("#restore_button"),
		restore_message_field = $(".restore-wripper h6"),
		restore_message = [
							"Пожалуйста, укажите свой Email для восстановления доступа.", 
							"Пожалуйста, введите код для восстановления доступа"
		],
		loginForm = $("#loginForm"),
		loginFormNew = $("#loginFormNew"),
		restore = $(".popup"),
		rKey_7 = rKey_8 = false,
		$email = $("#restore"),
		$hash = $("#restore_form [name='user-cache']");
	
	
// Отравка поля Email для восстановления пароля
	
//Код отвечающий за проверку форм email и code
	next.click( function () {
		var hashValue = $hash.val(),
			isMail = ("" === hashValue),
			key = (isMail ? rKey_7 : rKey_8),
			message = (isMail ? "Укажите Email для воcстановления доступа к странице" : "Введите код подтверждения");
		
		if ( !key ){
			alert(message);
			return false;
		}
		else {
			restore_form.one("submit", function(e) {					
				e.preventDefault();
				sendMailCode();
			});
		}
		
	});

	function sendMailCode() {	
		var hashValue = $hash.val(),
			isMail = ("" === hashValue),
			url = (isMail ? './backend/library/newpassword/class.newpassword-1.php' : "./backend/library/newpassword/class.newpassword-2.php"),
			formData = (isMail ? {login: $email.val()} : {agree: $email.val()});
		$.ajax({
			url: url,
			type: "POST",
			data: formData,
			dataType: "html",
			beforeSend: function() {		
				$loaderGif.show();
			},
			success: function (data) {	
				//data = JSON.stringify(data);
				//data = JSON.parse(data);
				$loaderGif.hide();
				if (isMail) {
					if (!data) {
						alert("Такой email не зарегистрирован, проверте правильность ввода данных");
						return false;
					}
					else {
						data = JSON.parse(data);
						restore_form.trigger('reset');
						$("h4", restore_form).html(data.form_header);
						$("h6", restore_form).html(data.message);
						$("label", restore_form).html(data.label);
						$("input[type='text']", restore_form).
							attr("name", data.input_name).
							attr("placeholder", data.placeholder).
							removeClass("email").
							addClass(data.newClass);
						$hash.val(data.user_hash);
						$(".input-submit-wrapper input[type='submit']").
							attr("value",data.button_value);
					}
				}
				else {
					if (data === "0") {
						alert('Код подтверждения неверный, отправьте повторно Email');
						location.reload();
						return false;
					}
					else {
						restore_form.submit();
					}
				}
			},
			error: function(){
				alert("Превышено время ожидания запроса");
			}
		});
	}
	
	rEmail.bind("change", function () { rKey_7 = checkFormEntry($(this), "mail", messageArray[2], restore_message[0], restore_message_field); }); // Проверка электронной почты
	restore.on("change", ".code", function () { rKey_8 = checkFormEntry($(this), "code", messageArray[6], restore_message[1], restore_message_field);}); // Проверка поля код
	
/*-----------------------------------------------Код изменения пароля----------------------------------------------------------------*/
	var changeButton = $('#change-password-form input[type="submit"]'),
		change_form = $("#change-password-form"),
		new_pswd = $('.new-Password'),
		rpt_pswd = $('.rpt-Password'),
		passKey_1 = passKey_2 = false;
	
	var changePassword = function (element, validator, msg1, msg2, help) {
		rpt_pswd.trigger("blur");
		return validate(element.val(), validator, function(){
			help.html(msg2).removeClass("red");
			return false;
		}, function() {
			help.html(msg2).removeClass("red");
			return true;
		}, function() {
			help.html(msg1).addClass("red");
			return false;
		});
	};
	
	function comparePswd (element, validator, msg1, msg2, help) {		
		var value_1 = new_pswd.val(),
			value_2 = rpt_pswd.val();

		if (value_1 === value_2 && value_1 === "") {
			help.html(msg2).removeClass("red");
			return false;
		}
		else if (value_1 != value_2) {
			help.html(msg1).addClass("red");
			return false;
		}
		else {
			help.html(msg2).removeClass("red");
			return true;
		}
	}
	
	new_pswd.bind("blur", function () { passKey_1 = changePassword($(this), "passw", pswdMessage($(this).val().length), "", $(".help-new-pswd")); }); // Проверка электронной почты
	rpt_pswd.bind("blur", function () { passKey_2 = comparePswd($(this), "passw", messageArray[4], "", $(".help-rpt-pswd")); }); // Проверка электронной почты
	
// Функция отправки формы изменения пароля
	changeButton.click( function () {	
		new_pswd.trigger("blur");
		rpt_pswd.trigger("blur");
		if ( !passKey_1 || !passKey_2){
			alert("Заполните форму изменения пароля");
			return false;
		}
		else {		
			change_form.one('submit', function (e) {
				e.preventDefault();
				sendChangeForm();
			});
		}
	});
	
	function sendChangeForm () {
		var form_data = change_form.serialize();
		$.ajax({
			url: "./backend/library/newpassword/class.newpassword-2.php",
			type: "POST",
			data: form_data,
			dataType: "html",
			beforeSend: function() {		
				$loaderGif.show();
			},
			success: function (data) {
				$loaderGif.hide();
				if (!data) {
					alert("Пароль был успешно изменен");
					change_form.submit();
				}
				else {
					alert ("Ошибка изменения пароля. Попробуйте еще раз.");
					change_form.trigger('reset');
					return false;
				}
			},
			error: function(){
				alert("Превышено время ожидания запроса");
			}
		});
	}
	
/*----------------------------------------------Error Authorization-------------------------------------------------------------------*/
	var login = $('#repeat-login'),
		pswd = $('#repeat-pswd'),
		hash = $("#error-authorization-form [name='user-cache']"),
		error_auth_form = $('#error-authorization-form'),
		repeat = $('#repeat'),
		help_login = $('.help-login'),
		help_pswd = $('.help-pswd'),
		$field = $('.field'),
		alert_message = [
			"Введите Email",
			"Введите пароль"
		],
		isLogin = false,
		index = false;
		
	login.change( function () {
		isLogin = checkFormEntry($(this), "mail", messageArray[2], "Проверте правильность входа", help_login);
		index = 0;
	});
	
	pswd.change( function () {
		isLogin = checkFormEntry($(this), "passw", pswdMessage($(this).val().length), "Убедитесь, что у вас раскладка клавиатуры \"eng\" и не включен Caps Lock", help_pswd);
		index = 1;
	});
	
	repeat.bind("click", function(){		
		$('.error-wripper input[type="text"]').trigger("change");
		if(!isLogin){
			alert(alert_message[index]);
			return false;
		}
		else{
			error_auth_form.one('submit', function (e) {
				e.preventDefault();
				sendErrorForm();
			});
		}
	});
		
	function sendErrorForm () {	
debugger;	
		var hashValue = hash.val(),
			isLogin = ("text" === hashValue),
			formData = (isLogin ? {rpt_login: $field.val()} : {rpt_pswd: $field.val()});
		$.ajax({
			url: "./users/backend/library/class.check3.php",
			type: "POST",
			data: formData,
			dataType: "html",
			beforeSend: function() {		
				$loaderGif.show();
			},
			success: function (data) {			
debugger;
				$loaderGif.hide();
				if (!data) {
					error_auth_form.submit();
				}
				else if (data === "to password"){
					error_auth_form.attr("action", "./index.php?page=auth_error&error_type=password");
					error_auth_form.submit();
				}
				else {
					alert(data + " не правильный, проверьте правильность ввода!");
					error_auth_form.trigger('reset');
					return false;
				}
			},
			error: function(){
				alert("Превышено время ожидания запроса");
			}
		});
	}
});