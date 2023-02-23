using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_master_headerUserControl : PublicUserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected CookiesUtils cookies = new CookiesUtils();
    public string sessionKey = "PiglobalUser";
    protected string cookieKey = "PiglobalUser";
    protected void lnkLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        cookies.Remove(cookieKey);
        Response.Redirect("/");
    }
}