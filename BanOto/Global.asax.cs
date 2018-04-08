using BanOto.Entity;
using BanOto.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace BanOto
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            Application["NoOfVisitor"] = 0;
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            HitCount count = new HitCount();
            count.AddCount(new Counter() { STT = 0, IPAdress = Request.UserHostAddress, CreateTime = DateTime.Now });
            Application.Lock();
            Application["NoOfVisitor"] = (int)Application["NoOfVisitor"] + 1;
            Application.UnLock();
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            Application.Lock();
            Application["NoOfVisitor"] = (int)Application["NoOfVisitor"] - 1;
            Application.UnLock();
        }

        protected void Application_End(object sender, EventArgs e)
        {
            
        }
    }
}