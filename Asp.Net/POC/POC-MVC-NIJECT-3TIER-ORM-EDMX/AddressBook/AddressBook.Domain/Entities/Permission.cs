using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AddressBook.Domain.Entities
{
    public partial class Permission
    {
        public int PermissionID { get; set; }
        public int RoleID { get; set; }
        public int PersonID { get; set; }
    
        public virtual Person Person { get; set; }
        public virtual Role Role { get; set; }
    }
    
}
