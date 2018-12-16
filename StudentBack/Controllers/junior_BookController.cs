﻿using StudenBack.Models;
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
    public class junior_BookController : Controller
    {
        // GET: junior_Book
        private Repository<junior_Book> repo = new Repository<junior_Book>();
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
                         select new LessonViewModel
                         {
                             Id = Row.Id,
                             title=Row.title,
                             Description = Row.Description,
                             Image = Row.Image,
                         };
            JQueryDataTableResponse<LessonViewModel> jqDataTableRs = JQueryDataTableHelper<LessonViewModel>.GetResponse(1, totalLen, totalLen, result.ToList());
            return Json(jqDataTableRs);
        }
        #endregion


        [HttpGet]
        public ActionResult Insert()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Insert(FormCollection form, HttpPostedFileBase Image)
        {

            if (form["title"] == "")
            {
                ViewBag.ErrMessage = "請輸入標題,請檢查";
                return View();
            }
            if (Image == null)
            {
                ViewBag.ErrMessage = "請選擇圖片,請檢查";
                return View();
            }

            var q = repo.GetAll().ToList();
            var result = (from Row in q
                          select new LessonViewModel
                          {
                              Id = Row.Id,
                              title = Row.title,
                              Description = Row.Description,
                              Image = Row.Image,
                          }).OrderByDescending(x => x.Id);
            var MaxId = int.Parse(result.First().Id.ToString());
            int i = MaxId + 1;
            junior_Book _junior_Book = new junior_Book();
            if (Image != null)
            {
                //判斷圖片名稱是否重複
                var rptimg = (from Row in q
                              select new LessonViewModel
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

                string strPath = Request.PhysicalApplicationPath + @"Image\junior_Book\" + Image.FileName;
                Image.SaveAs(strPath);
                _junior_Book.Image = Image.FileName;
            }

            _junior_Book.Id = i;
            _junior_Book.title = form["title"];
            _junior_Book.Description = form["Description"];

            repo.Create(_junior_Book);
            return RedirectToAction("Index");
        }


        #region Delete
        [HttpPost]
        public ActionResult Delete(string Id)
        {
            try
            {
                junior_Book _junior_Book = repo.GetByID(int.Parse(Id));
                if (_junior_Book.Image != "")
                {
                    string strPath = string.Format("~/Image/junior_Book/{0}", _junior_Book.Image);
                    var fullPath = Request.MapPath(strPath);
                    System.IO.File.Delete(fullPath);
                }
                repo.Delete(_junior_Book);
                return Json(new { Status = "0", StatusDesc = "刪除成功" });
            }
            catch (Exception err)
            {

                return Json(new { Status = "2", StatusDesc = "刪除失敗,請洽管理人員" + err.Message });
            }

        }
        #endregion


        public ActionResult GetImageFile(string fileName)
        {
            return File("~/Image/junior_Book/" + fileName, "image/png");
        }
    }
}