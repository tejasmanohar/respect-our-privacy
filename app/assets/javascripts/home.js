$(document).ready(function() {
	$(".show-email").click(function() {
		$(".call").hide();
		$(".email").show();
	});

	$(".show-call").click(function() {
		$(".email").hide();
		$(".call").show();
	});
});