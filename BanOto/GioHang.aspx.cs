using BanOto.Entity;
using BanOto.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanOto
{
    public partial class GioiHang : System.Web.UI.Page
    {
        BanOtoEntities db = new BanOtoEntities();
        protected List<Hang> items = new List<Hang>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                load();
                TakeData();
            }
            if (Session[CommonContanst.CART_SESSION] != null)
            {
                items = Session[CommonContanst.CART_SESSION] as List<Hang>;
                ListCart.DataSource = items;
                ListCart.DataBind();
            }
            drVC_SelectedIndexChanged(sender, e);
        }

        void TakeData()
        {
            if (Session[CommonContanst.CART_SESSION] != null)
            {
                items = Session[CommonContanst.CART_SESSION] as List<Hang>;

                if (Request["id"] != null)
                {
                    try
                    {
                        string id = Request["id"].ToString();
                        var xe = db.Xes.Find(id);
                        int quanti = 0;
                        if (Request["soluong"] != null)
                        {
                            int.TryParse(Request["soluong"].ToString(), out quanti);
                        }
                        if (quanti <= 0)
                        {
                            quanti = 1;
                        }

                        if (items.Exists(x => x.MaXe.Equals(xe.MaXe)))
                        {
                            foreach (var item in items)
                            {
                                if (item.MaXe.Equals(xe.MaXe))
                                {
                                    if (quanti == 0)
                                    {
                                        item.SoLuongMua++;
                                    }
                                    else
                                    {
                                        item.SoLuongMua = quanti;
                                    }
                                }
                            }
                        }
                        else
                        {
                            Hang h = new Hang();
                            h.Anh = xe.Anh;
                            h.MaXe = xe.MaXe;
                            h.MaXX = xe.MaXX;
                            h.MaMau = xe.MaMau;
                            h.MaLoaiXe = xe.MaLoaiXe;
                            h.GiaBan = xe.GiaBan;
                            h.GiamGia = xe.GiamGia;
                            h.TenXe = xe.TenXe;
                            h.LoaiHopSo = xe.LoaiHopSo;
                            h.MaTH = xe.MaTH;
                            h.SoLuongMua = quanti;
                            items.Add(h);
                        }
                        Session[CommonContanst.CART_SESSION] = items;

                        ListCart.DataSource = items;
                        ListCart.DataBind();

                        listCungLoai.DataSource = db.Xes.Where(x => x.MaLoaiXe == xe.MaLoaiXe).Take(4).ToList();
                        listCungLoai.DataBind();
                    }
                    catch (Exception ex) { }
                }
            }
            else
            {
                if (Request["id"] != null)
                {
                    string id = Request["id"].ToString();
                    var xe = db.Xes.Find(id);

                    Hang h = new Hang();
                    h.Anh = xe.Anh;
                    h.MaXe = xe.MaXe;
                    h.MaXX = xe.MaXX;
                    h.MaMau = xe.MaMau;
                    h.MaLoaiXe = xe.MaLoaiXe;
                    h.GiaBan = xe.GiaBan;
                    h.GiamGia = xe.GiamGia;
                    h.LoaiHopSo = xe.LoaiHopSo;
                    h.TenXe = xe.TenXe;
                    h.MaTH = xe.MaTH;
                    int quanti = 1;
                    if (Request["soluong"] != null)
                    {
                        int.TryParse(Request["soluong"].ToString(), out quanti);
                    }
                    if (quanti <= 0)
                    {
                        quanti = 1;
                    }
                    h.SoLuongMua = quanti;
                    items.Add(h);
                    Session[CommonContanst.CART_SESSION] = items;
                    Session[CommonContanst.CART_HISTORY] = items;
                    listCungLoai.DataSource = db.Xes.Where(x => x.MaLoaiXe == xe.MaLoaiXe).Take(4).ToList();
                    listCungLoai.DataBind();
                }


                ListCart.DataSource = items;
                ListCart.DataBind();
            }
            decimal tong = 0;
            foreach (var item in items)
            {
                tong += item.TongTien;
            }
            lbTong.Text = String.Format("{0:n0}", tong) + "VNĐ";
        }

        void load()
        {

            drVC.DataSource = db.VanChuyens.ToList();
            drVC.DataBind();
            drVC.SelectedIndex = 0;

            listNewCars.DataSource = db.Xes.OrderBy(x => x.TimeCreate).Take(4).ToList();
            listNewCars.DataBind();

            list.DataSource = db.Xes.OrderByDescending(x => x.DanhGia).Take(4).ToList();
            list.DataBind();
        }


        protected void ListCart_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("DeleteItem"))
            {
                items = Session[CommonContanst.CART_SESSION] as List<Hang>;
                var result = items.Find(x => x.MaXe.Equals(e.CommandArgument.ToString()));
                items.Remove(result);
                Session[CommonContanst.CART_SESSION] = items;
                ListCart.DataSource = items;
                ListCart.DataBind();
            }
            else if (e.CommandName.Equals("UpdateItem"))
            {

                items = Session[CommonContanst.CART_SESSION] as List<Hang>;
                var result = items.Find(x => x.MaXe.Equals(e.CommandArgument.ToString()));
                txtChange.Value = result.MaXe;
                txtCoupon_code.Text = result.SoLuongMua + "";
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (txtChange.Value != null)
            {
                items = Session[CommonContanst.CART_SESSION] as List<Hang>;
                var result = items.Find(x => x.MaXe.Equals(txtChange.Value.ToString()));
                int index = items.IndexOf(result);
                items.Remove(result);
                result.SoLuongMua = int.Parse(txtCoupon_code.Text);
                items.Insert(index, result);
                Session[CommonContanst.CART_SESSION] = items;
                ListCart.DataSource = items;
                ListCart.DataBind();
            }
        }

        protected void drVC_SelectedIndexChanged(object sender, EventArgs e)
        {
            items = Session[CommonContanst.CART_SESSION] as List<Hang>;
            var vc = db.VanChuyens.Find(int.Parse(drVC.SelectedValue.ToString()));
            decimal tong = 0;
            if (items != null)
            {
                if (items.Count > 0)
                {
                    foreach (var item in items)
                    {
                        tong += item.TongTien;
                    }
                    decimal tien = ((decimal)vc.PhiVC.Value * tong) / 100 + tong;
                    lbPhi.Text = String.Format("{0:n0}", vc.PhiVC) + "%";
                    lbTong.Text = String.Format("{0:n0}", tien) + "VNĐ";
                }
            }
        }

        protected void btnThanhToan_Click(object sender, EventArgs e)
        {
            Session[CommonContanst.PHI_VC] = drVC.SelectedValue.ToString();
            Response.Redirect("ThanhToan.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
            {
                Response.Redirect("TimKiem.aspx?tenxe=" + txtSearch.Text);
            }
        }
    }
}