using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Database;
public partial class transaction_subscribeEmail : PublicUser
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (dbConnect.other_Subscribes.Where(n => n.Email == Request["email"]).Count() == 0)
            {
                var other_Subscribe = new other_Subscribe()
                {
                    Email= Request["email"],
                    CreatedAt=DateTime.Now,
                    FullName=Request["email"],
                    IsDeleted=false,
                    CreatedBy = Request["email"]
                };
                dbConnect.other_Subscribes.InsertOnSubmit(other_Subscribe);
                dbConnect.SubmitChanges();
            }
        }
        catch { }
    }
}