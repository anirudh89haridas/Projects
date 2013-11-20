using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using AddressBook.BLL.Interfaces;
using AddressBook.Domain.Entities;
using AddressBook.Infrastructure.Interfaces;

namespace AddressBook.BLL
{
    public class Master : IMaster
    {
        private IMasterRepository _MasterRepository;

        public Master(IMasterRepository MasterRepository)
        {
            _MasterRepository = MasterRepository;
        }

        public List<CountryMaster> GetAllCountry()
        {

            List<CountryMaster> Countries = _MasterRepository.GetAllCountry();
            return Countries;

        }
        public List<HobbyMaster> GetAllHobby()
        {

            List<HobbyMaster> Hobbies = _MasterRepository.GetAllHobby();
            return Hobbies;

        }
        public List<LanguageMaster> GetAllLanguage()
        {

            List<LanguageMaster> Languages = _MasterRepository.GetAllLanguage();
            return Languages;

        }
        public List<StateMaster> GetAllStateByCountryID(int CountryID)
        {

            List<StateMaster> States = _MasterRepository.GetAllStateByCountryID(CountryID);
            return States;

        }
    }
}
