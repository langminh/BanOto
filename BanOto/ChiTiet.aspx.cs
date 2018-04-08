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
            if (Request["id"] != null)
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
                string htt = string.IsNullOrEmpty(xe.HeThongTreoTruoc) == true ? "" : "Trước: " + xe.HeThongTreoTruoc + ";";
                htt += string.IsNullOrEmpty(xe.HeThongTreoSau) == true ? "" : " Sau: " + xe.HeThongTreoSau + ";";
                lbHTTreo.Text = htt;
                string lop = string.IsNullOrEmpty(xe.KichCoLopT) == true ? "" : "Trước: " + xe.KichCoLopT + ";";
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

                listComment.DataSource = db.BinhLuans.Where(x => x.MaXe.Equals(id)).ToList();
                listComment.DataBind();
            }
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("GioHang.aspx?id=" + lbMaXe.Value.ToString() + "&soluong=" + txtSoLuong.Value.ToString());
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            var session = Session[CommonContanst.USER_SESSION] as UserLogin;
            if (session != null)
            {
                if (session.Role != 0)
                {
                    if (!string.IsNullOrEmpty(txtNoiDung.Text.Trim()))
                    {
                        try
                        {
                            BinhLuan bl = new BinhLuan();
                            bl.Email = session.UserName;
                            bl.HoTen = db.Users.Find(session.UserID).HoTen;
                            string id = Request["id"].ToString();
                            var xe = db.Xes.Find(id);
                            bl.MaXe = xe.MaXe;
                            bl.CreateTime = DateTime.Now;
                            bl.NoiDung = txtNoiDung.Text;
                            db.BinhLuans.Add(bl);
                            db.SaveChanges();
                            load();
                        }
                        catch (Exception ex)
                        {

                        }
                    }
                }
                else
                {
                    if (!string.IsNullOrEmpty(txtNoiDung.Text.Trim()))
                    {
                        try
                        {
                            BinhLuan bl = new BinhLuan();
                            bl.Email = session.UserName;
                            bl.HoTen = session.Hoten;
                            string id = Request["id"].ToString();
                            var xe = db.Xes.Find(id);
                            bl.MaXe = xe.MaXe;
                            bl.CreateTime = DateTime.Now;
                            bl.NoiDung = txtNoiDung.Text;
                            db.BinhLuans.Add(bl);
                            db.SaveChanges();
                            load();
                        }
                        catch (Exception ex)
                        {

                        }
                    }
                }
            }
            else
            {
                if (!string.IsNullOrEmpty(txtEmail.Text.Trim()))
                {
                    if (!string.IsNullOrEmpty(txtTen.Text.Trim()))
                    {
                        if (!string.IsNullOrEmpty(txtNoiDung.Text.Trim()))
                        {
                            try
                            {
                                BinhLuan bl = new BinhLuan();
                                bl.Email = txtEmail.Text;
                                bl.HoTen = txtTen.Text;
                                string id = Request["id"].ToString();
                                var xe = db.Xes.Find(id);
                                bl.MaXe = xe.MaXe;
                                bl.NoiDung = txtNoiDung.Text;
                                bl.CreateTime = DateTime.Now;
                                db.BinhLuans.Add(bl);

                                UserLogin ses = new UserLogin();
                                ses.UserName = txtEmail.Text;
                                ses.Hoten = txtTen.Text;
                                Session[CommonContanst.USER_SESSION] = ses;

                                db.SaveChanges();
                                load();
                            }
                            catch (Exception ex)
                            {

                            }
                        }
                    }
                }
            }
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