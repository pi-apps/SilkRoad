using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Database;
public partial class gianhang_chitietsanpham : PrivateUser
{
    public pro_Product product { get; set; }
    public sys_Config sys_Config { get; set; }
    public other_Webpage seo { get; set; }
    public store_Customer buyer { get; set; }
    public store_Customer seller { get; set; }
    public order_Order order { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        seo = dbConnect.other_Webpages.Single(n => n.Id == 47);
        order = dbConnect.order_Orders.Single(n => n.Code == Request["orderCode"].Split(',')[0]);
        product = order.pro_Product;
        buyer = dbConnect.store_Customers.Single(n => n.Id == order.BuyerId);
        seller = dbConnect.store_Customers.Single(n => n.Id == order.SellerId);
        sys_Config = dbConnect.sys_Configs.Single(n => n.Id == 1);
        
        if (!IsPostBack)
        {
            hdfUrl.Value = urlDomainShare + Request.RawUrl;
            hdfPurchaseFee.Value = sys_Config.PurchaseFee + "";
            hdfCodeOrder.Value = order.Id + "";
            if (order.IsDeleted == false && order.IsSellerConfirm == true && order.IsBuyerConfirm == false)
            {
                Panel1.Visible = true; Panel2.Visible = true;
            }
            if(order.IsBuyerConfirm==true && order.IsSellerConfirm==true && order.IsDeleted == false)
            {
                Panel3.Visible = true;
            }
            if (order.IsDeleted == true)
            {
                Panel4.Visible = true;
            }
            seo.ViewCount += 1;
            try { dbConnect.SubmitChanges(); } catch { }
        }
        //var lstNoiDungChat = dbConnect.order_OrderChats
        //    .Where(n => n.order_OrderId == order.Id)
        //    .OrderBy(n => n.Id).ToList()
        //    .Select(n => new
        //    {
        //        n.Id,
        //        MessageCss = getCss(n.SellerId, n.BuyerId),
        //        Message = getMessage(n.Id),
        //        n.CreatedAt,
        //        Avatar = getCustomer(n.SellerId, n.BuyerId).Avatar,
        //        FullName = getCustomer(n.SellerId, n.BuyerId).FullName,
        //    });
        //rptNoiDungChat.DataSource = lstNoiDungChat;
        //rptNoiDungChat.DataBind();

    }
    public string getMessage(int Id)
    {
        var chat = dbConnect.order_OrderChats.Single(n => n.Id == Id);
        if (chat.MessageFile == null || chat.MessageFile == "")
        {
            return chat.Message;
        }
        else
        {
            return "<a target='_blank' href='/" + chat.MessageFile + "'>Xem file</a>";
        }
    }
    public store_Customer getCustomer(int? SellerId, int? BuyerId)
    {
        if (SellerId == null || SellerId == 0)
        {
            return dbConnect.store_Customers.Single(n => n.Id == BuyerId);
        }
        else return dbConnect.store_Customers.Single(n => n.Id == SellerId);
    }
    public string getCss(int? SellerId, int? BuyerId)
    {
        if (SellerId == null || SellerId == 0)
        {
            return "odd";
        }
        else return "event";
    }
    protected void btnThongBao_Click(object sender, EventArgs e)
    {

    }

    protected void lnkHuyLenh_Click(object sender, EventArgs e)
    {

    }
}