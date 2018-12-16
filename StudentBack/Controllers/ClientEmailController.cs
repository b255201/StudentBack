using StudentBack.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Text;
using StudenBack.Models;
using StudenBack.ViewModel;
using StudentBack.Filter;
using StudentBack.Attribute;

namespace StudentBack.Controllers
{
    [AuthenticateUser]
    public class ClientEmailController : Controller
    {
        Repository<EDM> EDMs = new Repository<EDM>();
        StudentEntities db = new StudentEntities();
        // GET: ClientEmail
        public ActionResult Index()
        {
            return View();
        }
        #region GetSearch
        [HttpPost]
        public ActionResult Search()
        {
            var q = db.EDMs.ToList();
            int totalLen = Convert.ToInt16(q.Count());
            var result = from Row in q
                         select new ContactViewModel
                         {                          
                             Email = Row.Email,
                         };
            JQueryDataTableResponse<ContactViewModel> jqDataTableRs = JQueryDataTableHelper<ContactViewModel>.GetResponse(1, totalLen, totalLen, result.ToList());
            return Json(jqDataTableRs);
        }
        #endregion
    }
}