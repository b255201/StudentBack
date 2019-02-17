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
    public class JuniorClassController : Controller
    {
        private Repository<JuniorClass> repo = new Repository<JuniorClass>();
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
                          select new JuniorClass
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
            JuniorClass _JuniorClass = new JuniorClass();
            var ImageCount = 1;
            var img = "";
            if (Images != null)
            {
                foreach (var Image in Images)
                {
                    if(Image != null)
                    {

                        //判斷圖片名稱是否重複
                        var rptimg = (from Row in q
                                      select new LessonViewModel
                                      {
                                          Image = Row.Image
                                      });
                        if (rptimg != null)
                        {                  
                            foreach(var x in rptimg)
                            {
                                string[] ary = x.Image.Split(',');

                                foreach (string y in ary)
                                {
                                    if(y== Image.FileName)
                                    {
                                        ViewBag.ErrMessage = "已有圖片名稱：" + Image.FileName + "，請檢查";
                                        return View();
                                    }
                                }
                            }
                        }

                        string strPath = Request.PhysicalApplicationPath + @"Image\Junior_Lesson\" + Image.FileName;
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
                _JuniorClass.Image = img;
            }
            _JuniorClass.Id = i;
            _JuniorClass.title = form["title"];
            _JuniorClass.Description = form["Description"];
            _JuniorClass.Course = form["Course"];
            _JuniorClass.CreateTime = DateTime.Now;
            repo.Create(_JuniorClass);
            return RedirectToAction("Index");
        }
        #region Delete
        [HttpPost]
        public ActionResult Delete(string Id)
        {
            try
            {
                JuniorClass _JuniorClass = repo.GetByID(int.Parse(Id));
                foreach (var x in _JuniorClass.Image.Split(','))
                {
                    if (x != "")
                    {
                        string strPath = string.Format("~/Image/Junior_Lesson/{0}", x);
                        var fullPath = Request.MapPath(strPath);
                        System.IO.File.Delete(fullPath);
                    }           
                }
                repo.Delete(_JuniorClass);
                return Json(new { Status = "0", StatusDesc = "刪除成功" });
            }
            catch (Exception err)
            {

                return Json(new { Status = "2", StatusDesc = "刪除失敗,請洽管理人員" + err.Message });
            }

        }
        #endregion

        [HttpGet]
        public ActionResult Edit(string Id)
        {
            JuniorClass _JuniorClass = repo.GetByID(int.Parse(Id));
            ViewBag.Id = _JuniorClass.Id;
            ViewBag.title = _JuniorClass.title;
            ViewBag.Description = _JuniorClass.Description;
            ViewBag.InitImage = _JuniorClass.Image;
            ViewBag.Course = _JuniorClass.Course;
            return View();
        }

        [HttpPost]
        public ActionResult Edit(FormCollection form, IEnumerable<HttpPostedFileBase> Images)
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
                          select new ChildClass
                          {
                              Id = Row.Id,
                              title = Row.title,
                              Description = Row.Description,
                              Image = Row.Image,
                          }).OrderByDescending(x => x.Id);

            JuniorClass _JuniorClass = new JuniorClass();
            var ImageCount = 1;
            var img = "";
            var InitCount = 0;
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
                                          Image = Row.Image
                                      }).Where(x => x.Id != int.Parse(form["Id"]));
                        if (rptimg != null)
                        {
                            string[] initImagAry = form["InitImage"].Split(',');

                            foreach (var x in rptimg)
                            {
                                string[] ary = x.Image.Split(',');
                                foreach (string y in ary)
                                {
                                    foreach (var g in initImagAry)
                                    {
                                        if (g == y)
                                        {
                                        }
                                        else
                                        {
                                            if (y == Image.FileName)
                                            {
                                                ViewBag.ErrMessage = "已有圖片名稱：" + Image.FileName + "，請檢查";
                                                return View();
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        //先刪除圖片檔案
                        if (InitCount == 0)
                        {
                            foreach (var x in form["InitImage"].Split(','))
                            {
                                if (x != "")
                                {
                                    string strPath1 = string.Format("~/Image/Junior_Lesson/{0}", x);
                                    var fullPath = Request.MapPath(strPath1);
                                    System.IO.File.Delete(fullPath);
                                }
                            }
                            InitCount = 1;
                        }

                        string strPath = Request.PhysicalApplicationPath + @"Image\Junior_Lesson\" + Image.FileName;
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
                _JuniorClass.Image = img;
            }
            _JuniorClass.Id = int.Parse(form["Id"]);
            _JuniorClass.title = form["title"];
            _JuniorClass.Description = form["Description"];
            _JuniorClass.Course = form["Course"];
            _JuniorClass.CreateTime = DateTime.Now;
            repo.Delete(repo.GetByID(int.Parse(form["Id"])));
            repo.Create(_JuniorClass);

            return RedirectToAction("Index");
        }

    }
}