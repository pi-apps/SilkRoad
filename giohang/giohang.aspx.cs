using Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public  class ShopCart
{
    public int store_ShopRentalId { get; set; }
    public string store_ShopRentalName { get; set; }
}
public partial class page_page : PublicUser
{
    public ShoppingCart shopping { get; set; }
    public Guid WorkingSessionId { get; set; }
    public other_Webpage seo { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        WorkingSessionId = Guid.Parse(Request["WorkingSessionId"]);
        if (dbConnect.setting_WorkingSessions.SingleOrDefault(n => n.Id == WorkingSessionId) == null)
        {
            Response.Redirect("/");
        }
        try { seo = dbConnect.other_Webpages.Single(n => n.Id == 1070); }
        catch { seo = dbConnect.other_Webpages.Single(n => n.Id == 70); }
        shopping = new ShoppingCart(WorkingSessionId);
        if (!IsPostBack)
        {
            seo.ViewCount += 1;
            try { dbConnect.SubmitChanges(); } catch { }
            ddlThanhPho.DataSource = dbConnect.tblTinhs.Where(n => n.IsStatus == true).OrderBy(n => n.Name);
            ddlThanhPho.DataValueField = "Id";
            ddlThanhPho.DataTextField = "Name";
            ddlThanhPho.DataBind();
            ddlThanhPho.Items.Insert(0, new ListItem("--Chọn tỉnh/thành phố--", "0"));
            ddlQuanHuyen.Items.Insert(0, new ListItem("--Chọn quận/huyện--", "0"));
            ddlPhuongXa.Items.Insert(0, new ListItem("--Chọn phường/xã--", "0"));
        }
        if (!IsPostBack)
        {
            seo.ViewCount += 1;
            try { dbConnect.SubmitChanges(); } catch { }
            
            if (shopping.TotalItemCount == 0)
            {
                mulCart.ActiveViewIndex = 0;
            }
            else { mulCart.ActiveViewIndex = 1; }
            //load giao hàng
            var lstShipping = ShippingMethodUtils.ShippingMethod();
            shippingMethods.DataSource = lstShipping;
            shippingMethods.DataValueField = "Id";
            shippingMethods.DataTextField = "Name";
            shippingMethods.DataBind();
            int step = 0;
            foreach (var item in lstShipping)
            {
                shippingMethods.Items[step].Attributes.Add("data-name", item.Name);
                shippingMethods.Items[step].Attributes.Add("data-id", item.Id.ToString());
                shippingMethods.Items[step].Attributes.Add("data-price", item.Price.ToString());
                step++;
            }

            shippingMethods.SelectedValue = "0";
            hdfshippingValue.Value = "0";
            //load danh sách gian hàng
            LoadBagCart();
        }
    }
    void LoadBagCart()
    {
        var lstShop = new List<ShopCart>();
        foreach (var item in shopping.cartInfo.Select(n=>n.store_ShopRentalId).Distinct())
        {
            lstShop.Add(new ShopCart()
            {
                store_ShopRentalId = item.Value,
                store_ShopRentalName = dbConnect.store_ShopRentals.Single(n => n.Id == item.Value).Name
            });
        }
        rptShop.DataSource = lstShop;
        rptShop.DataBind();
    }
    protected void rptCart_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var hdfId = e.Item.FindControl("hdfId") as HiddenField;
        //var ltrShop = e.Item.FindControl("ltrShop") as Literal;
        //var product = dbConnect.pro_Products.Single(n => n.Id == int.Parse(hdfId.Value));
        //string resultTemp = "";
        //resultTemp += "<span class='panel-right-store'><a href='/gian-hang/" + product.store_ShopRental.Name.RemoveSymbol().ToLower() + "-" + product.store_ShopRental.Id + ".html' title='" + product.store_ShopRental.Name + "'>" + product.store_ShopRental.Name + "</a></span>";
        //ltrShop.Text = resultTemp;
    }
    protected void btnContinueCheckOut_Click(object sender, EventArgs e)
    {
        Response.Redirect("/checkout/payment.html?WorkingSessionId=" + WorkingSessionId);
    }

    protected void rptShop_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var hdfShopRentalIdId = e.Item.FindControl("hdfShopRentalIdId") as HiddenField;
        var rptCart = e.Item.FindControl("rptCart") as Repeater;
        rptCart.DataSource = shopping.cartInfo.Where(n => n.store_ShopRentalId == int.Parse(hdfShopRentalIdId.Value)).OrderBy(n=>n.Quantity);
        rptCart.DataBind();
    }

    protected void ddlThanhPho_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlThanhPho.SelectedIndex > 0)
        {
            ddlQuanHuyen.DataSource = dbConnect.tblQuanHuyens.Where(n => n.IsStatus == true && n.tblTinhId == int.Parse(ddlThanhPho.SelectedValue)).OrderBy(n => n.Name);
            ddlQuanHuyen.DataValueField = "Id";
            ddlQuanHuyen.DataTextField = "Name";
            ddlQuanHuyen.DataBind();
            ddlQuanHuyen.Items.Insert(0, new ListItem("--Chọn quận/huyện--", "0"));
            ddlPhuongXa.Items.Clear();
            ddlPhuongXa.Items.Insert(0, new ListItem("--Chọn phường/xã--", "0"));
        }
        else
        {
            ddlQuanHuyen.Items.Clear();
            ddlQuanHuyen.Items.Insert(0, new ListItem("--Chọn quận/huyện--", "0"));
            ddlPhuongXa.Items.Clear();
            ddlPhuongXa.Items.Insert(0, new ListItem("--Chọn phường/xã--", "0"));
        }
    }

    protected void ddlQuanHuyen_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlQuanHuyen.SelectedIndex > 0)
        {
            ddlPhuongXa.DataSource = dbConnect.tblPhuongXas.Where(n => n.IsStatus == true && n.tblQuanHuyenId == int.Parse(ddlQuanHuyen.SelectedValue)).OrderBy(n => n.Name);
            ddlPhuongXa.DataValueField = "Id";
            ddlPhuongXa.DataTextField = "Name";
            ddlPhuongXa.DataBind();
            ddlPhuongXa.Items.Insert(0, new ListItem("--Chọn quận/huyện--", "0"));
        }
        else
        {
            ddlPhuongXa.Items.Clear();
            ddlPhuongXa.Items.Insert(0, new ListItem("--Chọn phường/xã--", "0"));
        }
    }
}