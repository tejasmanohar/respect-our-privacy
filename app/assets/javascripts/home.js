$(document).ready(function() {
	$(".show-email").click(function() {
		$("#call-to-action").addClass("email").removeClass("call");
	});

	$(".show-call").click(function() {
		$("#call-to-action").addClass("call").removeClass("email");
	});

    $(document).on('click', '.copy', function (event) {
        event.preventDefault();
    });

    ZeroClipboard.config({
        swfPath: "//cdnjs.cloudflare.com/ajax/libs/zeroclipboard/2.2.0/ZeroClipboard.swf"
    });
    var client = new ZeroClipboard($(".copy"));
    client.on("ready", function (event) {
        client.on("copy", function (event) {
            var clipboard = event.clipboardData;
            clipboard.setData("text/plain", "Dear ICANN – \n\n" +
                "Regarding the proposed rules governing companies that provide WHOIS privacy services (as set forth in the Privacy and Policy Services Accreditation Issues Policy document):\n\n" +
                "I urge you to respect internet users' rights to privacy and due process.\n" +
                "- Everyone deserves the right to privacy.\n" +
                "- No one’s personal information should be revealed without a court order, regardless of whether the request comes from a private individual or law enforcement agency.\n\n" +
                "Private information should be kept private. Thank you.");
        });
    });
});