function DisplayInfoEmployee(Id) {
    popupThongTinNhanVien.SetContentUrl('/prodraftadmin/congty/nhanvien/EmployeeInfo.aspx?Id=' + Id);
    popupThongTinNhanVien.Show();
}
function DisplayInfoAccount(Id) {
    popupTaiKhoanNhanVien.SetContentUrl('/prodraftadmin/congty/nhanvien/EmployeeAccount.aspx?Id=' + Id);
    popupTaiKhoanNhanVien.Show();
}