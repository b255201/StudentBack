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
    public class LessonOptController : Controller
    {
        private Repository<LessonOpt> repo = new Repository<LessonOpt>();
        // GET: LessonOpt
        public ActionResult Index()
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
                         select new LessonOpt
                         {
                             Id = Row.Id,
                             Seq=Row.Seq,
                             Description = Row.Description
                         };
            JQueryDataTableResponse<LessonOpt> jqDataTableRs = JQueryDataTableHelper<LessonOpt>.GetResponse(1, totalLen, totalLen, result.ToList());
            return Json(jqDataTableRs);
        }
        #endregion


        [HttpGet]
        public ActionResult Insert()
        {
            var q = repo.GetAll().ToList();
            var result = (from Row in q
                          select new LessonOpt
                          {
                              Id = Row.Id,
                              Description = Row.Description,
                          }).OrderByDescending(x => x.Id);
            var MaxId = 0;
            if (result.Count() != 0)
            {
                MaxId = int.Parse(result.First().Id.ToString());
            }
            int i = MaxId + 1;
            ViewBag.Seq = i;
            return View();
        }

        [HttpPost]
        public ActionResult Insert(FormCollection form)
        {
         
            if (form["Description"] == "")
            {
                ViewBag.ErrMessage = "請輸入課程名稱,請檢查";
                return View();
            }

            var q = repo.GetAll().ToList();
            var result = (from Row in q
                          select new LessonOpt
                          {
                              Id = Row.Id,
                              Description = Row.Description,
                          }).OrderByDescending(x => x.Id);
            var MaxId = 0;
            if (result.Count() != 0)
            {
                MaxId = int.Parse(result.First().Id.ToString());
            }
            int i = MaxId + 1;
            LessonOpt _LessonOpt = new LessonOpt();
            _LessonOpt.Id = i;
            _LessonOpt.Seq=form["Seq"];
            _LessonOpt.Description = form["Description"];
            repo.Create(_LessonOpt);
            return RedirectToAction("Index");
        }
   
        [HttpGet]
        public ActionResult Edit(string Id)
        {
            LessonOpt _LessonOpt = repo.GetByID(int.Parse(Id));
            ViewBag.Id = _LessonOpt.Id;
            ViewBag.Description = _LessonOpt.Description;
            ViewBag.Seq = _LessonOpt.Seq;
            return View(_LessonOpt);
        }
        [HttpPost]
        public ActionResult Edit(FormCollection form)
        {
            if (form["Description"] == "")
            {
                ViewBag.ErrMessage = "請輸入課程名稱,請檢查";
                return View();
            }
            LessonOpt _LessonOpt = new LessonOpt();
            _LessonOpt.Id =int.Parse(form["Id"]);
            _LessonOpt.Seq = form["Seq"];
            _LessonOpt.Description = form["Description"];
            repo.Update(_LessonOpt);
            return RedirectToAction("Index");
        }

        #region Delete
        [HttpPost]
        public ActionResult Delete(string Id)
        {
            try
            {
                LessonOpt _LessonOpt = repo.GetByID(int.Parse(Id));
                repo.Delete(_LessonOpt);
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