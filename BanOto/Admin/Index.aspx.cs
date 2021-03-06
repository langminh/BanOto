﻿using BanOto.Entity;
using BanOto.Helper;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanOto.Admin
{
    public partial class Index : System.Web.UI.Page
    {
        BanOtoEntities db = new BanOtoEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
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

            lbTruyCap.Text = db.Counters.Count() + "";
            DateTime today = DateTime.Now;
            var startDate = new DateTime(today.Year, today.Month, 1);
            var endDate = startDate.AddMonths(1).AddDays(-1);

            lbSoild.Text = db.DonHangs.Where(x => EntityFunctions.TruncateTime(x.NgayDH) >= startDate.Date && EntityFunctions.TruncateTime(x.NgayDH) <= endDate.Date).Count() + "";
            lbComment.Text = Application["NoOfVisitor"].ToString();
            lbMessage.Text = db.Logs.Where(x => x.IsRead == false).Count() + "";
        }

        void load()
        {
            var list = db.DonHangs.OrderByDescending(x => x.NgayDH).Take(10).ToList();
            List<Temp> temps = new List<Temp>();
            foreach(var item  in list)
            {
                temps.Add(new Temp() { MaDH = item.MaDH, HoTen = item.HoTen,
                    ThoiGian = item.NgayDH.Value, TrangThai = item.TrangThai,
                    SoLuong = item.CTDonHangs.Where(x => x.MaDH.Equals(item.MaDH)).First().SoLuong.Value });
            }
            listDH.DataSource = temps;
            listDH.DataBind();
            DateTime today = DateTime.Now;
            var startDate = new DateTime(today.Year, today.Month, 1);
            var endDate = startDate.AddMonths(1).AddDays(-1);
            lbTotalSoild.Text = db.DonHangs.Count() + "";
            lbTotalMonth.Text = db.DonHangs.Where(x => EntityFunctions.TruncateTime(x.NgayDH) >= startDate.Date && EntityFunctions.TruncateTime(x.NgayDH) <= endDate.Date).Count() + "";
            var wStart = FirstDayOfWeek(DateTime.Now);
            var wEnd = LastDayOfWeek(DateTime.Now);
            lbTotalMonth.Text = db.DonHangs.Where(x => EntityFunctions.TruncateTime(x.NgayDH) >= wStart.Date && EntityFunctions.TruncateTime(x.NgayDH) <= wEnd.Date).Count() + "";

            Label1.Text = db.Counters.Count() + "";
            Label2.Text = db.Counters.Where(x => EntityFunctions.TruncateTime(x.CreateTime) >= startDate.Date && EntityFunctions.TruncateTime(x.CreateTime) <= endDate.Date).Count() + "";
            Label3.Text = db.Counters.Where(x => EntityFunctions.TruncateTime(x.CreateTime) >= wStart.Date && EntityFunctions.TruncateTime(x.CreateTime) <= wEnd.Date).Count() + "";
        }

        public DateTime FirstDayOfWeek(DateTime date)
        {
            DayOfWeek fdow = CultureInfo.CurrentCulture.DateTimeFormat.FirstDayOfWeek;
            int offset = fdow - date.DayOfWeek;
            DateTime fdowDate = date.AddDays(offset);
            return fdowDate;
        }

        public DateTime LastDayOfWeek(DateTime date)
        {
            DateTime ldowDate = FirstDayOfWeek(date).AddDays(6);
            return ldowDate;
        }

        protected void listDH_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("See"))
            {
                Response.Redirect("CTHoaDon.aspx?id=" + e.CommandArgument.ToString());
            }
        }

        private class Temp
        {
            public string MaDH { get; set; }
            public string HoTen { get; set; }
            public DateTime ThoiGian { get; set; }
            public int SoLuong { get; set; }
            public string TrangThai { get; set; }
        }
    }
}