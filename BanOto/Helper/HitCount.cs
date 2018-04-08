using BanOto.Entity;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Web;

namespace BanOto.Helper
{
    public class HitCount
    {
        public void AddCount(Counter HC)
        {
            using(BanOtoEntities db = new BanOtoEntities())
            {
                DateTime today = DateTime.Now.Date;
                var v = db.Counters.Where(x => x.IPAdress.Equals(HC.IPAdress) && EntityFunctions.TruncateTime(x.CreateTime) == today).FirstOrDefault();
                if(v == null)
                {
                    db.Counters.Add(HC);
                    db.SaveChanges();
                }
            }
        }

        public object[] GetCount()
        {
            object[] o = new object[2];
            using(BanOtoEntities db = new BanOtoEntities())
            {
                DateTime today = DateTime.Now.Date;
                o[0] = db.Counters.Where(x => EntityFunctions.TruncateTime(x.CreateTime) == today).Count();
                o[1] = db.Counters.Count();
            }
            return o;
        }
    }
}