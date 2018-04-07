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
    public partial class QuanLyHinhThucVanChuyen : System.Web.UI.Page
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
            var result = db.VanChuyens.ToList();
            GridView1.DataSource = result;
            GridView1.DataBind();
        }

        void reset()
        {
            txtMaVC.Text = "";
            txtTenVC.Text = "";
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtTenVC.ToString().Length > 0)
                {
                    Entity.VanChuyen th = new Entity.VanChuyen();
                    th.TenVC = txtTenVC.Text;
                    th.PhiVC = float.Parse(txtPhi.Text);
                    db.VanChuyens.Add(th);
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

        protected void btnSua_1_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtMaVC.Text.Length > 0)
                {
                    Entity.VanChuyen th = db.VanChuyens.Find(int.Parse(txtMaVC.Text.ToString()));
                    th.TenVC = txtTenVC.Text;
                    th.PhiVC = float.Parse(txtPhi.Text);
                    db.SaveChanges();
                    load();
                    reset();
                    lbThongBao.Text = "sửa thành công";
                    lbThongBao.ForeColor = System.Drawing.Color.Green;
                    Response.Redirect("QuanLyHinhThucVanChuyen.aspx", true);
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
                if (txtMaVC.Text.ToString().Length > 0)
                {
                    Entity.VanChuyen th = db.VanChuyens.Find(int.Parse(txtMaVC.Text.ToString()));
                    db.VanChuyens.Remove(th);
                    db.SaveChanges();
                    load();
                    reset();
                    lbThongBao.Text = "xóa thành công";
                    lbThongBao.ForeColor = System.Drawing.Color.Green;
                    Response.Redirect("QuanLyHinhThucVanChuyen.aspx", true);
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
            GridViewRow row = GridView1.SelectedRow;

            txtMaVC.Text = row.Cells[0].Text;
            txtTenVC.Text = row.Cells[1].Text;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            load();
        }
    }
}