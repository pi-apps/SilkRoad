//filter
var url = $("#urlRequest").val();
$(document).on("change", ".ddlSort", function () {
    redirectUrl();
});
$(document).on("change", ".ddlPageSize", function () {
    redirectUrl();
});
$(document).on("change", ".pagging-cus-input .page-current", function () {
    pageCurrent = $(this).attr("data-pagecurrent");
    pageNo = $(this).attr("data-pageno");
    pageTotal = $(this).attr("data-page");
    page = $(this).val();
    if (isNaN(page)) {

    } else {
        pageInt = parseInt(page);
        if (pageInt < 1) { }
        else if (pageInt == pageCurrent) { }
        else if (pageInt > pageTotal) { }
        else {
            redirectPageUrl(page, pageNo);
        }
    }

});
$(document).on("click", ".btnSearch", function (e) {
    e.preventDefault();
    redirectUrl();
});
function redirectPageUrl(page, pageNo) {
    var sort = $(".ddlSort").val();
    var ps = $(".ddlPageSize").val();
    var cate = $(".ddlDanhMuc").val();
    if ($(".txtKeyword").length > 0) {
        var urlKeyWord = $(".txtKeyword").val();
        window.location = url + "?key=" + urlKeyWord + "&cate=" + cate + "&ps=" + ps
            + "&sort=" + sort + "&p=" + page + "&g=" + pageNo;
    }
    else {
        window.location = url + "?cate=" + cate + "&reg=" + reg + "&ps=" + ps
            + "&sort=" + sort + "&p=" + page + "&g=" + pageNo;
    }
}
function redirectUrl() {
    var sort = $(".ddlSort").val();
    var ps = $(".ddlPageSize").val();
    var cate = $(".ddlDanhMuc").val();
    if ($(".txtKeyword").length > 0) {
        var urlKeyWord = $(".txtKeyword").val();
        window.location = url + "?key=" + urlKeyWord + "&cate=" + cate + "&ps=" + ps
            + "&sort=" + sort;
    }
    else {
        window.location = url + "?cate=" + cate + "&reg=" + reg + "&ps=" + ps
            + "&sort=" + sort;
    }
}
function callPopupKhongDuTienDauGia(AmountBalance) {
    var what = new jPopup({
        title: "<h2>Thông báo piglobal.net</h2>",
        content: "<p>Số dư tài khoản của bạn <b>" + AmountBalance + "π</b> không đủ để giao dịch?<br>Xin vui lòng lưu ý rằng, sàn đấu giá có nội quy như sau:<br>"
            + "<ol><li>Người muốn tham gia đấu giá phải đặt cọc số Pi bằng với giá bằng giá khởi điểm mà người chủ sản phẩm đã niêm yết</li>"
            + "<li>Trong thời gian đấu giá. Ai trả giá cao nhất thì người đó sẽ được quyền mua sản phẩm ở giá mà mình đưa ra.</li>"
            + "<li>Giá đấu cao nhất và ID người dùng sẽ được thể hiện trên khung đấu giá</li>"
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
function popupdatgiathau(Id) {
    var what = new jPopup({
        title: "<h2>Đặt giá thầu</h2>",
        content: "Nhập giá thầu mà bạn muốn đặt vào ô bên dưới"
            + "<div class='form-group' style='margin-bottom:5px;'>"
            + "<input type='text' class='form-control' id='txtInputGiaThau' style='display:inline-block;width: 80%;margin-right: 5px;'>"
            + "<button type='button' data-id='" + Id + "' class='btn btn-warning btn-dat-gia-thau' style='margin-bottom:5px;'>Đặt giá</button>"
            + "</div>"
            + "<div class='alert alert-success' role='alert' id='div-popup-message-gia-thau'></div>",
        draggable: true,
        resizeable: true,
        overlay: true,
        closeButton: true
    });
    var draggable = true;
    var overlay = false;
    what.open();
}
$(document).ready(function () {
    //$("#bodyContentPlaceHolder_ddlDonVi").select2();
    //$(".txt1 select").select2();
    var cboxOptions = {
        width: '95%',
        maxWidth: '760px',
        inline: true,
        escKey: false, //escape key will not close
        overlayClose: false, //clicking background will not close
    }
    var cboxOptionsIframe = {
        width: '95%',
        iframe: true,
        maxWidth: '760px',
        height: '500px',
        maxHeight: '760px',
        escKey: false, //escape key will not close
        overlayClose: false, //clicking background will not close
    };
    $(".view-more-page").colorbox(cboxOptionsIframe);
    $(".iframe").colorbox(cboxOptions);
    $(".inline").colorbox(cboxOptions);
    $(window).resize(function () {
        $.colorbox.resize({
            width: window.innerWidth > parseInt(cboxOptions.maxWidth) ? cboxOptions.maxWidth : cboxOptions.width,
            height: window.innerHeight > parseInt(cboxOptions.maxHeight) ? cboxOptions.maxHeight : cboxOptions.height
        });
        $.colorbox.resize({
            width: window.innerWidth > parseInt(cboxOptionsIframe.maxWidth) ? cboxOptionsIframe.maxWidth : cboxOptionsIframe.width,
            height: window.innerHeight > parseInt(cboxOptionsIframe.maxHeight) ? cboxOptionsIframe.maxHeight : cboxOptionsIframe.height
        });
    });
});
$(document).on("click", ".btn-dat-gia-thau", function (e) {
    var id = $(this).attr("data-id");
    var value = $("#txtInputGiaThau").val();
    $("#div-popup-message-gia-thau").hide();
    if (value.trim().length == 0) {
        $("#txtInputGiaThau").attr("style", "border:1px solid red;display:inline-block;width: 80%;margin-right: 5px;");
    }
    else {
        if (isNaN(value)) {
            $("#txtInputGiaThau").attr("style", "border:1px solid red;display:inline-block;width: 80%;margin-right: 5px;");
        }
        else {
            $("#txtInputGiaThau").attr("style", "border:1px solid #ced4da;display:inline-block;width: 80%;margin-right: 5px;");
            $("#overlay-mua-hang").show();
            $.ajax({
                url: '/transaction/birdproduct.aspx',
                data: { productId: id, value: value }, //data
                type: 'POST',
                success: function (data) {
                    $("#txtInputGiaThau").val("");
                    $("#overlay-mua-hang").hide();
                    $("#div-popup-message-gia-thau").show();
                    if (data == "0") {
                        $("#div-popup-message-gia-thau").html("Chúc mừng bạn. Bạn đã đặt giá thầu thành công.");
                    }
                    else if (data == "1"){
                        $("#div-popup-message-gia-thau").html("Đã hết thời gian bỏ thầu. Sản phẩm đấu giá đã kết thúc");
                    } 
                    else if (data == "2") {
                        $("#div-popup-message-gia-thau").html("Số dư của bạn không đủ để đặt giá thầu.");
                    }
                    else if (data == "3") {
                        $("#div-popup-message-gia-thau").html("Giá thầu bạn đặt đang nhỏ hơn giá thầu gần nhất.");
                    }
                },
                error: function (jxhr, msg, err) {
                }
            });
        }
    }
});