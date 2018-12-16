using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StudentBack.Models.Models
{
    public partial class Video
    {
        public class VideoMetadata
        {
            public int Id { get; set; }
            public string Title { get; set; }
            public string Description { get; set; }
            public string Date { get; set; }
            public string href { get; set; }
            public System.DateTime CreateTime { get; set; }
            public string Item { get; set; }

        }    
    }
}