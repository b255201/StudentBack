using StudenBack.Models;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace StudentBack.Models
{
   
    public class UserAuth : Controller
    {
        public Repository<employee> repo = new Repository<employee>();
        public Repository<employeeCategory> repoe = new Repository<employeeCategory>();
        public StudentEntities db = new StudentEntities();
        //return -1 when not login, 0 when can't access, 1 when normal
        public string checkPermission(HttpSessionStateBase session, string ActionName, string ControllerName)
        {
            string permissionName = (ControllerName + ActionName).ToLower();

            if (session == null)
            {
                return "haventLogin";
            } 
            //如果沒login
            if (session["employeeId"] == null) return "haventLogin";
            int cateId = Convert.ToInt32(session["employeeCategoryId"]);
            var ecd =
                db.employeeCategoryDetails.SingleOrDefault(
                    x =>
                        x.employeeCategoryId == cateId &&
                        x.permission.permissionName == permissionName);
            if (ecd != null)
            {
                bool canAccess = ecd.canAccess;
                //如果沒權限
                if (!canAccess) return "denied";
                //如果有全縣
                return "approved";
            }
            return "error";
        }

        internal string checkPermission(object session, string v1, string v2)
        {
            throw new NotImplementedException();
        }
    }
}