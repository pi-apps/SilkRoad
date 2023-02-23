function callPopupKhongDuTienMuaGH(AmountBalance, tiencoc)
{
    var what = new jPopup({
        title: "<h2>Thông báo piglobal.net</h2>",
        content: "<p>Số dư tài khoản của bạn <b>" + AmountBalance + "π</b> không đủ để giao dịch?<br>Xin vui lòng lưu ý rằng, gian hàng sau khi mua sẽ có quyền lợi như sau:<br>"
            + "<ol><li>Cấp sổ đỏ cho chủ cửa hàng. Hiệu lực vĩnh viễn</li>"
            + "<li>Người dùng mua gian hàng sẽ được tham gia bán lại hoặc cho thuê</li>"
            + "<li>Điều kiện bán và cho thuê lại gian hàng, phải đáp ứng yêu cầu của BQT đề ra</li>"
            + "</ol>"
            + "Nếu bạn vẫn muốn tiếp tục giao dịch. Vui lòng nhấp vào liên kết bên dưới.<br><div style='text-align:center;'><a href='/taikhoan/giaodich/naptien/list.aspx' class='btn btn-success'>Nạp tiền ngay</a></div></p>",
        draggable: true,
        resizeable: true,
        overlay: true,
        closeButton: true
    });
    var draggable = true;
    var overlay = false;
    what.open();
}
function callPopupKhongDuTienThueGH(AmountBalance, tiencoc)
{
    var what = new jPopup({
        title: "<h2>Thông báo piglobal.net</h2>",
        content: "<p>Số dư tài khoản của bạn <b>" + AmountBalance +"π</b> không đủ để giao dịch?<br>Xin vui lòng lưu ý rằng, phí thuê gian hàng được tính như sau:<br>"
            +"<ol><li>Người dùng khi muốn bán hàng, sẽ đặt thuê gian hàng. Chu kì thuê 6 tháng/1 lần</li>"
            + "<li>Người thuê phải đặt cọc tiền thuê gian hàng 2 tháng/giá cho thuê</li>"
            + "<li>Người thuê phải thanh toán tiền thuê tháng đâu tiên trong phiên giao dịch đầu</li>"
            + "<li>Người thuê phải trả phí thuê 30 ngày 1 lần. Trong 60 ngày không trả phí thuê, sẽ bị khoá gian hàng và mất tiền cọc đã đặt.</li>"
            + "<li>Tiền cọc gian hàng sẽ được hoàn trả khi người thuê đủ điều kiện: đã hết hạn thuê và trả tiền thuê đầy đủ</li>"
            + "<li>Hệ thống sẽ nhắc nợ trả tiền thuê trong 3 lần. Sau 3 lần người thuê không trả tiền thuê gian hàng tự động bị khoá</li>"
            + "</ol>"
            +"Nếu bạn vẫn muốn tiếp tục giao dịch. Vui lòng nhấp vào liên kết bên dưới.<br><div style='text-align:center;'><a href='/taikhoan/giaodich/naptien/list.aspx' class='btn btn-success'>Nạp tiền ngay</a></div></p>",
        draggable: true,
        resizeable: true,
        overlay: true,
        closeButton: true
    });
    var draggable = true;
    var overlay = false;
    what.open();
}