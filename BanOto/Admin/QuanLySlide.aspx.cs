using BanOto.Entity;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanOto.Admin
{
    public partial class QuanLySlide : System.Web.UI.Page
    {
        BanOtoEntities db = new BanOtoEntities();
        string fileName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                load();
            }
        }

        void load()
        {
            listImg.DataSource = db.Slides.OrderByDescending(x => x.CreateTime).ToList();
            listImg.DataBind();
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                try
                {
                    string filename = Path.GetFileName(FileUpload1.FileName);
                    FileUpload1.SaveAs(Server.MapPath("~/Images/slides/") + filename);
                    lbThongBao.Text = "Tải lên ảnh thành công!";
                    Image1.ImageUrl = "~/Images/slides/" + filename;
                    fileName = filename;

                    Slide slide = new Slide();
                    slide.Tilte = txtTieuDe.Text;
                    slide.Type = txtNoiDung.Text;
                    if (!string.IsNullOrEmpty(fileName))
                    {
                        slide.Anh = fileName;
                    }
                    {
                        string tenfile = Image1.ImageUrl;
                        int indexLast = tenfile.LastIndexOf('/');
                        string tenfilemoi = tenfile.Substring(indexLast + 1);
                        slide.Anh = tenfilemoi;
                    }

                    db.Slides.Add(slide);
                    db.SaveChanges();
                    load();
                }
                catch (Exception ex)
                {
                    lbThongBao.Text = "Tải lên ảnh bị lỗi do: " + ex.Message;
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void listImg_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("UpdateItem"))
            {
                lbMa.Value = e.CommandArgument.ToString();
                var slide = db.Slides.Find(int.Parse(e.CommandArgument.ToString()));
                if(slide != null)
                {
                    txtNoiDung.Text = slide.Type;
                    txtTieuDe.Text = slide.Tilte;
                    Image1.ImageUrl = "../Images/slides/" + slide.Anh;
                }
            }
            else if (e.CommandName.Equals("DeleteItem"))
            {
                var slide = db.Slides.Find(int.Parse(e.CommandArgument.ToString()));
                if (slide != null)
                {
                    try
                    {
                        db.Slides.Remove(slide);
                        db.SaveChanges();
                        load();
                    }
                    catch (Exception ex) { }
                }
            }
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            if(lbMa.Value != null)
            {
                var slide = db.Slides.Find(int.Parse(lbMa.Value.ToString()));
                try
                {
                    if(slide != null)
                    {
                        slide.Tilte = txtTieuDe.Text;
                        slide.Type = txtNoiDung.Text;
                        if (!string.IsNullOrEmpty(fileName))
                        {
                            slide.Anh = fileName;
                        }
                        {
                            string tenfile = Image1.ImageUrl;
                            int indexLast = tenfile.LastIndexOf('/');
                            string tenfilemoi = tenfile.Substring(indexLast + 1);
                            slide.Anh = tenfilemoi;
                        }
                        db.SaveChanges();
                        load();
                    }
                }catch(Exception ex) { }
            }
        }
    }
}