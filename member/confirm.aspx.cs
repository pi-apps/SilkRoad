using Database;
using Piglobal.Data.Mail;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class member_Default : PublicUser
{
    public other_Webpage seo { get; set; }
    public string sessionKey = "PiglobalUser";
    protected string cookieKey = "PiglobalUser";
    protected void Page_Load(object sender, EventArgs e)
    {
        seo = dbConnect.other_Webpages.Single(n => n.Id == 59);
        if (Session["PiglobalUser"] != null)
        {
            Response.Redirect("/san-giao-dich.html");
        }
        else
        {
            string code = Request["code"];
            var account = dbConnect.store_Customers.Single(n => n.CodeVerify == code && n.IsActive == false && n.IsStatus == true);
            if (account.IsActive == false)
            {
                account.IsActive = true;
                account.ActiveDate = DateTime.Now;
                dbConnect.SubmitChanges();
                SessionUtils<store_Customer> util = new SessionUtils<store_Customer>();
                util.Add(sessionKey, account);
                #region create cookies
                HttpCookie ckiUser = new HttpCookie(cookieKey);
                ckiUser["piEmail"] = account.Email;
                ckiUser["piPassword"] = account.Password;
                ckiUser.Expires = DateTime.Now.AddDays(2);
                Response.Cookies.Add(ckiUser);
                #endregion
                Response.Redirect("/san-giao-dich.html");
            }
            else { Response.Redirect("/san-giao-dich.html"); }
        }
    }
    
}