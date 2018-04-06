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
    public partial class ThemAnh : System.Web.UI.Page
    {
        BanOtoEntities db = new BanOtoEntities();
        List<Temp> list = new List<Temp>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                load();
            }
        }

        void load()
        {
            if (Request["id"] != null)
            {
                string id = Request["id"].ToString();
                var xe = db.Xes.Find(id);
                if (xe != null)
                {
                    txtMaXe.Text = xe.MaXe;
                    txtName.Text = xe.TenXe;
                    imgCar.Src = "../Images/Cars/" + xe.Anh;
                    loadData();
                }
            }
        }

        void loadData()
        {
            var data = db.Anhs.Where(x => x.MaXe.Equals(txtMaXe.Text)).ToList();
            foreach (var item in data)
            {
                long length = new System.IO.FileInfo(Server.MapPath("~/Images/Cars/") + item.Src).Length;

                list.Add(new Temp() { MaAnh=item.MaAnh ,FileName = item.Src, Src = item.Src, Capacity = GetFileSizeInBytes(length) });
            }
            listImg.DataSource = list;
            listImg.DataBind();
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            try
            {
                // Get the HttpFileCollection
                HttpFileCollection hfc = Request.Files;
                for (int i = 0; i < hfc.Count; i++)
                {
                    HttpPostedFile hpf = hfc[i];
                    if (hpf.ContentLength > 0)
                    {
                        hpf.SaveAs(Server.MapPath("../Images/Cars/") +
                          Path.GetFileName(hpf.FileName));
                        Temp temp = new Temp();
                        temp.FileName = hpf.FileName;
                        temp.Src = hpf.FileName;
                        temp.Capacity = GetFileSizeInBytes(hpf.ContentLength);
                        list.Add(temp);
                    }
                }
                Insert(list);
                loadData();
            }
            catch (Exception ex)
            {
                // Handle your exception here
            }
        }

        protected void Insert(List<Temp> list)
        {
            foreach (var item in list)
            {
                try
                {
                    db.Anhs.Add(new Anh() { MaXe = txtMaXe.Text, Src = item.Src });
                    db.SaveChanges();
                }
                catch (Exception ex) { }
            }
        }

        protected string GetFileSizeInBytes(long TotalBytes)
        {
            if (TotalBytes >= 1073741824) //Giga Bytes
            {
                Decimal FileSize = Decimal.Divide(TotalBytes, 1073741824);
                return String.Format("{0:##.##} GB", FileSize);
            }
            else if (TotalBytes >= 1048576) //Mega Bytes
            {
                Decimal FileSize = Decimal.Divide(TotalBytes, 1048576);
                return String.Format("{0:##.##} MB", FileSize);
            }
            else if (TotalBytes >= 1024) //Kilo Bytes
            {
                Decimal FileSize = Decimal.Divide(TotalBytes, 1024);
                return String.Format("{0:##.##} KB", FileSize);
            }
            else if (TotalBytes > 0)
            {
                Decimal FileSize = TotalBytes;
                return String.Format("{0:##.##} Bytes", FileSize);
            }
            else
            {
                return "0 Bytes";
            }


        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("DanhSachXe.aspx");
        }

        protected class Temp
        {
            public int MaAnh { get; set; }
            public string FileName { get; set; }
            public string Src { get; set; }
            public string Capacity { get; set; }
        }

        protected void listImg_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("DeleteItem"))
            {
                int id = int.Parse(e.CommandArgument.ToString());
                var img = db.Anhs.Find(id);
                try
                {
                    db.Anhs.Remove(img);
                    db.SaveChanges();
                    load();
                }catch(Exception ex) { }
            }
        }
    }
}