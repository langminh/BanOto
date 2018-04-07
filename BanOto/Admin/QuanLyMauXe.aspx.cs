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
    public partial class QuanLyMauXe : System.Web.UI.Page
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
            var result = db.Maus.ToList();
            GridView1.DataSource = result;
            GridView1.DataBind();
        }

        void reset()
        {
            txtMaMau.Value = "";
            txtTenMau.Text = "";
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtTenMau.ToString().Length > 0)
                {
                    Mau loai = new Mau();
                    loai.TenMau = txtTenMau.Text;
                    db.Maus.Add(loai);
                    db.SaveChanges();
                    load();
                    reset();
                    lbThongBao.Text = "Thêm thành công";
                    lbThongBao.ForeColor = System.Drawing.Color.Green;

                }
                else
                {
                    lbThongBao.Text = "Chưa nhập dữ liệu";
                    lbThongBao.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lbThongBao.Text = "Đã có lỗi xảy ra. Vui lòng thử lại sau.";
                lbThongBao.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtMaMau.Value.ToString().Length > 0)
                {
                    Mau loai = db.Maus.Find(int.Parse(txtMaMau.Value.ToString()));
                    loai.TenMau = txtTenMau.Text;
                    db.SaveChanges();
                    load();
                    reset();
                    lbThongBao.Text = "sửa thành công";
                    lbThongBao.ForeColor = System.Drawing.Color.Green;
                    Response.Redirect("QuanLyMauXe.aspx", true);
                }
                else
                {
                    lbThongBao.Text = "Chưa nhập dữ liệu";
                    lbThongBao.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lbThongBao.Text = "Đã có lỗi xảy ra. Vui lòng thử lại sau.";
                lbThongBao.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtMaMau.Value.ToString().Length > 0)
                {
                    Mau loai = db.Maus.Find(int.Parse(txtMaMau.Value.ToString()));
                    db.Maus.Remove(loai);
                    db.SaveChanges();
                    load();
                    reset();
                    lbThongBao.Text = "xóa thành công";
                    lbThongBao.ForeColor = System.Drawing.Color.Green;
                    Response.Redirect("QuanLyMauXe.aspx", true);
                }
                else
                {
                    lbThongBao.Text = "Chưa nhập dữ liệu";
                    lbThongBao.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lbThongBao.Text = "Đã có lỗi xảy ra. Vui lòng thử lại sau.";
                lbThongBao.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            reset();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = GridView1.SelectedIndex;

            GridViewRow row = GridView1.SelectedRow;

            txtMaMau.Value = row.Cells[0].Text;
            txtTenMau.Text = row.Cells[1].Text;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            load();
        }
    }
}