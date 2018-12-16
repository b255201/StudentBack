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
    public class HighClassController : Controller
    {
        private Repository<HighClass> repo = new Repository<HighClass>();
        // GET: HighClass
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
                         select new CourseViewModel
                         {
                             Id = Row.Id,
                             title = Row.title,
                             Description = Row.Description,
                             Image = Row.Image,
                             Course = Row.Course
                         };
            JQueryDataTableResponse<CourseViewModel> jqDataTableRs = JQueryDataTableHelper<CourseViewModel>.GetResponse(1, totalLen, totalLen, result.ToList());
            return Json(jqDataTableRs);
        }
        #endregion


        [HttpGet]
        public ActionResult Insert()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Insert(FormCollection form, IEnumerable<HttpPostedFileBase> Images)
        {
            if (form["title"] == "")
            {
                ViewBag.ErrMessage = "請輸入標題,請檢查";
                return View();
            }
            if (form["Course"] == "")
            {
                ViewBag.ErrMessage = "請選擇課程,請檢查";
                return View();
            }

            var q = repo.GetAll().ToList();
            var result = (from Row in q
                          select new HighClass
                          {
                              Id = Row.Id,
                              title = Row.title,
                              Description = Row.Description,
                              Image = Row.Image,
                          }).OrderByDescending(x => x.Id);
            var MaxId = 0;
            if (result.Count() != 0)
            {
                MaxId = int.Parse(result.First().Id.ToString());
            }
            int i = MaxId + 1;
            HighClass _HighClass = new HighClass();
            var ImageCount = 1;
            var img = "";
            if (Images != null)
            {
                foreach (var Image in Images)
                {
                    if (Image != null)
                    {
                        //判斷圖片名稱是否重複
                        var rptimg = (from Row in q
                                      select new LessonViewModel
                                      {
                                          Id = Row.Id,
                                          title = Row.title,
                                          Description = Row.Description,
                                          Image = Row.Image,
                                      }).Where(x => x.Image == Image.FileName);
                        if (rptimg != null)
                        {
                            if (rptimg.Count() != 0)
                            {
                                ViewBag.ErrMessage = "已有圖片名稱：" + Image.FileName + "，請檢查";
                                return View();
                            }
                        }

                        string strPath = Request.PhysicalApplicationPath + @"Image\High_Lesson\" + Image.FileName;
                        Image.SaveAs(strPath);
                        if (ImageCount == 1)
                        {
                            img = Image.FileName;
                        }
                        else
                        {
                            img += "," + Image.FileName;
                        }
                        ImageCount++;
                    }
                }
                _HighClass.Image = img;
            }
            _HighClass.Id = i;
            _HighClass.title = form["title"];
            _HighClass.Description = form["Description"];
            _HighClass.Course = form["Course"];
            _HighClass.CreateTime = DateTime.Now;
            repo.Create(_HighClass);
            return RedirectToAction("Index");
        }
        #region Delete
        [HttpPost]
        public ActionResult Delete(string Id)
        {
            try
            {
                HighClass _HighClass = repo.GetByID(int.Parse(Id));
                foreach (var x in _HighClass.Image.Split(','))
                {
                    if (x != "")
                    {
                        string strPath = string.Format("~/Image/High_Lesson/{0}", x);
                        var fullPath = Request.MapPath(strPath);
                        System.IO.File.Delete(fullPath);
                    }
                }
                repo.Delete(_HighClass);
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