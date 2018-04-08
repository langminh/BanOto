using BanOto.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanOto
{
    public partial class Xe : System.Web.UI.Page
    {
        BanOtoEntities db = new BanOtoEntities();
        List<Entity.Xe> list = new List<Entity.Xe>();
        protected bool isOld = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                loadDropDown();
                
            }
            load();
            if (Request["type"] != null)
            {
                string type = Request["type"].ToString();
                if (type.Equals("xemoi"))
                {
                    isOld = false;
                }
                else if (type.Equals("xecu"))
                {
                    isOld = true;
                }
            }
        }

        void loadDropDown()
        {
            filterHang.DataSource = db.ThuongHieux.OrderBy(x => x.TenTH).ToList();
            filterHang.DataBind();

            filterLoaiHS.DataSource = db.LoaiHopSoes.OrderBy(x => x.TenHS).ToList();
            filterLoaiHS.DataBind();

            filterLoaiXe.DataSource = db.LoaiXes.OrderBy(x => x.TenLX).ToList();
            filterLoaiXe.DataBind();

            filterMau.DataSource = db.Maus.OrderBy(x => x.TenMau).ToList();
            filterMau.DataBind();

            filterXX.DataSource = db.XuatXus.OrderBy(x => x.TenXX).ToList();
            filterXX.DataBind();

            listQuanTam.DataSource = db.Xes.OrderByDescending(x => x.DanhGia).Take(4).ToList();
            listQuanTam.DataBind();
        }
        void load()
        {
            try
            {
                if (Request["type"] != null)
                {
                    string type = Request["type"].ToString();
                    if (type.Equals("khuyenmai"))
                    {
                        list = db.Xes.Where(x => x.GiamGia > 0).OrderByDescending(x => x.GiamGia).ToList();
                        lbType.Text = "Xe Khuyến mại";
                    }
                    else if (type.Equals("xemoi"))
                    {
                        list = db.Xes.OrderByDescending(x => x.TimeCreate).ToList();
                        isOld = false;
                        lbType.Text = "Xe Mới";
                    }
                    else if (type.Equals("quantam"))
                    {
                        list = db.Xes.OrderByDescending(x => x.DanhGia).ToList();
                        lbType.Text = "Xe quan tâm nhiều";
                    }
                    else if (type.Equals("xecu"))
                    {
                        list = db.Xes.OrderBy(x => x.TimeCreate).ToList();
                        lbType.Text = "Xe cũ";
                        isOld = true;
                    }
                    
                    listCars.DataSource = list;
                    listCars.DataBind();
                }
                else if (Request["loaixe"] != null)
                {
                    int loaixe = int.Parse(Request["loaixe"].ToString());
                    string name = db.LoaiXes.Find(loaixe).TenLX;
                    lbType.Text = name;
                    list = db.Xes.Where(x => x.MaLoaiXe == loaixe).ToList();
                    listCars.DataSource = list;
                    listCars.DataBind();
                }
                else if (Request["thuonghieu"] != null)
                {
                    int thuonghieu = int.Parse(Request["thuonghieu"].ToString());
                    lbType.Text = db.ThuongHieux.Find(thuonghieu).TenTH;
                    list = db.Xes.Where(x => x.MaTH == thuonghieu).ToList();
                    listCars.DataSource = list;
                    listCars.DataBind();
                }
                else
                {
                    list = db.Xes.OrderByDescending(x => x.TimeCreate).ToList();
                    listCars.DataSource = list;
                    listCars.DataBind();
                    lbType.Text = "Xe";
                }
            }
            catch (Exception ex) { }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            listCars.DataSource = Listfilter();
            listCars.DataBind();
        }

        List<Entity.Xe> Listfilter()
        {
            var result = db.Xes.ToList();

            int a = DropDownList1.SelectedIndex;
            switch (a)
            {
                case 1:
                    result = result.OrderBy(x => x.TenXe).ToList();
                    break;
                case 2:
                    result = result.OrderByDescending(x => x.TenXe).ToList();
                    break;
                case 3:
                    result = result.OrderBy(x => x.GiaBan).ToList();
                    break;
                case 4:
                    result = result.OrderByDescending(x => x.GiaBan).ToList();
                    break;
                default:
                    result = result.OrderByDescending(x => x.TimeCreate).ToList();
                    break;
            }
            return result;
        }

        private void ListCars_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            listCars.DataBind();
        }

        protected void filterHang_SelectedIndexChanged(object sender, EventArgs e)
        {
            var result = Listfilter();
            int id = db.ThuongHieux.Find(int.Parse(filterHang.SelectedValue)).MaTH;
            listCars.DataSource = result.Where(x => x.MaTH == id).ToList();
            listCars.DataBind();
            listCars.PagePropertiesChanging += ListCars_PagePropertiesChanging;
        }

        protected void filterLoaiHS_SelectedIndexChanged(object sender, EventArgs e)
        {
            var result = Listfilter();
            int id = db.LoaiHopSoes.Find(int.Parse(filterLoaiHS.SelectedValue)).MaHS;
            listCars.DataSource = result.Where(x => x.LoaiHopSo == id).ToList();
            listCars.DataBind();
            listCars.PagePropertiesChanging += ListCars_PagePropertiesChanging;
        }

        protected void filterMau_SelectedIndexChanged(object sender, EventArgs e)
        {
            var result = Listfilter();
            int id = db.Maus.Find(int.Parse(filterMau.SelectedValue)).MaMau;
            listCars.DataSource = result.Where(x => x.MaMau == id).ToList();
            listCars.DataBind();
            listCars.PagePropertiesChanging += ListCars_PagePropertiesChanging;
        }

        protected void filterLoaiXe_SelectedIndexChanged(object sender, EventArgs e)
        {
            var result = Listfilter();
            int id = db.LoaiXes.Find(int.Parse(filterLoaiXe.SelectedValue)).MaLX;
            listCars.DataSource = result.Where(x => x.MaLoaiXe == id).ToList();
            listCars.DataBind();
            listCars.PagePropertiesChanging += ListCars_PagePropertiesChanging;
        }

        protected void filterXX_SelectedIndexChanged(object sender, EventArgs e)
        {
            var result = Listfilter();
            int id = db.XuatXus.Find(int.Parse(filterXX.SelectedValue)).MaXX;
            listCars.DataSource = result.Where(x => x.MaXX == id).ToList();
            listCars.DataBind();
            listCars.PagePropertiesChanging += ListCars_PagePropertiesChanging;
        }
    }
}