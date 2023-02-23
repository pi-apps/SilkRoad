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
    public store_ShopRental store_ShopRental { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        store_ShopRental = dbConnect.store_ShopRentals.Single(n => n.Id == int.Parse(Request["Id"]));
        if (!IsPostBack)
        {
            //load tinh
            ddlTinh.DataSource = dbConnect.tblTinhs.OrderBy(n => n.Name);
            ddlTinh.DataTextField = "Name";
            ddlTinh.DataValueField = "Id";
            ddlTinh.DataBind();
            ddlTinh.Items.Insert(0, new ListItem("--Chọn tỉnh/thành phố--", ""));
            ddlQuanHuyen.Items.Insert(0, new ListItem("--Chọn quận/huyện--", ""));
            ddlPhuongXa.Items.Insert(0, new ListItem("--Chọn phường/xã--", ""));
            txtName.Text = store_ShopRental.Name;
            txtTelegram.Text = store_ShopRental.Telegram;
            txtHotline.Text = store_ShopRental.Hotline;
            txtFacebookMess.Text = store_ShopRental.FacebookMess;
            txtLinkGoogleMap.Text = store_ShopRental.LinkGoogleMap;
            txtFacebook.Text = store_ShopRental.Facebook;
            if (store_ShopRental.store_ShopLocations.Count > 0)
            {
                var store_ShopLocation = store_ShopRental.store_ShopLocations.First();
                txtAddress.Text = store_ShopLocation.Address;
                if (store_ShopLocation.tblTinhId != null)
                {
                    ddlTinh.SelectedValue = store_ShopLocation.tblTinhId + "";
                    ddlTinh_SelectedIndexChanged(sender, e);
                    if (store_ShopLocation.tblQuanHuyenId != null)
                    {
                        ddlQuanHuyen.SelectedValue = store_ShopLocation.tblQuanHuyenId + "";
                        ddlQuanHuyen_SelectedIndexChanged(sender, e);
                        ddlPhuongXa.SelectedValue = store_ShopLocation.tblPhuongXaId + "";
                    }
                }
                txtLat.Text = store_ShopLocation.Lat;
                txtLong.Text = store_ShopLocation.Long;
                txtGoogleMap.Text = store_ShopLocation.GoogleMap;
            }
        }
    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        store_ShopRental = dbConnect.store_ShopRentals.Single(n => n.Id == int.Parse(Request["Id"]));
        store_ShopRental.Name = txtName.Text;
        store_ShopRental.FacebookMess = txtFacebookMess.Text;
        store_ShopRental.Facebook = txtFacebook.Text;
        store_ShopRental.Hotline = txtHotline.Text;
        store_ShopRental.LinkGoogleMap = txtLinkGoogleMap.Text;
        store_ShopRental.Telegram = txtTelegram.Text;
        if (store_ShopRental.store_ShopLocations.Count > 0)
        {
            var store_ShopLocation = store_ShopRental.store_ShopLocations.First();
            store_ShopLocation.Address = txtAddress.Text;
            store_ShopLocation.Lat = txtLat.Text;
            store_ShopLocation.Long = txtLong.Text;
            store_ShopLocation.LinkGoogleMap = txtLinkGoogleMap.Text;
            store_ShopLocation.GoogleMap = txtGoogleMap.Text;
            try { store_ShopLocation.tblTinhId = int.Parse(ddlTinh.SelectedValue); } catch { }
            try { store_ShopLocation.tblQuanHuyenId = int.Parse(ddlQuanHuyen.SelectedValue); } catch { }
            try { store_ShopLocation.tblPhuongXaId = int.Parse(ddlPhuongXa.SelectedValue); } catch { }
        }
        else
        {
            var store_ShopLocation = new store_ShopLocation() { };
            store_ShopLocation.Address = txtAddress.Text;
            store_ShopLocation.Lat = txtLat.Text;
            store_ShopLocation.Long = txtLong.Text;
            store_ShopLocation.LinkGoogleMap = txtLinkGoogleMap.Text;
            store_ShopLocation.GoogleMap = txtGoogleMap.Text;
            try { store_ShopLocation.tblTinhId = int.Parse(ddlTinh.SelectedValue); } catch { }
            try { store_ShopLocation.tblQuanHuyenId = int.Parse(ddlQuanHuyen.SelectedValue); } catch { }
            try { store_ShopLocation.tblPhuongXaId = int.Parse(ddlPhuongXa.SelectedValue); } catch { }
            dbConnect.store_ShopLocations.InsertOnSubmit(store_ShopLocation);
        }
        dbConnect.SubmitChanges();
        ClientAlerter.Show(this, "Lưu dữ liệu thành công");
    }

    protected void ddlTinh_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlTinh.SelectedValue != "")
        {
            ddlQuanHuyen.DataSource = dbConnect.tblQuanHuyens.Where(n=>n.tblTinhId==int.Parse(ddlTinh.SelectedValue)).OrderBy(n => n.Name);
            ddlQuanHuyen.DataTextField = "Name";
            ddlQuanHuyen.DataValueField = "Id";
            ddlQuanHuyen.DataBind();
            ddlQuanHuyen.Items.Insert(0, new ListItem("--Chọn quận/huyện--", ""));
            ddlPhuongXa.Items.Clear();
            ddlPhuongXa.Items.Insert(0, new ListItem("--Chọn phường/xã--", ""));
        }
        else
        {
            ddlQuanHuyen.Items.Clear();
            ddlPhuongXa.Items.Clear();
            ddlQuanHuyen.Items.Insert(0, new ListItem("--Chọn quận/huyện--", ""));
            ddlPhuongXa.Items.Insert(0, new ListItem("--Chọn phường/xã--", ""));
        }
    }

    protected void ddlQuanHuyen_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlQuanHuyen.SelectedValue != "")
        {
            ddlPhuongXa.DataSource = dbConnect.tblQuanHuyens.Where(n => n.tblTinhId == int.Parse(ddlTinh.SelectedValue)).OrderBy(n => n.Name);
            ddlPhuongXa.DataTextField = "Name";
            ddlPhuongXa.DataValueField = "Id";
            ddlPhuongXa.DataBind();
            ddlPhuongXa.Items.Insert(0, new ListItem("--Chọn phường/xã--", ""));
        }
        else
        {
            ddlPhuongXa.Items.Clear();
            ddlPhuongXa.Items.Insert(0, new ListItem("--Chọn phường/xã--", ""));
        }
    }
}