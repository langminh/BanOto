using BanOto.Data.DAL;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using SD = System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanOto.Admin
{
    public partial class Chat : System.Web.UI.Page
    {
        protected string UserName = "admin";
        protected string UserImage = "../Images/Avatars/DP/dummy.png";
        protected string UploadFolderPath = "~/Uploads/";

        DAL data = new DAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["UserName"] != null)
            UserName = Session["UserName"].ToString();
            this.Header.DataBind();
        }

        protected void btnChangePicModel_Click(object sender, EventArgs e)
        {

            string serverPath = HttpContext.Current.Server.MapPath("~/");
            //path = serverPath + path;
            if (FileUpload1.HasFile)
            {
                string FileWithPat = serverPath + @"Images/Avatars/DP/" + UserName + FileUpload1.FileName;

                FileUpload1.SaveAs(FileWithPat);
                SD.Image img = SD.Image.FromFile(FileWithPat);
                SD.Image img1 = RezizeImage(img, 151, 150);
                img1.Save(FileWithPat);
                if (File.Exists(FileWithPat))
                {
                    FileInfo fi = new FileInfo(FileWithPat);
                    string ImageName = fi.Name;
                    string query = "update User set Avatar='" + ImageName + "' where Email='" + UserName + "'";
                    if (data.ExecuteQuery(query))
                        UserImage = "../Images/Avatars/DP/" + ImageName;
                }
            }
        }

        protected void FileUploadComplete(object sender, EventArgs e)
        {
            string filename = System.IO.Path.GetFileName(AsyncFileUpload1.FileName);
            AsyncFileUpload1.SaveAs(Server.MapPath(this.UploadFolderPath) + filename);
        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Admin/Login.aspx");
        }

        public void GetUserImage(string Username)
        {
            if (Username != null)
            {
                string query = "select Avatar from User where Email='" + Username + "'";

                string ImageName = data.GetColumnVal(query, "Avatar");
                if (ImageName != "")
                    UserImage = "../Images/Avatars/DP/" + ImageName;
            }
        }

        #region Resize Image With Best Qaulity

        private SD.Image RezizeImage(SD.Image img, int maxWidth, int maxHeight)
        {
            if (img.Height < maxHeight && img.Width < maxWidth) return img;
            using (img)
            {
                Double xRatio = (double)img.Width / maxWidth;
                Double yRatio = (double)img.Height / maxHeight;
                Double ratio = Math.Max(xRatio, yRatio);
                int nnx = (int)Math.Floor(img.Width / ratio);
                int nny = (int)Math.Floor(img.Height / ratio);
                Bitmap cpy = new Bitmap(nnx, nny, SD.Imaging.PixelFormat.Format32bppArgb);
                using (Graphics gr = Graphics.FromImage(cpy))
                {
                    gr.Clear(Color.Transparent);

                    // This is said to give best quality when resizing images
                    gr.InterpolationMode = InterpolationMode.HighQualityBicubic;

                    gr.DrawImage(img,
                        new Rectangle(0, 0, nnx, nny),
                        new Rectangle(0, 0, img.Width, img.Height),
                        GraphicsUnit.Pixel);
                }
                return cpy;
            }

        }

        private MemoryStream BytearrayToStream(byte[] arr)
        {
            return new MemoryStream(arr, 0, arr.Length);
        }
        #endregion
    }
}