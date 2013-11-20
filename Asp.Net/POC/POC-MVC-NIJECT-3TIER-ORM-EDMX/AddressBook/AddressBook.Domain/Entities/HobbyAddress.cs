using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AddressBook.Domain.Entities
{
    public partial class HobbyAddress
    {
        public int HobbyAddressID { get; set; }
        public int PersonAddressID { get; set; }
        public int HobbyID { get; set; }

        public virtual HobbyMaster HobbyMaster { get; set; }
        public virtual Person PersonAddress { get; set; }
    }    
    
}
