using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Database;
public partial class transaction_SendChat : PrivateUser
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var cateUser = Request["cateUser"];
        var orderId = int.Parse(Request["orderId"]);
        var content = Request["content"];
        var order = dbConnect.order_Orders.Single(n => n.Id == orderId);
        var chat = new order_OrderChat()
        {
            IsDeleted = false,
            CreatedBy = Account.Email,
            Code = order.Code,
            Message = content,
            MessageFile = null,
            order_OrderId = order.Id,
            pro_ProductId = order.pro_ProductId,
            CreatedAt = DateTime.Now,
        };
        if(cateUser== "buyer")
        {
            chat.BuyerId = Account.Id;
        }
        if (cateUser == "seller")
        {
            chat.SellerId = Account.Id;
        }
        dbConnect.order_OrderChats.InsertOnSubmit(chat);
        dbConnect.SubmitChanges();
    }
}