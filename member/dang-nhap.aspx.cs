using Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class member_Default : PublicUser
{
    public other_Webpage seo { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        seo = dbConnect.other_Webpages.Single(n => n.Id == 60);
        if (!IsPostBack)
        {
            seo.ViewCount += 1;
            try { dbConnect.SubmitChanges(); } catch { }
            Session["PiglobalUser"] = null;
            Session.Abandon();
            CookiesUtils cookies = new CookiesUtils();
            cookies.Remove("PiglobalUser");
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            SecurityPublicUtils utils = new SecurityPublicUtils();
            var account = utils.Login(txtEmail.Text, txtPassword.Text,true);
            if (account != null)
            {
                Response.Redirect("/danh-sach-gian-hang.html");
            }
            else { lblError.Text = "Sai thông tin đăng nhập."; }
        }
        catch
        {
            lblError.Text = "Sai thông tin đăng nhập.";
        }
    }
}