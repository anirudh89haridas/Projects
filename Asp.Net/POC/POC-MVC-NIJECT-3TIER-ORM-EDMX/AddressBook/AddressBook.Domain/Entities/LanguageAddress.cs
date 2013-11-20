using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AddressBook.Domain.Entities
{
    public partial class LanguageAddress
    {
        public int LanguageAddressID { get; set; }
        public int PersonAddressID { get; set; }
        public int LanguageID { get; set; }

        public virtual LanguageMaster LanguageMaster { get; set; }
        public virtual Person PersonAddress { get; set; }
    }
}
