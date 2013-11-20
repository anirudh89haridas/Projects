using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AddressBook.Domain.Entities
{
    public partial class Person
    {
     
        public int PersonID { get; set; }
        public int? PersonAddressID { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int StateID { get; set; }
        public long? PhoneNumber { get; set; }
        public string CompleteAddress { get; set; }
        public string PinCode { get; set; }
        public Nullable<System.DateTime> DateOfBirth { get; set; }
        public string Gender { get; set; }
        public string PhotoName { get; set; }
        public virtual StateMaster StateMaster { get; set; }

        public virtual IList<Permission> Permissions { get; set; }
        public virtual IList<HobbyAddress> HobbyAddresses { get; set; }
        public virtual IList<LanguageAddress> LanguageAddresses { get; set; }


    }

}
