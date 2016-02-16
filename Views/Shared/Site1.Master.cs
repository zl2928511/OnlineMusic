using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using 天籁之声.Models;

namespace 天籁之声.Views.Shared
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        public int s;
        public string m;
        protected void Page_Load(object sender, EventArgs e)
        {
            UserInfo uinfo=(UserInfo)Session["CurrentUser"];
            if (uinfo == null)
            {
                m = "<a href='../Member/LogOn' id='inin0'>登录</a>";
            }
            else
            {
                m = "<a href='../Member/Index?uid="+uinfo.Uid+"' id='inin0' style='color:Red'>"+uinfo.Uname+"</a>";
            }
            TianLaiDBDataContext db = new TianLaiDBDataContext();
            int count=db.Music.Count();
            Random random = new Random();
            s = random.Next(count+1);
        }
    }
}