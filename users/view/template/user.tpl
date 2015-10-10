<html>
	<head>
		<title>{title}</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=0.1">
		<link rel="stylesheet" type="text/css" href="./styles/user.css"/>
		<link rel="shortcut icon" href="../images/logo_m.png">
		<script type="text/javascript" src="./scripts/jquery-1.11.2.min.js"></script>
		<script type="text/javascript" src="./scripts/user_script.js"></script>
		<script type="text/javascript" src="./scripts/jquery.form.min.js"></script>
	</head>
	<body>
		<header>
			<div>
				<ul>
					<li>
						<a href="#">
							<p id="brand">
								<span>S</span>martPeople
							</p>
						</a>
					</li>
					<li>
						<a href="#">
							<p>
								Начать обучение
							</p>
						</a>
					</li>
					<li>
						<a href="#">
							<p>
								На изучении...
							</p>
						</a>
					</li>
					<li>
						<a href="#">
							<p>
								Настройки
							</p>
						</a>
					</li>
					<li>
						<a href="../unset.php">
							<p>
								Выход
							</p>
						</a>
					</li>
				</ul>
			</div>
		</header>
		<article>
			<div id="content">
				<div id="top">
					<div>
						<div>
							<p>
								{name.surname}
							</p>
						</div>
					</div>
					<div>
						<table>
							<tbody>
								<tr>
									<td>
										<p>
											Статус
										</p>
									</td>
									<td>
										<p>
											Smart уровень
										</p>
									</td>
									<td rowspan="2">
										<p>
											Online
										</p>
									</td>
								</tr>
								<tr>
									<td>
										<p>
											Новичок
										</p>
									</td>
									<td>
										<p>
											<span>0</span>
											<progress value="50" max="1000"></progress>
											<span>1</span>
										</p>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div id="left_top">
					<div id="frame">
						<img src="../images/ajax-loader.gif" id="loading-img" style="display:none;" alt="Please Wait"/>
						<div id="upload_form">
							<form class="upload" action="../library/class.upload.php" method="post" enctype="multipart/form-data"  id="MyUploadForm">
								<input name="image_file" id="imageInput" type="file" />
								<input type="submit"  id="submit-btn" value="Upload" />
							</form>
						</div>
						<div id="avatar">
							<img src="../avatars/thumb_{avatar}" alt="Avatar" id="ava"/>
						</div>
						<div id="photo_emblem">
							<img src="../images/photo_emblem.png" alt="upload_photo"/>
						</div>
					</div>
					<div id="button">
						<button id="teach">Научить</button>
					</div>
					<div id="honors">
						<table>
							<thead>
								<tr>
									<td colspan="3">Награды</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<img src="../images/honors/medal.png" alt="medal"/>
									</td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div id="right_top">
					<div id="friends">
						<table>
							<thead>
								<tr>
									<td><p>Друзья <span>0</span></p></td>
									<td><p>Учителя <span>0</span></p></td>
									<td><p>Ученики <span>0</span></p></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<table>
											<tbody>
												<tr>
													<td><img src="../images/ava.jpg" alt="Avatar"/></td>
													<td><img src="../images/ava.jpg" alt="Avatar"/></td>
													<td><img src="../images/ava.jpg" alt="Avatar"/></td>
												</tr>
												<tr>
													<td><p>Александр Кабанов</p></td>
													<td><p>Александр Кабанов</p></td>
													<td><p>Александр Кабанов</p></td>
												</tr>
												<tr>
													<td><img src="../images/ava.jpg" alt="Avatar"/></td>
													<td><img src="../images/ava.jpg" alt="Avatar"/></td>
													<td><img src="../images/ava.jpg" alt="Avatar"/></td>
												</tr>
												<tr>
													<td><p>Александр Кабанов</p></td>
													<td><p>Александр Кабанов</p></td>
													<td><p>Александр Кабанов</p></td>
												</tr>
											</tbody>
										</table>
									</td>
									<td>
										<table>
											<tbody>
												<tr>
													<td><img src="../images/ava.jpg" alt="Avatar"/></td>
													<td><img src="../images/ava.jpg" alt="Avatar"/></td>
													<td><img src="../images/ava.jpg" alt="Avatar"/></td>
												</tr>
												<tr>
													<td><p>Александр Кабанов</p></td>
													<td><p>Александр Кабанов</p></td>
													<td><p>Александр Кабанов</p></td>
												</tr>
												<tr>
													<td><img src="../images/ava.jpg" alt="Avatar"/></td>
													<td><img src="../images/ava.jpg" alt="Avatar"/></td>
													<td><img src="../images/ava.jpg" alt="Avatar"/></td>
												</tr>
												<tr>
													<td><p>Александр Кабанов</p></td>
													<td><p>Александр Кабанов</p></td>
													<td><p>Александр Кабанов</p></td>
												</tr>
											</tbody>
										</table>
									</td>
									<td>
										<table>
											<tbody>
												<tr>
													<td><img src="../images/ava.jpg" alt="Avatar"/></td>
													<td><img src="../images/ava.jpg" alt="Avatar"/></td>
													<td><img src="../images/ava.jpg" alt="Avatar"/></td>
												</tr>
												<tr>
													<td><p>Александр Кабанов</p></td>
													<td><p>Александр Кабанов</p></td>
													<td><p>Александр Кабанов</p></td>
												</tr>
												<tr>
													<td><img src="../images/ava.jpg" alt="Avatar"/></td>
													<td><img src="../images/ava.jpg" alt="Avatar"/></td>
													<td><img src="../images/ava.jpg" alt="Avatar"/></td>
												</tr>
												<tr>
													<td><p>Александр Кабанов</p></td>
													<td><p>Александр Кабанов</p></td>
													<td><p>Александр Кабанов</p></td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="blog">
						<div>
							<p>
								Ваши идеи
							</p>
						</div>
						<div>
							<input type="text" placeholder="Какие у вас мысли? Напишите об этом..."/>
						</div>
					</div>
				</div>
			</div>
		</article>
		<footer>
		
		</footer>
	</body>
</html>