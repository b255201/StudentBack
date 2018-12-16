using StudenBack.Models;
using StudentBack.Attribute;
using StudentBack.Models;
using StudentBack.Models.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StudentBack.Controllers
{
    [AuthenticateUser]
    public class VideoBackController : Controller
    {
        private Repository<Models.Video> repo = new Repository<Models.Video>();
        // GET: Video
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
                         select new Models.Video
                         {
                             Id = Row.Id,
                             Title = Row.Title,
                             Item=Row.Item
                         };
            JQueryDataTableResponse<Models.Video> jqDataTableRs = JQueryDataTableHelper<Models.Video>.GetResponse(1, totalLen, totalLen, result.ToList());
            return Json(jqDataTableRs);
        }
        #endregion

        [HttpGet]
        public ActionResult test()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Insert()
        {
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Insert(FormCollection form, IEnumerable<HttpPostedFileBase> Images)
        {
            if (form["title"] == "")
            {
                ViewBag.ErrMessage = "請輸入標題,請檢查";
                return View();
            }
            if (form["href"] == "")
            {
                ViewBag.ErrMessage = "請選擇課程,請檢查";
                return View();
            }
            var q = repo.GetAll().ToList();
            var result = (from Row in q
                          select new Models.Video
                          {
                              Id = Row.Id
                          }).OrderByDescending(x => x.Id);
            var MaxId = 0;
            if (result.Count() != 0)
            {
                MaxId = int.Parse(result.First().Id.ToString());
            }
            int i = MaxId + 1;
            Models.Video _Video = new Models.Video();
            _Video.Id = i;
            _Video.Title = form["title"];
            _Video.Description = form["Description"];
            _Video.Date = form["Date"];
            _Video.href= form["href"];
            _Video.CreateTime = DateTime.Now;
            _Video.Item = form["Item"];
            repo.Create(_Video);
            return RedirectToAction("Index");
        }
        #region Delete
        [HttpPost]
        public ActionResult Delete(string Id)
        {
            try
            {
                Models.Video __Video = repo.GetByID(int.Parse(Id));        
                repo.Delete(__Video);
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