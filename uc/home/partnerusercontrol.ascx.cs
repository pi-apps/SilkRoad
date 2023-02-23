using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_home_PartnerUserControl : PublicUserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        rptPartner.DataSource = dbConnect.setting_Partners.Where(n => n.IsStatus == true).OrderBy(n => n.NumOr);
        rptPartner.DataBind();
    }
}