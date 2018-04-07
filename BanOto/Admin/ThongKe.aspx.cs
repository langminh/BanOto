using BanOto.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanOto.Admin
{
    public partial class ThongKe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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
        void load()
        {

        }
    }
}