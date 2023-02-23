using Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class transaction_birdproduct : PrivateUser
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TransactionBirdProductUtil transactionBirdProductUtil = new TransactionBirdProductUtil();
        string result = transactionBirdProductUtil.CreateTransactionBirdAuctionProduct(Request["productId"], Request["value"]);
        Response.Write(result);
    }
}