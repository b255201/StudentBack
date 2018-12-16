using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StudentBack.Models.Models
{
    public partial class LastNew
    {
        public class LastNewMetadata
        {
            public int Id { get; set; }
            public string title { get; set; }
            public string Description { get; set; }
            public System.DateTime CreateTime { get; set; }

        }    
    }
}