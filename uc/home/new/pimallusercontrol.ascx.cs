using Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_home_PartnerUserControl : PublicUserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //rptPartner.DataSource = dbConnect.setting_Partners.Where(n => n.IsStatus == true).OrderBy(n => n.NumOr);
        //rptPartner.DataBind();
        //load product
        if (!IsPostBack)
        {
            ddlSort.DataSource = SortProductModelUtils.getListSort();
            ddlSort.DataValueField = "Value";
            ddlSort.DataTextField = "Text";
            ddlSort.DataBind();
            ddlSort.SelectedValue = "7";


            ddlVungMien.DataSource = dbConnect.tblRegions.Where(n => n.IsStatus == true);
            ddlVungMien.DataValueField = "Id";
            ddlVungMien.DataTextField = "Name";
            ddlVungMien.DataBind();
            ddlVungMien.Items.Insert(0, new ListItem("Vùng miền", ""));

            ProductCategorysUtils.loadDropDownListPublic(ddlDanhMuc);
        }
        if (Request["cate"] != null) { ddlDanhMuc.SelectedValue = Request["cate"] + ""; }
        if (Request["reg"] != null) { ddlVungMien.SelectedValue = Request["reg"] + ""; }
        //if (Request["ps"] != null) { ddlPageSize.SelectedValue = Request["ps"] + ""; }
        if (Request["sort"] != null) { ddlSort.SelectedValue = Request["sort"] + ""; }
        if (Request["key"] != null) { txtKeyword.Text = Request["key"] + ""; }
        string cateIds = "";
        int reg = 0;
        if (ddlVungMien.SelectedValue != "") { reg = int.Parse(ddlVungMien.SelectedValue); }
        try
        {
            var pro_Category = dbConnect.pro_Categories.Single(n => n.Id == int.Parse(ddlDanhMuc.SelectedValue));
            var categoryResults = dbConnect.proGetChildLevelCategory(pro_Category.Id, pro_Category.Name).ToList();
            cateIds = string.Join(",", categoryResults.Distinct().Select(n => n.child).Distinct());
        }
        catch { }
        var items = dbConnect.getListShop(txtKeyword.Text, reg, cateIds, int.Parse(ddlSort.SelectedValue))
            .Distinct()
            .Select(n => new
            {
                n.Id,
                n.Name,
                n.Price,
                n.Banner,n.Image,
                n.StatusCss,
                n.StatusName,
                n.Code,
                n.ExchangeRate,
                n.Summary,
                n.RankingCount
            })
            .ToList().Distinct();
        Pager p = new Pager(12, items.Distinct().Count(), 5);
        rptGianHang.DataSource = items.Distinct().Skip(p.PageSkip).Take(p.PageSize);
        rptGianHang.DataBind();
        rptGianhang2.DataSource = items.Distinct().Skip(12).Take(p.PageSize);
        rptGianhang2.DataBind();
        //Just for you
        rptProductJustForYou.DataSource = dbConnect.getSanPhamDanhChoBan();
        rptProductJustForYou.DataBind();
        //dong thuan gia
        rptSanPhamDongThuan.DataSource = dbConnect.getSanPhamDongThuanPiGiaCao();
        rptSanPhamDongThuan.DataBind();
        //moi len ke
        var lstMoiLenKe = dbConnect.getSanPhamMoiLenKe().ToList();
        rptMoiLenKe01.DataSource= lstMoiLenKe.Skip(0).Take(12);
        rptMoiLenKe01.DataBind();
        rptMoiLenKe02.DataSource = lstMoiLenKe.Skip(12);
        rptMoiLenKe02.DataBind();
    }

    protected void rptGianHang_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

    }

    protected void rptGianhang2_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

    }

    protected void rptProductJustForYou_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var hdfId = e.Item.FindControl("hdfId") as HiddenField;
        var pro = dbConnect.pro_Products.Single(n => n.Id == int.Parse(hdfId.Value));
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
        //Noi Ban
        var ltrNoiBan = e.Item.FindControl("ltrNoiBan") as Literal;
        var strNoiBan="";
        try { strNoiBan = pro.store_ShopRental.store_ShopLocations.Where(n => n.IsStatus == true).First().tblTinh.Name; }
        catch { strNoiBan = ""; }
        ltrNoiBan.Text = strNoiBan;
        //ltrBuyProduct
        var sys_Config = dbConnect.sys_Configs.Single(n => n.Id == 1);
        var ltrBuyProduct = e.Item.FindControl("ltrBuyProduct") as Literal;
        string UrlBuy = "<a onclick='addtoCart(" + sys_Config.PurchaseFee + "," + pro.store_ShopRentalId + "," + pro.Id + ");' title='Đặt hàng'><button type='button' class='btn btn-secondary btn-lg'><i class='fa fa-cart-arrow-down' aria-hidden='true'></i>&nbsp;Mua hàng</button></a>";
        //if (Session["PiglobalUser"] == null)
        //{
        //    UrlBuy = "<a href='/member/dang-nhap.aspx'><button type='button' class='btn btn-secondary btn-lg'><i class='fa fa-cart-arrow-down' aria-hidden='true'></i>&nbsp;Mua hàng</button></a>";
        //}
        //else
        //{
        //    var customer1 = Session["PiglobalUser"] as store_Customer;
        //    var customer = dbConnect.store_Customers.Single(n => n.Id == customer1.Id);
        //    if (customer.AmountBalance >= sys_Config.PurchaseFee)
        //    {
        //        UrlBuy = "<a onclick='callPopupXacNhanGiaoDich(" + sys_Config.PurchaseFee + "," + pro.store_ShopRentalId + "," + pro.Id + ");' title='Đặt hàng'><button type='button' class='btn btn-secondary btn-lg'><i class='fa fa-cart-arrow-down' aria-hidden='true'></i>&nbsp;Mua hàng</button></a>";
        //    }
        //    else
        //    {
        //        UrlBuy = "<a href='javascript:void(0);' onclick='callPopupKhongDuTien();'><button type='button' class='btn btn-secondary btn-lg'><i class='fa fa-cart-arrow-down' aria-hidden='true'></i>&nbsp;Mua hàng</button></a>";
        //    }
        //}
        ltrBuyProduct.Text = UrlBuy;
    }

    protected void rptSanPhamDongThuan_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var hdfId = e.Item.FindControl("hdfId") as HiddenField;
        var pro = dbConnect.pro_Products.Single(n => n.Id == int.Parse(hdfId.Value));
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
        //Noi Ban
        var ltrNoiBan = e.Item.FindControl("ltrNoiBan") as Literal;
        var strNoiBan = "";
        try { strNoiBan = pro.store_ShopRental.store_ShopLocations.Where(n => n.IsStatus == true).First().tblTinh.Name; }
        catch { strNoiBan = ""; }
        ltrNoiBan.Text = strNoiBan;
        //ltrBuyProduct
        var sys_Config = dbConnect.sys_Configs.Single(n => n.Id == 1);
        var ltrBuyProduct = e.Item.FindControl("ltrBuyProduct") as Literal;
        string UrlBuy = "<a onclick='addtoCart(" + sys_Config.PurchaseFee + "," + pro.store_ShopRentalId + "," + pro.Id + ");' title='Đặt hàng'><button type='button' class='btn btn-secondary btn-lg'><i class='fa fa-cart-arrow-down' aria-hidden='true'></i>&nbsp;Mua hàng</button></a>";
        //if (Session["PiglobalUser"] == null)
        //{
        //    UrlBuy = "<a href='/member/dang-nhap.aspx'><button type='button' class='btn btn-secondary btn-lg'><i class='fa fa-cart-arrow-down' aria-hidden='true'></i>&nbsp;Mua hàng</button></a>";
        //}
        //else
        //{
        //    var customer1 = Session["PiglobalUser"] as store_Customer;
        //    var customer = dbConnect.store_Customers.Single(n => n.Id == customer1.Id);
        //    if (customer.AmountBalance >= sys_Config.PurchaseFee)
        //    {
        //        UrlBuy = "<a onclick='callPopupXacNhanGiaoDich(" + sys_Config.PurchaseFee + "," + pro.store_ShopRentalId + "," + pro.Id + ");' title='Đặt hàng'><button type='button' class='btn btn-secondary btn-lg'><i class='fa fa-cart-arrow-down' aria-hidden='true'></i>&nbsp;Mua hàng</button></a>";
        //    }
        //    else
        //    {
        //        UrlBuy = "<a href='javascript:void(0);' onclick='callPopupKhongDuTien();'><button type='button' class='btn btn-secondary btn-lg'><i class='fa fa-cart-arrow-down' aria-hidden='true'></i>&nbsp;Mua hàng</button></a>";
        //    }
        //}
        ltrBuyProduct.Text = UrlBuy;
    }

    protected void rptMoiLenKe01_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var hdfId = e.Item.FindControl("hdfId") as HiddenField;
        var pro = dbConnect.pro_Products.Single(n => n.Id == int.Parse(hdfId.Value));
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
        //Noi Ban
        var ltrNoiBan = e.Item.FindControl("ltrNoiBan") as Literal;
        var strNoiBan = "";
        try { strNoiBan = pro.store_ShopRental.store_ShopLocations.Where(n => n.IsStatus == true).First().tblTinh.Name; }
        catch { strNoiBan = ""; }
        ltrNoiBan.Text = strNoiBan;
        //ltrBuyProduct
        var sys_Config = dbConnect.sys_Configs.Single(n => n.Id == 1);
        var ltrBuyProduct = e.Item.FindControl("ltrBuyProduct") as Literal;
        string UrlBuy = "<a onclick='addtoCart(" + sys_Config.PurchaseFee + "," + pro.store_ShopRentalId + "," + pro.Id + ");' title='Đặt hàng'><button type='button' class='btn btn-secondary btn-lg'><i class='fa fa-cart-arrow-down' aria-hidden='true'></i>&nbsp;Mua hàng</button></a>";
        //if (Session["PiglobalUser"] == null)
        //{
        //    UrlBuy = "<a href='/member/dang-nhap.aspx'><button type='button' class='btn btn-secondary btn-lg'><i class='fa fa-cart-arrow-down' aria-hidden='true'></i>&nbsp;Mua hàng</button></a>";
        //}
        //else
        //{
        //    var customer1 = Session["PiglobalUser"] as store_Customer;
        //    var customer = dbConnect.store_Customers.Single(n => n.Id == customer1.Id);
        //    if (customer.AmountBalance >= sys_Config.PurchaseFee)
        //    {
        //        UrlBuy = "<a onclick='callPopupXacNhanGiaoDich(" + sys_Config.PurchaseFee + "," + pro.store_ShopRentalId + "," + pro.Id + ");' title='Đặt hàng'><button type='button' class='btn btn-secondary btn-lg'><i class='fa fa-cart-arrow-down' aria-hidden='true'></i>&nbsp;Mua hàng</button></a>";
        //    }
        //    else
        //    {
        //        UrlBuy = "<a href='javascript:void(0);' onclick='callPopupKhongDuTien();'><button type='button' class='btn btn-secondary btn-lg'><i class='fa fa-cart-arrow-down' aria-hidden='true'></i>&nbsp;Mua hàng</button></a>";
        //    }
        //}
        ltrBuyProduct.Text = UrlBuy;
    }

    protected void rptMoiLenKe02_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var hdfId = e.Item.FindControl("hdfId") as HiddenField;
        var pro = dbConnect.pro_Products.Single(n => n.Id == int.Parse(hdfId.Value));
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
        //Noi Ban
        var ltrNoiBan = e.Item.FindControl("ltrNoiBan") as Literal;
        var strNoiBan = "";
        try { strNoiBan = pro.store_ShopRental.store_ShopLocations.Where(n => n.IsStatus == true).First().tblTinh.Name; }
        catch { strNoiBan = ""; }
        ltrNoiBan.Text = strNoiBan;
        //ltrBuyProduct
        var sys_Config = dbConnect.sys_Configs.Single(n => n.Id == 1);
        var ltrBuyProduct = e.Item.FindControl("ltrBuyProduct") as Literal;
        string UrlBuy = "<a onclick='addtoCart(" + sys_Config.PurchaseFee + "," + pro.store_ShopRentalId + "," + pro.Id + ");' title='Đặt hàng'><button type='button' class='btn btn-secondary btn-lg'><i class='fa fa-cart-arrow-down' aria-hidden='true'></i>&nbsp;Mua hàng</button></a>";
        //if (Session["PiglobalUser"] == null)
        //{
        //    UrlBuy = "<a href='/member/dang-nhap.aspx'><button type='button' class='btn btn-secondary btn-lg'><i class='fa fa-cart-arrow-down' aria-hidden='true'></i>&nbsp;Mua hàng</button></a>";
        //}
        //else
        //{
        //    var customer1 = Session["PiglobalUser"] as store_Customer;
        //    var customer = dbConnect.store_Customers.Single(n => n.Id == customer1.Id);
        //    if (customer.AmountBalance >= sys_Config.PurchaseFee)
        //    {
        //        UrlBuy = "<a onclick='callPopupXacNhanGiaoDich(" + sys_Config.PurchaseFee + "," + pro.store_ShopRentalId + "," + pro.Id + ");' title='Đặt hàng'><button type='button' class='btn btn-secondary btn-lg'><i class='fa fa-cart-arrow-down' aria-hidden='true'></i>&nbsp;Mua hàng</button></a>";
        //    }
        //    else
        //    {
        //        UrlBuy = "<a href='javascript:void(0);' onclick='callPopupKhongDuTien();'><button type='button' class='btn btn-secondary btn-lg'><i class='fa fa-cart-arrow-down' aria-hidden='true'></i>&nbsp;Mua hàng</button></a>";
        //    }
        //}
        ltrBuyProduct.Text = UrlBuy;
    }
}