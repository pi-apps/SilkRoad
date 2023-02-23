//function callPopupKhongDuTien() {
//    var what = new jPopup({
//        title: "<h2>Thông báo piglobal.net</h2>",
//        content: "<p>Cảm ơn bạn đã tham gia giao dịch tại piglobal.net<br>Để tiến hành giao dịch bạn phải đáp ứng 2 yêu cầu sau:<br>1. Có số dư tài khoản trên 0.05π<br>2. Thông tin cá nhân đã cập nhật ví Pi.<br><div style='text-align:center;'><a target='_blank' href='/taikhoan/thongtin/updateinfo.aspx' class='btn btn-danger'>Cập nhật ngay</a></div></p>",
//        draggable: true,
//        resizeable: true,
//        overlay: true,
//        closeButton: true
//    });
//    var draggable = true;
//    var overlay = false;
//    what.open();
//}
//function callPopupXacNhanGiaoDich(PurchaseFee,shopRentalId, productId) {
//    var what = new jPopup({
//        title: "<h2>Thông báo piglobal.net</h2>",
//        content: "<p>Bạn có đang sẵn sàng tham gia giao dịch tại piglobal.net?<br>Với giao dịch mua hàng, bạn sẽ phải chịu phí <b>" + PurchaseFee+"π</b>/1 giao dịch<br>Nếu bạn vẫn muốn tiếp tục giao dịch. Vui lòng nhấp vào liên kết bên dưới.<br><div style='text-align:center;'><a data-shop='" + shopRentalId + "' data-pro='" + productId+"' href='javascript:void(0);' class='tien-hanh-dat-lenh btn btn-success'>Tiến hành giao dịch</a></div></p>",
//        draggable: true,
//        resizeable: true,
//        overlay: true,
//        closeButton: true
//    });
//    var draggable = true;
//    var overlay = false;
//    what.open();
//}
//$(document).on("click", ".tien-hanh-dat-lenh", function () {
//    $("#overlay-mua-hang").show();
//    var productId = $(this).attr("data-pro");
//    var ShopId = $(this).attr("data-shop");
//    $.ajax({
//        url: '/transaction/CreateTransactionBuyProduct.aspx',
//        data: { productId: productId, ShopId: ShopId }, //data
//        type: 'POST',
//        success: function (data) {
//            $("#overlay-mua-hang").hide();
//            location.href = data;
//        },
//        error: function (jxhr, msg, err)
//        {
//        }
//    });
//})