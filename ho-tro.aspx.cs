using Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ho_tro : PublicUser
{
    public other_Webpage seo { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        seo = dbConnect.other_Webpages.Single(n => n.Id == 65);
        if (!IsPostBack)
        {
            seo.ViewCount += 1;
            try { dbConnect.SubmitChanges(); } catch { }
        }
        rptFaq.DataSource = dbConnect.other_FAQs.Where(n => n.IsStatus == true).OrderBy(n => n.NumOr);
        rptFaq.DataBind();
    }
}