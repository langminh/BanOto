using BanOto.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanOto.Admin
{
    public partial class ThongBaoMoi : System.Web.UI.Page
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
            var list = db.Logs.Where(x => x.IsRead == false).OrderByDescending(x => x.TimeCreate).ToList();
            foreach(var item in list)
            {
                if (item.IsRead == false)
                {
                    var log = db.Logs.Find(item.MaLog);
                    log.IsRead = true;
                    db.SaveChanges();
                }
            }
            listLogs.DataSource = db.Logs.OrderByDescending(x => x.TimeCreate).ToList();
            listLogs.DataBind();
        }
    }
}