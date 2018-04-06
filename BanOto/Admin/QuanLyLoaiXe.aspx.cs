using BanOto.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanOto.Admin
{
    public partial class QuanLyLoaiXe : System.Web.UI.Page
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
            var result = db.LoaiXes.ToList();
            GridView1.DataSource = result;
            GridView1.DataBind();
        }

        void reset()
        {
            txtMaLoaiXe.Text = "";
            txtTenLoaiXe.Text = "";
        }

        public static void ClearFields(ControlCollection pageControls)
        {
            foreach (Control contl in pageControls)
            {
                string strCntName = (contl.GetType()).Name;

                switch (strCntName)
                {
                    case "TextBox":
                        TextBox tbSource = (TextBox)contl;
                        tbSource.Text = "";
                        break;
                    case "RadioButtonList":
                        RadioButtonList rblSource = (RadioButtonList)contl;
                        rblSource.SelectedIndex = -1;
                        break;
                    case "DropDownList":
                        DropDownList ddlSource = (DropDownList)contl;
                        ddlSource.SelectedIndex = -1;
                        break;
                    case "ListBox":
                        ListBox lbsource = (ListBox)contl;
                        lbsource.SelectedIndex = -1;
                        break;
                }
                ClearFields(contl.Controls);
            }
        }
        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            ClearFields(Form.Controls);
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtTenLoaiXe.Text.Length > 0)
                {
                    LoaiXe loai = new LoaiXe();
                    loai.TenLX = txtTenLoaiXe.Text;
                    db.LoaiXes.Add(loai);
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
                if (txtMaLoaiXe.Text.Length > 0)
                {
                    LoaiXe loai = db.LoaiXes.Find(int.Parse(txtMaLoaiXe.Text));
                    loai.TenLX = txtTenLoaiXe.Text;
                    db.SaveChanges();
                    load();
                    reset();
                    lbThongBao.Text = "sửa thành công";
                    lbThongBao.ForeColor = System.Drawing.Color.Green;
                    Response.Redirect("QuanLyLoaiXe.aspx", true);
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
                if (txtMaLoaiXe.Text.Length > 0)
                {
                    LoaiXe loai = db.LoaiXes.Find(int.Parse(txtMaLoaiXe.Text));
                    db.LoaiXes.Remove(loai);
                    db.SaveChanges();
                    load();
                    reset();
                    lbThongBao.Text = "xóa thành công";
                    lbThongBao.ForeColor = System.Drawing.Color.Green;
                    ClearFields(Form.Controls);
                    Response.Redirect("QuanLyLoaiXe.aspx", true);
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

            txtMaLoaiXe.Text = row.Cells[0].Text;
            txtTenLoaiXe.Text = row.Cells[1].Text;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            load();
        }
    }
}