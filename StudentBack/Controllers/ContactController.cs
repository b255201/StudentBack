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
    public class ContactController : Controller
    {
        Repository<FreeTrail> FreeTrails = new Repository<FreeTrail>();
        StudentEntities db = new StudentEntities();
        // GET: Contact
      
        public ActionResult Index()
        {
            var q = db.FreeTrail.ToList();
            return View();
        }
        public ActionResult test()
        {    
            return View();
        }

        #region GetSearch
        [HttpPost]
        public ActionResult Search(string ddInS, string ddInE)
        {
          
            var q = db.FreeTrail.ToList();
            if (!string.IsNullOrEmpty(ddInS))
            {
                q = q.Where(x=>x.CreateTime >= DateTime.Parse(ddInS)).ToList();
            }
            if (!string.IsNullOrEmpty(ddInE))
            {
                q = q.Where(x => x.CreateTime <= DateTime.Parse(ddInE)).ToList();
            }
            int totalLen = Convert.ToInt16(q.Count());
            var result = from Row in q
                         select new ContactViewModel
                         {                       
                             Name = Row.Name,
                             SchoolName = Row.SchoolName,
                             Email = Row.Email,
                             Phone = Row.Phone,
                             LocalPhone = Row.LocalPhone,
                             Course = Row.Course,
                             Memo=Row.Memo,
                             Time = DBNull.Value.Equals(Row.CreateTime) ? "" :Common.lang.DateTimeUtil.ToYMD(Row.CreateTime)
                         };
            JQueryDataTableResponse<ContactViewModel> jqDataTableRs = JQueryDataTableHelper<ContactViewModel>.GetResponse(1, totalLen, totalLen, result.ToList());
            return Json(jqDataTableRs);
        }
        #endregion
        //public static string ToYMD(DateTime? dt)
        //{
        //    if (dt.HasValue)
        //        return dt.Value.ToString("yyyy/MM/dd");
        //    else
        //        return "";
        //}

    }


}