using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace 天籁之声.Models
{
    public class TianLianRepository
    {
        private TianLaiDBDataContext db = new TianLaiDBDataContext();

        public static IEnumerable<Singer> SearchBySname(string name)
        { 
             TianLaiDBDataContext db = new TianLaiDBDataContext();
             string sql="select * from Singer where Sname like '%"+name+"%'";
             var result = db.ExecuteQuery<Singer>(sql);
             return result;
        }
        public static IEnumerable<Music> SearchByMname(string name)
        {
            TianLaiDBDataContext db = new TianLaiDBDataContext();
            string sql = "select * from Music where Mname like '%" + name + "%'";
            var result = db.ExecuteQuery<Music>(sql);
            return result;
        }
        public static IEnumerable<Album> SearchByAlbum(string name)
        {
            TianLaiDBDataContext db = new TianLaiDBDataContext();
            string sql = "select * from Album where Aname like '%" + name + "%'";
            var result = db.ExecuteQuery<Album>(sql);
            return result;
        }

        public static IQueryable<Music> SelectById(int id)
        {   
            TianLaiDBDataContext db = new TianLaiDBDataContext();
            return db.Music.Where(d => d.Mid == id);
        }
        public Singer SelectBySid(int id)
        {
            return db.Singer.SingleOrDefault(d => d.Sid == id);
        }
        public Album SelectByAid(int id)
        {
            return db.Album.SingleOrDefault(d => d.Aid == id);
        }

        public IEnumerable<Music> AddList(string mids)
        {
            string sql = "select * from Music where Mid in (" + mids+")";
            var result = db.ExecuteQuery<Music>(sql);
            return result;
        }

        public void AddToPlayList(string mids,string uid)
        {
            string sql="select * from Music where Mid in ("+mids+")";
            var result = db.ExecuteQuery<Music>(sql);           
            foreach (var item in result)
            {
                PlayList pl = new PlayList();
                pl.Mid = item.Mid;
                pl.Uid = uid;
                db.PlayList.InsertOnSubmit(pl);
                db.SubmitChanges();
            }
        }
        public string SelectMid(string uid)
        {
            var result =from pl in db.PlayList where pl.Uid==uid.ToString() select pl.Mid;
            string mids="";
            foreach (var item in result)
            {
                mids =mids+item+",";
            }
            mids = mids.Remove(mids.LastIndexOf(","), 1);
            return mids;
        }

        public static void DeleteBySid(int sid)
        {
            TianLaiDBDataContext db = new TianLaiDBDataContext();
            var item = db.Singer.FirstOrDefault(p => p.Sid == sid);
            db.Singer.DeleteOnSubmit(item);
            db.SubmitChanges();
        }
        public static void DeleteByAid(int aid)
        {
            TianLaiDBDataContext db = new TianLaiDBDataContext();
            var item = db.Album.FirstOrDefault(p => p.Aid == aid);
            db.Album.DeleteOnSubmit(item);
            db.SubmitChanges();
        }
        public static void DeleteByMid(int mid)
        {
            TianLaiDBDataContext db = new TianLaiDBDataContext();
            var item = db.Music.FirstOrDefault(p => p.Mid == mid);
            db.Music.DeleteOnSubmit(item);
            db.SubmitChanges();
        }
        public static void DeletePlayListAll()
        {
            TianLaiDBDataContext db = new TianLaiDBDataContext();
            db.PlayList.DeleteAllOnSubmit(db.PlayList);
            db.SubmitChanges();
        }

        public static void DeleteList(int mid,string uid)
        {
            TianLaiDBDataContext db = new TianLaiDBDataContext();
            var item = db.PlayList.FirstOrDefault(p => p.Mid == mid&&p.Uid==uid);
            db.PlayList.DeleteOnSubmit(item);
            db.SubmitChanges();
        }
        public static void DeleteListAll(string uid)
        {
            TianLaiDBDataContext db = new TianLaiDBDataContext();
            var item = db.PlayList.Where(p => p.Uid == uid);
            db.PlayList.DeleteAllOnSubmit(item);
            db.SubmitChanges();
        }

        public static UserInfo userinfo(string uid)
        {
            TianLaiDBDataContext db = new TianLaiDBDataContext();
            var result = db.UserInfo.FirstOrDefault(p => p.Uid == uid);
            return result;
        }
    }
}