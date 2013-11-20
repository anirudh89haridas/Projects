using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AddressBook.Domain.Entities
{
    public partial class StateMaster
    {
       
    
        public int StateID { get; set; }
        public int CountryID { get; set; }
        public string StateName { get; set; }

        public virtual IList<Person> Addresses { get; set; }
        public virtual CountryMaster CountryMaster { get; set; }
    }
    
}
