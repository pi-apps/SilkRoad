using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_home_ServiceUserControl : PublicUserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        rptService.DataSource = dbConnect.setting_Services.Where(n => n.IsStatus == true && n.IsHome==true).OrderBy(n=>n.NumOr);
        rptService.DataBind();
    }
}