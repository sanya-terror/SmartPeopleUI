$(document).ready(
	function () {
		$("#blog input").bind("focus",
			function () {
				$("#blog div:last-child").css("height","80px");
				$("#blog div:last-child").append("<button>Написать</button>");
				$("#blog button").attr("id","write");
			}
		);
		
		$("#blog input").on("blur",
			function () {
				$("#blog div:last-child").css("height","40px");
				$("#write").detach();
			}
		);
		
		$("#photo_emblem img").on("click",
			function () {
				$("#upload_form").toggle();
			}
		);
		
		var options = { 
			target: '#avatar',   // target element(s) to be updated with server response 
			beforeSubmit: beforeSubmit,  // pre-submit callback 
			success: afterSuccess,  // post-submit callback 
			resetForm: true        // reset the form after successful submit 
		}; 
		
		$('#MyUploadForm').submit(function() { 
			$(this).ajaxSubmit(options);  			
			// always return false to prevent standard browser submit and page navigation 
			return false; 
		}); 
	}
);

function afterSuccess() {
	$('#submit-btn').show(); //hide submit button
	$('#loading-img').hide(); //hide submit button
	$('#photo_emblem').show();
	
}

function beforeSubmit(){
    //check whether browser fully supports all File API
   if (window.File && window.FileReader && window.FileList && window.Blob) {
	
		if( !$('#imageInput').val()) { //check empty input filed
			$("#avatar").html("Вы не заполнили меня");
			$("#avatar").css("height", "200px");
			$("#upload_form").hide();
			return false
		}
		
		var fsize = $('#imageInput')[0].files[0].size; //get file size
		var ftype = $('#imageInput')[0].files[0].type; // get file type
		

		//allow only valid image file types 
		switch(ftype){
            case 'image/png': case 'image/gif': case 'image/jpeg': case 'image/pjpeg':
                break;
            default:
                $("#avatar").html("<b>"+ftype+"</b> Неподдерживаемый тип файлов");
				return false
        }
		
		//Allowed file size is less than 1 MB (1048576)
		if( fsize > 10408576) {
			$("#avatar").html("<b>"+bytesToSize(fsize) +"</b> Too big Image file! <br />Please reduce the size of your photo using an image editor.");
			return false
		}
				
		$('#upload_form').hide(); //hide submit button
		$('#loading-img').show(); //hide submit button
		$('#photo_emblem').hide();
		$("#avatar").html("");  
	}
	else {
		//Output error to older browsers that do not support HTML5 File API
		$("#avatar").html("Please upgrade your browser, because your current browser lacks some new features we need!");
		return false;
	}
}

function bytesToSize(bytes) {
   var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
   if (bytes == 0) return '0 Bytes';
   var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
   return Math.round(bytes / Math.pow(1024, i), 2) + ' ' + sizes[i];
}