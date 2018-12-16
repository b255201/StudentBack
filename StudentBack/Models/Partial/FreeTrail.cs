using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StudentBack.Models.Models
{
    public partial class FreeTrail
    {
        public class FreeTrailsMetadata
        {
            public int SeqID { get; set; }
            public string Name { get; set; }
            public string SchoolName { get; set; }
            public string Email { get; set; }
            public string Phone { get; set; }
            public string LocalPhone { get; set; }
            public string Course { get; set; }
            public Nullable<System.DateTime> CreateTime { get; set; }
            
        }    
    }
}