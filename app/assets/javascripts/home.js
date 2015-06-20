$(document).ready(function() {
	$(".show-email").click(function() {
		$("#call-to-action").addClass("email").removeClass("call");
	});

	$(".show-call").click(function() {
		$("#call-to-action").addClass("call").removeClass("email");
	});
});