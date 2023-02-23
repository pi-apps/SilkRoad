using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_home_AboutUserControl : PublicUserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        rptAbout.DataSource = dbConnect.other_AboutUs.Where(n => n.IsStatus == true && n.IsHome == true).OrderBy(n => n.NumOr);
        rptAbout.DataBind();
    }
}