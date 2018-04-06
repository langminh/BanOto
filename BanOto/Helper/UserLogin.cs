using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BanOto.Helper
{
    public class UserLogin
    {
        public string UserName { get; set; }
        public string UserID { get; set; }
        public DateTime LoginTime { get; set; }
        public List<Hang> hangs { get; set; }
        public bool RememberMe { get; set; }
        public int Role { get; set; }
        public string Avatar { get; set; } 
    }
    public class Hang : Entity.Xe
    {
        public int SoLuongMua { get; set; }
        public decimal TongTien { get {
                return (decimal)SoLuongMua * GiaBan;
            } }
    }
    public class CommonContanst
    {
        public static string USER_SESSION
        {
            get
            {
                return "USER_SESSION";
            }
        }
        public static string CART_SESSION
        {
            get
            {
                return "CART_SESSION";
            }
        }
    }

    public class CartItem
    {
        public string HoTen { get; set; }
        public string Email { get; set; }
        public string Sdt { get; set; }
        public string DiaChi { get; set; }
        public Hang hangs { get; set; }
    }
}