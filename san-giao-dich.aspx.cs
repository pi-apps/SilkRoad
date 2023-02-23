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
        seo = dbConnect.other_Webpages.Single(n => n.Id == 63);
        if (!IsPostBack)
        {
            seo.ViewCount += 1;
            try { dbConnect.SubmitChanges(); } catch { }
        }
        //load product
        if (!IsPostBack)
        {
            ddlSort.DataSource = SortProductModelUtils.getListSortSanGiaoDich();
            ddlSort.DataValueField = "Value";
            ddlSort.DataTextField = "Text";
            ddlSort.DataBind();
            ddlSort.SelectedValue = "7";

            ddlPageSize.DataSource = SortProductModelUtils.getListPageSize();
            ddlPageSize.DataValueField = "Value";
            ddlPageSize.DataTextField = "Text";
            ddlPageSize.DataBind();
            ddlPageSize.SelectedValue = "10";
        }
        if (Request["ps"] != null) { ddlPageSize.SelectedValue = Request["ps"] + ""; }
        if (Request["sort"] != null) { ddlSort.SelectedValue = Request["sort"] + ""; }
        if (Request["key"] != null) { txtKeyword.Text = Request["key"] + ""; }
        var items = dbConnect.getListSanGiaoDich(txtKeyword.Text, int.Parse(ddlSort.SelectedValue))
            .Distinct()
            .Select(n => new
            {
                n.Id,
                n.Name,n.NumOr,
                n.Price,
                n.Banner,
                n.Code,
                n.ExchangeRate,
                n.Summary,
                n.PriceSold
            })
            .ToList().Distinct();
        Pager p = new Pager(int.Parse(ddlPageSize.SelectedValue), items.Distinct().Count(), 5);
        Literal1.Text = p.NavigationCategoryNewPublic2();
        rptProduct.DataSource = items.Distinct().Skip(p.PageSkip).Take(p.PageSize);
        rptProduct.DataBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {

    }

    protected void rptProduct_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var sys_Config = dbConnect.sys_Configs.Single(n => n.Id == 1);
        var hdfId = e.Item.FindControl("hdfId") as HiddenField;
        var ltrbtnThue = e.Item.FindControl("ltrbtnThue") as Literal;
        var ltrMua = e.Item.FindControl("ltrMua") as Literal;
        var shop = dbConnect.store_Shops.Single(n => n.Id == int.Parse(hdfId.Value));
        #region load price
        var ltrGia = e.Item.FindControl("ltrGia") as Literal;
        if (shop.IsAllowBan == true && shop.IsAllowThue == true)
        {
            string strPrice = "";
            strPrice += "<span class='gia-thue'>Giá thuê: <strong> " + shop.Price.Value.ToString("#,##0") + "π</strong></span>";
            strPrice += "<span class='price-icon'><img src='/pi-layout/assets/icon-price.png' /></span>";
            strPrice += "<span class='gia-mua'>Giá mua: <strong> " + shop.PriceSold.Value.ToString("#,##0") + "π</strong></span>";
            ltrGia.Text = strPrice;
        }
        else if (shop.IsAllowBan == false && shop.IsAllowThue == true)
        {
            ltrGia.Text = "<span class='gia-thue'>Giá thuê: <strong> "+shop.Price.Value.ToString("#,##0")+"π</strong></span>";
        }
        else if (shop.IsAllowBan == true && shop.IsAllowThue == false)
        {
            ltrGia.Text = "<span class='gia-mua'>Giá mua: <strong> " + shop.PriceSold.Value.ToString("#,##0") + "π</strong></span>";
        }
        #endregion

        string UrlThue = "";
        if (Session["PiglobalUser"] == null)
        {
            if (shop.IsAllowThue == true)
                UrlThue = "<a class='btn-thue' href='/member/dang-nhap.aspx'>Thuê store</a>";
            else UrlThue = "";
        }
        else
        {
            var customer1 = Session["PiglobalUser"] as store_Customer;
            var customer = dbConnect.store_Customers.Single(n => n.Id == customer1.Id);
            var tiencoc = shop.Price * 2 + shop.Price;
            if (customer.AmountBalance >= tiencoc)
            {
                UrlThue = "<a class='btn-thue' href='/san-giao-dich/dat-thue-gian-hang-" + shop.Id + ".html' title='Đặt thuê'>Thuê store</a>";
            }
            else
            {
                UrlThue = "<a class='btn-thue' href='javascript:void(0);' onclick='callPopupKhongDuTienThueGH(" + customer.AmountBalance.Value.ToString("#.##0") + "," + tiencoc.Value.ToString("#.##0") + ");'>Thuê store</a>";
            }
            if (shop.IsAllowThue == true) { }
            else UrlThue = "";
        }
        ltrbtnThue.Text = UrlThue;


        string UrlMua = "";
        if (Session["PiglobalUser"] == null)
        {
            if (shop.IsAllowBan == true)
            {
                UrlMua = "<a class='btn-mua' href='/member/dang-nhap.aspx'>Mua store</a>";
            }
            else { UrlMua = ""; }
        }
        else
        {
            var customer1 = Session["PiglobalUser"] as store_Customer;
            var customer = dbConnect.store_Customers.Single(n => n.Id == customer1.Id);
            var tiencoc = shop.PriceSold;

            if (customer.AmountBalance >= tiencoc)
            {
                UrlMua = "<a class='btn-mua' href='/san-giao-dich/dat-mua-gian-hang-" + shop.Id + ".html' title='Đặt mua'>Mua store</a>";
            }
            else
            {
                UrlMua = "<a class='btn-mua' href='javascript:void(0);' onclick='callPopupKhongDuTienMuaGH(" + customer.AmountBalance.Value.ToString("#.##0") + "," + tiencoc.Value.ToString("#.##0") + ");'>Mua store</a>";
            }
            if (shop.IsAllowBan == true)
            {
                
            }
            else { UrlMua = ""; }
        }
        ltrMua.Text = UrlMua;
    }
}