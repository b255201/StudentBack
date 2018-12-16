using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using StudenBack.Models;
using StudenBack.ViewModel;
using StudentBack.Attribute;
using StudentBack.Models;

namespace StudentBack.Controllers
{
    [AuthenticateUser]
    public class EmployeeController : Controller
    {
        private Repository<employee> repo = new Repository<employee>();
        private Repository<employeeCategory> repoc = new Repository<employeeCategory>();
        private UserAuth ua = new UserAuth();
     
        private StudentEntities db = new StudentEntities();
        // GET: Employee

        public ActionResult Index()
        {        
            return View();
        }
        [HttpPost]
        public ActionResult Search()
        {
            var emps = repo.GetAll().ToList();
            int totalLen = Convert.ToInt16(emps.Count());
            var result = from Row in emps
                         select new EmployeeViewModel
                         {
                             employeeName = Row.employeeName,
                             employeeAccount = Row.employeeAccount
                         };

            JQueryDataTableResponse<EmployeeViewModel> jqDataTableRs = JQueryDataTableHelper<EmployeeViewModel>.GetResponse(1, totalLen, totalLen, result.ToList());
            return Json(jqDataTableRs);
        }

        [HttpGet]
        public ActionResult Insert()
        {
            ViewBag.datas = repoc.GetAll();
            return View();
        }

        [HttpPost]
        public ActionResult Insert(FormCollection form)
        {
            string permissionResult = ua.checkPermission(Session, "Insert", "Employee");
            string employeeName =form["employeeName"];
            string employeeAccount = form["employeeAccount"];
            string pwd =form["employeePwd"];        
            string pwdreconfirm = form["pwdreconfirm"];
            if (employeeName.Trim()=="")
            {
                return Json(new { Status = "1", Message = "請輸入姓名，請檢查" });
            }
            if (employeeAccount.Trim() == "")
            {
                return Json(new { Status = "1", Message = "請輸入帳號，請檢查" });
            }
            if (pwd.Trim() == "" || pwdreconfirm.Trim() == "")
            {
                return Json(new { Status = "1", Message = "請輸入密碼，請檢查" });
            }
            if (pwd!= pwdreconfirm)
            {
                return Json(new { Status = "1", Message = "密碼驗證錯誤，請檢查" });
            }
        
             var q=db.employee.ToList();
            var count= q.Where(x => x.employeeAccount == employeeAccount).Count();
            if (count >= 1)
            {
                return Json(new { Status = "1", Message = "此帳號已有人使用，請檢查" });
            }
            switch (permissionResult)
            {
                case "HaventLogin":
                    TempData["PageAfterLogin"] = Request.Path;
                    return RedirectToAction("Index", "Login");

                case "approved":
                    ViewBag.now = string.Format("{0:yyyy-MM-dd}", DateTime.Now);
                    //parse pwd
                    employee e = new employee();
                    var result = ee.HashPassword(pwd);
                    e.employeeId = 2028;
                    e.employeeName = employeeName;
                    e.employeeAccount = employeeAccount;
                    e.employeePwd = result.HashedPwd;
                    e.employeeSalt = result.Salt;
                    e.employeeCategoryId = 0;
                    e.employeeOnBoardDate = DateTime.Now;
                    e.createTime = DateTime.Now;
                    repo.Create(e);
                    return Json(new { Status = "0" });           
                case "denied":
                    return Json(new { Status = "1", Message = "權限不足" });
                default:
                    return Json(new { Status = "0" });
            }

            //  string permissionResult = ua.checkPermission(Session, "Insert", "Employee");
            //switch (permissionResult)
            //{
            //    case "HaventLogin":
            //        TempData["PageAfterLogin"] = Request.Path;
            //        return RedirectToAction("Index", "Login");

            //    case "approved":
            //        ViewBag.now = string.Format("{0:yyyy-MM-dd}", DateTime.Now);
            //        //parse pwd
            //        var result = ee.HashPassword(pwd);
            //        e.employeePwd = result.HashedPwd;
            //        e.employeeSalt = result.Salt;

            //        repo.Create(e);

            //        var empscount = repo.GetAll().ToList().Count();
            //        int lastpage = empscount % 5 != 0 ? (empscount / 5) + 1 : (empscount / 5);
            //        //倒到最後一頁
            //        return RedirectToAction("Index", "Employee", new { page = lastpage });

            //    case "denied":
            //        return Content("權限不足");

            //    default:
            //        return RedirectToAction("Index", "Home");
        }
    }

}
