using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Database;
using DongAGroup.Helpers.Encrypt;

public partial class prodraftadmin_congty_nhanvien_EmployeeInfo : AdminPageUtils
{
    public pro_Product pro_Product { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        pro_Product = dbConnect.pro_Products.Single(n => n.Id == int.Parse(Request["Id"]));
        if (!IsPostBack)
        {
            ddlTags.DataSource = dbConnect.pro_Tags.Where(n => n.IsStatus == true).OrderByDescending(n => n.Id);
            ddlTags.DataValueField = "Id";
            ddlTags.DataTextField = "Name";
            ddlTags.DataBind();
            ddlTags.Items.Insert(0, new ListItem("--Chọn tags--", ""));
            LoadDanhMuc();
        }

    }
    void LoadDanhMuc()
    {
        rptDanhSach.DataSource = dbConnect.pro_ProductTags.Where(n => n.pro_ProductId == int.Parse(Request["Id"]));
        rptDanhSach.DataBind();

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        var pro_ProductModel = dbConnect.pro_Products.Single(n => n.Id == int.Parse(Request["Id"]));
        lblMessage.Visible = true;
        try
        {
            if (dbConnect.pro_ProductTags.Where(n => n.pro_TagId == int.Parse(ddlTags.SelectedValue)&&n.pro_ProductId== int.Parse(Request["Id"])).Count() > 0)
            {
                lblMessage.Text = "Từ khóa cho sản phẩm này đã tồn tại";
            }
            else
            {
                var proCate = new pro_ProductTag()
                {
                    pro_TagId = int.Parse(ddlTags.SelectedValue),
                    CreatedAt = DateTime.Now,
                    CreatedBy = Account.Employee.Email,
                    IsStatus = true,
                    pro_ProductId = pro_ProductModel.Id
                };
                dbConnect.pro_ProductTags.InsertOnSubmit(proCate);
                dbConnect.SubmitChanges();
                lblMessage.Text = "Thêm từ khóa cho sản phẩm thành công";
                ddlTags.SelectedIndex = -1;
            }
            LoadDanhMuc();
        }
        catch
        {
            lblMessage.Text = "Đã xảy ra lỗi. Vui lòng kiểm tra lại dữ liệu";
        }
    }

    protected void btnDelete_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton l = sender as ImageButton;
        pro_ProductTag model = dbConnect.pro_ProductTags.Single(m => m.Id == int.Parse(l.CommandArgument));
        dbConnect.pro_ProductTags.DeleteOnSubmit(model);
        dbConnect.SubmitChanges();
        LoadDanhMuc();
        lblMessage.Text = "Xóa từ khóa sản phẩm thành công";
    }
}