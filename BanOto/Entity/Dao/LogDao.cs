using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BanOto.Entity.Dao
{
    public class LogDao
    {
        private BanOtoEntities db;
        private static LogDao instance;

        public static LogDao Instance
        {
            get { if (instance == null) instance = new LogDao(); return instance; }
        }

        private LogDao()
        {
            db = new BanOtoEntities();
        }

        public List<Log> GetLogs()
        {
            return db.Logs.OrderByDescending(x => x.TimeCreate).ToList();
        }

        public bool SaveLog(Log log)
        {
            try
            {
                var result = db.Logs.Find(log.MaLog);
                result.TimeLogout = log.TimeLogout;
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Create(Log log)
        {
            try
            {
                db.Logs.Add(log);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

    }
}