function openPopupNapTien(Id) {
    PoupGiaoDich.SetContentUrl('/taikhoan/giaodich/naptien/chitiet.aspx?Id=' + Id);
    PoupGiaoDich.Show();
}