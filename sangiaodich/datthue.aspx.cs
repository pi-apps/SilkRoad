using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Database;
public class ModelDatThueGianHang
{
    public string STT { get; set; }
    public string HinhThuc { get; set; }
    public string NgayThanhToan { get; set; }
    public string SoTien { get; set; }
}
public partial class gianhang_chitietsanpham : PrivateUser
{
    public sys_Config sys_Config { get; set; }
    public other_Webpage seo { get; set; }
    public store_Shop store_Shop { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        seo = dbConnect.other_Webpages.Single(n => n.Id == 70);
        store_Shop = dbConnect.store_Shops.Single(n => n.Id == int.Parse(Request["Id"].Split(',')[0]));
        sys_Config = dbConnect.sys_Configs.Single(n => n.Id == 1);
        List<ModelDatThueGianHang> lstChiTiet = new List<ModelDatThueGianHang>();
        lstChiTiet.Add(new ModelDatThueGianHang() {
            STT = "1",
            HinhThuc = "Đặt cọc thuê gian hàng",
            NgayThanhToan = "Ngay lập tức",
            SoTien = (store_Shop.Price * sys_Config.MonthDeposit).Value.ToString("0.##")+ "π",  
        });
        for (int i = 1; i <= sys_Config.ShopRentalCycle; i++)
        {
            if (i == 1)
            {
                lstChiTiet.Add(new ModelDatThueGianHang()
                {
                    STT = (i + 1).ToString(),
                    HinhThuc = "Phí thuê gian hàng",
                    NgayThanhToan = "Ngay lập tức",
                    SoTien = (store_Shop.Price).Value.ToString("0.##") + "π",
                });
            }
            else
            {
                lstChiTiet.Add(new ModelDatThueGianHang()
                {
                    STT = (i + 1).ToString(),
                    HinhThuc = "Phí thuê gian hàng",
                    NgayThanhToan = DateTime.Now.AddMonths(i).ToString("dd/MM/yyyy"),
                    SoTien = (store_Shop.Price).Value.ToString("0.##") + "π",
                });
            }
        }
        rptThongTinThanhToan.DataSource = lstChiTiet;
        rptThongTinThanhToan.DataBind();
        if (!IsPostBack)
        {
            hdfUrl.Value = urlDomainShare + Request.RawUrl;
            seo.ViewCount += 1;
            try { dbConnect.SubmitChanges(); } catch { }
        }

    }
}