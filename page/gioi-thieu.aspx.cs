using Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class page_page : PublicUser
{
    public other_AboutUs seo { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        seo = dbConnect.other_AboutUs.Single(n => n.Id == int.Parse(Request["Id"].Split(',')[0]));
        if (!IsPostBack)
        {
            seo.ViewCount += 1;
            try { dbConnect.SubmitChanges(); } catch { }
        }
    }
}