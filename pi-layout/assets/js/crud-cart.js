//$("#overlay-mua-hang").show();
$(document).on("click", ".cd-item-remove-item", function () {
    id = $(this).attr("data-id");
    var WorkingSessionId = getUserWorkingSession(WorkingSession).value;
    $.ajax({
        url: '/ajax/cart/removeCart.aspx',
        data: { productId: id, WorkingSessionId: WorkingSessionId },
        dataType: 'json',
        type: 'POST',
        success: function (info) {
            location.reload();
        },
        complete: function () {
        }
    });
});
$(document).on("click", ".shop_cart_main", function (e) {
    //chọn của hàng, chọn tất cả sản phẩm trong cửa hàng
    var shopRentalId = $(this).attr("data-shoprentalid");
    var isChecked = $(this).is(':checked');
    $(".cart-input-item[data-shoprentalid='" + shopRentalId + "']").prop("checked", isChecked);
    var selected = new Array();
    $(".panel-info-cart input.cart-input-item[type=checkbox]:checked").each(function () {
        selected.push($(this).val());
    });
    if (selected.length > 0) {
        $("#hdfProductIdPayment").val(selected); caculatorAmountPayment(selected);
    } else {
        $("#hdfProductIdPayment").val(""); $(".sub-total").html(0 + " π");
        $(".grand-total").html(0 + " π");
    }
});
$(document).on("click", ".cart-input-item", function (e) {
    var selected = new Array();
    $(".panel-info-cart input.cart-input-item[type=checkbox]:checked").each(function () {
        selected.push($(this).val());
    });
    if (selected.length > 0) {
        $("#hdfProductIdPayment").val(selected); caculatorAmountPayment(selected);

    } else {
        $("#hdfProductIdPayment").val(""); $(".sub-total").html(0 + " π");
        $(".grand-total").html(0 + " π"); }
});
function reloadTotalPayment() {
    var selected = new Array();
    $(".panel-info-cart input.cart-input-item[type=checkbox]:checked").each(function () {
        selected.push($(this).val());
    });
    if (selected.length > 0) {
        $("#hdfProductIdPayment").val(selected); caculatorAmountPayment(selected);

    } else {
        $("#hdfProductIdPayment").val(""); $(".sub-total").html(0 + " π");
        $(".grand-total").html(0 + " π");
    }
}
function caculatorAmountPayment(arrayId)
{
    var WorkingSessionId = getUserWorkingSession(WorkingSession).value;
    $.ajax({
        url: '/ajax/cart/caculatorAmountPayment.aspx',
        data: { productId: arrayId, WorkingSessionId: WorkingSessionId },
        dataType: 'json',
        type: 'POST',
        success: function (info) {
            $(".sub-total").html(info.Amount + " π");
            $(".grand-total").html(info.TotalAmount + " π");
        },
        complete: function () {
        }
    });
}
$(document).on("click", ".plus", function (e)
{
    var productid = $(this).attr("data-id");
    var quantity = parseInt($("input[type=number][data-id='" + productid + "']").val());
    quantity = quantity + 1;
    $("input[type=number][data-id='" + productid + "']").val(quantity);
    var WorkingSessionId = getUserWorkingSession(WorkingSession).value;
    $.ajax({
        url: '/ajax/cart/updateQuantityCart.aspx',
        data: { productid: productid, WorkingSessionId: WorkingSessionId, quantity: quantity },
        dataType: 'json',
        type: 'POST',
        success: function (info) {
            $(".line-item-total-price-amount[data-id='" + productid + "']").html(info.totalsell + " π");
        },
        complete: function ()
        {
            reloadTotalPayment();
        }
    });
});
$(document).on("click", ".minus", function (e) {
    var productid = $(this).attr("data-id");
    var quantity = parseInt($("input[type=number][data-id='" + productid + "']").val());
    if (quantity>1)
        quantity = quantity - 1;
    $("input[type=number][data-id='" + productid + "']").val(quantity);
    var WorkingSessionId = getUserWorkingSession(WorkingSession).value;
    $.ajax({
        url: '/ajax/cart/updateQuantityCart.aspx',
        data: { productid: productid, WorkingSessionId: WorkingSessionId, quantity: quantity },
        dataType: 'json',
        type: 'POST',
        success: function (info) {
            $(".line-item-total-price-amount[data-id='" + productid + "']").html(info.totalsell + " π");
        },
        complete: function () {
            reloadTotalPayment();
        }
    });
});
$(document).on("click", "#bodyContentPlaceHolder_btnContinueCheckOut", function (e)
{
    e.preventDefault();
    var selected = new Array();
    $(".panel-info-cart input.cart-input-item[type=checkbox]:checked").each(function () {
        selected.push($(this).val());
    });
    if (selected.length > 0)
    {
        var WorkingSessionId = getUserWorkingSession(WorkingSession).value;
        //check address
        if (validFormBooking())//gọi hàm login và mua hàng của PI
        {
            //tao đơn hàng
            const Pi = window.Pi;
            Pi.init({ version: "2.0" });

            //alert(PiNetworkClient);

            async function auth() {
                try {
                    // Identify the user with their username / unique network-wide ID, and get permission to request payments from them.
                    const scopes = ['username', 'payments', 'wallet_address'];
                    function onIncompletePaymentFound(payment) {

                        var data = {
                            'action': 'complete', WorkingSessionId: WorkingSessionId,
                            'paymentId': payment.identifier,
                            'txid': payment.transaction.txid,
                            'app_client': 'Pi Silk Road'
                        };
                        return $.post("https://pisilkroad.com/ajax/payment/payment.aspx", data).done(function (data) {
                            location.href = '/checkout/cartinfo.html?WorkingSessionId=' + WorkingSessionId + "&paymentId=" + payment.identifier;
                        }).fail(function () {
                            
                        });
                    }; // Read more about this in the SDK reference

                    Pi.authenticate(scopes, onIncompletePaymentFound).then(function (auth)
                    {
                        //gọi hàm tạo đơn hàng
                        $("#overlay-mua-hang").show();
                        $.ajax({
                            url: '/ajax/cart/SaveOrderStep1.aspx',
                            data: {
                                WorkingSessionId: WorkingSessionId,
                                fullName:$("#bodyContentPlaceHolder_txtFullName").val(),
                                UserName: auth.user.username,
                                Uid: auth.user.uid,
                                AccessToken: auth.accessToken,
                                Timestamp: auth.user.credentials.valid_until.timestamp,
                                Iso8601: auth.user.credentials.valid_until.iso8601,
                                phone: $("#bodyContentPlaceHolder_txtPhone").val(),
                                email: $("#bodyContentPlaceHolder_txtEmail").val(),
                                thanhpho: $("#bodyContentPlaceHolder_ddlThanhPho").val(),
                                quanhuyen: $("#bodyContentPlaceHolder_ddlQuanHuyen").val(),
                                phuongxa: $("#bodyContentPlaceHolder_ddlPhuongXa").val(),
                                diachi: $("#bodyContentPlaceHolder_txtAddress").val(),
                                productId: selected
                            },
                            type: 'POST', dataType: 'json',
                            success: function (info) {
                                //alert(info); alert(info.Code);
                                if (info == "0")
                                {

                                }
                                else transfer(info.Code,info.Amount, info.PaymentName);
                            },
                            complete: function () {
                                $("#overlay-mua-hang").hide();
                            }
                        });
                    }).catch(function (error) {
                        
                    });
                } catch (err) {
                    
                }
            }

            async function transfer(code,amount,paymentname) {
                try {
                    const payment = Pi.createPayment({
                        // Amount of π to be paid:
                        amount: amount,
                        // An explanation of the payment - will be shown to the user:
                        memo: paymentname, // e.g: "Digital kitten #1234",
                        // An arbitrary developer-provided metadata object - for your own usage:
                        metadata: { paymentType: "donation" /* ... */ }, // e.g: { kittenId: 1234 }
                    }, {
                        // Callbacks you need to implement - read more about those in the detailed docs linked below:
                        onReadyForServerApproval: function (paymentId) {
                            var data = {
                                'action': 'approve',
                                'paymentId': paymentId,
                                'txid': '', WorkingSessionId: WorkingSessionId,
                                'app_client': 'Pi Silk Road',
                                'grouporrder': code
                            };
                            return $.post("https://pisilkroad.com/ajax/payment/payment.aspx", data).done(function (data)
                            {
                                var what = new jPopup({
                                    title: "<h2>Thông báo pisilkroad.com</h2>",
                                    content: "<p><i class='fa fa-exclamation' aria-hidden='true'></i>&nbsp;Chứng thực tài khoản ví được chấp nhận. Vui lòng đợi thanh toán.</p>",
                                    draggable: true,
                                    resizeable: true,
                                    overlay: true,
                                    closeButton: true
                                });
                                var draggable = true;
                                var overlay = false;
                                what.open();
                                
                            }).fail(function (error)
                            {
                                var what = new jPopup({
                                    title: "<h2>Thông báo pisilkroad.com</h2>",
                                    content: "<p><i class='fa fa-exclamation' aria-hidden='true'></i>&nbsp;Lỗi trong quá trình chấp thuận thanh toán. Vui lòng thử lại sau.</p>",
                                    draggable: true,
                                    resizeable: true,
                                    overlay: true,
                                    closeButton: true
                                });
                                var draggable = true;
                                var overlay = false;
                                what.open();
                                
                            });
                        },
                        onReadyForServerCompletion: function (paymentId, txid) {
                            var data = {
                                'action': 'complete',
                                'paymentId': paymentId, WorkingSessionId: WorkingSessionId,
                                "txid": txid,
                                'app_client': 'Pi Silk Road', 'grouporrder': code
                            };
                            return $.post("https://pisilkroad.com/ajax/payment/payment.aspx", data).done(function (data) {

                                var what = new jPopup({
                                    title: "<h2>Thông báo pisilkroad.com</h2>",
                                    content: "<p><i class='fa fa-exclamation' aria-hidden='true'></i>&nbsp;Bạn đã thanh toán đơn hàng thành công..</p>",
                                    draggable: true,
                                    resizeable: true,
                                    overlay: true,
                                    closeButton: true
                                });
                                var draggable = true;
                                var overlay = false;
                                what.open();
                                location.href = '/checkout/cartinfo.html?WorkingSessionId=' + WorkingSessionId + "&paymentId=" + paymentId;
                            }).fail(function () {
                                var what = new jPopup({
                                    title: "<h2>Thông báo pisilkroad.com</h2>",
                                    content: "<p><i class='fa fa-exclamation' aria-hidden='true'></i>&nbsp;Lỗi trong quá trình thanh toán. Vui lòng kiểm soát lại số dư.</p>",
                                    draggable: true,
                                    resizeable: true,
                                    overlay: true,
                                    closeButton: true
                                });
                                var draggable = true;
                                var overlay = false;
                                what.open();
                            });
                        },
                        onCancel: function (paymentId) {

                        },
                        onError: function (error, payment) {
                            var what = new jPopup({
                                title: "<h2>Thông báo pisilkroad.com</h2>",
                                content: "<p><i class='fa fa-exclamation' aria-hidden='true'></i>&nbsp;Lỗi trong quá trình thanh toán. Vui lòng kiểm soát lại số dư.</p>",
                                draggable: true,
                                resizeable: true,
                                overlay: true,
                                closeButton: true
                            });
                            var draggable = true;
                            var overlay = false;
                            what.open(); },
                    });
                } catch (err) {
                    var what = new jPopup({
                        title: "<h2>Thông báo pisilkroad.com</h2>",
                        content: "<p><i class='fa fa-exclamation' aria-hidden='true'></i>&nbsp;Lỗi trong quá trình chấp thuận thanh toán. Vui lòng thử lại sau.</p>",
                        draggable: true,
                        resizeable: true,
                        overlay: true,
                        closeButton: true
                    });
                    var draggable = true;
                    var overlay = false;
                    what.open();
                }
            }

            auth();
        }
        else
        {
            var what = new jPopup({
                title: "<h2>Thông báo pisilkroad.com</h2>",
                content: "<p><i class='fa fa-exclamation' aria-hidden='true'></i>&nbsp;Vui lòng nhập đầy đủ thông tin giao nhận.</p>",
                draggable: true,
                resizeable: true,
                overlay: true,
                closeButton: true
            });
            var draggable = true;
            var overlay = false;
            what.open();
        }

    } else
    {
        var what = new jPopup({
            title: "<h2>Thông báo pisilkroad.com</h2>",
            content: "<p><i class='fa fa-exclamation' aria-hidden='true'></i>&nbsp;Vui lòng chọn ít nhất 1 sản phẩm.</p>",
            draggable: true,
            resizeable: true,
            overlay: true,
            closeButton: true
        });
        var draggable = true;
        var overlay = false;
        what.open();
    }
    e.preventDefault();
});
function validFormBooking() {
    var cssDefault = "info-user-order form-control";
    var cssDefaultCmb = "js-cart_shipping_method-select cart_shipping_method-select custom-select form-control shippingMethods";
    var i = 0;
    //check HoTen
    var hoten = $("#bodyContentPlaceHolder_txtFullName").val();
    if (hoten == "") {
        $("#bodyContentPlaceHolder_txtFullName").addClass("input-validation-error");
    }
    else {
        $("#bodyContentPlaceHolder_txtFullName").attr("class", cssDefault);
        i += 1;
    }
    //check DienThoai
    var phone = $("#bodyContentPlaceHolder_txtPhone").val();
    if (phone == "") {
        $("#bodyContentPlaceHolder_txtPhone").addClass("input-validation-error");
    }
    else if (!isValidPhoneBooking(phone)) {
        $("#bodyContentPlaceHolder_txtPhone").addClass("input-validation-error");
    }
    else {
        $("#bodyContentPlaceHolder_txtPhone").attr("class", cssDefault);
        i += 1;
    }
    //Check Email
    var email = $("#bodyContentPlaceHolder_txtEmail").val();

    if (email == "") {
        $("#bodyContentPlaceHolder_txtEmail").addClass("input-validation-error");
    }
    else if (!validateEmailBooking(email)) {
        $("#bodyContentPlaceHolder_txtEmail").addClass("input-validation-error");
    }
    else {
        $("#bodyContentPlaceHolder_txtEmail").attr("class", cssDefault);
        i += 1;
    }
    //check thành phố
    var thanhpho = $("#bodyContentPlaceHolder_ddlThanhPho").val();
    if (thanhpho == "0") {
        $("#bodyContentPlaceHolder_ddlThanhPho").addClass("input-validation-error");
    }
    else {
        $("#bodyContentPlaceHolder_ddlThanhPho").attr("class", cssDefaultCmb);
        i += 1;
    }
    //check quận huyện
    var quanhuyen = $("#bodyContentPlaceHolder_ddlQuanHuyen").val();
    if (quanhuyen == "0") {
        $("#bodyContentPlaceHolder_ddlQuanHuyen").addClass("input-validation-error");
    }
    else {
        $("#bodyContentPlaceHolder_ddlQuanHuyen").attr("class", cssDefaultCmb);
        i += 1;
    }
    //check phường xã
    var phuongxa = $("#bodyContentPlaceHolder_ddlPhuongXa").val();
    if (phuongxa == "0") {
        $("#bodyContentPlaceHolder_ddlPhuongXa").addClass("input-validation-error");
    }
    else {
        $("#bodyContentPlaceHolder_ddlPhuongXa").attr("class", cssDefaultCmb);
        i += 1;
    }
    //check địa chỉ
    var diachi = $("#bodyContentPlaceHolder_txtAddress").val();
    if (diachi == "") {
        $("#bodyContentPlaceHolder_txtAddress").addClass("input-validation-error");
    }
    else {
        $("#bodyContentPlaceHolder_txtAddress").attr("class", cssDefaultCmb);
        i += 1;
    }
    
    if (i == 7) return true;
    return false;
}
function isValidPhoneBooking(p) {
    var phoneRe = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/;
    var digits = p.replace(/\D/g, "");
    return phoneRe.test(digits);
}
function validateEmailBooking(email) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}