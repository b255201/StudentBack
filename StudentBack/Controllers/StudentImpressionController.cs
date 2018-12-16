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
    public class StudentImpressionController : Controller
    {
        private Repository<Models.StudentImpression> repo = new Repository<Models.StudentImpression>();
        // GET: ScholarShip
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
                         select new Models.StudentImpression
                         {
                             Id = Row.Id,
                             Title = Row.Title,
                             Image = Row.Image
                         };
            JQueryDataTableResponse<Models.StudentImpression> jqDataTableRs = JQueryDataTableHelper<Models.StudentImpression>.GetResponse(1, totalLen, totalLen, result.ToList());
            return Json(jqDataTableRs);
        }
        #endregion

        public ActionResult Insert()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Insert(FormCollection form, HttpPostedFileBase Image)
        {
            if (form["Title"] == "")
            {
                ViewBag.ErrMessage = "請輸入標題,請檢查";
                return View();
            }
            if (form["Description"] == "")
            {
                ViewBag.ErrMessage = "請選擇課程,請檢查";
                return View();
            }
            var q = repo.GetAll().ToList();
            var result = (from Row in q
                          select new Models.StudentImpression
                          {
                              Id = Row.Id
                          }).OrderByDescending(x => x.Id);
            var MaxId = 0;
            if (result.Count() != 0)
            {
                MaxId = int.Parse(result.First().Id.ToString());
            }
            int i = MaxId + 1;
            Models.StudentImpression _StudentImpression = new Models.StudentImpression();
            _StudentImpression.Id = i;
            _StudentImpression.Title = form["Title"];
            _StudentImpression.Description = form["Description"];
            _StudentImpression.Date = form["Date"];
            if (Image != null)
            {
                //判斷圖片名稱是否重複
                var rptimg = (from Row in q
                              select new Models.ScholarShip
                              {
                                  Image = Row.Image
                              }).Where(x => x.Image == Image.FileName);
                if (rptimg != null)
                {
                    if (rptimg.Count() != 0)
                    {
                        ViewBag.ErrMessage = "已有圖片名稱：" + Image.FileName + "，請檢查";
                        return View();
                    }
                }
                string strPath = Request.PhysicalApplicationPath + @"Image\StudentImpression\" + Image.FileName;
                Image.SaveAs(strPath);
                _StudentImpression.Image = Image.FileName;
            }
            else
            {
                ViewBag.ErrMessage = "請上傳圖片,請檢查";
                return View();
            }
            _StudentImpression.CreateTime = DateTime.Now;
            repo.Create(_StudentImpression);
            return RedirectToAction("Index");
        }
        #region Delete
        [HttpPost]
        public ActionResult Delete(string Id)
        {
            try
            {
                Models.StudentImpression _StudentImpression = repo.GetByID(int.Parse(Id));

                if (_StudentImpression.Image != "")
                {
                    string strPath = string.Format("~/Image/StudentImpression/{0}", _StudentImpression.Image);
                    var fullPath = Request.MapPath(strPath);
                    System.IO.File.Delete(fullPath);
                }


                repo.Delete(_StudentImpression);
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