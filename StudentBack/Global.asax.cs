using StudentBack;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using StudentBack.Filter;
using StudentBack.App_Start;
using System.Security.Principal;

namespace StudentBack
{
  
    public class MvcApplication : System.Web.HttpApplication
    {
        #region 取得所有sessions
        private static readonly List<string> _sessions = new List<string>();
        private static readonly object Padlock = new object();
        public static List<string> Sessions { get { return _sessions; } }
        protected void Session_Start(object sender, EventArgs e)
        {
            lock (Padlock)
            {
                _sessions.Add(Session.SessionID);
            }
        }
        protected void Session_End(object sender, EventArgs e)
        {
            lock (Padlock)
            {
                _sessions.Remove(Session.SessionID);
            }
        }
        #endregion
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
           // FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
        //void Application_AuthenticateRequest(object sender, EventArgs e)
        //{
        //    if (!Request.IsAuthenticated)
        //    {
        //        string[] roles = { "1"};
        //        Context.User = new GenericPrincipal(Context.User.Identity, roles);
        //    }

        //}

    }
}
