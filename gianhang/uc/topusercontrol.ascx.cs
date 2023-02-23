using Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gianhang_UC_topUserControl : PublicUserControl
{
    public store_ShopRental seo { get; set; }
    public store_ShopBanner store_ShopBanner { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        seo = dbConnect.store_ShopRentals.Single(n => n.Id == int.Parse(Request["shopRentalId"]));
        store_ShopBanner = seo.store_ShopBanners.Where(b => b.IsStatus == true).OrderByDescending(n => n.Id).FirstOrDefault();
        if (store_ShopBanner == null)
        {
            store_ShopBanner = new store_ShopBanner();
            store_ShopBanner.Image = seo.Banner;
            store_ShopBanner.Name = seo.Name;
            store_ShopBanner.Link = "";
        }
        var lstCategoryShop = dbConnect.getCategoryByShopRentalId(seo.Id).ToList();
        var lstCategory = new List<pro_Category>();
        foreach (var item in lstCategoryShop)
        {
            lstCategory.Add(dbConnect.pro_Categories.Single(n => n.Id == item.Id));
        }
        //danh mục
        var lstCategoryProduct = lstCategory.Where(n => n.IsStatus == true && n.IsDeleted == false && n.Parent == 0);
        rptCateProDM.DataSource = lstCategoryProduct.OrderBy(n => n.NumOr)
            .Select(n => new {
                n.Id,n.Icon,
                n.Name,
                shopRentalId = seo.Id,
                n.UrlSeo,
                Count = dbConnect.pro_Categories.Where(m => n.IsStatus == true && m.IsDeleted == false && m.Parent == n.Id).Count()
            });
        rptCateProDM.DataBind();
        string url = Request.Url.ToString();
        hdfMenuGianhang.Value = "1";
        if (url.Contains("sanphamgianhang.aspx"))
        {
            hdfMenuGianhang.Value = "3";
        }
        else if (url.Contains("sanpham.aspx"))
        {
            hdfMenuGianhang.Value = "3";
        }
        else if (url.Contains("sanphamall.aspx"))
        {
            hdfMenuGianhang.Value = "3";
        }
        else if (url.Contains("sanphamkhuyenmai.aspx"))
        {
            hdfMenuGianhang.Value = "5";
        }
        else if (url.Contains("gioithieu.aspx"))
        {
            hdfMenuGianhang.Value = "2";
        }
        else if (url.Contains("thuvienhinh.aspx"))
        {
            hdfMenuGianhang.Value = "4";
        }
    }
}