using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc.Filters;
using NLog;
using StudenBack.Models;
using StudentBack.Models;
using System.Web.Security;
using System.Web.Mvc;
using System.Web.Routing;
using System.Security.Principal;

namespace StudentBack.Filter
{
    public class SSOAuthenticationFilter : IAuthenticationFilter
    {
        private static Logger _logger = LogManager.GetCurrentClassLogger();
        private const string LOGIN_URL = "~/Login/Index";
        private Repository<employee> repo = new Repository<employee>();
        private Repository<employeeCategory> repoc = new Repository<employeeCategory>();
        private UserAuth ua = new UserAuth();
        private HttpSessionStateBase Session;

        void IAuthenticationFilter.OnAuthentication(AuthenticationContext filterContext)
        {

            HttpRequestBase request = filterContext.HttpContext.Request;
            HttpResponseBase response = filterContext.HttpContext.Response;
            //var rd = System.Web.HttpContext.Current.Request.RequestContext.RouteData;
            //string currentAction = rd.GetRequiredString("action");
            //string currentController = rd.GetRequiredString("controller");
            var urlHelper = new UrlHelper(filterContext.RequestContext);
            var user = Convert.ToString(filterContext.HttpContext.Session["employeeId"]);
            if (user.Trim()!="")
            {
                return;
            }
            else
            {
                filterContext.Result = new RedirectResult(LOGIN_URL);
                filterContext.Result = new HttpUnauthorizedResult();
                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary
                {
                    {"controller","Login"},
                    {"action","Index"},
                    { "id", UrlParameter.Optional }
                });
               
            }
        }
        public void OnAuthenticationChallenge(AuthenticationChallengeContext filterContext)
        {
            //if (filterContext.Result == null || filterContext.Result is HttpUnauthorizedResult)
            //{
            //    filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary
            //{
            //    {"controller","Login"},
            //    {"action","Index"},
            //    {"returnUrl",filterContext.HttpContext.Request.RawUrl }
            //});
            //}
        }
    }
}
