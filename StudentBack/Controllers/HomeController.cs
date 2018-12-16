using StudentBack.Attribute;
using StudentBack.Filter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StudentBack.Controllers
{
   
    [AuthenticateUser]
    public class HomeController : Controller
    {
      
        // GET: Home
        [AuthenticateUser]
        public ActionResult Index()
        {
            return View();
        }
    }
}