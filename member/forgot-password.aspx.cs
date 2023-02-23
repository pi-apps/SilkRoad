using Database;
using Piglobal.Data.Mail;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class member_Default : PublicUser
{
    public other_Webpage seo { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        seo = dbConnect.other_Webpages.Single(n => n.Id == 61);
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
    protected void btnKhoiPhuc_Click(object sender, EventArgs e)
    {
        try
        {
            var user = dbConnect.store_Customers.Single(n => n.Email == txtEmail.Text && n.IsStatus == true && n.IsActive == true);
            user.UpdatedAt = DateTime.Now;
            user.UpdatedBy = user.Email;
            string codeVerify = GenerateKeyUtil.GenerateKey();
            user.CodeVerify = codeVerify;
            dbConnect.SubmitChanges();
            Session["quenmatkhau"] = "success";
            //send email confirm
            #region send email confirm
            try
            {
                string LogoEmail = ConfigurationManager.AppSettings["LogoEmail"].ToString();
                string url = urlDomain + "member/reset_pass.aspx?code=" + codeVerify;
                StreamReader red = new StreamReader(MapPath("~/email_template/reset_pass.html"));
                string body = red.ReadToEnd();
                red.Close();
                body = string.Format(body, url, LogoEmail);
                //send user
                PiglobalEmail.SendEmail(txtEmail.Text, "[piglobal.net] Khôi phục mật khẩu", body);
                //SeoGMail.Send(txtEmail.Text, "[piglobal.net] Khôi phục mật khẩu", body);
            }
            catch { }
            #endregion
            txtEmail.Text = "";
        }
        catch
        {
            lblErrorEmail.Text = "Không tìm thấy email cần khôi phục trong hệ thống.";
        }
    }
}