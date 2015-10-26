<div class="wrapped">
	<div class="error-autorization">
		<div class="popup">
			<form name="error-authorization-form" action="./users/index.php" method="post" id="error-authorization-form">
				<input type="hidden" name="user-cache" value="{type}" />
				<div class="error-wrapper">
					<h4>{title-message}</h4>
				</div>
				<div class="error-wrapper">
					<h6 class="help-{ids}">{help-message}</h6>
				</div>
				<div class="error-wrapper">
					<div class="error-input-wrapper">
						<div class="fixed-label">
							<label for="repeat-{ids}">{label}</label>
						</div>
						<input type="{type}" name="rpt_{ids}" id="repeat-{ids}" class="field" placeholder="{placeholder}" />
					</div>
				</div>
				<div class="input-submit-wrapper">
					<div class="button-rpt">
						<input type="submit" value="Повторить" id="repeat"/>
						<div class="gif"><img src="./view/images/ajax-loader.gif"/></div>
					</div>
					<div class="registration">
						<a href="index.php">Регистрация</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>