using System;
using System.Linq;
using System.Web.Mvc;
using 天籁之声.Models;
using System.Web.Security;
using System.Web;
using System.IO;

namespace 天籁之声.Controllers
{
    [HandleError]
    public class MemberController : Controller
    {
        TianLaiDBDataContext db = new TianLaiDBDataContext();
        //
        // GET: /Member/      
        #region 注册
        public ActionResult Register()
        {
            ViewData["unameconfirm"] = "中文、英文字母、数字(0-9_.)，长度3-20位";
            return View();
        }
        private string HashPassword(string str)
        {
            string rethash = "";
            System.Security.Cryptography.SHA1 hash = System.Security.Cryptography.SHA1.Create();
            System.Text.ASCIIEncoding encoder = new System.Text.ASCIIEncoding();
            byte[] combined = encoder.GetBytes(str);
            hash.ComputeHash(combined);
            rethash = Convert.ToBase64String(hash.Hash);
            return rethash;
        }
        [HttpPost]
        public ActionResult Register([Bind(Exclude = "ID,IsAdmin,AuthCode,CreateTime")] FormCollection formcollection)
        {
            UserInfo userinfo=new UserInfo();
            userinfo.Uid = formcollection["username"];
            userinfo.Password = formcollection["password"];
            userinfo.Uname = formcollection["nickname"];
            userinfo.Email = formcollection["email"];
            userinfo.Photo = formcollection["selectbox"];
            try
            {
                using (TianLaiDBDataContext db = new TianLaiDBDataContext())
                {
                    //检查账户是否重复
                    if (db.UserInfo.Where(p => p.Uid == userinfo.Uid).FirstOrDefault() != null)
                    {
                        ViewData["unameconfirm"] = "<label style='color:Red'>用户名重复，请重新输入</label>";
                        return View(userinfo);
                    }
                    using (System.Transactions.TransactionScope transaction = new System.Transactions.TransactionScope())
                    {
                        //指定已排除的默认值
                        userinfo.IsAdmin = false;
                        userinfo.AuthCode = Guid.NewGuid().ToString();
                        userinfo.Password = HashPassword(userinfo.Password);
                        userinfo.Createdata = DateTime.Now;
                        //将数据保存至数据库
                        db.UserInfo.InsertOnSubmit(userinfo);
                        db.SubmitChanges();                       
                        System.Net.Mail.SmtpClient sc = new System.Net.Mail.SmtpClient("smtp.qq.com", 25);
                        sc.Credentials = new System.Net.NetworkCredential("342354548", "0oO0oO");
                        sc.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                        string verify_url = new Uri(Request.Url, System.Web.Routing.RouteTable.Routes.GetVirtualPath
                            (Request.RequestContext, new System.Web.Routing.RouteValueDictionary
                                (new { action = "Verify", authCode = userinfo.AuthCode })).VirtualPath).AbsoluteUri;
                        sc.Send("342354548@qq.com", userinfo.Email, "会员注册确认信", verify_url);
                        transaction.Complete();
                    }
                }
            }
            catch (System.Net.Mail.SmtpException)
            {
                ModelState.AddModelError("Email", "很抱歉！系统发生异常，目前无法寄送确认信，请稍候再试！");
                return View(userinfo);
            }
            return Content("注册信息已发出，请登录邮箱验证！");
        }
        public ActionResult Verify(string authCode)
        {
            using (TianLaiDBDataContext db = new TianLaiDBDataContext())
            {
                var member = db.UserInfo.Where(p => p.AuthCode == authCode).FirstOrDefault();
                if (member != null)
                {
                    ViewData["Result"] = "会员验证成功！";
                    member.AuthCode = null;
                    db.SubmitChanges();
                    Session["CurrentUser"] = db.UserInfo.ToList().Find(u => u.Uid == member.Uid);
                }
                else
                {
                    ViewData["Result"] = "找不到此验证码，您是否已经验证过了呢？";
                }
            }
            return View();
        }
        #endregion

        #region 登录
        [HttpGet]
        public ActionResult LogOn()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LogOn(string account, string password)
        {
            if (ValidateLogOn(account, password))
            {
                Session["CurrentUser"] = db.UserInfo.ToList().Find(u => u.Uid == account);
                return RedirectToAction("Index", "Member", new { uid = account });

            }
            else
            {
                ModelState.AddModelError("password", "账号或密码错误！");
            }
            return View();
        }

        private bool ValidateLogOn(string uid, string password)
        {
            string hashed_pw = HashPassword(password);
            using (TianLaiDBDataContext db = new TianLaiDBDataContext())
            {
                UserInfo userinfo = db.UserInfo.Where(p => p.Uid == uid && p.Password == hashed_pw).FirstOrDefault();
                if (userinfo != null)
                {
                    //如果会员尚未点击验证信中的超链接就无法登录
                    if (userinfo.AuthCode != null)
                    {
                        ModelState.AddModelError("password", "您的Email尚未验证成功！");
                        return false;
                    }                   
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
        #endregion

        #region 个人中心
        //首页
        public ActionResult Index(string uid)
        {
           if( UserConfirm(uid))
           {
               var item = TianLianRepository.userinfo(uid);
               return View(item);
           }
           return View("Error");
        }
        //个人资料
        public ActionResult UserInfo(string uid)
        {
            if (UserConfirm(uid))
            {
                var item = TianLianRepository.userinfo(uid);
                return View(item);
            }
            return View("Error");
        }
        //播放列表
        public ActionResult UserPlaylist(string uid)
        {
            if (UserConfirm(uid))
            {
                ViewData["uid"] = uid;
                TianLianRepository tianlairepository = new TianLianRepository();
                try
                {
                    string mids = tianlairepository.SelectMid(uid);
                    return View(tianlairepository.AddList(mids));
                }
                catch (Exception ex)
                {
                    ex.ToString();
                }
                return Content("播放列表暂无歌曲，请添加后再试!");
            }
            return View("Error");
        }
        public ActionResult DeleteList(int mid,string uid)
        {
            TianLianRepository.DeleteList(mid,uid);
            return RedirectToAction("UserPlaylist",new { uid=uid});
        }
        public ActionResult DeleteListAll(string uid)
        {
            TianLianRepository.DeleteListAll(uid);
            return Content("播放列表已清空！");
        }
        //验证邮箱
        public ActionResult ConfirmMail(string uid)
        { 
        if( UserConfirm(uid))
           {
               var item = TianLianRepository.userinfo(uid);
               return View(item);
           }
        return View("Error");
        }
        [HttpPost]
        public ActionResult ConfirmMail([Bind(Exclude = "AuthCode")] string uid, UserInfo userinfo)
        {
            try
            {
                using (System.Transactions.TransactionScope transaction = new System.Transactions.TransactionScope())
                {
                    userinfo = db.UserInfo.FirstOrDefault(p => p.Uid == uid);
                    userinfo.Email = Request["newmail"];
                    userinfo.AuthCode = Guid.NewGuid().ToString();
                    UpdateModel(userinfo);
                    db.SubmitChanges();
                    System.Net.Mail.SmtpClient sc = new System.Net.Mail.SmtpClient("smtp.qq.com", 25);
                    sc.Credentials = new System.Net.NetworkCredential("342354548", "0oO0oO");
                    sc.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                    string verify_url = new Uri(Request.Url, System.Web.Routing.RouteTable.Routes.GetVirtualPath
                        (Request.RequestContext, new System.Web.Routing.RouteValueDictionary
                            (new { action = "Verify", authCode = userinfo.AuthCode })).VirtualPath).AbsoluteUri;
                    sc.Send("342354548@qq.com", userinfo.Email, "会员注册确认信", verify_url);
                    transaction.Complete();
                }
                Session["CurrentUser"] = null;
                return Content("验证邮件已发出，请验证后重新登录！");
            }
            catch (Exception ex)
            {
                ex.ToString();
                return Content("验证邮箱不存在，请重新填写！");
            }
        }
        //修改头像
        public ActionResult ModifyPhoto(string uid)
        {
            if (UserConfirm(uid))
            {
                var item = TianLianRepository.userinfo(uid);
                return View(item);
            }
            return View("Error");
        }
        [HttpPost]
        public ActionResult ModifyPhoto(string uid, FormCollection formValues)
        {
            var user = db.UserInfo.FirstOrDefault(p=>p.Uid==uid);
            user.Photo = formValues["selectbox"];
            UpdateModel(user);
            db.SubmitChanges();
            return Content("修改成功！");
        }
        //修改密码
        public ActionResult ModifyPassword(string uid)
        {
            if (UserConfirm(uid))
            {
                var item = TianLianRepository.userinfo(uid);
                return View(item);
            }
            return View("Error");
        }
        [HttpPost]
        public ActionResult ModifyPassword(string uid, FormCollection formcollection)
        {
            try
            {
                string opwd=formcollection["oldp"];
                string pwd =formcollection["newp"];
                var userinfo = db.UserInfo.FirstOrDefault(p => p.Uid == uid);
                if (HashPassword(opwd) == userinfo.Password)
                {
                    userinfo.Password = HashPassword(pwd);
                    UpdateModel(userinfo);
                    db.SubmitChanges();
                    return Content("修改成功！");
                }
                else
                    return Content("密码错误！");
            }
            catch (Exception ex)
            {
                ex.ToString();
                return Content("两次密码输入不一致！");
            }
        }
        //上传音乐
        public ActionResult UploadMusic(string uid)
        {
            return View();
        }
        [HttpPost]
        public ActionResult UploadMusic([Bind(Exclude = "Mid")] Music music)
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
                music.Mname = filename.Replace(".mp3","");
                music.Url = "../../uploads/" + filename;
            }
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
        //下载音乐
        public ActionResult DownloadMusic()
        {
            var item = db.Music;
            return View(item);
        }
        //推广
        public ActionResult Tuiguang(string uid)
        {
            var item = TianLianRepository.userinfo(uid);
            return View(item);
        }
        //用户确认
        public bool UserConfirm( string uid)
        {
            UserInfo uf = (UserInfo)Session["CurrentUser"];
            if (Session["CurrentUser"] != null && uid == uf.Uid)
            {
                return true;
            }
            else
                return false;
        }
        #endregion

        #region 注销
        public ActionResult LogOff()
        {
            Session["CurrentUser"] =null;
            return RedirectToAction("Default","MusicPlay"); ;
        }
        #endregion
    }

}
