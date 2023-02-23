$(document).on("keyup",".PriceAdult input", function (e) {
    PriceAdultSell = parseFloat($(".PriceAdult input:eq(0)").val()) - parseFloat($(".PriceAdult input:eq(1)").val())
    $(".PriceAdultSell").html(PriceAdultSell);
    $(".PriceAdultSell").number(true);
})
$(document).on("keyup", ".PriceChildren input", function (e) {
    PriceChildrenSell = parseFloat($(".PriceChildren input:eq(0)").val()) - parseFloat($(".PriceChildren input:eq(1)").val())
    $(".PriceChildrenSell").html(PriceChildrenSell);
    $(".PriceChildrenSell").number(true);
})
$(document).on("keyup", ".PriceKid input", function (e) {
    PriceKidSell = parseFloat($(".PriceKid input:eq(0)").val()) - parseFloat($(".PriceKid input:eq(1)").val())
    $(".PriceKidSell").html(PriceKidSell);
    $(".PriceKidSell").number(true);
})
$(document).on("keyup", ".PriceAdultEN input", function (e) {
    PriceAdultSellEN = parseFloat($(".PriceAdultEN input:eq(0)").val()) - parseFloat($(".PriceAdultEN input:eq(1)").val())
    $(".PriceAdultSellEN").html(PriceAdultSellEN);
    $(".PriceAdultSellEN").number(true);
})
$(document).on("keyup", ".PriceChildrenEN input", function (e) {
    PriceChildrenSellEN = parseFloat($(".PriceChildrenEN input:eq(0)").val()) - parseFloat($(".PriceChildrenEN input:eq(1)").val())
    $(".PriceChildrenSellEN").html(PriceChildrenSellEN);
    $(".PriceChildrenSellEN").number(true);
})
$(document).on("keyup", ".PriceKidEN input", function (e) {
    PriceKidSellEN = parseFloat($(".PriceKidEN input:eq(0)").val()) - parseFloat($(".PriceKidEN input:eq(1)").val())
    $(".PriceKidSellEN").html(PriceKidSellEN);
    $(".PriceKidSellEN").number(true);
})