using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using AddressBook.Domain.Entities;
using AddressBook.Infrastructure.Interfaces;

namespace AddressBook.Infrastructure.Data.Repositories
{
    public class MasterRepository:IMasterRepository
    {
       
        public List<CountryMaster> GetAllCountry()
        {
            using (var Context = new EDMX.AddressBookEntities())
            {
                List<CountryMaster> Countries = (from Country in Context.CountryMasters
                                                 select new CountryMaster { CountryID = Country.CountryID, CountryName = Country.CountryName }).ToList<CountryMaster>();
                
                return Countries;
            }
        }
        public List<HobbyMaster> GetAllHobby()
        {
            using (var Context = new EDMX.AddressBookEntities())
            {
                List<HobbyMaster> Hobbies = (from Hobby in Context.HobbyMasters
                                             select new HobbyMaster { HobbyID = Hobby.HobbyID, HobbyName = Hobby.HobbyName }).ToList<HobbyMaster>();

                return Hobbies;
            }
        }
        public List<LanguageMaster> GetAllLanguage()
        {
            using (var Context = new EDMX.AddressBookEntities())
            {
                List<LanguageMaster> Languages = (from Language in Context.LanguageMasters
                                                select new LanguageMaster { LanguageID = Language.LanguageID, LanguageName = Language.LanguageName }).ToList<LanguageMaster>();

                return Languages;
            }
        }
        public List<StateMaster> GetAllStateByCountryID(int CountryID)
        {
            using (var Context = new EDMX.AddressBookEntities())
            {
                List<StateMaster> States = (from State in Context.StateMasters
                                               where State.CountryID==CountryID
                                               select new StateMaster { StateID = State.StateID, StateName = State.StateName }).ToList<StateMaster>();

                return States;
            }
        }
    }
}
