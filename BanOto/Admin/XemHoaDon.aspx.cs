using BanOto.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanOto.Admin
{
    public partial class XemHoaDon : System.Web.UI.Page
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
            if(Request["id"] != null)
            {
                string id = Request["id"].ToString();
                var hd = db.DonHangs.Find(id);
                if(hd != null)
                {
                    lbMaDH.Text = hd.MaDH;
                    lbName.Text = hd.HoTen;
                    lbDiaChi.Text = hd.DiaChi;
                    lbEmail.Text = hd.Email;
                    lbSdt.Text = hd.Sdt;
                    lbThanhToan.Text = hd.ThanhToan.TenTT;
                    lbVanChuyen.Text = hd.VanChuyen.TenVC;

                    var cthd = db.CTDonHangs.Where(x => x.MaDH.Equals(hd.MaDH)).First();
                    var xe = db.Xes.Find(cthd.MaXe);

                    List<Temp> temp = new List<Temp>();
                    temp.Add(new Temp() { MaXe = xe.MaXe, TenXe = xe.TenXe, SoLuong = cthd.SoLuong.Value, GiaBan = xe.GiaBan });
                    listCars.DataSource = temp;
                    listCars.DataBind();

                }
            }
        }

        private class Temp
        {
            public string MaXe { get; set; }
            public string TenXe { get; set; }
            public decimal GiaBan { get; set; }
            public int SoLuong { get; set; }
            public decimal TongTien
            {
                get
                {
                    return (decimal)this.SoLuong * this.GiaBan;
                }
            }
        }
    }
}