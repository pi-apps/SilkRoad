$(document).on("keyup",".txtPrice", function (e) {
    PriceSell = parseFloat($(".txtPrice").val()) - parseFloat($(".txtPricePromotion").val())
    $(".txtPriceSell").val(PriceSell);
    $(".txtPriceSell").number(true);
    $(".txtPricesellOnline").val(PriceSell);
    $(".txtPricesellOnline").number(true);
    $(".txtDepositPayment").val(PriceSell);
    $(".txtDepositPayment").number(true);
    //tính % giảm giá
    percent = (parseFloat($(".txtPricePromotion").val()) * 100) / parseFloat($(".txtPrice").val())
    $(".txtPricePercent").val(percent);


})
$(document).on("keyup", ".txtPricePromotion", function (e) {
    PriceSell = parseFloat($(".txtPrice").val()) - parseFloat($(".txtPricePromotion").val())
    $(".txtPriceSell").val(PriceSell);
    $(".txtPriceSell").number(true);
    $(".txtPricesellOnline").val(PriceSell);
    $(".txtPricesellOnline").number(true);
    $(".txtDepositPayment").val(PriceSell);
    $(".txtDepositPayment").number(true);
    //tính % giảm giá
    percent = (parseFloat($(".txtPricePromotion").val()) * 100) / parseFloat($(".txtPrice").val())
    $(".txtPricePercent").val(percent);
})
$(document).on("keyup", ".txtPricePercent", function (e) {
    PriceSell = parseFloat($(".txtPrice").val()) - ((parseFloat($(".txtPricePercent").val()) / 100) * parseFloat($(".txtPrice").val()))
    $(".txtPriceSell").val(PriceSell);
    $(".txtPriceSell").number(true);
    $(".txtPricesellOnline").val(PriceSell);
    $(".txtPricesellOnline").number(true);
    $(".txtDepositPayment").val(PriceSell);
    $(".txtDepositPayment").number(true);

    $(".txtPricePromotion").val(parseFloat($(".txtPrice").val()) - parseFloat($(".txtPriceSell").val()));
    $(".txtPricePromotion").number(true);
    //tính % giảm giá
    //percent = (parseFloat($(".txtPricePromotion").val()) * 100) / parseFloat($(".txtPrice").val())
    //$(".txtPricePercent").val(percent);
});
$(document).on("click", ".tab-content-radio input[type=checkbox],#bodyContentPlaceHolder_btnSave", function (e) {
    code = "";
    $('.tab-content-radio input[type=checkbox]').each(function () {
        if ($(this).prop('checked')) {
            code += $(this).parent().attr('data-code');
        }
    });
    if (code != "") {
        code = $("#hdfCodeParent").val()+"" + code;
    }
    else code = $("#hdfCodeParent").val();
    $("#txtImportCode").val(code);
    $("#txtCode").val(code);
});
$(document).on("click", ".legend-attribute", function (e) {
    $(".attribute-detail").hide();
    $("fieldset.attribute legend").attr("class", "legend-attribute legend-attribute-noactive");
    $(this).attr("class", "legend-attribute legend-attribute-active");
    $("#attribute-detail-" + $(this).attr("data-id")).show();
});