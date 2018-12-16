using StudenBack.Models;
using StudenBack.ViewModel;
using StudentBack.Filter;
using StudentBack.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StudentBack.Controllers
{

    [AllowAnonymous]
    public class LoginController : Controller
    {
        Repository<employee> repo = new Repository<employee>();
        [AllowAnonymous]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(LoginViewModel emp)
        {
            if (ModelState.IsValid)
            {
                var loginEmp = repo.CheckAccPwd(emp.Account, emp.Password);
                if (loginEmp == null)
                {
                    ViewBag.WrongLogin = "帳號密碼有誤，請重新輸入";
                    return View(emp);
                }
                else
                {
                    //send sessionid cookie to user
                    Response.Cookies.Add(new HttpCookie("JSESSIONID", HttpContext.Session.SessionID) { HttpOnly = true });
                    //set session key value pair
                    Session["employeeId"] = loginEmp.employeeId;
                    Session["employeeCategoryId"] = loginEmp.employeeCategoryId;

                    //返回登入前頁面
                    if (TempData["PageAfterLogin"] != null)
                    {
                        return Redirect(TempData["PageAfterLogin"].ToString());
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
            }
            return View(emp);
        }


        public void Loginn()
        {
            //send sessionid cookie to user
            Response.Cookies.Add(new HttpCookie("JSESSIONID", HttpContext.Session.SessionID) { HttpOnly = true });
            //set session key value pair
            Session["employeeId"] = 2028;

            console.write(Session.SessionID);
            console.write(Session["employeeId"].ToString());
        }

        public ActionResult Logout()
        {
            //登出
            Session.Abandon();
            Response.Cookies.Add(new HttpCookie("JSESSIONID", "") { Expires = DateTime.Now.AddYears(-1) });

            return RedirectToAction("Index", "Login");
        }

        public void WhoIsLogin()
        {
            console.write(Session.SessionID);
            if (Session["employeeId"] != null)
            {
                console.write(Session["employeeId"].ToString());
            }
            ViewBag.PreviousUrl = HttpContext.Request.UrlReferrer;
            console.write(ViewBag.PreviousUrl.ToString());
        }
    }
}