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
    public partial class LockScreen : System.Web.UI.Page
    {
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
            UserLogin user = Session[CommonContanst.USER_SESSION] as UserLogin;
            if(user != null)
            {
                if (!string.IsNullOrEmpty(txtPass.Text))
                {
                    string pass = UserDao.Instance.GetUser(user.UserID).MatKhau;
                    if (pass.Equals(txtPass.Text))
                    {
                        if (user.Role == 1)
                        {
                            Response.Redirect("~/Admin/Index.aspx");
                        }
                        else
                        {
                            SetNotify("Lỗi!", "danger", "Bạn không có quyền truy cập.");
                        }
                    }
                    else
                    {
                        SetNotify("Lỗi!", "danger", "Sai mật khẩu.");
                    }
                }
                else
                {
                    SetNotify("Lỗi!", "danger", "Bạn chưa nhập mật khẩu.");
                }
            }
            else
            {
                SetNotify("Lỗi!", "danger", "Phiên làm việc hết hạn. Hãy đăng nhập lại.");
            }
        }
    }
}