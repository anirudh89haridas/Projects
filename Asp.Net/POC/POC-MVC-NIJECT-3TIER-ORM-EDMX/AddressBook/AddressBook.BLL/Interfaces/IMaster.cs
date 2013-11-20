using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AddressBook.Domain.Entities;

namespace AddressBook.BLL.Interfaces
{
    public interface IMaster
    {
        List<CountryMaster> GetAllCountry();
        List<HobbyMaster> GetAllHobby();
        List<LanguageMaster> GetAllLanguage();
        List<StateMaster> GetAllStateByCountryID(int CountryID);
    }
}
