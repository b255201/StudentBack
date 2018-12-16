using NLog;
using StudentBack.Attribute;
using StudentBack.Filter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StudentBack.App_Start
{
    public class FilterConfig
    {
        private static Logger _logger = LogManager.GetCurrentClassLogger();

        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
          //  _logger.Debug("Add SSOAuthenticationFilter");
            // filters.Add(new SSOAuthenticationFilter());
            filters.Add(new PermissionFilter());

        }
    }
}