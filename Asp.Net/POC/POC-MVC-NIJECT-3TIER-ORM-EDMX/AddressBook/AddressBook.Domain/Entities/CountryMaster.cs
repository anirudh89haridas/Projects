using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AddressBook.Domain.Entities
{
    public partial class CountryMaster
    {
      
        public int CountryID { get; set; }
        public string CountryName { get; set; }

        public virtual IList<StateMaster> StateMasters { get; set; }
    }
    
}
