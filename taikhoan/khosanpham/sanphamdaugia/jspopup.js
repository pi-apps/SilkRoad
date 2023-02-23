function openPoupImage(Id) {
    PoupImage.SetContentUrl('/taikhoan/khosanpham/quanlysanpham/detail/image.aspx?Id=' + Id);
    PoupImage.Show();
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