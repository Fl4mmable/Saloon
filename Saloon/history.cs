//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Saloon
{
    using System;
    using System.Collections.Generic;
    
    public partial class history
    {
        public int id { get; set; }
        public Nullable<System.DateTime> date_service { get; set; }
        public Nullable<int> status_id { get; set; }
        public Nullable<int> service_list_id { get; set; }
        public Nullable<int> client_id { get; set; }
        public Nullable<System.TimeSpan> time { get; set; }
    
        public virtual client client { get; set; }
        public virtual service_list service_list { get; set; }
        public virtual status status { get; set; }
    }
}
