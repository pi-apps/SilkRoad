using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Database;
public partial class gianhang_chitietsanpham : PublicUser
{
    public pro_Product product { get; set; }
    public store_ShopRental shopRental { get; set; }
    public string strPrice { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        product = dbConnect.pro_Products.SingleOrDefault(n => n.Id == int.Parse(Request["ProductId"]) && n.IsAuction==true && n.IsAuctionPublic==true);
        if (product == null)
        {
            Response.Redirect("/san-dau-gia.html");
        }
        if (!IsPostBack)
        {
            product.ViewCount += 1;
            try { dbConnect.SubmitChanges(); } catch { }
        }
        var lstImage = product.pro_ProductImages.Where(n => n.IsStatus == true).OrderBy(n => n.NumOr);
        rptImages1.DataSource = lstImage;
        rptImages1.DataBind();
        if (lstImage.Count() > 1)
        {
            rptImages2.DataSource = lstImage;
            rptImages2.DataBind();
        }
        string UrlBuy = "";
        if (DateTime.Now <= product.AuctionEnd)
        {
            if (Session["PiglobalUser"] == null)
            {
                UrlBuy = "<a class='btn-mua' href='/member/dang-nhap.aspx'><i class='fa fa-gavel' aria-hidden='true'></i>&nbsp; Đấu giá</a>";
            }
            else
            {
                var customer1 = Session["PiglobalUser"] as store_Customer;
                var customer = dbConnect.store_Customers.Single(n => n.Id == customer1.Id);
                if (customer.AmountBalance >= product.PriceAuction)
                {
                    UrlBuy = "<a class='btn-mua' onclick='popupdatgiathau(" + product.Id + ");' href='javascript:void(0);'><i class='fa fa-gavel' aria-hidden='true'></i>&nbsp; Đấu giá</a>";
                }
                else
                {
                    UrlBuy = "<a class='btn-mua' href='javascript:void(0);' onclick='callPopupKhongDuTienDauGia(" + customer.AmountBalance.Value.ToString("#.##0") + ");'><i class='fa fa-gavel' aria-hidden='true'></i>&nbsp; Đấu giá</a>";
                }
            }
            ltrDatGiaThau.Text = UrlBuy;
        }
        var lstAction = dbConnect.pro_HistoryProductAuctions.Where(n => n.pro_ProductId == product.Id).OrderByDescending(n => n.PriceAuction);
        if (lstAction.Count() == 0)
        {
            ltrGiaDat.Text = "---";
            ltrNguoiDat.Text = "---";
            ltrThoiGian.Text = "---";
        }
        else
        {
            try
            {
                var auction = lstAction.First();
                ltrGiaDat.Text = auction.PriceAuction.Value.ToString("#,0.##") + "π";
                ltrNguoiDat.Text = auction.store_Customer.Code;
                ltrThoiGian.Text = auction.CreatedAt.Value.ToString("dd/MM/yyyy HH:mm:ss");
            }
            catch
            {
                ltrGiaDat.Text = "---";
                ltrNguoiDat.Text = "---";
                ltrThoiGian.Text = "---";
            }
        }
    }
}