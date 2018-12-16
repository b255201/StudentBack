using StudenBack.Models;
using StudenBack.ViewModel;
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
    public class LiuIndexController : Controller
    {
        private Repository<Activity_Message> Activity = new Repository<Activity_Message>();
        private Repository<Models.LastNew> LastNews = new Repository<Models.LastNew>();
        // GET: LiuIndex
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ActivityMessage_Index()
        {
            return View();
        }

        #region GetSearch
        [HttpPost]
        public ActionResult Search()
        {
            var q = Activity.GetAll().ToList();
            int totalLen = Convert.ToInt16(q.Count());
            var result = from Row in q
                         select new LessonViewModel
                         {
                             Id = Row.Id,
                             title = Row.title,
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
            var q = Activity.GetAll().ToList();
            var result = (from Row in q
                          select new LessonViewModel
                          {
                              Id = Row.Id,
                              title = Row.title,
                              Description = Row.Description,
                              Image = Row.Image,
                          }).OrderByDescending(x => x.Id);
            var MaxId = 0;

            if (form["title"] == "")
            {
                ViewBag.CountMessage = "請輸入標題,請檢查";
                return View();
            }
            if (Image == null)
            {
                ViewBag.CountMessage = "請選擇圖片,請檢查";
                return View();
            }

            if (result.Count() >= 6)
            {
                ViewBag.CountMessage = "最多只能六筆,請檢查";
                return View();
            }
            //判斷圖片名稱是否重複
            var rptimg = (from Row in q
                          select new LessonViewModel
                          {
                              Id = Row.Id,
                              title = Row.title,
                              Description = Row.Description,
                              Image = Row.Image,
                          }).Where(x => x.Image==Image.FileName);
            if(rptimg != null)
            {
                if (rptimg.Count()!=0)
                {
                    ViewBag.CountMessage = "已有圖片名稱："+ Image.FileName+"，請檢查";
                    return View();
                }
            }


            if (result.Count() != 0)
            {
                 MaxId = int.Parse(result.First().Id.ToString());
            }
                  
            int i = MaxId + 1;
            Activity_Message _Activity_Message = new Activity_Message();
            if (Image != null)
            {
                string strPath = Request.PhysicalApplicationPath + @"Image\LiuIndex\" + Image.FileName;
                Image.SaveAs(strPath);
                _Activity_Message.Image = Image.FileName;
            }
            _Activity_Message.Id = i;
            _Activity_Message.title = form["title"];
            _Activity_Message.Description = form["Description"];
            Activity.Create(_Activity_Message);
            return RedirectToAction("ActivityMessage_Index");
        }

        #region Delete
        [HttpPost]
        public ActionResult Delete(string Id)
        {
            try
            {
                Activity_Message _Activity_Message = Activity.GetByID(int.Parse(Id));

                if (_Activity_Message.Image != "")
                {
                    string strPath = string.Format("~/Image/LiuIndex/{0}", _Activity_Message.Image);
                    var fullPath = Request.MapPath(strPath);
                    System.IO.File.Delete(fullPath);
                }           
                Activity.Delete(_Activity_Message);
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
            return File("~/Image/LiuIndex/" + fileName, "image/png");
        }
        public ActionResult LastNew()
        {
            return View();
        }
 
        #region LastNewSearch
        [HttpPost]
        public ActionResult LastNewSearch()
        {
            var q = LastNews.GetAll().ToList();
            int totalLen = Convert.ToInt16(q.Count());
            var result = from Row in q
                         select new LessonViewModel
                         {
                             Id = Row.Id,
                             title = Row.title,
                             Description = Row.Description,
                         };
            JQueryDataTableResponse<LessonViewModel> jqDataTableRs = JQueryDataTableHelper<LessonViewModel>.GetResponse(1, totalLen, totalLen, result.ToList());
            return Json(jqDataTableRs);
        }
        #endregion


        [HttpGet]
        public ActionResult InsertLastNew()
        {
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult InsertLastNew(FormCollection form)
        {
            var q = LastNews.GetAll().ToList();
            var result = (from Row in q
                          select new LessonViewModel
                          {
                              Id = Row.Id,
                              title = Row.title,
                              Description = Row.Description,
                          }).OrderByDescending(x => x.Id);
            var MaxId = 0;

            if (form["title"] == "")
            {
                ViewBag.CountMessage = "請輸入標題,請檢查";
                return View();
            }
        
            if (result.Count() != 0)
            {
                MaxId = int.Parse(result.First().Id.ToString());
            }

            int i = MaxId + 1;
            Models.LastNew _LastNew = new Models.LastNew();

            _LastNew.Id = i;
            _LastNew.title = form["title"];
            _LastNew.Description = form["Description"];
            _LastNew.CreateTime = DateTime.Now;
            LastNews.Create(_LastNew);
            return RedirectToAction("LastNew");
        }

        #region Delete
        [HttpPost]
        public ActionResult LastDelete(string Id)
        {
            try
            {
                Models.LastNew _LastNew = LastNews.GetByID(int.Parse(Id));
                LastNews.Delete(_LastNew);
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