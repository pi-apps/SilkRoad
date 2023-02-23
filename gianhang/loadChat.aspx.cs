using Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gianhang_loadChat : PrivateUser
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var lstNoiDungChat = dbConnect.order_OrderChats
            .Where(n => n.order_OrderId == int.Parse(Request["code"]))
            .OrderBy(n => n.Id).ToList()
            .Select(n => new
            {
                n.Id,
                MessageCss = getCss(n.SellerId, n.BuyerId),
                Message = getMessage(n.Id),
                n.CreatedAt,
                Avatar = getCustomer(n.SellerId, n.BuyerId).Avatar,
                FullName = getCustomer(n.SellerId, n.BuyerId).FullName,
            });
        rptNoiDungChat.DataSource = lstNoiDungChat;
        rptNoiDungChat.DataBind();
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
}