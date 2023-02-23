$(document).on("click", ".menu-cate-left .icon-add-1", function (e) {
    $(this).next().show();
    $(this).find("i").attr("class", "fa fa-angle-up float-right");
    $(this).attr("class", "icon-sub-1 toggle");
});
$(document).on("click", ".menu-cate-left .icon-sub-1", function (e) {
    $(this).next().hide();
    $(this).find("i").attr("class", "fa fa-angle-down float-right");
    $(this).attr("class", "icon-add-1 toggle");
});
$(document).ready(function () {
    $('.aside-toggle-btn').click(function () {
        $(this).toggleClass('move');
        $(this).next().toggleClass('show');
    });
});

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
    window.location = url + "?ps=" + ps
        + "&sort=" + sort + "&p=" + page + "&g=" + pageNo;
}
function redirectUrl() {
    var sort = $(".ddlSort").val();
    var ps = $(".ddlPageSize").val();
    window.location = url + "?ps=" + ps
        + "&sort=" + sort;
}