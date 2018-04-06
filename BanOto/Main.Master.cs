using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanOto
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected string UserName = "admin";
        protected string UserImage = "../Images/Avatars/DP/dummy.png";
        protected string UploadFolderPath = "~/Uploads/";
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}