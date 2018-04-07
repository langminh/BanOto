using BanOto.Entity;
using BanOto.Entity.Dao;
using BanOto.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanOto.Admin
{
    public partial class TrangCaNhan : System.Web.UI.Page
    {
        protected string css_Class = "";
        BanOtoEntities db = new BanOtoEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var session = Session[CommonContanst.USER_SESSION] as UserLogin;
                if (session != null)
                {
                    if (session.Role == 1)
                    {
                        load();
                    }
                    else
                    {

                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        public string GetType(string type)
        {
            switch (type)
            {
                case "login":
                    return "fa-sign-in";
                case "logout":
                    return "fa-sign-out";
                case "upload":
                    return "fa-upload";
                case "add":
                    return "fa-plus";
                case "comment":
                    return "fa-comments";
                case "delete":
                    return "fa-times";
                case "message":
                    return "fa-envelope-o";
                default:
                    return "fa-bell-o";
            }
        }

        void load()
        {
            var session = Session[CommonContanst.USER_SESSION] as UserLogin;
            if (session != null)
            {
                var user = UserDao.Instance.GetUser(session.UserID);
                userImg.Src = "../Images/Avatars/" + user.Avatar;
                userName.Text = user.Email;
                userFullName.Text = user.HoTen;
                lbAddress.Text = user.DiaChi;
                lbEmail.Text = user.Email;
                if (user.Sdt != null)
                    lbPhone.Text = user.Sdt;
                if (user.GT.HasValue)
                {
                    lbGT.Text = user.GT.Value == false ? "Nam" : "Nữ";
                }

                List<Log> logs = LogDao.Instance.GetLogs().Where(x => x.IsRead == false).Take(10).ToList();
                lbCount.Text = logs.Count.ToString();
                for(int i = 0; i < logs.Count; i++)
                {
                    logs[i].Type = GetType(logs[i].Type);
                }

                listLogs.DataSource = logs;
                listLogs.DataBind();
            }

            
        }
    }
}