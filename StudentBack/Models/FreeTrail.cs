//------------------------------------------------------------------------------
// <auto-generated>
//     這個程式碼是由範本產生。
//
//     對這個檔案進行手動變更可能導致您的應用程式產生未預期的行為。
//     如果重新產生程式碼，將會覆寫對這個檔案的手動變更。
// </auto-generated>
//------------------------------------------------------------------------------

namespace StudentBack.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class FreeTrail
    {
        public int SeqID { get; set; }
        public string Name { get; set; }
        public string SchoolName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string LocalPhone { get; set; }
        public string Course { get; set; }
        public Nullable<System.DateTime> CreateTime { get; set; }
        public string Memo { get; set; }
    }
}