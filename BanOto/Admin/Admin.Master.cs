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
    public partial class Admin : System.Web.UI.MasterPage
    {
        BanOtoEntities db = new BanOtoEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                load();
            }   
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            var logs = LogDao.Instance.GetLogs().Where(x => x.IsRead == false).Take(5).ToList();
            lbCount.Text = logs.Count.ToString();
        }

        void load()
        {
            var session = Session[CommonContanst.USER_SESSION] as UserLogin;
            if (session != null)
            {
                userName.Text = session.UserName;
                imgUser.Src = "../Images/Avatars/" + session.Avatar;
                var logs = LogDao.Instance.GetLogs().Where(x => x.IsRead == false).Take(5).ToList();
                lbCount.Text = logs.Count.ToString();
                listNotify.DataSource = logs;
                listNotify.DataBind();
            }
            
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            //Save log
            var session = Session[CommonContanst.USER_SESSION] as UserLogin;
            if(session != null)
            {
                Log log = new Log();
                string LogID = db.Database.SqlQuery<String>(String.Format(@"select [dbo].[FN_GetLogIDNext]()")).FirstOrDefault();
                log.MaLog = "";
                log.IsRead = false;
                log.Type = "logout";
                log.UserName = session.UserID;
                log.TimeLogout = DateTime.Now;
                log.IsRead = false;
                log.TimeCreate = DateTime.Now;

                log.Messages = session.UserName+" Đăng xuất hệ thống vào " + DateTime.Now.ToString("hh:MM dd/mm/yyyy");
                LogDao.Instance.Create(log);
            }
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}