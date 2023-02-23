using Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class prodraftadmin_khosanpham_quanlysanpham_ajax_updateNumOr : AdminPageUtils
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try {
            int id = int.Parse(Request["id"]);
            int numOr = int.Parse(Request["numOr"]);
            pro_Product model = dbConnect.pro_Products.Single(m => m.Id == id);
            model.NumOr = numOr;
            model.UpdatedBy = Account.Employee.Email;
            model.UpdatedAt = DateTime.Now;
            dbConnect.SubmitChanges();
        }
        catch { }
    }
}