using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using 天籁之声.Models;
using System.Web.Security;

namespace 天籁之声.Controllers
{
    [HandleError]
    public class MusicPlayController : Controller
    {
        //
        // GET: /MusicPlay/
        TianLaiDBDataContext db = new TianLaiDBDataContext();
        TianLianRepository tianlairepository = new TianLianRepository();

        public ActionResult Index(int mid)
        {
            var item = db.Music.SingleOrDefault(p => p.Mid == mid);
            ViewData["count"] = db.Music.Count();
            return View(item);
        }

        public ActionResult Default()
        {
            MusicSingerModel item = new MusicSingerModel(db.Singer, db.Music,db.Album);
            return View(item);
        }
        public ActionResult Playlist()
        {
            string checkbox = Request["checkbox"];//取得连播ID
            try
            {               
                if (Session["CurrentUser"]!= null)
                {
                    UserInfo uf = (UserInfo)Session["CurrentUser"];
                    tianlairepository.AddToPlayList(checkbox,uf.Uid);
                    string mids = tianlairepository.SelectMid(uf.Uid);
                    return View(tianlairepository.AddList(mids));
                }
                else
                {
                    return View(tianlairepository.AddList(checkbox));
                }
            }
            catch(Exception ex)
            {               
                ex.ToString();
                return Content("<script language='javascript'>alert('未选择歌曲！');window.location.href='../MusicPlay/Default';</script>");
            }
        }

        public ActionResult Lrc(int mid)
        {
            var music = db.Music.SingleOrDefault(p => p.Mid == mid);          
            return View(music);
        }

        public ActionResult Singer(string sid,string sname)
        {
            SingerAlbumModel item = new SingerAlbumModel(db.Singer, db.Album);
            ViewData["sid"] = sid;
            ViewData["sname"] = sname;           
            return View(item);
        }

        public ActionResult Album(string Aid,string Aname)
        {
            AlbumMusicModel item = new AlbumMusicModel(db.Music,db.Album);
            ViewData["aname"] = Aname;
            return View(item);
        }

        public ActionResult Albums(string area)
        {
            AlbumMusicModel item = new AlbumMusicModel(db.Music, db.Album);
            ViewData["area"] = area;
            return View(item);
        }

        public ActionResult SearchByMname(string q)
        {
            var item = TianLianRepository.SearchByMname(q);
            return View(item);
        }

        public ActionResult SearchByAlbum(string q)
        {
            var item =TianLianRepository.SearchByAlbum(q);
            return View(item);
        }
     
        public ActionResult SearchBySname(string q)
        {
            var item = TianLianRepository.SearchBySname(q);
            return View(item);
        }
    }
}
