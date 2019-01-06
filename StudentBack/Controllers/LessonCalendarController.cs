using StudenBack.Models;
using StudenBack.ViewModel;
using StudentBack.Attribute;
using StudentBack.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StudentBack.Controllers
{
    [AuthenticateUser]
    public class LessonCalendarController : Controller
    {
        private Repository<LessonCalendar> repo = new Repository<LessonCalendar>();
        // GET: LessonCalendar
        public ActionResult Index()
        {
            var q = repo.GetAll().OrderByDescending(c => c.Id);
            ViewBag.Data = q.ToList();
            return View();
        }
        public ActionResult Insert()
        {
            return View();
        }


        #region GetSearch
        [HttpPost]
        public ActionResult Search()
        {
            var q = repo.GetAll().ToList();
            int totalLen = Convert.ToInt16(q.Count());
            var result = from Row in q
                         select new LessonCalendar
                         {
                             Id = Row.Id,
                             Title = Row.Title,
                             Department = Row.Department,
                             Link = Row.Link,
                             Schedule = Row.Schedule,
                         };
            JQueryDataTableResponse<LessonCalendar> jqDataTableRs = JQueryDataTableHelper<LessonCalendar>.GetResponse(1, totalLen, totalLen, result.ToList());
            return Json(jqDataTableRs);
        }
        #endregion

        [HttpPost]
        public ActionResult Insert(FormCollection form)
        {
            LessonCalendar _LessonCalendar = new LessonCalendar();
            var q = repo.GetAll().ToList();
            var result = (from Row in q
                          select new LessonCalendar
                          {
                              Id = Row.Id,
                              Title = Row.Title
                          }).OrderByDescending(x => x.Id);
            var MaxId = 0;
            if (result.Count() != 0)
            {
                MaxId = int.Parse(result.First().Id.ToString());
            }
            int i = MaxId + 1;
            _LessonCalendar.Title = form["Title"];
            _LessonCalendar.Link = form["Link"];
            _LessonCalendar.Department = form["Department"];
            _LessonCalendar.Schedule = form["Time"] + "_" + form["Date"];
            _LessonCalendar.CreateTime = DateTime.Now;
            repo.Create(_LessonCalendar);
            return RedirectToAction("Insert");
        }

        #region Delete
        [HttpPost]
        public ActionResult Delete(string Id)
        {
            try
            {
                LessonCalendar _LessonCalendar = repo.GetByID(int.Parse(Id));          
                repo.Delete(_LessonCalendar);
                return Json(new { Status = "0", StatusDesc = "刪除成功" });
            }
            catch (Exception err)
            {

                return Json(new { Status = "2", StatusDesc = "刪除失敗,請洽管理人員" + err.Message });
            }
        }
        #endregion
    }
}