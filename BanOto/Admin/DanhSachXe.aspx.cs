using BanOto.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanOto.Admin
{
    public partial class DanhSachXe : System.Web.UI.Page
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
            listCars.DataSource = db.Xes.ToList();
            listCars.DataBind();
        }

        protected void listCars_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if(e.CommandName == "UpdateItem")
            {
                Response.Redirect("QuanLyXe.aspx?id=" + e.CommandArgument.ToString());
            }else if(e.CommandName == "DeleteItem")
            {
                string CarID = e.CommandArgument.ToString();
                txtCarID_Delete.Value = db.Xes.Find(CarID).MaXe;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#modalDelete').modal('show');", true);
                deleteModal.Update();
            }
        }

        void SetNotify(string modal, string status, string type, string content)
        {
            string csName = "DeleteScript";
            Type csType = this.GetType();
            ClientScriptManager cs = Page.ClientScript;
            if (!cs.IsStartupScriptRegistered(csType, csName))
            {
                StringBuilder csText = new StringBuilder();
                csText.Append(@"$('#" + modal + "').modal('hide'); $.notify({title: '<strong>" + status + "</strong>',message: '" + content + "'},{type: '" + type + "', offset: 120});");
                ScriptManager.RegisterStartupScript(this, csType, csName, csText.ToString(), true);
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string CarID = txtCarID_Delete.Value.ToString();
            var car = db.Xes.Find(CarID);
            //SetNotify("modalDelete", "Xong!", "success", "Đã xóa sản phẩm khỏi hệ thống");

            if (car != null)
            {
                try
                {
                    db.Xes.Remove(car);
                    db.SaveChanges();
                    SetNotify("modalDelete", "Xong!", "success", "Đã xóa sản phẩm khỏi hệ thống");
                }
                catch (Exception ex)
                {
                    SetNotify("modalDelete", "Lỗi!", "success", "Đã có lỗi xảy ra. Thử lại sau.");
                }
            }
        }
    }
}