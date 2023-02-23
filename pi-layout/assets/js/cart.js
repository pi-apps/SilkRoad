function addtoCart(purchaseFee, storeId, productId)
{
    var WorkingSessionId = getUserWorkingSession(WorkingSession).value;
    //call ajax
    $.ajax({
        url: '/ajax/cart/addCart.aspx',
        data: { productId: productId, storeId: storeId, purchaseFee: purchaseFee, WorkingSessionId:WorkingSessionId },
        dataType: 'json',
        type: 'POST',
        success: function (info) {
            //$(".cart-number").html(info.Count);
            $("#cd-cart").html("");
            $("#cd-cart").load('/ajax/cart/loadInfoRightCart.aspx?WorkingSessionId=' + WorkingSessionId);
        },
        complete: function () {
            $('#main-nav').removeClass('speed-in');
            toggle_panel_visibility($('#cd-cart'), $('#cd-shadow-layer'), $('body'));
        }
    });
}
$(document).on("click", ".cd-item-remove", function () {
    id = $(this).attr("data-id");
    var WorkingSessionId = getUserWorkingSession(WorkingSession).value;
    $.ajax({
        url: '/ajax/cart/removeCart.aspx',
        data: { productId: id, WorkingSessionId: WorkingSessionId },
        dataType: 'json',
        type: 'POST',
        success: function (info) {
            //$(".cart-number").html(info.Count);
            $("#cd-cart").html("");
            $("#cd-cart").load('/ajax/cart/loadInfoRightCart.aspx?WorkingSessionId=' + WorkingSessionId);
        },
        complete: function () {
            //$('#main-nav').removeClass('speed-in');
            // toggle_panel_visibility($('#cd-cart'), $('#cd-shadow-layer'), $('body'));
        }
    });
});
