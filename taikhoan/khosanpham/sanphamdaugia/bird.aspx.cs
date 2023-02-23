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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Request["Id"] != null)
            {
                var model = dbConnect.pro_Products.Single(n => n.Id == int.Parse(Request["Id"]));
                if (model.IsAuctionEnd == true)
                {
                    btnSave.Visible = false;
                }
                else
                {
                    btnSave.Visible = true;
                }
                txtPriceAuction.Text = model.PriceAuction + "";
                try
                {
                    txtTimeStart.Text = model.AuctionStart.Value.ToString("dd/MM/yyyy HH:mm:ss");
                    txtTimeEnd.Text = model.AuctionEnd.Value.ToString("dd/MM/yyyy HH:mm:ss");
                }
                catch { }
                if (model.AuctionEnd < DateTime.Now)
                {
                    txtPriceAuction.ReadOnly = true;
                    txtTimeEnd.ReadOnly = true;
                    txtTimeStart.ReadOnly = true;
                    btnSave.Visible = false;
                }
            }
        }
    }
    public string TransactionCode()
    {
        try
        {
            var cusCount = dbConnect.store_CustomerTransactionHistories.ToList().Last().Id + 1;
            return string.Format("{0:PT00000000}", cusCount);
        }
        catch
        {
            return string.Format("{0:PT00000000}", 1);
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool flag = false;
        string message = "";
        try
        {
            if (Request["Id"] != null)
            {
                #region Update
                var model = dbConnect.pro_Products.Single(n => n.Id == int.Parse(Request["Id"]));

                model.UpdatedAt = DateTime.Now;
                model.UpdatedBy = Account.Email;
                //if (model.AuctionStart > DateTime.Now)
                //{
                model.AuctionStart = DateTime.ParseExact(txtTimeStart.Text, "dd/MM/yyyy HH:mm:ss", null);
                model.AuctionEnd = DateTime.ParseExact(txtTimeEnd.Text, "dd/MM/yyyy HH:mm:ss", null);
                model.PriceAuction = double.Parse(txtPriceAuction.Text.Replace(",", ""));
                //cap nhat lai  tien coc
                var customer = dbConnect.store_Customers.Single(n => n.Id == Account.Id);
                var customerTransactionHistory = dbConnect.store_CustomerTransactionHistories.SingleOrDefault(b => b.pro_ProductId == model.Id && b.IsAuction == true);
                if (customerTransactionHistory != null)
                {
                    if (model.PriceAuction != customerTransactionHistory.Amount)
                    {
                        if ((customerTransactionHistory.Amount + customer.AmountBalance) >= double.Parse(txtPriceAuction.Text.Replace(",", "")))
                        {
                            customer.AmountBalance = (customerTransactionHistory.Amount + customer.AmountBalance) - double.Parse(txtPriceAuction.Text.Replace(",", ""));
                            customer.UpdatedAt = DateTime.Now;
                            customer.UpdatedBy = Account.Email;

                            model.PriceAuction = double.Parse(txtPriceAuction.Text.Replace(",", ""));
                            customerTransactionHistory.Amount = double.Parse(txtPriceAuction.Text.Replace(",", ""));
                            customerTransactionHistory.UpdatedAt = DateTime.Now;
                            customerTransactionHistory.UpdatedBy = Account.Email;
                        }
                        else
                        {

                        }
                    }
                }
                else
                {
                    if (customer.AmountBalance >= model.PriceAuction)
                    {
                        var store_CustomerTransactionHistory = new store_CustomerTransactionHistory()
                        {
                            Code = TransactionCode(),
                            IsAuction = true,
                            pro_Product = model,
                            IsUserConfirm = true,
                            UserConfirmDate = DateTime.Now,
                            IsAdminConfirm = true,
                            AdminConfirmDate = DateTime.Now,
                            IsDeleted = false,
                            Amount = model.PriceAuction,
                            CreatedAt = DateTime.Now,
                            CreatedBy = Account.Email,
                            store_CustomerId = customer.Id,
                            store_TransactionTypeId = 10
                        };
                        dbConnect.store_CustomerTransactionHistories.InsertOnSubmit(store_CustomerTransactionHistory);
                        //tru tien tai khoản
                        customer.AmountBalance -= model.PriceAuction;
                        customer.UpdatedAt = DateTime.Now;
                        customer.UpdatedBy = Account.Email;
                        model.IsAuctionPublic = true;
                        model.IsStatus = true;
                    }
                    else
                    {
                        model.IsAuctionPublic = false;
                        model.IsStatus = false;
                    }
                }
                //}
                model.IsAuction = true;
                message = "Cập nhật thành công.";
                #endregion
            }
            dbConnect.SubmitChanges();
            flag = true;
        }
        catch (Exception ex)
        {

        }
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