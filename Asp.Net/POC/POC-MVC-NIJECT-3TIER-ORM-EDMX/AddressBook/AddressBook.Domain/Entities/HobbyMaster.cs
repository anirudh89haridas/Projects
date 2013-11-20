using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AddressBook.Domain.Entities
{
    public partial class HobbyMaster
    {
      
    
        public int HobbyID { get; set; }
        public string HobbyName { get; set; }

        public virtual IList<HobbyAddress> HobbyAddresses { get; set; }
    }
    
}
