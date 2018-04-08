using BanOto.Entity;
using BanOto.Entity.Dao;
using BanOto.Helper;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanOto
{
    public partial class Profile : System.Web.UI.Page
    {
        BanOtoEntities db = new BanOtoEntities();
        string fileName = "dummy.png";
        protected string UploadFolderPath = "~/Images/Avatars/DP/";
        protected void Page_Load(object sender, EventArgs e)
        {
            var session = Session[CommonContanst.USER_SESSION] as UserLogin;
            if (session != null)
            {
                if (session.Role != 0)
                {
                    load();
                }
                else
                {

                }
            }
            else
            {
                Response.Redirect("DangNhap.aspx");
            }
        }

        void load()
        {
            var session = Session[CommonContanst.USER_SESSION] as UserLogin;
            if (session != null)
            {
                var user = db.Users.Find(session.UserID);
                userImg.Src = "../Images/Avatars/" + user.Avatar;
                userName.Text = user.Email;
                userFullName.Text = user.HoTen;
                lbAddress.Text = user.DiaChi;
                lbEmail.Text = user.Email;
                txtPhone.Text = user.Sdt;
                txtAddress.Text = user.DiaChi;
                txtName.Text = user.HoTen;
                txtEmail.Text = user.Email;
                Image1.ImageUrl = "../Images/Avatars/" + user.Avatar;
                if (user.Sdt != null)
                    lbPhone.Text = user.Sdt;
                if (user.GT.HasValue)
                {
                    lbGT.Text = user.GT.Value == false ? "Nam" : "Nữ";
                }
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                try
                {
                    var session = Session[CommonContanst.USER_SESSION] as UserLogin;
                    if (session != null)
                    {
                        string filename = Path.GetFileName(FileUpload1.FileName);
                        FileUpload1.SaveAs(Server.MapPath("~/Images/Avatars/") + filename);
                        Image1.ImageUrl = "~/Images/Avatars/" + filename;
                        fileName = filename;

                        string id = session.UserID;
                        var user = db.Users.Find(id);
                        if (user != null)
                        {
                            try
                            {
                                user.Avatar = filename;
                                db.SaveChanges();
                                load();
                                SetNotify("Xong!", "success", "Tải lên ảnh thành công!");
                            }
                            catch (Exception ex) { }
                        }
                    }
                }
                catch (Exception ex)
                {
                    SetNotify("Lỗi!", "danger", "Đã xảy ra lỗi trong quá trình tải ảnh lên. Hãy thử lại sau");
                }
            }
        }

        void SetNotify(string status, string type, string content)
        {
            string csName = "CreateScript";
            Type csType = this.GetType();
            ClientScriptManager cs = Page.ClientScript;
            if (!cs.IsStartupScriptRegistered(csType, csName))
            {
                StringBuilder csText = new StringBuilder();
                csText.Append(@"$.notify({title: '<strong>" + status + "</strong>',message: '" + content + "'},{type: '" + type + "'});");
                ScriptManager.RegisterStartupScript(this, csType, csName, csText.ToString(), true);
            }
        }

        protected void btnCreateOk_Click(object sender, EventArgs e)
        {
            var session = Session[CommonContanst.USER_SESSION] as UserLogin;
            if (session != null)
            {
                string id = session.UserID;

                var user = db.Users.Find(id);
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
                                user.Sdt = txtPhone.Text;
                                user.DiaChi = txtAddress.Text;
                                user.HoTen = txtName.Text;
                                user.Email = txtEmail.Text;
                                if (rdoNam.Checked)
                                {
                                    user.GT = false;
                                }else if (rdoNu.Checked)
                                {
                                    user.GT = true;
                                }
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
                                            user.MatKhau = txtRePass.Text;
                                        }
                                        else
                                        {
                                            SetNotify("Lỗi!", "danger", "Cập nhật thông tin người dùng không thành công. Mật khẩu không trùng khớp");
                                        }
                                    }
                                    else
                                    {
                                        SetNotify("Lỗi!", "danger", "Cập nhật thông tin người dùng không thành công. Hãy nhập vào mật khẩu");
                                    }
                                }
                                else
                                {
                                    SetNotify("Lỗi!", "danger", "Cập nhật thông tin người dùng không thành công. Hãy nhập vào mật khẩu");
                                }
                                try { 
                                    
                                    db.SaveChanges();
                                    load();
                                    SetNotify("Xong!", "success", "Cập nhật thông tin người dùng thành công.");
                                }catch(Exception ex) {
                                    //Update false
                                    SetNotify("Lỗi!", "danger", "Cập nhật thông tin người dùng không thành công. Đã có lỗi xảy ra. Hãy thử lại sau");
                                }
                            }
                            else
                            {
                                SetNotify("Lỗi!", "danger", "Cập nhật thông tin người dùng không thành công. Hãy nhập vào địa chỉ Email");
                            }
                        }
                        else
                        {
                            SetNotify("Lỗi!", "danger", "Cập nhật thông tin người dùng không thành công. Hãy nhập vào Họ tên của bạn");
                        }
                    }
                    catch (Exception ex) { }
                }
            }
        }
    }
}