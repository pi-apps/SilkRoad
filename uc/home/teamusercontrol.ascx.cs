using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_home_TeamUserControl : PublicUserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        rptOurTeam.DataSource = dbConnect.setting_OurTeams.Where(n => n.IsStatus == true).OrderBy(n => n.NumOr);
        rptOurTeam.DataBind();
    }
}