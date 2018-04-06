using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SD = System.Drawing;
using System.Text;
using BanOto.Entity;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;
using BanOto.Entity.Dao;

namespace BanHangDienTu.Admin
{
    public partial class AddCatalog : System.Web.UI.Page
    {
        BanOtoEntities db = new BanOtoEntities();
        string fileName = "dummy.png";
        protected string UploadFolderPath = "~/Images/Avatars/DP/";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillData();
            }
        }

        private void FillData()
        {
            var result = UserDao.Instance.GetUsers();
            userList.DataSource = result;
            userList.DataBind();
        }


        void SetNotify(string modal, string status, string type, string content)
        {
            string csName = "CreateScript";
            Type csType = this.GetType();
            ClientScriptManager cs = Page.ClientScript;
            if (!cs.IsStartupScriptRegistered(csType, csName))
            {
                StringBuilder csText = new StringBuilder();
                csText.Append(@"$('#" + modal + "').modal('hide'); $.notify({title: '<strong>" + status + "</strong>',message: '" + content + "'},{type: '" + type + "', offset: 120});");
                ScriptManager.RegisterStartupScript(this, csType, csName, csText.ToString(), true);
            }
        }


        protected void Update_Click(object sender, EventArgs e)
        {

            //Catalog catalog = CatalogDao.Instance.GetCatalog(ID);

            string id = txtUserID.Value.ToString();

            var user = new User();

            user = db.Users.Find(id);
            if (user != null)
            {
                //Update
                string repass = txtRePass.Text;
                try
                {
                    if (!string.IsNullOrEmpty(txtName.Text))
                    {
                        if (!string.IsNullOrEmpty(txtEmail.Text))
                        {
                            if (!string.IsNullOrEmpty(txtPass.Text))
                            {
                                if (!string.IsNullOrEmpty(txtRePass.Text))
                                {
                                    if (txtPass.Text.Equals(txtRePass.Text))
                                    {
                                        if (rdoNam.Checked)
                                        {
                                            user.GT = false;
                                        }
                                        else if (rdoNu.Checked)
                                        {
                                            user.GT = true;
                                        }
                                        user.IsLock = chkStatus.Checked;
                                        user.MatKhau = txtRePass.Text;
                                        user.Sdt = txtPhone.Text;
                                        user.DiaChi = txtAddress.Text;
                                        user.HoTen = txtName.Text;
                                        user.Email = txtEmail.Text;
                                        if (UserDao.Instance.UpdateUser(user))
                                        {
                                            //Update success
                                            SetNotify("create", "Xong!", "success", "Cập nhật thông tin người dùng thành công.");
                                            FillData();
                                        }
                                        else
                                        {
                                            //Update false
                                            SetNotify("create", "Lỗi!", "danger", "Cập nhật thông tin người dùng không thành công. Đã có lỗi xảy ra. Hãy thử lại sau");
                                        }
                                    }
                                    else
                                    {
                                        SetNotify("create", "Lỗi!", "danger", "Cập nhật thông tin người dùng không thành công. Mật khẩu không trùng khớp");
                                    }
                                }
                                else
                                {
                                    SetNotify("create", "Lỗi!", "danger", "Cập nhật thông tin người dùng không thành công. Hãy nhập vào mật khẩu");
                                }
                            }
                            else
                            {
                                SetNotify("create", "Lỗi!", "danger", "Cập nhật thông tin người dùng không thành công. Hãy nhập vào mật khẩu");
                            }
                        }
                        else
                        {
                            SetNotify("create", "Lỗi!", "danger", "Cập nhật thông tin người dùng không thành công. Hãy nhập vào địa chỉ Email");
                        }
                    }
                    else
                    {
                        SetNotify("create", "Lỗi!", "danger", "Cập nhật thông tin người dùng không thành công. Hãy nhập vào Họ tên của bạn");
                    }
                }
                catch { }
            }
            else
            {
                //Insert
                try
                {
                    if (!string.IsNullOrEmpty(txtName.Text))
                    {

                        if (!string.IsNullOrEmpty(txtEmail.Text))
                        {
                            if (!string.IsNullOrEmpty(txtPass.Text))
                            {
                                if (!string.IsNullOrEmpty(txtRePass.Text))
                                {
                                    if (txtPass.Text.Equals(txtRePass.Text))
                                    {
                                        User temp = new User();
                                        temp.MatKhau = txtPass.Text;
                                        temp.MaQuyen = 2;
                                        temp.DiaChi = txtAddress.Text;
                                        temp.Email = txtEmail.Text;
                                        temp.HoTen = txtName.Text;
                                        temp.Sdt = txtPhone.Text;
                                        string userID = db.Database.SqlQuery<String>(String.Format(@"select [dbo].[FN_GetUserIDNext]()")).FirstOrDefault();
                                        temp.UserName = userID;

                                        if (rdoNam.Checked)
                                        {
                                            temp.GT = false;
                                        }
                                        else if (rdoNu.Checked)
                                        {
                                            temp.GT = true;
                                        }
                                        temp.IsLock = chkStatus.Checked;
                                        if (UserDao.Instance.CreateUser(temp))
                                        {
                                            //Create success
                                            SetNotify("create", "Xong!", "success", "Thêm mới người dùng thành công.");
                                            FillData();
                                        }
                                        else
                                        {
                                            //Create fales
                                            SetNotify("create", "Lỗi!", "danger", "Cập nhật thông tin người dùng không thành công. Đã có lỗi xảy ra. Hãy thử lại sau");
                                        }
                                    }
                                    else
                                    {
                                        SetNotify("create", "Lỗi!", "danger", "Cập nhật thông tin người dùng không thành công. Mật khẩu không trùng khớp");
                                    }
                                }
                                else
                                {
                                    SetNotify("create", "Lỗi!", "danger", "Cập nhật thông tin người dùng không thành công. Hãy nhập vào mật khẩu");
                                }
                            }
                            else
                            {
                                SetNotify("create", "Lỗi!", "danger", "Cập nhật thông tin người dùng không thành công. Hãy nhập vào mật khẩu");
                            }
                        }
                        else
                        {
                            SetNotify("create", "Lỗi!", "danger", "Cập nhật thông tin người dùng không thành công. Hãy nhập vào địa chỉ Email");
                        }
                    }
                    else
                    {
                        SetNotify("create", "Lỗi!", "danger", "Cập nhật thông tin người dùng không thành công. Hãy nhập vào Họ tên của bạn");
                    }
                }
                catch (Exception ex) { }
            }
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            string UserID = txtUserID_Delete.Value.ToString();

            //Do something to delete
            var user = UserDao.Instance.GetUser(UserID);
            if (user != null)
            {
                try
                {
                    if (UserDao.Instance.DeleteUser(user.UserName))
                    {
                        //Delete success
                        SetNotify("modalDelete", "Xong!", "success", "Đã xóa người dùng khỏi hệ thống.");
                        FillData();
                    }
                    else
                    {
                        //Delete false
                        SetNotify("modalDelete", "Lỗi!", "danger", "Xóa người dùng không thành công. Đã có lỗi xảy ra. Hãy thử lại sau");
                    }
                }
                catch (Exception ex) { }
            }
        }

        void RefeshData()
        {
            txtUserID.Value = "";
            txtAddress.Text = "";
            txtEmail.Text = "";
            txtName.Text = "";
            txtPass.Text = "";
            txtPhone.Text = "";
            chkStatus.Checked = false;
            rdoNam.Checked = false;
            rdoNu.Checked = false;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string csName = "CreateScript";
            Type csType = this.GetType();

            txtUserID.Value = "";
            createlabel.Text = "Thêm mới người dùng";
            ClientScriptManager cs = Page.ClientScript;
            if (!cs.IsStartupScriptRegistered(csType, csName))
            {
                StringBuilder csText = new StringBuilder();
                csText.Append("$(document).ready(function(){$('#create').modal({ backdrop: 'static', keyboard: false, show: true });});");
                ScriptManager.RegisterStartupScript(this, csType, csName, csText.ToString(), true);
            }
        }


        protected void userList_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "UpdateItem")
            {
                string userID = e.CommandArgument.ToString();
                var user = db.Users.Find(userID);
                if (user != null)
                {
                    txtUserID.Value = user.UserName;
                    txtAddress.Text = user.DiaChi;
                    txtEmail.Text = user.Email;
                    txtName.Text = user.HoTen;
                    txtPass.Text = user.MatKhau;
                    txtPhone.Text = user.Sdt;
                    chkStatus.Checked = user.IsLock;
                    if (user.GT.HasValue)
                    {
                        if (user.GT.Value)
                        {
                            rdoNu.Checked = true;
                        }
                        else
                        {
                            rdoNam.Checked = true;
                        }
                    }

                    createlabel.Text = "Chỉnh sửa thông tin người dùng " + user.HoTen;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#create').modal('show');", true);
                    updateModal.Update();
                }
            }
            else if (e.CommandName == "DeleteItem")
            {
                string userID = e.CommandArgument.ToString();
                var user = db.Users.Find(userID);
                if (user != null)
                {
                    txtUserID_Delete.Value = user.UserName;
                    deletelabel.Text = user.HoTen;
                    //txtCatalogID_Delete.Value = CatalogDao.Instance.GetCatalog(int.Parse(catalogID)).CatalogID + "";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#modalDelete').modal('show');", true);
                    deleteModal.Update();
                }
            }
        }

        #region Resize Image With Best Qaulity

        private SD.Image RezizeImage(SD.Image img, int maxWidth, int maxHeight)
        {
            if (img.Height < maxHeight && img.Width < maxWidth) return img;
            using (img)
            {
                Double xRatio = (double)img.Width / maxWidth;
                Double yRatio = (double)img.Height / maxHeight;
                Double ratio = Math.Max(xRatio, yRatio);
                int nnx = (int)Math.Floor(img.Width / ratio);
                int nny = (int)Math.Floor(img.Height / ratio);
                Bitmap cpy = new Bitmap(nnx, nny, SD.Imaging.PixelFormat.Format32bppArgb);
                using (Graphics gr = Graphics.FromImage(cpy))
                {
                    gr.Clear(Color.Transparent);

                    // This is said to give best quality when resizing images
                    gr.InterpolationMode = InterpolationMode.HighQualityBicubic;

                    gr.DrawImage(img,
                        new Rectangle(0, 0, nnx, nny),
                        new Rectangle(0, 0, img.Width, img.Height),
                        GraphicsUnit.Pixel);
                }
                return cpy;
            }

        }

        private MemoryStream BytearrayToStream(byte[] arr)
        {
            return new MemoryStream(arr, 0, arr.Length);
        }
        #endregion
    }
}