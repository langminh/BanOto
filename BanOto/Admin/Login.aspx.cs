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

namespace BanOto.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        BanOtoEntities db = new BanOtoEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

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
                    int check = UserDao.Instance.CheckUser(txtUsername.Text, txtPassword.Text);
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
                    else
                    {
                        UserLogin session = new UserLogin();
                        var user = UserDao.Instance.GetUser(txtUsername.Text, txtPassword.Text);
                        if (user != null)
                        {
                            if (user.MaQuyen == 1)
                            {
                                session.UserID = user.UserName;
                                session.LoginTime = DateTime.Now;
                                session.UserName = user.Email;
                                session.Role = user.MaQuyen;
                                session.Avatar = user.Avatar;
                                Session[CommonContanst.USER_SESSION] = session;
                                Log log = new Log();

                                string LogID = db.Database.SqlQuery<String>(String.Format(@"select [dbo].[FN_GetLogIDNext]()")).FirstOrDefault();
                                log.MaLog = LogID;
                                log.Type = "login";
                                log.TimeCreate = DateTime.Now;
                                log.IsRead = false;
                                log.TimeLogin = DateTime.Now;
                                log.Messages = user.Email + " Đăng nhập hệ thống quản trị vào " + DateTime.Now.ToString("hh:MM dd/mm/yyyy");
                                log.UserName = user.UserName;
                                LogDao.Instance.Create(log);
                                Response.Redirect("~/Admin/Index.aspx");
                            }
                            else
                            {
                                SetNotify("Hạn chế quyền!", "danger", "Bạn không có quyền truy cập!!!.");
                            }
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
    }
}