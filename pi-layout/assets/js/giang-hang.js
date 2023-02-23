//filter
var url = $("#urlRequest").val();
$(document).on("change", ".ddlSort", function () {
    redirectUrl();
});
$(document).on("change", ".ddlPageSize", function () {
    redirectUrl();
});
$(document).on("change", ".ddlDanhMuc", function () {
    redirectUrl();
});
$(document).on("change", ".ddlVungMien", function () {
    redirectUrl();
});
$(document).on("change", ".pagging-cus-input .page-current", function () {
    pageCurrent = $(this).attr("data-pagecurrent");
    pageNo = $(this).attr("data-pageno");
    pageTotal = $(this).attr("data-page");
    page = $(this).val();
    if (isNaN(page))
    {
        
    } else
    {
        pageInt = parseInt(page);
        if (pageInt <1) { }
        else if (pageInt == pageCurrent) { }
        else if (pageInt > pageTotal) { }
        else
        {
            redirectPageUrl(page,pageNo);
        }
    }
    
});
$(document).on("click", ".btnSearch", function (e) {
    e.preventDefault();
    redirectUrl();
});
function redirectPageUrl(page,pageNo) {
    var sort = $(".ddlSort").val();
    var ps = $(".ddlPageSize").val();
    var cate = $(".ddlDanhMuc").val();
    var reg = $(".ddlVungMien").val();
    if ($(".txtKeyword").length > 0) {
        var urlKeyWord = $(".txtKeyword").val();
        window.location = url + "?key=" + urlKeyWord + "&cate=" + cate + "&reg=" + reg + "&ps=" + ps
            + "&sort=" + sort + "&p=" + page + "&g=" + pageNo;
    }
    else {
        window.location = url + "?cate=" + cate + "&reg=" + reg + "&ps=" + ps
            + "&sort=" + sort + "&p=" + page+"&g=" + pageNo;
    }
}
function redirectUrl() {
    var sort = $(".ddlSort").val();
    var ps = $(".ddlPageSize").val();
    var cate = $(".ddlDanhMuc").val();
    var reg = $(".ddlVungMien").val();
    if ($(".txtKeyword").length > 0) {
        var urlKeyWord = $(".txtKeyword").val();
        window.location = url + "?key=" + urlKeyWord + "&cate=" + cate + "&reg=" + reg+"&ps=" + ps
            + "&sort=" + sort;
    }
    else {
        window.location = url + "?cate=" + cate + "&reg=" + reg+"&ps=" + ps
            + "&sort=" + sort;
    }
}