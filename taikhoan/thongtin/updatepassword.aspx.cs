using Database;
using dxtLib.WebProvider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Siteadmin_cauhinh_banner_new : PrivateUser
{
    protected void Page_PreRender(object sender, EventArgs e)
    {
        var Id = Request["Id"];
        if (!IsPostBack)
        {
            
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            var account1 = dbConnect.store_Customers.Where(n => n.Id == Account.Id).SingleOrDefault();
            if (account1 == null)
            {
                ClientAlerter.Show(this, "Thông tin tài khoản không chính xác.");
            }
            else
            {
                if (EncryptPassword.Decrypt(account1.Password) == txtOldPass.Text)
                {
                    account1.UpdatedAt = DateTime.Now;
                    account1.UpdatedBy = Account.Email;
                    account1.Password = EncryptPassword.Encrypt(txtPassword.Text);
                    dbConnect.SubmitChanges();
                    SecurityPublicUtils utils = new SecurityPublicUtils();
                    var account = utils.Login(account1.Email, txtPassword.Text, true);
                    txtOldPass.Text = txtPassword.Text = txtRePassword.Text = "";
                    ClientAlerter.Show(this, "Cập nhật mật khẩu thành công.");
                }
                else
                {
                    ClientAlerter.Show(this, "Mật khẩu cũ không chính xác. Vui lòng kiểm tra lại.");
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
            ClientAlerter.Show(this, "Đã có lỗi xảy ra. Vui lòng thực hiện thao tác sau 10p nữa.");
        }
    }
}