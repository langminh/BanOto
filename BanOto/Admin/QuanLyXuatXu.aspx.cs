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
    public partial class QuanLyXuatXu : System.Web.UI.Page
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
            var result = db.XuatXus.ToList();
            GridView1.DataSource = result;
            GridView1.DataBind();
        }

        void reset()
        {
            txtMaXX.Text = "";
            txtTenXX.Text = "";
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtTenXX.ToString().Length > 0)
                {
                    Entity.XuatXu th = new Entity.XuatXu();
                    th.TenXX = txtTenXX.Text;
                    db.XuatXus.Add(th);
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
                if (txtMaXX.Text.Length > 0)
                {
                    Entity.XuatXu th = db.XuatXus.Find(int.Parse(txtMaXX.Text.ToString()));
                    th.TenXX = txtTenXX.Text;
                    db.SaveChanges();
                    load();
                    reset();
                    lbThongBao.Text = "sửa thành công";
                    lbThongBao.ForeColor = System.Drawing.Color.Green;
                    Response.Redirect("QuanLyXuatXu.aspx", true);
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
                if (txtMaXX.Text.ToString().Length > 0)
                {
                    Entity.XuatXu th = db.XuatXus.Find(int.Parse(txtMaXX.Text.ToString()));
                    db.XuatXus.Remove(th);
                    db.SaveChanges();
                    load();
                    reset();
                    lbThongBao.Text = "xóa thành công";
                    lbThongBao.ForeColor = System.Drawing.Color.Green;
                    Response.Redirect("QuanLyXuatXu.aspx", true);
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

            txtMaXX.Text = row.Cells[0].Text;
            txtTenXX.Text = row.Cells[1].Text;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            load();
        }
    }
}