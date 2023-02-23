using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_home_FaqUserControl : PublicUserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        rptFaq.DataSource = dbConnect.other_FAQs.Where(n => n.IsStatus == true && n.IsHome == true).OrderBy(n => n.NumOr);
        rptFaq.DataBind();
    }
}