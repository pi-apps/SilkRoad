using Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : PublicUser
{
    public other_Webpage seo { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        seo = dbConnect.other_Webpages.Single(n => n.Id == 57);
        if (!IsPostBack)
        {
            seo.ViewCount += 1;
            try { dbConnect.SubmitChanges(); } catch { }
        }
        rptHomeIntroLink.DataSource = dbConnect.HomeIntroLinks.Where(n=>n.IsStatus==true).OrderBy(n=>n.NumOr);
        rptHomeIntroLink.DataBind();
    }
}