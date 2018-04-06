using BanOto.Entity;
using BanOto.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanOto
{
    public partial class Client : System.Web.UI.MasterPage
    {
        BanOtoEntities db = new BanOtoEntities();
        protected string UserName = "admin";
        protected string Admin = "admin";
        protected string UserImage = "../Images/Avatars/DP/dummy.png";
        protected string UploadFolderPath = "~/Uploads/";
        List<Hang> items = new List<Hang>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                load();
            }
            if(Session[CommonContanst.CART_SESSION] != null)
            {
                items = Session[CommonContanst.CART_SESSION] as List<Hang>;
                lbCount.InnerHtml = items.Count + "";
            }
        }

        void load()
        {
            lbCount.InnerHtml = "2";
            if (Session[CommonContanst.USER_SESSION] != null)
            {
                var session = Session[CommonContanst.USER_SESSION] as UserLogin;
                lbName.Text = session.UserName;
            }


            listLoaiXe.DataSource = db.LoaiXes.Take(5).ToList();
            listLoaiXe.DataBind();
        }

        protected void btnEnterChat_ServerClick(object sender, EventArgs e)
        {
            
        }
    }
}