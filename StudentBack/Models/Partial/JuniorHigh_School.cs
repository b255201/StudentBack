using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace StudentBack.Models.Partial
{
    [MetadataType(typeof(JuniorHigh_SchoolMetadata))]

    public partial class JuniorHigh_School
    {
        public class JuniorHigh_SchoolMetadata
        {
            [DisplayName("編號")]
            public int Id { get; set; }
            public string Image { get; set; }
            [DisplayName("產品描述")]
            [DataType(DataType.MultilineText)]
            public string Description { get; set; }
        }
    }

}