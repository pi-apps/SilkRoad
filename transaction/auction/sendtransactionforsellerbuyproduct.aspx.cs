using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Database;
public partial class transaction_CreateTransactionBuyProduct : PrivateUser
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //lay thông tin cần thiết
        var order = dbConnect.order_Orders.Single(n => n.Id == int.Parse(Request["order"]));
        order.IsSellerConfirm = true;
        order.SellerConfirmDate = DateTime.Now;
        order.DeletedAt = DateTime.Now;
        order.DeletedBy = Account.Email;
        dbConnect.SubmitChanges();
        //Response.Write("/gian-hang/" + order.store_ShopRental.Name.RemoveSymbol() + "-" + order.store_ShopRentalId + ".html");
    }
}