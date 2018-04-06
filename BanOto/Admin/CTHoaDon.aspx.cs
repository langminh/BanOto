using BanOto.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanOto.Admin
{
    public partial class CTHoaDon : System.Web.UI.Page
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
            if (Request["id"] != null)
            {
                string id = Request["id"].ToString();
                var hd = db.DonHangs.Find(id);
                if(hd != null)
                {
                    var temp = db.CTDonHangs.Where(x => x.MaDH.Equals(hd.MaDH)).First();
                    var xe = db.Xes.Find(temp.MaXe);
                    List<Temp> list = new List<Temp>();
                    list.Add(new Temp() { MaDH = hd.MaDH, MaXe = temp.MaXe, GiaBan = xe.GiaBan, SoLuong = temp.SoLuong.Value, TrangThai = hd.TrangThai });
                    listChiTiet.DataSource = list;
                    listChiTiet.DataBind();
                }
                
            }
        }

        protected void listChiTiet_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("UpdateItem"))
            {
                var dh = db.DonHangs.Find(e.CommandArgument.ToString());
                if(dh != null)
                {
                    try
                    {
                        dh.TrangThai = "Đã xử lý";
                        db.SaveChanges();
                        load();
                    }catch(Exception ex) { }
                }
            }
        }

        private class Temp
        {
            public string MaDH { get; set; }
            public string MaXe { get; set; }
            public decimal GiaBan { get; set; }
            public int SoLuong { get; set; }
            public decimal TongTien { get {
                    return (decimal)this.SoLuong * this.GiaBan;
                } }
            public string TrangThai { get; set; }
        }
    }

    

}