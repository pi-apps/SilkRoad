using Database;
using DongAGroup.Helpers.Encrypt;
using dxtLib.WebProvider;
using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Login : AdminPageUtils
{
    
    protected SecurityUtils utils = new SecurityUtils();
    public string urlReturn;
    protected void Page_Load(object sender, EventArgs e)
    {
        urlReturn = Account.Role.RoleUrl;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            using (KolagfaramDBDataContext dbConnect = new KolagfaramDBDataContext())
            {
                var account1 = dbConnect.company_EmployeeAccounts.Where(n => n.Id == Account.EmployeeAccount.Id).SingleOrDefault();
                if (account1 == null)
                {
                    ClientAlerter.Show(this, "Thông tin tài khoản không chính xác.");
                }
                else
                {
                    if (EncryptPassword.Decrypt(account1.Password) == txtOldPass.Text)
                    {
                        account1.UpdatedAt = DateTime.Now;
                        account1.UpdatedBy = Account.Employee.Email;
                        account1.Password = EncryptPassword.Encrypt(txtPassword.Text);
                        dbConnect.SubmitChanges();
                        string ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
                        utils.Login(Account.EmployeeAccount.UserName, txtPassword.Text, ip, true);
                        txtOldPass.Text = txtPassword.Text = txtRePassword.Text = "";
                        ClientAlerter.Show(this, "Cập nhật mật khẩu thành công.");
                    }
                    else
                    {
                        ClientAlerter.Show(this, "Mật khẩu cũ không chính xác. Vui lòng kiểm tra lại.");
                    }
                }
            }
        }
        catch(Exception ex)
        {
            Response.Write(ex.ToString());
            ClientAlerter.Show(this, "Đã có lỗi xảy ra. Vui lòng thực hiện thao tác sau 10p nữa.");
        }
    }
}
