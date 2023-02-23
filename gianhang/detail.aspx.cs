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
        rptVideo.DataSource = seo.store_Videos.Where(n => n.IsStatus == true && n.IsHome == true).OrderBy(n => n.NumOr);
        rptVideo.DataBind();
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
        rptCategory.DataSource = dbConnect.getCategoryByShopRentalId(seo.Id).ToList();
        rptCategory.DataBind();

        var lstProductPromotion = seo.pro_Products
            .Where(n => n.IsStatus == true && n.PriceSell > 0 && (n.PriceSell < n.Price) &&n.IsAuction==false)
            .OrderByDescending(n => n.PriceSell)
            .Take(8).Select(n => new
            {
                n.Id,
                Name = n.ProductName,
                n.PricePercent,
                UrlSeo = n.pro_Category.UrlSeo,
                CategoryName = n.pro_Category.Name,
                CategoryId = n.pro_Category.Id,
                n.Image
            });
        rptProductKM.DataSource = lstProductPromotion;
        rptProductKM.DataBind();
        var lstProductNew = seo.pro_Products.Where(n => n.IsStatus == true && n.IsAuction == false).OrderByDescending(n => n.Id)
            .Take(8).Select(n => new
            {
                n.Id,
                Name = n.ProductName,
                n.PricePercent,
                UrlSeo = n.pro_Category.UrlSeo,
                CategoryName = n.pro_Category.Name,
                CategoryId = n.pro_Category.Id,
                n.Image
            });
        rptProductNew.DataSource = lstProductNew;
        rptProductNew.DataBind();

        rptImage.DataSource = seo.store_ShopGalleries.Where(n => n.IsStatus == true && n.IsHome == true).OrderBy(n => n.NumOr);
        rptImage.DataBind();

        rptNewLeft.DataSource = seo.store_ShopNews.Where(n => n.IsStatus == true)
            .Where(n => n.IsHome == true &&n.IsTop==true).Take(1);
        rptNewLeft.DataBind();

        rptNewRight.DataSource = seo.store_ShopNews.Where(n => n.IsStatus == true)
            .Where(n => n.IsHome == true && n.IsRight == true).Take(3);
        rptNewRight.DataBind();
    }

    protected void rptProductKM_ItemDataBound(object sender, RepeaterItemEventArgs e)
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

    protected void rptProductNew_ItemDataBound(object sender, RepeaterItemEventArgs e)
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