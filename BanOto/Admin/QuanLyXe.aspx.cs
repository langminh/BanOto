using BanOto.Entity;
using BanOto.Helper;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanOto.Admin
{
    public partial class QuanLyXe : System.Web.UI.Page
    {

        BanOtoEntities db = new BanOtoEntities();
        string fileName = "";
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
                        SetValue();
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
            drHang.DataSource = db.ThuongHieux.ToList();
            drHang.DataBind();
            drHang.SelectedIndex = 0;

            drLoaiHS.DataSource = db.LoaiHopSoes.ToList();
            drLoaiHS.DataBind();
            drLoaiHS.SelectedIndex = 0;

            drLoaiXe.DataSource = db.LoaiXes.ToList();
            drLoaiXe.DataBind();
            drLoaiXe.SelectedIndex = 0;

            drMau.DataSource = db.Maus.ToList();
            drMau.DataBind();
            drMau.SelectedIndex = 0;

            drXuatXu.DataSource = db.XuatXus.ToList();
            drXuatXu.DataBind();
            drXuatXu.SelectedIndex = 0;
        }

        void SetValue()
        {
            if (Request["id"] != null)
            {
                string id = Request["id"].ToString();
                if (!string.IsNullOrEmpty(id))
                {
                    var xe = db.Xes.Find(id);
                    if (xe != null)
                    {
                        txtIDXe.Text = xe.MaXe;
                        txtTenXe.Text = xe.TenXe;
                        txtBaiViet.Text = xe.NoiDung;
                        txtChoNgoi.Text = xe.ChoNgoi + "";
                        txtCongSuat.Text = xe.CongXuat + "";
                        txtDTXilanh.Text = xe.DungTichXiLanh + "";
                        txtGamXe.Text = xe.KhoangSangGam + "";
                        txtGia.Text = xe.GiaBan + "";
                        txtMoTa.Text = xe.MoTa;
                        txtGiamGia.Text = xe.GiamGia + "";
                        txtHTLoa.Text = xe.HeThongLoa;
                        txtKCLopS.Text = xe.KichCoLopS;
                        txtKCLopT.Text = xe.KichCoLopT;
                        txtKhoiLuong.Text = xe.TrongLuong + "";
                        txtKieuTD.Text = xe.KieuTruyenDong;
                        txtMamVanh.Text = xe.MamVanh;
                        txtMomen.Text = xe.MomenXoan + "";
                        txtPhanhSau.Text = xe.PhanhSau;
                        txtPhanhTruoc.Text = xe.PhanhTruoc;
                        txtSL.Text = xe.SoLuong + "";
                        txtTreoS.Text = xe.HeThongTreoSau;
                        txtTreoT.Text = xe.HeThongTreoTruoc;
                        txtNamSX.Text = xe.NamSX + "";
                        if (xe.MaTH != null)
                            drHang.SelectedValue = drHang.Items.FindByValue(xe.MaTH.Value.ToString()).Value;
                        if (xe.MaXX != null)
                        {
                            drXuatXu.SelectedValue = drXuatXu.Items.FindByValue(xe.MaXX.Value.ToString()).Value;
                        }
                        if (xe.MaLoaiXe != null)
                        {
                            drLoaiXe.SelectedValue = drLoaiXe.Items.FindByValue(xe.MaLoaiXe.Value.ToString()).Value;
                        }
                        if (xe.MaMau != null)
                        {
                            drMau.SelectedValue = drMau.Items.FindByValue(xe.MaMau.Value.ToString()).Value;
                        }
                        if (!string.IsNullOrEmpty(xe.Anh))
                        {
                            Image1.ImageUrl = "../Images/Cars/" + xe.Anh;
                        }
                        else
                        {
                            string tenfile = Image1.ImageUrl;
                            int indexLast = tenfile.LastIndexOf('/');
                            string tenfilemoi = tenfile.Substring(indexLast + 1);
                            xe.Anh = tenfilemoi;
                        }
                        btnSua.Visible = true;
                        btnThem.Visible = false;
                        btnAddAnh.Visible = true;
                    }
                }
            }
        }

        void Reset()
        {
            txtIDXe.Text = "";
            txtTenXe.Text = "";
            txtBaiViet.Text = "";
            txtChoNgoi.Text = "";
            txtCongSuat.Text = "";
            txtDTXilanh.Text = "";
            txtGamXe.Text = "";
            txtGia.Text = "";
            txtGiamGia.Text = "";
            txtHTLoa.Text = "";
            txtKCLopS.Text = "";
            txtKCLopT.Text = "";
            txtKhoiLuong.Text = "";
            txtKieuTD.Text = "";
            txtMamVanh.Text = "";
            txtMomen.Text = "";
            txtPhanhSau.Text = "";
            txtPhanhTruoc.Text = "";
            txtSL.Text = "";
            txtTreoS.Text = "";
            txtTreoT.Text = "";
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            Entity.Xe xe = new Entity.Xe();
            try
            {
                int chieucao, chieudai, chieurong, chongoi, giaban,
                    khoangsanggam;
                float giamgia, trongluong;
                int.TryParse(txtChieuCao.Text, out chieucao);
                int.TryParse(txtChieuDai.Text, out chieudai);
                int.TryParse(txtChieuRong.Text, out chieurong);
                int.TryParse(txtChoNgoi.Text, out chongoi);
                int.TryParse(txtGia.Text, out giaban);
                int.TryParse(txtGamXe.Text, out khoangsanggam);

                float.TryParse(txtGiamGia.Text, out giamgia);
                float.TryParse(txtKhoiLuong.Text, out trongluong);

                xe.TimeCreate = DateTime.Now;
                xe.SoLuong = int.Parse(txtSL.Text);
                xe.ChieuCao = chieucao;
                xe.ChieuDai = chieudai;
                xe.ChieuRong = chieurong;
                xe.ChongBoABS = chkABS.Checked;
                xe.ChoNgoi = chongoi;
                xe.CongXuat = txtCongSuat.Text;
                xe.DungTichXiLanh = txtDTXilanh.Text;
                xe.PhanhTruoc = txtPhanhTruoc.Text;
                xe.NamSX = txtNamSX.Text;
                xe.PhanhSau = txtPhanhSau.Text;
                xe.GiaBan = giaban;
                xe.GiamGia = giamgia;
                xe.GuongChieuHau = chkChieuHau.Checked;
                xe.HeThongLoa = txtHTLoa.Text;
                xe.HeThongTreoSau = txtTreoS.Text;
                xe.HeThongTreoTruoc = txtTreoT.Text;
                xe.KhoangSangGam = khoangsanggam;
                xe.KichCoLopS = txtKCLopS.Text;
                xe.KichCoLopT = txtKCLopT.Text;
                xe.KieuTruyenDong = txtKieuTD.Text;
                xe.MamVanh = txtMamVanh.Text;
                xe.MomenXoan = txtMomen.Text;
                xe.MoTa = txtMoTa.Text;
                xe.NoiDung = HttpUtility.HtmlEncode(txtBaiViet.Text);
                xe.TangAp = chkTangAp.Checked;
                xe.TinhTrang = chkTT.Checked;
                xe.TrongLuong = trongluong;
                xe.MaLoaiXe = int.Parse(drLoaiXe.SelectedValue);
                xe.MaMau = int.Parse(drMau.SelectedValue);
                xe.MaTH = int.Parse(drHang.SelectedValue);
                xe.MaXX = int.Parse(drXuatXu.SelectedValue);
                xe.LoaiHopSo = int.Parse(drLoaiHS.SelectedValue);
                xe.TenXe = txtTenXe.Text;

                if (!string.IsNullOrEmpty(fileName))
                {
                    xe.Anh = fileName;
                }
                else
                {
                    string tenfile = Image1.ImageUrl;
                    int indexLast = tenfile.LastIndexOf('/');
                    string tenfilemoi = tenfile.Substring(indexLast + 1);
                    xe.Anh = tenfilemoi;
                }

                string CarID = db.Database.SqlQuery<String>(String.Format(@"select [dbo].[FN_GetCarIDNext]()")).FirstOrDefault();
                xe.MaXe = CarID;
                db.Xes.Add(xe);
                db.SaveChanges();
                Response.Redirect("DanhSachXe.aspx");
            }
            catch (Exception ex)
            {
                lbThongBao.Text = "Đã xảy ra lỗi. Vui lòng thử lại sau.";
                lbThongBao.ForeColor = Color.Red;
            }

        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            Entity.Xe xe = db.Xes.Find(txtIDXe.Text);
            try
            {
                int chieucao, chieudai, chieurong, chongoi, giaban,
                    khoangsanggam;
                float giamgia, trongluong;
                int.TryParse(txtChieuCao.Text, out chieucao);
                int.TryParse(txtChieuDai.Text, out chieudai);
                int.TryParse(txtChieuRong.Text, out chieurong);
                int.TryParse(txtChoNgoi.Text, out chongoi);
                int.TryParse(txtGia.Text, out giaban);
                int.TryParse(txtGamXe.Text, out khoangsanggam);

                float.TryParse(txtGiamGia.Text, out giamgia);
                float.TryParse(txtKhoiLuong.Text, out trongluong);

                xe.ChieuCao = chieucao;
                xe.ChieuDai = chieudai;
                xe.ChieuRong = chieurong;
                xe.ChongBoABS = chkABS.Checked;
                xe.ChoNgoi = chongoi;
                xe.CongXuat = txtCongSuat.Text;
                xe.DungTichXiLanh = txtDTXilanh.Text;
                xe.GiaBan = giaban;
                xe.GiamGia = giamgia;
                xe.NamSX = txtNamSX.Text;
                xe.GuongChieuHau = chkChieuHau.Checked;
                xe.PhanhTruoc = txtPhanhTruoc.Text;
                xe.PhanhSau = txtPhanhSau.Text;
                xe.SoLuong = int.Parse(txtSL.Text);
                xe.HeThongLoa = txtHTLoa.Text;
                xe.HeThongTreoSau = txtTreoS.Text;
                xe.HeThongTreoTruoc = txtTreoT.Text;
                xe.KhoangSangGam = khoangsanggam;
                xe.KichCoLopS = txtKCLopS.Text;
                xe.KichCoLopT = txtKCLopT.Text;
                xe.KieuTruyenDong = txtKieuTD.Text;
                xe.MamVanh = txtMamVanh.Text;
                xe.MomenXoan = txtMomen.Text;
                xe.MoTa = txtMoTa.Text;
                xe.NoiDung = HttpUtility.HtmlEncode(txtBaiViet.Text);
                xe.TangAp = chkTangAp.Checked;
                xe.TinhTrang = chkTT.Checked;
                xe.TrongLuong = trongluong;
                xe.MaLoaiXe = int.Parse(drLoaiXe.SelectedValue);
                xe.MaMau = int.Parse(drMau.SelectedValue);
                xe.MaTH = int.Parse(drHang.SelectedValue);
                xe.MaXX = int.Parse(drXuatXu.SelectedValue);
                xe.LoaiHopSo = int.Parse(drLoaiHS.SelectedValue);
                xe.TenXe = txtTenXe.Text;

                if (!string.IsNullOrEmpty(fileName))
                {
                    xe.Anh = fileName;
                }
                {
                    string tenfile = Image1.ImageUrl;
                    int indexLast = tenfile.LastIndexOf('/');
                    string tenfilemoi = tenfile.Substring(indexLast + 1);
                    xe.Anh = tenfilemoi;
                }
                db.SaveChanges();
                Response.Redirect("DanhSachXe.aspx");
            }
            catch (Exception ex)
            {
                lbThongBao.Text = "Đã xảy ra lỗi. Vui lòng thử lại sau.";
                lbThongBao.ForeColor = Color.Red;
            }
        }


        protected void btnReset_Click(object sender, EventArgs e)
        {
            Reset();
            btnThem.Visible = true;
            btnSua.Visible = false;
            btnAddAnh.Visible = false;
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                try
                {
                    string filename = Path.GetFileName(FileUpload1.FileName);
                    FileUpload1.SaveAs(Server.MapPath("~/Images/Cars/") + filename);
                    lbThongBao.Text = "Tải lên ảnh thành công!";
                    lbThongBao.ForeColor = Color.Green;
                    Image1.ImageUrl = "~/Images/Cars/" + filename;
                    fileName = filename;
                }
                catch (Exception ex)
                {
                    lbThongBao.Text = "Đã xảy ra lỗi trong quá trình tải ảnh lên.";
                    lbThongBao.ForeColor = Color.Red;
                }
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/ThemAnh.aspx?id=" + txtIDXe.Text);
        }
    }
}