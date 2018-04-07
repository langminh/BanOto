using BanOto.Entity;
using BanOto.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanOto.Admin
{
    public partial class QuanLyDonHang : System.Web.UI.Page
    {
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

        void load()
        {
            listDH.DataSource = db.DonHangs.OrderBy(x => x.NgayDH).ToList();
            listDH.DataBind();
        }

        protected void listDH_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("ChiTiet"))
            {
                Response.Redirect("CTHoaDon.aspx?id=" + e.CommandArgument.ToString());
            }else if (e.CommandName.Equals("Xem"))
            {
                Response.Redirect("XemHoaDon.aspx?id=" + e.CommandArgument.ToString());
            }
        }
    }
}