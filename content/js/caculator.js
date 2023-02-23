function Caculator() {
    var url = $(".ddlCurrency").val();
    var _amount = $("#txtamount").val();
    if (url == '' || _amount == '') { $(".rc-total-rew").html("");return; }
    else {
        exchangeRate = parseFloat($("#hdfExchangeRate").val());
        bonus = parseFloat($("#hdfBonus").val());
        amount = parseFloat(_amount);
        $.getJSON(url, function (data) {
            price = parseFloat(data.data.quotes.USD.price);
            var total = ((price / exchangeRate) + ((price / exchangeRate) * (bonus / 100)) )* amount;
            if ($(".ddlCurrency option:selected").text() != "HTML") {
                total = total.toFixed(3);
            }
            $(".rc-total-rew").html(total);
        });
    }
}
$(document).on("change", ".ddlCurrency", function (e) {
    Caculator();
});
$(document).on("propertychange change keyup paste input", "#txtamount", function (e) {
    Caculator();
});
$(document).on("click", "#buy-token-cr,#buy-token-button", function (e) {
    var urlRedirect = "/member/buy-token.aspx?current=" + $(".ddlCurrency option:selected").text()+"&amount=" + $("#txtamount").val();
    location.href = urlRedirect;
    e.preventDefault();
});
$(document).on("click", "#mc-embedded-subscribe", function (e) {
    var email = $("#mce-EMAIL").val();
    if (email == '' || email.length == 0) { $(".subscribe-message").html("- Please Input Your E-mail Address"); }
    else if (!validateEmailBookingTour(email)) {
        $(".subscribe-message").html("- Please Input Your E-mail Address Correct Format");
    }
    else {
        $.ajax({
            url: '/ajax/subscribe.aspx',
            data: { email: email },
            success: function (result) {
                $(".subscribe-message").html("- Successfully! Thank you for signing up for the email");
                $("#mce-EMAIL").val("");
            }
        });
    }
    e.preventDefault();
});

function validateEmailBookingTour(email) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}
function isValidPhoneBookingTour(p) {
    var phoneRe = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/;
    var digits = p.replace(/\D/g, "");
    return phoneRe.test(digits);
}

var clipboardBTC = new ClipboardJS('#address-HRC20', {
    text: function () {
        return '2c924d9f9a09170cf86daa5a95c0a90160481dc4';
    }
});