function openPoupImage(Id) {
    PoupImage.SetContentUrl('/taikhoan/cuahang/chitietgianhang/hinhanh/image.aspx?Id=' + Id);
    PoupImage.Show();
}
function openPoupVideo(Id) {
    PoupVideo.SetContentUrl('/taikhoan/cuahang/chitietgianhang/video/video.aspx?Id=' + Id);
    PoupVideo.Show();
}
function openPoupContact(Id) {
    PoupVideo.SetContentUrl('/taikhoan/cuahang/chitietgianhang/lienlac/lienlac.aspx?Id=' + Id);
    PoupVideo.Show();
}