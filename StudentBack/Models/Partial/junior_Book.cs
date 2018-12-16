using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace StudentBack.Models.Partial
{
    [MetadataType(typeof(junior_BookMetadata))]

    public partial class junior_Book
    {
        public class junior_BookMetadata
        {
            [DisplayName("編號")]
            public int Id { get; set; }
            public string Image { get; set; }
            [DisplayName("產品描述")]
            public string Description { get; set; }
            public string title { get; set; }
        }
    }

}