$(document).on("ready", function () {
	$(".wall input").bind("focus",
		function () {
			$(".wall .blog").css("height","80px");
			$(".wall .publish-wrapper").append("<button>Опубликовать</button>");
			$(".wall button").addClass("publish").addClass("btn-success");
		}
	);

	$(".wall input").on("blur",
		function () {
			$(".wall .blog").css("height","40px");
			$(".fa-paperclip").detach();
			$(".publish").detach();
		}
	);
});