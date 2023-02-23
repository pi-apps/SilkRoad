using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class exam_popup_luotthitrongngay : PublicUser
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var lstAuction = dbConnect.pro_HistoryProductAuctions.Where(n => n.pro_ProductId == int.Parse(Request["Id"])).OrderByDescending(n => n.Id)
            .Select(n => new
            {
                n.Id,
                n.CreatedAt,
                n.PriceAuction,
                n.store_Customer.Code
            });

        Repeater1.DataSource = lstAuction;
        Repeater1.DataBind();
    }
}