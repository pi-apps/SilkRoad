using Database;
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

public partial class Login : System.Web.UI.Page
{
    
    protected SecurityPublicUtils utils = new SecurityPublicUtils();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        var account = utils.Login(username.Text, password.Text, Field.Checked);
        if (account != null)
        {
            Response.Redirect("/taikhoan");
        }
        else { ClientAlerter.Show(this, "Sai thông tin đăng nhập. Bạn vui lòng kiểm tra lại"); }
    }
}
