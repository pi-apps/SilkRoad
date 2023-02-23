using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Database;
using DevExpress.Web;
using dxtLib.WebProvider;

public partial class prodraftadmin_congty_nhanvien_EmployeeInfo : PrivateUser
{
    public store_CustomerTransactionHistory store_CustomerTransaction { get; set; }
    public string TrangThaiXacNhanUser { get; set; }
    public string TrangThaiXacNhanAdmin { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        TrangThaiXacNhanUser = "";
        store_CustomerTransaction = dbConnect.store_CustomerTransactionHistories.Single(n => n.Id == int.Parse(Request["Id"]));
        if (!IsPostBack)
        {
            txtNote.Text = store_CustomerTransaction.Note;
            MultiView1.ActiveViewIndex = 0;
            if ((store_CustomerTransaction.IsDeleted == false || store_CustomerTransaction.IsDeleted == null) || store_CustomerTransaction.IsAdminConfirm==false)
            {
                btnSave.Visible = true; MultiView1.ActiveViewIndex = 1;
            }
            else
            {
                btnSave.Visible = false; MultiView1.ActiveViewIndex = 0;
            }
            if(store_CustomerTransaction.IsUserConfirm == true)
            {
                btnSave.Visible = false; MultiView1.ActiveViewIndex = 0;
            }
            else { btnSave.Visible = true; MultiView1.ActiveViewIndex = 1; }
            if (store_CustomerTransaction.IsUserConfirm == false || store_CustomerTransaction.IsUserConfirm == null)
            {
                TrangThaiXacNhanUser = "<span class='naptien-choxacnhanuser'>Chưa xác nhận</span>";
            }
            else
            {
                TrangThaiXacNhanUser = "<span class='naptien-daxacnhanuser'>Đã xác nhận</span>";
            }
            if (store_CustomerTransaction.IsAdminConfirm == false || store_CustomerTransaction.IsAdminConfirm == null)
            {
                TrangThaiXacNhanAdmin = "<span class='naptien-choxacnhanadmin'>Chưa xác nhận</span>";
            }
            else
            {
                TrangThaiXacNhanAdmin = "<span class='naptien-daxacnhanadmin'>Đã xác nhận</span>";
            }
        }
    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        string urlImageFolder = "user_upload/giao-dich/nap-tien/" + DateTime.Now.Year + "/" + DateTime.Now.Month.ToString("00");
        System.IO.Directory.CreateDirectory(Server.MapPath("~/" + urlImageFolder));
        store_CustomerTransaction = dbConnect.store_CustomerTransactionHistories.Single(n => n.Id == int.Parse(Request["Id"]));
        //update chứng từ
        store_CustomerTransaction.UpdatedAt = DateTime.Now;
        store_CustomerTransaction.UpdatedBy = Account.Email;
        store_CustomerTransaction.Note = txtNote.Text;
        store_CustomerTransaction.IsUserConfirm = rdoIsUserConfirm.Checked;
        if(store_CustomerTransaction.IsUserConfirm==true)
            store_CustomerTransaction.UserConfirmDate = DateTime.Now;
        if (fulAttachedFile.HasFile)
        {
            string doihinh = fulAttachedFile.FileName.Trim();
            doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
            string hinh_web = "chungtu-" + Account.Code + ("-" + DateTime.Now.Ticks) + doihinh;
            fulAttachedFile.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
            string ImgSub = urlImageFolder + "/" + hinh_web;
            store_CustomerTransaction.AttachedFile = ImgSub;
        }
        dbConnect.SubmitChanges();
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "refreshParent()", true);
        ClientAlerter.Show(this, "Lưu dữ liệu thành công");
    }
}