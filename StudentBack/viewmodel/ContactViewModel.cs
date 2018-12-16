using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace StudenBack.ViewModel
{
    public class ContactViewModel
    {
        public int SeqID { get; set; }
        public string Name { get; set; }
        public string SchoolName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string LocalPhone { get; set; }
        public string Course { get; set; }
        public Nullable<System.DateTime> CreateTime { get; set; }
        public string Time { get; set; }
    }
}