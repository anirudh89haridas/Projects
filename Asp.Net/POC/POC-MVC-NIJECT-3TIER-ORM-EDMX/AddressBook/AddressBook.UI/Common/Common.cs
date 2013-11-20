using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AddressBook.ViewModel;

using AddressBook.BLL.Interfaces;
using AddressBook.Domain.Entities;

namespace AddressBook.Common
{
    public class Common
    {
        private readonly IContact _Contact;
        private readonly IMaster _Master;
        public Common(IContact Contact, IMaster Master)
        {
            this._Contact = Contact;
            this._Master = Master;
          
        }
        public AddContact GetAllDefaultValues()
        {


            List<SelectListItem> Countries = new List<SelectListItem>();

            foreach (CountryMaster Country in _Master.GetAllCountry())
            {
                SelectListItem ListItem = new SelectListItem();
                ListItem.Value = Convert.ToString(Country.CountryID);
                ListItem.Text = Country.CountryName;
                Countries.Add(ListItem);
            }

            List<SelectListItem> Languages = new List<SelectListItem>();
            foreach (LanguageMaster Language in _Master.GetAllLanguage())
            {
                SelectListItem ListItem = new SelectListItem();
                ListItem.Value = Convert.ToString(Language.LanguageID);
                ListItem.Text = Language.LanguageName;
                Languages.Add(ListItem);
            }

            List<SelectListItem> Hobbies = new List<SelectListItem>();
            foreach (HobbyMaster Hobby in _Master.GetAllHobby())
            {
                SelectListItem ListItem = new SelectListItem();
                ListItem.Value = Convert.ToString(Hobby.HobbyID);
                ListItem.Text = Hobby.HobbyName;
                Hobbies.Add(ListItem);
            }

            AddContact Person = new AddContact { Countries = Countries, Languages = Languages, Hobbies = Hobbies, States = GetAllStateByCountryID(0) };

            return Person;
        }

        public List<SelectListItem> GetAllStateByCountryID(int CountryID)
        {

            List<SelectListItem> States = new List<SelectListItem>();
            foreach (StateMaster State in _Master.GetAllStateByCountryID(CountryID))
            {
                SelectListItem ListItem = new SelectListItem();
                ListItem.Value = Convert.ToString(State.StateID);
                ListItem.Text = State.StateName;
                States.Add(ListItem);
            }

            return States;
        }

    }
}