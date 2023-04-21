using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Transactions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Populate the transactions table with data from the database
            PopulateTransactionsTable();
        }
    }

    protected void PopulateTransactionsTable()
    {
        // Connect to the database
        using (var db = new MarketplaceDbContext())
        {
            // Get the current user's ID
            string userID = User.Identity.GetUserId();

            // Query the database for all transactions involving the current user
            var transactions = db.Transactions.Where(t => t.BuyerID == userID || t.SellerID == userID).ToList();

            // Bind the transactions data to the transactions table
            transactionsTable.DataSource = transactions;
            transactionsTable.DataBind();
        }
    }

    protected void transactionsTable_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        // Format the transaction date column to display as a short date
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DateTime transactionDate = Convert.ToDateTime(DataBinder.Eval(e.Row.DataItem, "TransactionDate"));
            e.Row.Cells[2].Text = transactionDate.ToShortDateString();
        }
    }
}
