using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace StudenBack.ViewModel
{
    public class AccounEmpViewModel
    {
        [DisplayFormat(DataFormatString = "{0:N0}")]
        public int Amount { get; set; }

        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]
        public DateTime Date { get; set; }
        public string Remark { get; set; }
    }
}