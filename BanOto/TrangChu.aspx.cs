using BanOto.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanOto
{
    public partial class TrangChu : System.Web.UI.Page
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
            ListSlide.DataSource = db.Slides.Take(4).OrderByDescending(x => x.CreateTime).ToList();
            ListSlide.DataBind();

            listCars.DataSource = db.Xes.OrderByDescending(x => x.TimeCreate).Take(8).ToList();
            listCars.DataBind();

            listNew.DataSource = db.Xes.OrderByDescending(x => x.TimeCreate).Take(4).ToList();
            listNew.DataBind();

            listKhuyenmai.DataSource = db.Xes.OrderByDescending(x => x.GiamGia).Take(4).ToList();
            listKhuyenmai.DataBind();

            listQuanTam.DataSource = db.Xes.OrderByDescending(x => x.DanhGia).Take(4).ToList();
            listQuanTam.DataBind();
        }
    }
}