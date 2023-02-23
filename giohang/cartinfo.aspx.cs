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
    public order_GroupOrder groupOrder { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        groupOrder = new order_GroupOrder();
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
        }
        if (!IsPostBack)
        {
            seo.ViewCount += 1;
            try { dbConnect.SubmitChanges(); } catch { }
            LoadBagCart();
        }
    }
    void LoadBagCart()
    {
        //lay group order
        groupOrder = dbConnect.order_GroupOrders.Single(n => n.paymentId == Request["paymentId"] && n.setting_WorkingSessionId == Guid.Parse(Request["WorkingSessionId"]));
    }
    protected void rptCart_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var hdfId = e.Item.FindControl("hdfId") as HiddenField;
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
}