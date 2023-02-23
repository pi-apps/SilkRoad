using Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gianhang_Default : PublicUser
{
    public other_Webpage seo { get; set; }
    public store_ShopRental shopRental { get; set; }
    public store_ShopBanner store_ShopBanner { get; set; }
    public double minPrice { get; set; }
    public double maxPrice { get; set; }
    public double minPriceRequest { get; set; }
    public double maxPriceRequest { get; set; }
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
        seo = dbConnect.other_Webpages.Single(n => n.Id == 68);
        shopRental = dbConnect.store_ShopRentals.Single(n => n.Id == int.Parse(Request["shopRentalId"]));
        store_ShopBanner = shopRental.store_ShopBanners.Where(b => b.IsStatus == true).OrderByDescending(n => n.Id).FirstOrDefault();
        if (store_ShopBanner == null)
        {
            store_ShopBanner = new store_ShopBanner();
            store_ShopBanner.Image = shopRental.Banner;
            store_ShopBanner.Name = shopRental.Name;
            store_ShopBanner.Link = "";
        }
        if (!IsPostBack)
        {
            seo.ViewCount += 1;
            try { dbConnect.SubmitChanges(); } catch { }
        }
        minPrice = 0; maxPrice = 0;
        if (!IsPostBack)
        {
            ddlSort.DataSource = SortProductModelUtils.getListSortProduct();
            ddlSort.DataValueField = "Value";
            ddlSort.DataTextField = "Text";
            ddlSort.DataBind();
            ddlSort.SelectedValue = "5";

            ddlPageSize.DataSource = SortProductModelUtils.getListPageSizeProduct();
            ddlPageSize.DataValueField = "Value";
            ddlPageSize.DataTextField = "Text";
            ddlPageSize.DataBind();
            ddlPageSize.SelectedValue = "27";
        }
        if (Request["ps"] != null) { ddlPageSize.SelectedValue = Request["ps"] + ""; }
        if (Request["sort"] != null) { ddlSort.SelectedValue = Request["sort"] + ""; }
        
        var items = dbConnect.proProductByShop(shopRental.Id, int.Parse(ddlSort.SelectedValue))
                       .Distinct().ToList();
        Pager p = new Pager(int.Parse(ddlPageSize.SelectedValue), items.Distinct().Count(), 5);
        Literal1.Text = p.NavigationCategoryNewPublic2();
        rptProduct.DataSource = items.Distinct().Skip(p.PageSkip).Take(p.PageSize);
        rptProduct.DataBind();
    }

    protected void rptProduct_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var hdfId = e.Item.FindControl("hdfId") as HiddenField;
        var pro = dbConnect.pro_Products.Single(n => n.Id == int.Parse(hdfId.Value));
        string href = urlDomainShare + "/san-pham/" + pro.ProductName.RemoveSymbol().ToLower() + "-" + pro.Id + ".html";
        var ltrJsonLDT = e.Item.FindControl("ltrJsonLDT") as Literal;
        var ltrBadge = e.Item.FindControl("ltrBadge") as Literal;
        if (pro.PricePercent > 0)
        {
            ltrBadge.Text = "<span class='badge badge-success'>" + pro.PricePercent + "% OFF</span>";
        }
        var ltrPrice = e.Item.FindControl("ltrPrice") as Literal;
        string strPrice = "";
        if (pro.PriceSell == 0)
        {
            strPrice = "<p class='offer-price mb-0'>Liên hệ</p>";
        }
        else if (pro.PriceSell == pro.Price)
        {
            strPrice = "<p class='offer-price mb-0'>" + pro.PriceSell.Value.ToString("#,##0") + "π<br/></p>";
        }
        else if (pro.PriceSell < pro.Price)
        {
            strPrice = "<p class='offer-price mb-0'>" + pro.PriceSell.Value.ToString("#,##0") + "π <i class='fa fa-tag' aria-hidden='true'></i><br><span class='regular-price'>" + pro.Price.Value.ToString("#,##0") + "π</span></p>";
            //strPrice = "<del><span class='woocommerce-Price-amount amount'>" + pro.Price.Value.ToString("#,##0") + "&nbsp;<span class='woocommerce-Price-currencySymbol'>₫</span></span></del> <ins><span class='woocommerce-Price-amount amount'>" + pro.PriceSell.Value.ToString("#,##0") + "&nbsp;<span class='woocommerce-Price-currencySymbol'>₫</span></span></ins>";
        }
        ltrPrice.Text = strPrice;
        //ltrBuyProduct
        var sys_Config = dbConnect.sys_Configs.Single(n => n.Id == 1);
        var ltrBuyProduct = e.Item.FindControl("ltrBuyProduct") as Literal;
        string UrlBuy = "";
        if (Session["PiglobalUser"] == null)
        {
            UrlBuy = "<a href='/member/dang-nhap.aspx'><button type='button' class='btn btn-secondary btn-lg'><i class='fa fa-cart-arrow-down' aria-hidden='true'></i>&nbsp;Mua hàng</button></a>";
        }
        else
        {
            var customer1 = Session["PiglobalUser"] as store_Customer;
            var customer = dbConnect.store_Customers.Single(n => n.Id == customer1.Id);
            if (customer.AmountBalance >= sys_Config.PurchaseFee)
            {
                UrlBuy = "<a onclick='callPopupXacNhanGiaoDich(" + sys_Config.PurchaseFee + "," + pro.store_ShopRentalId + "," + pro.Id + ");' title='Đặt hàng'><button type='button' class='btn btn-secondary btn-lg'><i class='fa fa-cart-arrow-down' aria-hidden='true'></i>&nbsp;Mua hàng</button></a>";
            }
            else
            {
                UrlBuy = "<a href='javascript:void(0);' onclick='callPopupKhongDuTien();'><button type='button' class='btn btn-secondary btn-lg'><i class='fa fa-cart-arrow-down' aria-hidden='true'></i>&nbsp;Mua hàng</button></a>";
            }
        }
        ltrBuyProduct.Text = UrlBuy;
    }
}