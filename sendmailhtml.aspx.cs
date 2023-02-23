using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sendmailhtml : PublicUser
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        #region send email confirm
        try
        {

            string LogoEmail = ConfigurationManager.AppSettings["LogoEmail"].ToString();
            string url = urlDomain + "member/confirm.aspx?code=" + DateTime.Now.Ticks;
            StreamReader red = new StreamReader(MapPath("~/email_template/signup.html"));
            string body = red.ReadToEnd();
            red.Close();
            body = string.Format(body, url, LogoEmail);
            //send user
            PiglobalEmail.SendEmail(txtEmail.Text, "[piglobal.net] Xác nhận kích hoạt tài khoản", body);
        }
        //catch { }
        catch(Exception ex) { Response.Write(ex.ToString()); }
        #endregion
    }

    protected void btnSendText_Click(object sender, EventArgs e)
    {
        PiglobalEmail.SendEmail(txtEmail.Text, "[piglobal.net] Xác nhận kích hoạt tài khoản", "không có html nha");
    }
}