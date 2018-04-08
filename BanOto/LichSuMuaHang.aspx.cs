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
    public partial class LichSuMuaHang : System.Web.UI.Page
    {
        BanOtoEntities db = new BanOtoEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                load();
            }
        }
        void load()
        {
            var session = Session[CommonContanst.CART_HISTORY] as List<Hang>;
            if (session != null)
            {
                listCars.DataSource = session;
                listCars.DataBind();
            }

            listNewCars.DataSource = db.Xes.OrderBy(x => x.TimeCreate).Take(8).ToList();
            listNewCars.DataBind();

            list.DataSource = db.Xes.OrderByDescending(x => x.DanhGia).Take(8).ToList();
            list.DataBind();
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
            {
                Response.Redirect("TimKiem.aspx?tenxe=" + txtSearch.Text);
            }
        }
    }
}