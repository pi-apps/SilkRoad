//$('html, body').animate({
//    scrollTop: $("#buyToken-section").offset().top-200
//}, 2000);
$(document).on("click", ".btn-guide-create-wallet", function (e) {
    $(".content-HRC-20-Address").toggle("slow");
});
$(document).on("click", ".btn-guide-create-wallet1", function (e) {
    $(".content-HRC-20-Address1").toggle("slow");
});
var clipboardBTC = new ClipboardJS('#address-BTC', {
    text: function () {
        return '12dDS3rqvTxgEEbnFZgBgAwAMvpXgbU9Rg';
    },
    target: function () {
        return document.querySelector('span.address-BTC-content');
    }
});
var clipboardETH = new ClipboardJS('#address-ETH', {
    text: function () {
        return '0xA2f06b137b73C0C379D35015eC63EA2E52CBEd14';
    },
    target: function () {
        return document.querySelector('span.address-ETH-content');
    }
});
var clipboardHTML = new ClipboardJS('#address-HTML', {
    text: function () {
        return 'HtE35GupyXgvBphK74t4yuDtwbBp9o7eYK';
    },
    target: function () {
        return document.querySelector('span.address-HTML-content');
    }
});


function CaculatorPreSale() {
    var url = $("#ddlcurrency_id").val();
    var _amount = $("#txtpledged_amount").val();
    if (url == '' || _amount == '') { $(".total-rew-pre-salse").html(""); return; }
    else {
        exchangeRate = parseFloat($("#hdfExchangeRatePagePreSale").val());
        amount = parseFloat(_amount);
        bonus = parseFloat($("#hdfBonusPagePreSale").val());
        $.getJSON(url, function (data) {
            price = parseFloat(data.data.quotes.USD.price);
            $("#hdfPriceCurrency").val(price);
            var total = ((price / exchangeRate) + ((price / exchangeRate) * (bonus / 100))) * amount;
            $("#hdfTotalPagePreSale").val(total);
            if ($("#ddlcurrency_id option:selected").text() != "HTML") {
                total = total.toFixed(3);
            }
            $(".total-rew-pre-salse").html(total+" ");
        });
    }
}
CaculatorPreSale();
$(document).on("change", "#ddlcurrency_id", function (e) {
    CaculatorPreSale();
});
$(document).on("propertychange change keyup paste input", "#txtpledged_amount", function (e) {
    CaculatorPreSale();
});

$(function () {
    $(".txtDatePicker").datepicker({
        dateFormat: "yy-mm-dd",
        //changeMonth: true,
        //changeYear: true,
        maxDate: '-18Y',
        //minDate: new Date(1920, 10 - 1, 25),
    });
});