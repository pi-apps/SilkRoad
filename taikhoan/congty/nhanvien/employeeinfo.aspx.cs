using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Database;
public partial class prodraftadmin_congty_nhanvien_EmployeeInfo : AdminPageUtils
{
    public company_Employee emp { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        emp = dbConnect.company_Employees.Single(n => n.Id == int.Parse(Request["Id"]));
    }
}