using StudenBack.Models;
using StudenBack.ViewModel;
using StudentBack.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StudentBack.Controllers
{
    public class DialogController : Controller
    {
        private Repository<employee> repo = new Repository<employee>();
        #region emp, 員工資料
        /// <summary>
        /// 員工資料對話框
        /// </summary>
        /// <returns></returns>
        public ActionResult EmpInfo()
        {
            return PartialView("EmpInfoDialogPartial");
        }

        /// <summary>
        /// 員工資料對話框
        /// </summary>
        /// <returns></returns>
        public ActionResult EmpInfoPaging(FormCollection form)
        {
            JQueryDataTableRequest jqDataTableRq = JQueryDataTableHelper<EmployeeViewModel>.GetRequest(Request);
            string cdBr = form["cdBr"];
            string naBr = form["naBr"];
            var emps = repo.GetAll().ToList();
            var result = from Row in emps
                         select new EmployeeViewModel
                         {
                             employeeName = Row.employeeName,
                             employeeAccount = Row.employeeAccount
                         };

            int totalLen = Convert.ToInt16(emps.Count());
            JQueryDataTableResponse<EmployeeViewModel> jqDataTableRs = JQueryDataTableHelper<EmployeeViewModel>.GetResponse(jqDataTableRq.draw, totalLen, totalLen, result.ToList());

            return Json(jqDataTableRs);
        }
        #endregion
    }
}