using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using 天籁之声.Models;

namespace 天籁之声.Models
{
    public class SysAdminAuthorizeAttribute : AuthorizeAttribute
    {
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            UserInfo user = (UserInfo)filterContext.RequestContext.HttpContext.Session["CurrentUser"];
            if (user != null && user.IsAdmin == true)
            {
            }
            else
            {
                filterContext.RequestContext.HttpContext.Response.Write("无权访问");
                filterContext.RequestContext.HttpContext.Response.End();
            }
        }
    }
}