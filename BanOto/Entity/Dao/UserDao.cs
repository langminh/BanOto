using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BanOto.Entity.Dao
{
    public class UserDao
    {
        private BanOtoEntities db;
        private static UserDao instance;

        public static UserDao Instance
        {
            get { if (instance == null) instance = new UserDao(); return instance; }
        }

        private UserDao()
        {
            db = new BanOtoEntities();
        }

        public int CheckUser(string userName, string pass)
        {
            try
            {
                var user = db.Users.Where(x => x.Email.Equals(userName)).First();
                if (user != null)
                {
                    if (!user.IsLock)
                    {
                        if (user.MatKhau.Equals(pass))
                        {
                            return 1;
                        }
                        else
                        {
                            return 0;
                        }
                    }
                    else
                    {
                        return -1;
                    }
                }
                else
                {
                    return -2;
                }
            }
            catch(Exception ex)
            {
                return -2;
            }
        }

        public User GetUser(string userName, string pass)
        {
            try
            {
                return db.Users.Where(x => x.Email.Equals(userName) && x.MatKhau.Equals(pass)).First();
            }
            catch
            {
                return null;
            }
        }

        public User GetUser(string userName)
        {
            return db.Users.Where(x => (x.UserName.Equals(userName))).First();
        }


        public bool CreateUser(User user)
        {
            try
            {
                db.Users.Add(user);
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool DeleteUser(string id)
        {
            var result = db.Users.Find(id);
            if (result != null)
            {
                try
                {
                    db.Users.Remove(result);
                    db.SaveChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
            return false;
        }

        public List<User> GetUsers()
        {
            return db.Users.ToList();
        }

        public bool UpdateUser(User user)
        {
            var result = db.Users.Find(user.UserName);
            if (result != null)
            {
                result.UserName = user.UserName;
                result.Email = user.Email;
                result.HoTen = user.HoTen;
                result.Sdt = user.Sdt;
                result.GT = user.GT;
                result.MatKhau = user.MatKhau;
                try
                {
                    db.SaveChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
            return false;
        }

    }
}