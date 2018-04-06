using BanOto.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanOto
{
    public partial class ChiTiet : System.Web.UI.Page
    {
        BanOtoEntities db = new BanOtoEntities();
        protected List<Anh> anhs = new List<Anh>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                load();
            }
        }

        void loadImages(string id)
        {
            anhs = db.Anhs.Where(x => x.MaXe.Equals(id)).Take(4).ToList();
        }

        void load()
        {
            if(Request["id"] != null)
            {
                string id = Request["id"].ToString();
                var xe = db.Xes.Find(id);
                loadImages(xe.MaXe);

                lbABS.Text = xe.ChongBoABS == true ? "Có" : "Không";
                lbCao.Text = xe.ChieuCao == null ? "" : (xe.ChieuCao.Value == 0 ? "" : xe.ChieuCao.Value.ToString());
                lbCongSuay.Text = string.IsNullOrEmpty(xe.CongXuat) == true ? "" : (xe.CongXuat.Equals("0") ? "" : xe.CongXuat);
                lbDai.Text = xe.ChieuDai == null ? "" : (xe.ChieuDai.Value == 0 ? "" : xe.ChieuDai.Value.ToString());
                lbDungTichXiLanh.Text = string.IsNullOrEmpty(xe.DungTichXiLanh) ? "" : (xe.DungTichXiLanh.Equals(0) == true ? "" : xe.DungTichXiLanh);
                lbHang.Text = xe.ThuongHieu.TenTH;
                string htt = string.IsNullOrEmpty(xe.HeThongTreoTruoc) == true ? "" : "Trước: "+xe.HeThongTreoTruoc+";";
                htt += string.IsNullOrEmpty(xe.HeThongTreoSau) == true ? "" : " Sau: "+xe.HeThongTreoSau+";";
                lbHTTreo.Text = htt;
                string lop = string.IsNullOrEmpty(xe.KichCoLopT) == true ? "" : "Trước: " + xe.KichCoLopT+";";
                lop += string.IsNullOrEmpty(xe.KichCoLopS) == true ? "" : " Sau: " + xe.KichCoLopS;
                lbKClop.Text = lop;
                lbKhoangSang.Text = xe.KhoangSangGam == null ? "" : (xe.KhoangSangGam.Value == 0 ? "" : xe.KhoangSangGam + "");
                lbKieuTD.Text = string.IsNullOrEmpty(xe.KieuTruyenDong) == true ? "" : xe.KieuTruyenDong;
                lbLoaiHS.Text = xe.LoaiHopSo == null ? "" : xe.LoaiHopSo1.TenHS;
                lbLoaiXe.Text = xe.LoaiXe.TenLX;
                lbMau.Text = xe.Mau.TenMau;
                lbMomen.Text = string.IsNullOrEmpty(xe.MomenXoan) == true ? "" : (xe.MomenXoan.Equals("0") ? "" : xe.MomenXoan);
                lbRong.Text = xe.ChieuRong == null ? "" : (xe.ChieuRong.Value == 0 ? "" : xe.ChieuRong.Value.ToString());
                lbTangAp.Text = xe.TangAp == true ? "Có" : "Không";
                lbTrongLuong.Text = xe.TrongLuong == null ? "" : (xe.TrongLuong.Value == 0 ? "" : xe.TrongLuong.Value.ToString());
                lbXuatXu.Text = xe.XuatXu.TenXX;
                lbName.Text = lbNameCar.Text = xe.TenXe;
                lbMaXe.Value = xe.MaXe;
                MyLiteral.Text = Server.HtmlDecode(xe.NoiDung);
                lbGia.Text = String.Format("{0:n0}", xe.GiaBan) + "VNĐ";

                listCungLoai.DataSource = db.Xes.Where(x => x.MaLoaiXe == xe.MaLoaiXe).Take(4).ToList();
                listCungLoai.DataBind();
                

                listNewCars.DataSource = db.Xes.OrderBy(x => x.TimeCreate).Take(8).ToList();
                listNewCars.DataBind();

                list.DataSource = db.Xes.OrderByDescending(x => x.DanhGia).Take(8).ToList();
                list.DataBind();
            }
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("GioHang.aspx?id=" + lbMaXe.Value.ToString() + "&soluong=" + txtSoLuong.Value.ToString());
        }
    }
}