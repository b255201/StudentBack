using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Filters;
using System.Web.Routing;

namespace StudentBack.Attribute
{
    public class PermissionFilter : AuthorizeAttribute
    {
        private const string LOGIN_URL = "~/Login/Index";
        public override void OnAuthorization(AuthorizationContext filterContext)
        {

            HttpRequestBase request = filterContext.HttpContext.Request;
            HttpResponseBase response = filterContext.HttpContext.Response;
            var rd = System.Web.HttpContext.Current.Request.RequestContext.RouteData;
            string currentAction = rd.GetRequiredString("action");
            string currentController = rd.GetRequiredString("controller");
            var urlHelper = new UrlHelper(filterContext.RequestContext);
            var user = Convert.ToString(filterContext.HttpContext.Session["employeeId"]);
            base.OnAuthorization(filterContext);
            if (user.Trim() != "")
            {
                filterContext.Result = new RedirectResult(LOGIN_URL);
            }
            else
            {
                //  string url = "~/" + currentController + "/" + currentAction;
                //filterContext.Result = new RedirectResult(url);
                // filterContext.Result = new RedirectResult(LOGIN_URL);
                //filterContext.Result = new HttpUnauthorizedResult();

                filterContext.Result = new RedirectResult(LOGIN_URL);

            }


            //if (!filterContext.Principal.Identity.IsAuthenticated)
            //    filterContext.Result = new RedirectResult("Login/Index");
        }

        public void OnAuthenticationChallenge(AuthenticationChallengeContext filterContext)
        {
            //if (filterContext.HttpContext.Session["employeeId"]==null)
            //    filterContext.Result = new RedirectResult("Login/Index");

        }

        //public void OnAuthenticationChallenge(AuthenticationChallengeContext filterContext)
        //{
        //    throw new NotImplementedException();
        //}
    }
}