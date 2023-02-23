using Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class taikhoan_PiglobalAdminMasterPage : System.Web.UI.MasterPage
{
    protected SecurityPublicUtils security = new SecurityPublicUtils();
    public company_Permission _permission { get; set; }
    public double SoDu { get; set; }
    public string UserName
    {
        get
        {
            return SessionHelpers.CustomerInfo().Email;
        }
    }
    public store_Customer Account
    {
        get
        {
            return SessionHelpers.CustomerInfo();
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SoDu = 0;
            using (PiglobalDBDataContext db = new PiglobalDBDataContext())
            {
                var cus = db.store_Customers.Single(n => n.Id == Account.Id);
                try { SoDu = cus.AmountBalance.Value; } catch { }
            }
        }
    }

    protected CookiesUtils cookies = new CookiesUtils();
    public string sessionKey = "PiglobalUser";
    protected string cookieKey = "PiglobalUser";
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        cookies.Remove(cookieKey);
        Response.Redirect("/member/dang-nhap.aspx");
    }

   
}
