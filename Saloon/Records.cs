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
    
    public partial class Records
    {
        public int ID { get; set; }
        public Nullable<int> id_client { get; set; }
        public Nullable<int> id_employee { get; set; }
        public Nullable<int> id_day_of_week { get; set; }
        public string timestart { get; set; }
        public string timeend { get; set; }
        public Nullable<int> id_service { get; set; }
        public string date { get; set; }
    
        public virtual client client { get; set; }
        public virtual day_of_week day_of_week { get; set; }
        public virtual employee employee { get; set; }
        public virtual service service { get; set; }
    }
}
