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
    public partial class Index : System.Web.UI.Page
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
            var list = db.DonHangs.OrderByDescending(x => x.NgayDH).Take(10).ToList();
            List<Temp> temps = new List<Temp>();
            foreach(var item  in list)
            {
                temps.Add(new Temp() { MaDH = item.MaDH, HoTen = item.HoTen,
                    ThoiGian = item.NgayDH.Value, TrangThai = item.TrangThai,
                    SoLuong = item.CTDonHangs.Where(x => x.MaDH.Equals(item.MaDH)).First().SoLuong.Value });
            }
            listDH.DataSource = temps;
            listDH.DataBind();
        }

        protected void listDH_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("See"))
            {
                Response.Redirect("CTHoaDon.aspx?id=" + e.CommandArgument.ToString());
            }
        }

        private class Temp
        {
            public string MaDH { get; set; }
            public string HoTen { get; set; }
            public DateTime ThoiGian { get; set; }
            public int SoLuong { get; set; }
            public string TrangThai { get; set; }
        }
    }
}