using Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gianhang_Default : PublicUser
{
    public store_ShopRental seo { get; set; }
    public store_ShopBanner store_ShopBanner { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        
        try
        {
            urlRequest.Value = urlDomainShare + Request.RawUrl.Substring(0, Request.RawUrl.IndexOf('?'));
        }
        catch
        {
            urlRequest.Value = urlDomainShare + Request.RawUrl;
        }
        seo = dbConnect.store_ShopRentals.Single(n => n.Id == int.Parse(Request["shopRentalId"]));
        store_ShopBanner = seo.store_ShopBanners.Where(b => b.IsStatus == true).OrderByDescending(n => n.Id).FirstOrDefault();
        if (store_ShopBanner == null)
        {
            store_ShopBanner = new store_ShopBanner();
            store_ShopBanner.Image = seo.Banner;
            store_ShopBanner.Name = seo.Name;
            store_ShopBanner.Link = "";
        }
        if (!IsPostBack)
        {
            seo.ViewCount += 1;
            try { dbConnect.SubmitChanges(); } catch { }
        }
        rptGioiThieu.DataSource = seo.store_ShopAboutUs.Where(n => n.IsStatus == true);
        rptGioiThieu.DataBind();

        
        rptImage.DataSource = seo.store_ShopGalleries.Where(n => n.IsStatus == true && n.IsHome == true).OrderBy(n => n.NumOr);
        rptImage.DataBind();
    }
}