using BanOto.Entity;
using BanOto.Helper;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanOto.Admin
{
    public partial class QuanLyHangXe : System.Web.UI.Page
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
            var result = db.ThuongHieux.ToList();
            GridView1.DataSource = result;
            GridView1.DataBind();
        }

        void reset()
        {
            txtMaTH.Value = "";
            txtTenTH.Text = "";
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtTenTH.ToString().Length > 0)
                {
                    ThuongHieu th = new ThuongHieu();
                    th.TenTH = txtTenTH.Text;
                    if (fileName != "")
                        th.Anh = fileName;
                    else
                    {
                        string tenfile = Image1.ImageUrl;
                        int indexLast = tenfile.LastIndexOf('/');
                        string tenfilemoi = tenfile.Substring(indexLast + 1);
                        th.Anh = tenfilemoi;
                    }
                    db.ThuongHieux.Add(th);
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
                if (txtMaTH.Value.ToString().Length > 0)
                {
                    ThuongHieu th = db.ThuongHieux.Find(int.Parse(txtMaTH.Value.ToString()));
                    th.TenTH = txtTenTH.Text;
                    if (fileName != "")
                        th.Anh = fileName;
                    else
                    {
                        string tenfile = Image1.ImageUrl;
                        int indexLast = tenfile.LastIndexOf('/');
                        string tenfilemoi = tenfile.Substring(indexLast + 1);
                        th.Anh = tenfilemoi;
                    }
                    db.SaveChanges();
                    load();
                    reset();
                    lbThongBao.Text = "sửa thành công";
                    lbThongBao.ForeColor = System.Drawing.Color.Green;
                    Response.Redirect("QuanLyHangXe.aspx", true);
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
                if (txtMaTH.Value.ToString().Length > 0)
                {
                    ThuongHieu th = db.ThuongHieux.Find(int.Parse(txtMaTH.Value.ToString()));
                    db.ThuongHieux.Remove(th);
                    db.SaveChanges();
                    load();
                    reset();
                    lbThongBao.Text = "xóa thành công";
                    lbThongBao.ForeColor = System.Drawing.Color.Green;
                    Response.Redirect("QuanLyHangXe.aspx", true);
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

            txtMaTH.Value = row.Cells[0].Text;
            txtTenTH.Text = row.Cells[1].Text;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            load();
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                try
                {
                    string filename = Path.GetFileName(FileUpload1.FileName);
                    FileUpload1.SaveAs(Server.MapPath("../Images/logo/") + filename);
                    lbThongBao.Text = "Tải lên ảnh thành công!";
                    Image1.ImageUrl = "../Images/logo/" + filename;
                    fileName = filename;
                }
                catch (Exception ex)
                {
                    lbThongBao.Text = "Tải lên ảnh bị lỗi do: " + ex.Message;
                }
            }
        }
    }
}