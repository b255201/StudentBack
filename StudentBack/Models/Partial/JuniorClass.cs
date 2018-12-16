using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace StudentBack.Models.Partial
{
    [MetadataType(typeof(JuniorClassMetadata))]

    public partial class JuniorClass
    {
        public class JuniorClassMetadata
        {
            public int Id { get; set; }
            public string title { get; set; }
            public string Description { get; set; }
            public string Image { get; set; }
            public string Course { get; set; }
            public System.DateTime CreateTime { get; set; }
        }
    }

}