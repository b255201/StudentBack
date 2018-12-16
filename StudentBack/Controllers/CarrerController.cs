using StudentBack.Attribute;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StudentBack.Controllers
{
    [AuthenticateUser]
    public class CarrerController : Controller
    {
        // GET: Carrer
        public ActionResult Index()
        {
            return View();
        }
        //not finesh
        [ValidateInput(false)]
        public ActionResult Insert()
        {
            return View();
        }
    }
}