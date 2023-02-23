$(document).on("click", ".div-khungchat-footer .file", function () {

});
//*
function sendFile(file) {

    var formData = new FormData();
    formData.append('file', $('#bodyContentPlaceHolder_fulAttachment')[0].files[0]);
    $.ajax({
        type: 'post',
        url: '/transaction/fileUploader.ashx',
        data: formData,
        success: function (status)
        {
            console.log(status);
            //if (status != 'error') {
            //    var my_path = "MediaUploader/" + status;
            //    $("#myUploadedImg").attr("src", my_path);
            //}
        },
        processData: false,
        contentType: false,
        error: function () {
            //alert("Whoops something went wrong!");
        }
    });
}
//*
$(document).on("click", ".trans-button #huy-dat", function (e) {
    e.preventDefault();
    var what = new jPopup({
        title: "<h2>Thông báo piglobal.net</h2>",
        content: "<p>Có phải bạn đang muốn hủy giao dịch này?<br>Việc hủy này vẫn sẽ làm bạn mất phí giao dịch <b>" + $("#hdfPurchaseFee").val() + "π</b><br>Nếu bạn vẫn muốn tiếp tục hủy giao dịch. Vui lòng nhấp vào liên kết bên dưới.<br><div style='text-align:center;'><a data-order='" + $("#hdfCodeOrder").val() + "' href='javascript:void(0);' class='tien-hanh-huy-giao-dich btn btn-warning'>Tiếp tục hủy giao dịch</a></div></p>",
        draggable: true,
        resizeable: true,
        overlay: true,
        closeButton: true
    });
    var draggable = true;
    var overlay = false;
    what.open();
});
$(document).on("click", ".tien-hanh-huy-giao-dich", function ()
{
    var order = $(this).attr("data-order");
    $("#overlay-mua-hang").show();
    $.ajax({
        url: '/transaction/CancelTransactionBuyProduct.aspx',
        data: { order: order }, //data
        type: 'POST',
        success: function (data) {
            //console.log(data);
            $("#overlay-mua-hang").hide();
            location.href = data;
        },
        error: function (jxhr, msg, err) {
        }
    });
});
var btn = document.getElementsByClassName('copy');
var clipboard = new ClipboardJS(btn);
$(document).on("click", ".trans-button #xac-nhan-dat", function (e) {
    e.preventDefault();
    var what = new jPopup({
        title: "<h2>Thông báo piglobal.net</h2>",
        content: "<p>Bạn có chắc đã nhận được hàng từ người bán?<br>Nếu bạn đã nhân được hàng. Vui lòng nhấp vào liên kết bên dưới để hoàn thành đơn hàng.<br><div style='text-align:center;'><a data-order='" + $("#hdfCodeOrder").val() + "' href='javascript:void(0);' class='tien-hanh-bao-nguoi-ban btn btn-success'>Tiếp tục xác nhận</a></div></p>",
        draggable: true,
        resizeable: true,
        overlay: true,
        closeButton: true
    });
    var draggable = true;
    var overlay = false;
    what.open();
});
$(document).on("click", ".tien-hanh-bao-nguoi-ban", function () {
    var order = $(this).attr("data-order");
    $("#overlay-mua-hang").show();
    $.ajax({
        url: '/transaction/auction/FinishTransactionForBuyProduct.aspx',
        data: { order: order }, //data
        type: 'POST',
        success: function (data) {
            //console.log(data);
            $("#overlay-mua-hang").hide();
            location.reload();
        },
        error: function (jxhr, msg, err) {
        }
    });
});
$(document).on("click", ".trans-button #xac-nhan-nhan-tien", function (e) {
    e.preventDefault();
    var what = new jPopup({
        title: "<h2>Thông báo piglobal.net</h2>",
        content: "<p>Bạn có chắc đã thống nhất đơn hàng với người mua?<br>Nếu bạn chắc chắn muốn thực hiện thao tác này.<br/>Xin vui lòng nhấp vào liên kết bên dưới để tiếp tục.<br><div style='text-align:center;'><a data-order='" + $("#hdfCodeOrder").val() + "' href='javascript:void(0);' class='tien-hanh-hoan-thanh-don btn btn-success'>Tiếp tục xác nhận</a></div></p>",
        draggable: true,
        resizeable: true,
        overlay: true,
        closeButton: true
    });
    var draggable = true;
    var overlay = false;
    what.open();
});
$(document).on("click", ".tien-hanh-hoan-thanh-don", function () {
    var order = $(this).attr("data-order");
    $("#overlay-mua-hang").show();
    $.ajax({
        url: '/transaction/auction/SendTransactionForSellerBuyProduct.aspx',
        data: { order: order }, //data
        type: 'POST',
        success: function (data) {
            //console.log(data);
            $("#overlay-mua-hang").hide();
            location.reload();
        },
        error: function (jxhr, msg, err) {
        }
    });
});
$("#bodyContentPlaceHolder_textChat").keypress(function (e) {
    if (e.which == 13)
    {
        if ($(this).val().trim().length > 0) {
            $('.div-khungchat-footer .send').click();
        }
    }
});
$(document).on("click", ".div-khungchat-footer .send", function (e) {
    var content = $("#bodyContentPlaceHolder_textChat").val();
    var orderId = $("#hdfCodeOrder").val();
    var cateUser = $(this).attr("data-cate");
    $.ajax({
        url: '/transaction/SendChat.aspx',
        data: { orderId: orderId, content: content, cateUser: cateUser }, //data
        type: 'POST',
        success: function (data)
        {
            $("#bodyContentPlaceHolder_textChat").val("");
            loadChat();
        },
        error: function (jxhr, msg, err) {
        }
    });

});
setInterval(loadChat, 2000);
function loadChat() {
    $(".div-khungchat-body").html();
    $(".div-khungchat-body").load("/gianhang/loadChat.aspx?code=" + $("#hdfCodeOrder").val());
}
