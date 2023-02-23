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
    public string UrlBuy { get; set; }
    public sys_Config sys_Config { get; set; }
    public double ScoreProduct { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        ScoreProduct = 0.0;
        product = dbConnect.pro_Products.Single(n => n.Id == int.Parse(Request["productId"].Split(',')[0]));
        shopRental = product.store_ShopRental;
        var store_ShopRanking = dbConnect.store_ShopRankings
            .Where(n=>n.pro_ProductId==product.Id)
            .Where(n => n.store_ShopRentalId == shopRental.Id);
        if (store_ShopRanking.Count() > 0)
        {
            ScoreProduct = (double)store_ShopRanking.Sum(n => n.Score).Value / (double)store_ShopRanking.Count();
        }
        sys_Config = dbConnect.sys_Configs.Single(n => n.Id == 1);
        strPrice = "";
        if (!IsPostBack)
        {
            hdfUrl.Value = urlDomainShare + Request.RawUrl;
            product.ViewCount += 1;
            try { dbConnect.SubmitChanges(); } catch { }
            if (Session["PiglobalUser"] == null)
            {
                Panel1.Visible = false;
            }
            else
            {
                Panel1.Visible = true;
            }
        }
        if (product.PriceSell == 0)
        {
            strPrice = "<p class='offer-price-cus offer-price mb-0'><span class='text-success'>Liên hệ</span></p>";
        }
        else if (product.PriceSell == product.Price)
        {
            strPrice = "<p class='offer-price-cus offer-price mb-0'><span class='text-success'>" + product.PriceSell.Value.ToString("#,##0") + "π</span></p>";
        }
        else if (product.PriceSell < product.Price)
        {
            strPrice = "<p class='offer-price-cus offer-price mb-0'><span class='text-success'>" + product.PriceSell.Value.ToString("#,##0") + "π</span><span class='regular-price'>" + product.Price.Value.ToString("#,##0") + "π</span></p>";
        }
        #region Buy Product
        if (Session["PiglobalUser"] == null)
        {
            UrlBuy = "<a href='/member/dang-nhap.aspx'><button type='button' class='btn btn-secondary btn-lg'><i class='fa fa-cart-arrow-down' aria-hidden='true'></i>&nbsp;Mua hàng</button></a>";
        }
        else 
        {
            var customer = Session["PiglobalUser"] as store_Customer;
            if (customer.AmountBalance >= sys_Config.PurchaseFee)
            {
                UrlBuy = "<a onclick='callPopupXacNhanGiaoDich("+ sys_Config.PurchaseFee+ ","+shopRental.Id+","+product.Id+");' title='Đặt hàng'><button type='button' class='btn btn-secondary btn-lg'><i class='fa fa-cart-arrow-down' aria-hidden='true'></i>&nbsp;Mua hàng</button></a>";
            }
            else
            {
                UrlBuy = "<a href='javascript:void(0);' onclick='callPopupKhongDuTien();'><button type='button' class='btn btn-secondary btn-lg'><i class='fa fa-cart-arrow-down' aria-hidden='true'></i>&nbsp;Mua hàng</button></a>";
            }
        }
        
        #endregion
        var lstImage = product.pro_ProductImages.Where(n => n.IsStatus == true).OrderBy(n => n.NumOr);
        rptImages1.DataSource = lstImage;
        rptImages1.DataBind();
        if (lstImage.Count() > 1)
        {
            rptImages2.DataSource = lstImage;
            rptImages2.DataBind();
        }
        //san pham cung loai
        var lstCungLoai= shopRental.pro_Products
            .Where(n => n.pro_CategoryId == product.pro_CategoryId)
            .Where(n => n.IsStatus == true).Where(n => n.Id != product.Id)
            .OrderByDescending(n => dbConnect.GetNewId()).Take(12).Select(n => new
            {
                n.Id,
                Name = n.ProductName,
                n.PricePercent,
                UrlSeo = n.pro_Category.UrlSeo,
                CategoryName = n.pro_Category.Name,
                CategoryId = n.pro_Category.Id,
                n.Image
            });
        rptProductKM.DataSource = lstCungLoai;
        rptProductKM.DataBind();
        //san pham cung loai
        var lstGoiY = shopRental.pro_Products
            .Where(n => n.IsStatus == true).Where(n => n.Id != product.Id)
            .OrderByDescending(n => n.Id).Take(12).Select(n => new
            {
                n.Id,
                Name = n.ProductName,
                n.PricePercent,
                UrlSeo = n.pro_Category.UrlSeo,
                CategoryName = n.pro_Category.Name,
                CategoryId = n.pro_Category.Id,
                n.Image
            });
        rptProductNew.DataSource = lstGoiY;
        rptProductNew.DataBind();
        //lay binh luan san pham
        var lstBinhLuan = product
            .pro_ProductComments.Where(n => n.IsStatus == true)
            .OrderByDescending(n => n.Id)
            .Select(n => new
            {
                n.Id,
                n.Comment,
                n.store_Customer.FullName,
                n.CreatedAt,
                n.store_Customer.Avatar
            });
        if (lstBinhLuan.Count() > 0) { Panel2.Visible = true; }
        rptBinhLuan.DataSource = lstBinhLuan;
        rptBinhLuan.DataBind();
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

    protected void btnSendBL_Click(object sender, EventArgs e)
    {
        product = dbConnect.pro_Products.Single(n => n.Id == int.Parse(Request["productId"].Split(',')[0]));
        if (Session["PiglobalUser"] != null)
        {
            var customer = Session["PiglobalUser"] as store_Customer;
            string ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
            var comment = new pro_ProductComment()
            {
                store_CustomerId = customer.Id,
                FullName=customer.FullName,
                Email= customer.Email,
                CreatedBy= customer.Email,
                Image= customer.Avatar,
                Address= customer.Address,
                IpRate= ip,
                IsStatus=false,
                Comment=txtComment.Text,
                Phone= customer.Phone,
                IsDeleted=false,
                pro_ProductId=product.Id,
                ScoreRate=1,
                CreatedAt=DateTime.Now
            };
            dbConnect.pro_ProductComments.InsertOnSubmit(comment);
            dbConnect.SubmitChanges();
            Session["binhluansp"] = "Thêm thành công";
        }
        else { }
        Response.Redirect(hdfUrl.Value);
    }
}