using BanOto.Entity;
using BanOto.Entity.Dao;
using BanOto.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanOto
{
    public partial class DangNhap : System.Web.UI.Page
    {
        BanOtoEntities db = new BanOtoEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            var session = Session[CommonContanst.USER_SESSION] as UserLogin;
            if(session != null)
            {
                if (session.Role != 0)
                {
                    Response.Redirect("TrangChu.aspx");
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

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtUsername.Text))
            {
                if (!string.IsNullOrEmpty(txtPassword.Text))
                {
                    int check = UserDao.Instance.CheckUser(txtUsername.Text.Trim(), txtPassword.Text.Trim());
                    if (check == -2)
                    {
                        SetNotify("Đăng nhập thất bại!!!", "danger", "Tài khoản không tồn tại.");
                    }
                    else if (check == -1)
                    {
                        SetNotify("Đăng nhập thất bại!!!", "danger", "Tài khoản đã bị khóa");
                    }
                    else if (check == 0)
                    {
                        SetNotify("Đăng nhập thất bại!!!", "danger", "Sai mật khẩu");
                    }
                    else if (check == 1)
                    {
                        UserLogin session = new UserLogin();
                        var user = UserDao.Instance.GetUser(txtUsername.Text, txtPassword.Text);
                        if (user != null)
                        {
                            session.UserID = user.UserName;
                            session.LoginTime = DateTime.Now;
                            session.UserName = user.Email;
                            session.Role = user.MaQuyen;
                            session.Avatar = user.Avatar;
                            Session[CommonContanst.USER_SESSION] = session;
                            Response.Redirect("TrangChu.aspx");
                        }
                        else
                        {
                            SetNotify("Lỗi!", "danger", "Đã có lỗi xảy ra trong quá trình đăng nhập.");
                        }
                    }
                }
                else
                {
                    SetNotify("Lỗi!", "danger", "Bạn chưa nhập mật khẩu.");
                }
            }
            else
            {
                SetNotify("Lỗi!", "danger", "Bạn chưa nhập tài khoản.");
            }
        }

        protected void btnDangKy_Click(object sender, EventArgs e)
        {
            //Insert
            try
            {
                if (!string.IsNullOrEmpty(txtEmail.Text))
                {

                    if (!string.IsNullOrEmpty(txtEmail.Text))
                    {
                        if (!string.IsNullOrEmpty(txtMatKhau.Text))
                        {
                            if (!string.IsNullOrEmpty(txtNhapLai.Text))
                            {
                                if (txtMatKhau.Text.Equals(txtNhapLai.Text))
                                {
                                    User temp = new User();
                                    temp.MatKhau = txtMatKhau.Text;
                                    temp.MaQuyen = 2;
                                    temp.DiaChi = txtDiaChi.Text;
                                    temp.Email = txtEmail.Text;
                                    temp.HoTen = txtFullName.Text;
                                    temp.Sdt = txtSdt.Text;
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
                                    temp.IsLock = false;
                                    if (UserDao.Instance.CreateUser(temp))
                                    {
                                        //Create success
                                        Log log = new Log();
                                        UserLogin session = new UserLogin();
                                        string LogID = db.Database.SqlQuery<String>(String.Format(@"select [dbo].[FN_GetLogIDNext]()")).FirstOrDefault();
                                        log.MaLog = LogID;
                                        log.TimeCreate = DateTime.Now;
                                        log.UserName = temp.Email;
                                        log.IsRead = false;
                                        log.Messages = log.UserName + " Đã đăng ký người dùng: " + "Mã người dùng: " + temp.UserName + " Tên: " + temp.HoTen + " vào " + DateTime.Now.ToString();
                                        LogDao.Instance.Create(log);

                                        session.UserID = temp.UserName;
                                        session.LoginTime = DateTime.Now;
                                        session.UserName = temp.Email;
                                        session.Role = temp.MaQuyen;
                                        session.Avatar = temp.Avatar;
                                        Session[CommonContanst.USER_SESSION] = session;
                                        Response.Redirect("TrangChu.aspx");
                                    }
                                    else
                                    {
                                        //Create fales
                                        SetNotify("Lỗi!", "danger", "Cập nhật thông tin người dùng không thành công. Đã có lỗi xảy ra. Hãy thử lại sau");
                                    }
                                }
                                else
                                {
                                    SetNotify( "Lỗi!", "danger", "Cập nhật thông tin người dùng không thành công. Mật khẩu không trùng khớp");
                                }
                            }
                            else
                            {
                                SetNotify( "Lỗi!", "danger", "Cập nhật thông tin người dùng không thành công. Hãy nhập vào mật khẩu");
                            }
                        }
                        else
                        {
                            SetNotify("Lỗi!", "danger", "Cập nhật thông tin người dùng không thành công. Hãy nhập vào mật khẩu");
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