using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AddressBook.Domain.Entities
{
    public partial class Role
    {
       
        public int RoleID { get; set; }
        public string RoleName { get; set; }

        public virtual IList<Permission> Permissions { get; set; }
    }
    
}
