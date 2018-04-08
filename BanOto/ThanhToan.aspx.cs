using BanOto.Entity;
using BanOto.Entity.Dao;
using BanOto.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanOto
{
    public partial class ThanhToan : System.Web.UI.Page
    {
        BanOtoEntities db = new BanOtoEntities();
        protected List<Hang> items = new List<Hang>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                load();
                Tinh();
            }
            var session = Session[CommonContanst.USER_SESSION] as UserLogin;
            if (session != null)
            {
                var user = db.Users.Find(session.UserID);
                txtHoTen.Text = user.HoTen;
                txtEmail_Booking.Text = user.Email;
                txtDiaChi.Text = user.DiaChi;
                txtSdt.Text = user.Sdt;
                Tinh();
            }
        }

        void load()
        {
            var cartSession = Session[CommonContanst.CART_SESSION] as List<Hang>;
            if (cartSession != null)
            {
                items = cartSession;
                ListCart.DataSource = items;
                ListCart.DataBind();
            }
            listNewCars.DataSource = db.Xes.Take(4).ToList();
            listNewCars.DataBind();
            listCungLoai.DataSource = db.Xes.Take(2).ToList();
            listCungLoai.DataBind();
            drTT.DataSource = db.ThanhToans.ToList();
            drTT.DataBind();
            drTT.SelectedIndex = 0;
        }

        decimal TongTien(List<Hang> list, double phanTram)
        {
            decimal tong = 0;
            decimal tien = 1;
            foreach (var item in list)
            {
                tong += item.TongTien;
            }
            var phivc = Session[CommonContanst.PHI_VC] as string;
            if (phivc != null)
            {
                var vc = db.VanChuyens.Find(int.Parse(phivc));
                tien = ((decimal)vc.PhiVC.Value * tong) / 100 + tong;
            }
            tien = ((decimal)phanTram * tien) / 100 + tien;
            if (CommonContanst.USER_SESSION != null)
            {
                tien = (5 * tien) / 100 + tien;
            }
            return tien;
        }

        decimal Tinh()
        {
            var cartSession = Session[CommonContanst.CART_SESSION] as List<Hang>;
            if (cartSession != null)
            {
                items = cartSession;

                var phi = db.ThanhToans.Find(int.Parse(drTT.SelectedValue.ToString()));
                lbPhi.Text = String.Format("{0:n0}", phi.ChietKhau.Value) + "%";
                decimal kq = TongTien(items, phi.ChietKhau.Value);
                lbTong.Text = String.Format("{0:n0}", kq) + "VNĐ";
                return kq;
            }
            return 0;
        }

        protected void drTT_SelectedIndexChanged(object sender, EventArgs e)
        {
            Tinh();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtUserName.Text))
            {
                if (!string.IsNullOrEmpty(txtPass.Text))
                {
                    int check = UserDao.Instance.CheckUser(txtUserName.Text.Trim(), txtPass.Text.Trim());
                    if (check == -2)
                    {
                        lbThongBao.Text = "Tài khoản không tồn tại.";
                    }
                    else if (check == -1)
                    {
                        lbThongBao.Text = "Tài khoản đã bị khóa. Vui lòng liên hệ với quản trị viên.";
                    }
                    else if (check == 0)
                    {
                        lbThongBao.Text = "Sai mật khẩu.";
                    }
                    else if (check == 1)
                    {
                        UserLogin session = new UserLogin();
                        var user = UserDao.Instance.GetUser(txtUserName.Text.Trim(), txtPass.Text.Trim());
                        session.UserID = user.UserName;
                        session.UserName = user.Email;
                        session.Avatar = user.Avatar;
                        session.LoginTime = DateTime.Now;
                        session.Role = user.MaQuyen;
                        session.RememberMe = chkRemember.Checked;
                        Session[CommonContanst.USER_SESSION] = session;
                        Response.Redirect(Request.RawUrl, true);
                    }
                }
            }
        }

        protected void btnBooking_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtHoTen.Text))
            {
                if (!string.IsNullOrEmpty(txtDiaChi.Text))
                {
                    if (!string.IsNullOrEmpty(txtEmail_Booking.Text))
                    {
                        try
                        {
                            DonHang dh = new DonHang();
                            dh.DiaChi = txtDiaChi.Text.Trim();
                            dh.HoTen = txtHoTen.Text.Trim();
                            int mavc = 1;
                            if (Session[CommonContanst.PHI_VC] != null)
                            {
                                int.TryParse(Session[CommonContanst.PHI_VC].ToString(), out mavc);
                            }
                            if (mavc == 0)
                            {
                                mavc = 1;
                            }

                            Log log = new Log();

                            string LogID = db.Database.SqlQuery<String>(String.Format(@"select [dbo].[FN_GetLogIDNext]()")).FirstOrDefault();
                            log.MaLog = LogID;
                            log.TimeCreate = DateTime.Now;
                            log.UserName = txtHoTen.Text;
                            string madh = db.Database.SqlQuery<String>(String.Format(@"select [dbo].[FN_GetHoaDonIDNext] ()")).FirstOrDefault();
                            log.Messages = "Đã yêu cầu đặt hàng với mã đơn hàng: " + madh;
                            LogDao.Instance.Create(log);

                            dh.MaVC = mavc;
                            dh.MaTT = int.Parse(drTT.SelectedValue.ToString());
                            dh.TrangThai = "Chưa xử lý";
                            dh.NgayDH = DateTime.Now;
                            dh.TongTien = Tinh();

                            dh.MaDH = madh;
                            db.DonHangs.Add(dh);
                            db.SaveChanges();
                            var cartSession = Session[CommonContanst.CART_SESSION] as List<Hang>;
                            if (cartSession != null)
                            {
                                items = cartSession;
                                foreach (var item in items)
                                {
                                    CTDonHang ct = new CTDonHang();
                                    ct.MaDH = dh.MaDH;
                                    ct.MaXe = item.MaXe;
                                    ct.SoLuong = item.SoLuongMua;
                                    db.CTDonHangs.Add(ct);
                                    db.SaveChanges();
                                }
                            }
                            Response.Redirect("DatHangThanhCong.aspx");
                        }catch(Exception ex)
                        {

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