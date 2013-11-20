using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AddressBook.Domain.Entities
{
    public partial class LanguageMaster
    {
      
        public int LanguageID { get; set; }
        public string LanguageName { get; set; }

        public virtual IList<LanguageAddress> LanguageAddresses { get; set; }
    }
    
}
