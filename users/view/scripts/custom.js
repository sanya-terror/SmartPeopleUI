$(document).on("ready", function () {
	$(".wall input").bind("focus",
		function () {
			$(".wall .blog").css("height", "80px");
			$(".blog-nav").css("opacity", 1);
		}
	);

	$("header, .content .left").on("click", function () {
		$(".wall .blog").css("height", "40px");
		$(".blog-nav").css("opacity", 0);
	});
});