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
        if (!IsPostBack)
        {
            ddlRole.DataSource = dbConnect.company_Roles.Where(n => n.Active == true&&(n.IsDeleted == false||n.IsDeleted==null)).OrderBy(n => n.Id);
            ddlRole.DataValueField = "Id";
            ddlRole.DataTextField = "Name";
            ddlRole.DataBind();
            ddlRole.Items.Insert(0, new ListItem("--Chọn quyền truy cập--", "-"));

            if (emp.company_EmployeeAccounts.Count > 0)
            {
                txtUserName.Text = emp.company_EmployeeAccounts[0].UserName;
                ddlRole.SelectedValue = emp.company_EmployeeAccounts[0].company_Role.Id + "";
                chkActive.Checked = emp.company_EmployeeAccounts[0].Active.Value;
            }
            else
            {
                txtUserName.Text = emp.Code;
            }
        }

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        var empModel = dbConnect.company_Employees.Single(n => n.Id == int.Parse(Request["Id"]));
        lblMessage.Visible = true;
        //kiểm tra đã tạo user hay chưa?
        if (emp.company_EmployeeAccounts.Count > 0)//user đã tồn tại.
        {
            //update thông tin hiện có
            try
            {
                var itemAccount = dbConnect.company_EmployeeAccounts.Single(n => n.EmployeeId == empModel.Id);
                itemAccount.RoleId = int.Parse(ddlRole.SelectedValue);
                itemAccount.Active = chkActive.Checked;
                itemAccount.UserName = txtUserName.Text;
                if (txtPassword.Text.Trim()!="")
                {
                    var pass = EncryptPassword.Encrypt(txtPassword.Text.Trim());
                    itemAccount.Password = pass;
                }
                itemAccount.UpdatedAt = DateTime.Now;
                itemAccount.UpdatedBy = Account.Employee.Email + "";
                dbConnect.SubmitChanges();
                lblMessage.Text = "Cập nhật thông tin thành công";
            }
            catch { lblMessage.Text = "Lỗi !!! Cập nhật thông tin thất bại"; }
        }
        else//tạo mới thông tin
        {
            try
            {
                var pass = EncryptPassword.Encrypt(txtPassword.Text.Trim());
                var employeeAccount = new company_EmployeeAccount()
                {
                    EmployeeId = empModel.Id,
                    RoleId = int.Parse(ddlRole.SelectedValue),
                    UserName = txtUserName.Text,
                    Password = pass,
                    SortOrder = 1,
                    CreatedAt = DateTime.Now,
                    CreatedBy = Account.Employee.Email + "",
                    Active = chkActive.Checked,
                    IsAccessOutbound = true,
                    IsAccessHouseOwner = true,
                    IsAccessHouseOwnerAll = true,
                    IsExportHouse = true,
                    Avatar = "upload/no-avatar.png"
                };
                dbConnect.company_EmployeeAccounts.InsertOnSubmit(employeeAccount);
                dbConnect.SubmitChanges();
                lblMessage.Text = "Tạo tài khoản đăng nhập thành công";
            }
            catch { lblMessage.Text = "Lỗi !!! Tạo tài khoản đăng nhập thất bại"; }
        }
    }
}