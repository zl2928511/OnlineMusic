using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using 天籁之声.Models;
using System.Web.Security;
using System.IO;

namespace 天籁之声.Controllers
{
    [HandleError]
    [SysAdminAuthorizeAttribute]
    public class SysAdminController : Controller
    {
        //
        // GET: /SysAdmin/
        TianLianRepository tianlairepository = new TianLianRepository();
        #region 后台首页
        public ActionResult SysIndex()
        {
            return View();
        }
        #endregion
        #region 添加
        public ActionResult AddMusic()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddMusic([Bind(Exclude="Mid")] Music music)
        {
            foreach (string upload in Request.Files)
            {
                string path = AppDomain.CurrentDomain.BaseDirectory + "uploads/";
                string filename = Path.GetFileName(Request.Files[upload].FileName);
                if (filename.ToLower().IndexOf(".mp3") == -1)
                {
                    Response.Write("<div style='color:Red;'>请上传mp3格式文件！</div>");
                    return View();
                }
                Request.Files[upload].SaveAs(Path.Combine(path, filename));
                music.Url = "../../uploads/" + filename;
            }
            if (ModelState.IsValid)
            {
                try
                {
                    TianLaiDBDataContext db = new TianLaiDBDataContext();
                    db.Music.InsertOnSubmit(music);
                    db.SubmitChanges();
                    return Content("<label style='color:#35006A'>操作成功！</label>");
                }
                catch (Exception ex)
                {
                    ex.ToString();
                    return Content("<label style='color:Red'>操作失败！</label>");
                }
            }
            else return View(music);
        }
        public ActionResult AddSinger()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddSinger([Bind(Exclude="Sid")] Singer singer)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    TianLaiDBDataContext db = new TianLaiDBDataContext();
                    db.Singer.InsertOnSubmit(singer);
                    db.SubmitChanges();
                    return Content("<label style='color:#35006A'>操作成功！</label>");
                }
                catch (Exception ex)
                {
                    ex.ToString();
                    return Content("<label style='color:Red'>操作失败！</label>");
                }
            }
            else
            {
                return View(singer);
            }
        }
        public ActionResult AddAlbum()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddAlbum([Bind(Exclude="Aid")] Album album)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    TianLaiDBDataContext db = new TianLaiDBDataContext();
                    db.Album.InsertOnSubmit(album);
                    db.SubmitChanges();
                    return Content("<label style='color:#35006A'>操作成功！</label>");
                }
                catch (Exception ex)
                {
                    ex.ToString();
                    return Content("<label style='color:Red'>操作失败！</label>");
                }
            }
            else return View(album);
        }
        #endregion 
        #region 修改
        public ActionResult ModifyMusic()
        {
            TianLaiDBDataContext db = new TianLaiDBDataContext();
            var item = db.Music;
            return View(item);
        }
        public ActionResult ModifySinger()
        {
            TianLaiDBDataContext db = new TianLaiDBDataContext();
            var item = db.Singer;
            return View(item);
        }
        public ActionResult ModifyAlbum()
        {
            TianLaiDBDataContext db = new TianLaiDBDataContext();
            var item = db.Album;
            return View(item);
        }

        #endregion
        #region 修改2
        public ActionResult ModSinger(int sid)
        {
            Singer item = tianlairepository.SelectBySid(sid);
            return View (item);
        }
        [HttpPost]
        public ActionResult ModSinger(int sid,Singer singer)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    TianLaiDBDataContext db = new TianLaiDBDataContext();
                    singer = db.Singer.SingleOrDefault(d => d.Sid == sid);
                    UpdateModel(singer);
                    db.SubmitChanges();
                    return Content("<label style='color:#35006A'>操作成功！</label>");
                }
                catch (Exception ex)
                {
                    ex.ToString();
                    return Content("<label style='color:Red'>操作失败！</label>");
                }
            }
            else
            {
                return View(singer);
            }
        }
        public ActionResult ModMusic(int mid)
        {
            var item =TianLianRepository.SelectById(mid);
            return View(item.SingleOrDefault());
        }
        [HttpPost]
        public ActionResult ModMusic(int mid,Music music)
        {
            try
            {
                TianLaiDBDataContext db = new TianLaiDBDataContext();
                music = db.Music.SingleOrDefault(p => p.Mid == mid);
                UpdateModel(music);
                db.SubmitChanges();
                return Content("<label style='color:#35006A'>操作成功！</label>");
            }
            catch (Exception ex)
            {
                ex.ToString();
                return Content("<label style='color:Red'>操作失败！</label>");
            }
        }
        public ActionResult ModAlbum(int aid)
        {
            var item = tianlairepository.SelectByAid(aid);
            return View(item);
        }
        [HttpPost]
        public ActionResult ModAlbum(int aid,Album album)
        {
            try
            {
                TianLaiDBDataContext db = new TianLaiDBDataContext();
                album = db.Album.SingleOrDefault(p => p.Aid == aid);
                UpdateModel(album);
                db.SubmitChanges();
                return Content("<label style='color:#35006A'>操作成功！</label>");
            }
            catch (Exception ex)
            {
                ex.ToString();
                return Content("<label style='color:Red'>操作失败！</label>");
            }
        }

        //权限修改
        public ActionResult Permission()
        {
            TianLaiDBDataContext db = new TianLaiDBDataContext();
            var item = db.UserInfo;
            return View(item);
        }
        public ActionResult ModPermission(string uid)
        {
            try
            {
                TianLaiDBDataContext db = new TianLaiDBDataContext();
                UserInfo userinfo = db.UserInfo.SingleOrDefault(p => p.Uid == uid);
                if (userinfo.IsAdmin == true)
                    userinfo.IsAdmin = false;
                else
                    userinfo.IsAdmin = true;
                UpdateModel(userinfo);
                db.SubmitChanges();
                return View("Permission",db.UserInfo);
            }
            catch (Exception ex)
            {
                ex.ToString();
                return Content("<label style='color:Red'>操作失败！</label>");
            }
        }
        #endregion
        #region 删除
        public ActionResult DeleteMusic()
        {
            TianLaiDBDataContext db = new TianLaiDBDataContext();
            var item = db.Music;
            return View(item);
        }
        public ActionResult DeMusic(int mid)
        {
            TianLianRepository.DeleteByMid(mid);
            return Content("<label style='color:#35006A'>删除成功！</label>");
        }
        public ActionResult DeleteSinger()
        {
            TianLaiDBDataContext db = new TianLaiDBDataContext();
            var item = db.Singer;
            return View(item);
        }
        public ActionResult DeSinger(int sid)
        {
            TianLianRepository.DeleteBySid(sid);
            return Content("<label style='color:#35006A'>删除成功！</label>");
        }
        public ActionResult DeleteAlbum()
        {
            TianLaiDBDataContext db = new TianLaiDBDataContext();
            var item = db.Album;
            return View(item);
        }
        public ActionResult DeAlbum(int aid)
        {
            TianLianRepository.DeleteByAid(aid);
            return Content("<label style='color:#35006A'>删除成功！</label>");
        }
        public ActionResult DeletePlayList()
        {
            TianLaiDBDataContext db = new TianLaiDBDataContext();
            var item = db.PlayList;
            return View(item);
        }
        public ActionResult DePlayList()
        {
            TianLianRepository.DeletePlayListAll();
            return Content("<label style='color:#35006A'>删除成功！</label>");
        }
        #endregion
    }
}
