using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_master_footerUserControl : PublicUserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        rptMXH.DataSource = dbConnect.setting_Socials.Where(n => n.IsStatus == true).OrderBy(n => n.NumOr);
        rptMXH.DataBind();
        rptLinkMaster.DataSource=dbConnect.other_GroupLinks.Where(n => n.IsStatus == true).OrderBy(n => n.NumOr);
        rptLinkMaster.DataBind();
    }

    protected void rptLinkMaster_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var hdfId = e.Item.FindControl("hdfId") as HiddenField;
        var rptLinkSub = e.Item.FindControl("rptLinkSub") as Repeater;
        rptLinkSub.DataSource = dbConnect.other_GroupLinkDetails.Where(n => n.IsStatus == true)
            .Where(n => n.other_GroupLinkId == int.Parse(hdfId.Value))
            .OrderBy(n => n.NumOr);
        rptLinkSub.DataBind();
    }
}