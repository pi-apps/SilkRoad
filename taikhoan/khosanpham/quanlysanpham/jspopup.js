function openPopupEditCategory(Id) {
    popupEditCategory.SetContentUrl('/taikhoan/khosanpham/quanlysanpham/danhmuc/list.aspx?Id=' + Id);
    popupEditCategory.Show();
}
function openPopupEditTag(Id) {
    PopupEditTag.SetContentUrl('/taikhoan/khosanpham/quanlysanpham/tukhoa/list.aspx?Id=' + Id);
    PopupEditTag.Show();
}
function openPopupEditProdutRelated(Id) {
    PopupEditProdutRelated.SetContentUrl('/taikhoan/khosanpham/quanlysanpham/sanphammuakem/list.aspx?Id=' + Id);
    PopupEditProdutRelated.Show();
}
function openPopupEditProdutSameType(Id) {
    PopupEditProdutSameType.SetContentUrl('/taikhoan/khosanpham/quanlysanpham/sanphamcungloai/list.aspx?Id=' + Id);
    PopupEditProdutSameType.Show();
}
function openPopupImportProdut(Id) {
    popupImportProduct.SetContentUrl('/taikhoan/khosanpham/quanlysanpham/import.aspx?Id=' + Id);
    popupImportProduct.Show();
}
function openPoupImage(Id) {
    PoupImage.SetContentUrl('/taikhoan/khosanpham/quanlysanpham/detail/image.aspx?Id=' + Id);
    PoupImage.Show();
}
function openPoupVideo(Id) {
    PoupVideo.SetContentUrl('/taikhoan/khosanpham/quanlysanpham/detail/video.aspx?Id=' + Id);
    PoupVideo.Show();
}