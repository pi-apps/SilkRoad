function openPoupQuantity(Id) {
    PoupQuantity.SetContentUrl('/prodraftadmin/khosanpham/quanlysanpham/khovagia/detail/quantity.aspx?Id=' + Id);
    PoupQuantity.Show();
}
function openPoupImage(Id) {
    PoupImage.SetContentUrl('/prodraftadmin/khosanpham/quanlysanpham/khovagia/detail/image.aspx?Id=' + Id);
    PoupImage.Show();
}
function openPoupVideo(Id) {
    PoupVideo.SetContentUrl('/prodraftadmin/khosanpham/quanlysanpham/khovagia/detail/video.aspx?Id=' + Id);
    PoupVideo.Show();
}