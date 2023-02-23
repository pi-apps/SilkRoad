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
        seo = dbConnect.other_Webpages.Single(n => n.Id == 62);
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
    protected void btnSavePassNew_Click(object sender, EventArgs e)
    {
        try
        {
            var account = dbConnect.store_Customers.Single(n => n.CodeVerify == Request["code"]);
            account.Password = EncryptPassword.Encrypt(txtPassword.Text);
            account.UpdatedAt = DateTime.Now;
            account.UpdatedBy = account.Email;
            dbConnect.SubmitChanges();
            Session["forgot-password-success"] = "success";
            Response.Redirect("/member/dang-nhap.aspx");
        }
        catch
        {
            lblErrorEmail.Text = "Có lỗi xảy ra. Vui lòng kiểm tra lại quá trình khôi phục";
        }
    }
}