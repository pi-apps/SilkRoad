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
    public sys_Config sys_Config { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        sys_Config = dbConnect.sys_Configs.Single(n => n.Id == 1);
        if (!IsPostBack)
        {

        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        CodeSystemUtil codeSystemUtil = new CodeSystemUtil();
        string urlImageFolder = "user_upload/giao-dich/nap-tien/" + DateTime.Now.Year + "/" + DateTime.Now.Month.ToString("00");
        System.IO.Directory.CreateDirectory(Server.MapPath("~/" + urlImageFolder));
        bool flag = false;
        string message = "";
        try
        {
            #region Create
            var model = new store_CustomerTransactionHistory()
            {
                CreatedAt = DateTime.Now,
                CreatedBy = Account.Email,IsAuction=false,
                Code= codeSystemUtil.TransactionCode(),
                Amount = double.Parse(txtAmount.Text.Replace(",", "")),
                IsDeleted = false,
                IsUserConfirm= rdoIsUserConfirm.Checked,
                IsAdminConfirm=false,
                Note=txtNote.Text,
                store_TransactionTypeId=1,
                store_CustomerId=Account.Id
            };
            //update chứng từ
            if (fulAttachedFile.HasFile)
            {
                string doihinh = fulAttachedFile.FileName.Trim();
                doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
                string hinh_web = "chungtu-" + Account.Code + ("-" + DateTime.Now.Ticks) + doihinh;
                fulAttachedFile.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
                string ImgSub = urlImageFolder + "/" + hinh_web;
                model.AttachedFile = ImgSub;
            }
            if (rdoIsUserConfirm.Checked == true)//cập nhật ngày
            {
                try { model.UserConfirmDate = DateTime.ParseExact(txtUserConfirmDate.Text, "dd/MM/yyyy", null); } catch { }
            }
            dbConnect.store_CustomerTransactionHistories.InsertOnSubmit(model);
            message = "Tạo giao dịch thành công.";
            #endregion
            dbConnect.SubmitChanges();
            flag = true;
        }
        catch{ }
        if (flag)
        {
            ClientAlerter.ShowAndGoto(message, "list.aspx");
        }
        else
        {
            ClientAlerter.Show(this, "Lưu dữ liệu thất bại. Vui lòng kiểm tra lại");
        }
    }
}