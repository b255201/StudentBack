using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace StudentBack.Models
{
    [MetadataType(typeof(employeeMeta))]
    public partial class employee
    {
        [DisplayName("No.")]
        public int No { get; set; }

        [DisplayName("權限等級")]
        public string employeeCategoryName { get; set; }

        public class employeeMeta
        {
            [DisplayName("員工Id")]
            public int employeeId { get; set; }
            [DisplayName("姓名")]
            public string employeeName { get; set; }
            [DisplayName("帳號")]
            public string employeeAccount { get; set; }
            [DisplayName("密碼")]
            [DataType(DataType.Password)]
            public byte[] employeePwd { get; set; }
            public byte[] employeeSalt { get; set; }
            [DisplayName("權限類別")]
            public int employeeCategoryId { get; set; }
            [DisplayName("到職日"), DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
            [DataType(DataType.Date)]
            public Nullable<System.DateTime> employeeOnBoardDate { get; set; }
            [DisplayName("離職日"), DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
            [DataType(DataType.Date)]
            public Nullable<System.DateTime> employeeLeaveDate { get; set; }
            [DisplayName("照片")]
            public string employeePhoto { get; set; }

            public Nullable<System.DateTime> createTime { get; set; }

            public Nullable<System.DateTime> modifyTime { get; set; }
        }

    }
}