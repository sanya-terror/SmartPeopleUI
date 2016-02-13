$(document).on("ready", function () {
	$(".wall input").bind("focus",
		function () {
			$(".blog-nav").css("opacity", 1);
		}
	);

	$("header, .content .left").on("click", function () {
		$(".blog-nav").css("opacity", 0);
	});

	$(".attach-wrapper").each(function () {
		$(this).on("click", function () {
			$(this).toggleClass( "like" );
		});
	});

	var start = function () {
		radialProgress(document.getElementById('circle-rating'))
			.diameter(150)
			.value(105)
			.render();
	};

	start();
});