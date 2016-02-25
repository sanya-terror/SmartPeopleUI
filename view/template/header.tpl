<div class="wrapped">
	<div class="logo">
		<a href="./index.php"><h1>Smart People</h1></a>
	</div>
	<div class="login-form">
		<form name="login" action="./users/backend/login.php" method="post" id="loginForm">
			<div class="input-wrapper">
				<table>
					<tbody>
						<tr>
							<td>
								<label for="current_email" class="warning_email">Электронная почта</label>
							</td>
							<td>
								<label for="current_password" class="warning_password">Пароль</label>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" name="login" id="current_email"/>
							</td>
							<td>
								<input type="password" name="password" id="current_password"/>
							</td>
							<td rowspan="3" valign="top">
								<input type="submit" value="Вход"/>
							</td>
						</tr>
						<tr>
							<td>
								<input type="checkbox" name="remember" id="remember_me"/>
								<label for="remember_me">Запомнить меня</label>
							</td>
							<td>
								<a href="?page=forgot">Забыли пароль?</a>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
	</div>
</div>