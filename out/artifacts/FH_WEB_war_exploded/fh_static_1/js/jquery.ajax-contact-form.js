$(document).ready(function() {
	//Auto complete off
	$("input.autocomplete-off").attr("autocomplete", "off");
	
	//Refresh captcha image
	$("img.change-captcha").click(function(){
		var rnd = new Date().getTime();
		var src = $("img.captcha-img").attr("src");
		if (src.indexOf("?")!=-1) {
			var ind = src.indexOf("?");
			src = src.substr(0, ind);	
		}	
		src += "?"+rnd;
		$("img.captcha-img").attr("src", src);
		$("#verify").val("");
	});	
	
	//Closing divs - used on Notification boxes
	notificationReady = function(cls) {
		//Hide button event
		if (!$(".canhide").find("close-notification").length) {
			$(".canhide").append("<div class='close-notification'></div>").css("position", "relative");
			$(".close-notification").click(function() {
				$(this).hide();
				$(this).parent().fadeOut(700);
			});
		}
		//Notification icon
		if (!$(".notification").find(".icon").length) {
			$(".notification").append("<div class='icon'></div>").css("position", "relative");
		}
		//Notification type
		$(".notification").addClass(cls);
	}
	
	//Submit form
	$("#frm_contact").submit(function(){
		var action = $(this).attr("action");
		$("#submit").attr("disabled", "disabled");
		if (!$(".form-submit").find("img.preloader").length) {
			$("#submit").after('<img src="images/preloader.gif" class="preloader" />');
		}
		$(".notification").fadeOut(700, function() {
			$.post(action, {
				name: $("#name").val(),
				email: $("#email").val(),
				phone: $("#phone").val(),
				subject: $("#subject").val(),
				message: $("#message").val(),
				verify: $("#verify").val()
			},
				function(data){
					$(".notification").html(data).fadeIn(700);
					$(".form-submit img.preloader").fadeOut("fast", function(){$(this).remove()});
					$("#submit").removeAttr("disabled");
					if(data.match("success")!=null) $("#frm_contact").fadeOut("slow");
				}
			);
		});
		return false;
	});
});