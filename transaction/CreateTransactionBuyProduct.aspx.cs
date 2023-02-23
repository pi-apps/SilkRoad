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
        TransactionBuyProductUtil transactionBuyProductUtil = new TransactionBuyProductUtil();
        string urlReturn=transactionBuyProductUtil.CreateTransactionBuyProduct(Request["productId"], Request["ShopId"]);
        Response.Write(urlReturn);
    }
}