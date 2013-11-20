using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AddressBook.ViewModel;

using AddressBook.BLL.Interfaces;
using AddressBook.Domain.Entities;

namespace AddressBook.Controllers
{
    public class EditContactController : Controller
    {
        private readonly IContact _Contact;
        private readonly IMaster _Master;
        private Common.Common Defaults;
     
        public EditContactController(IContact Contact, IMaster Master)
        {
            this._Contact = Contact;
            this._Master = Master;
            Defaults = new Common.Common(Contact, Master);
        }
        //
        // GET: /EditContact/

        public ActionResult Index(int ID)
        {
            
            AddContact P1 = new AddContact();
            var C = _Contact.GetContactByID(ID);

            P1.UserName = C.UserName;
            P1.Password = C.Password;
            P1.FirstName = C.FirstName;
            P1.LastName = C.LastName;
            P1.Gender = C.Gender;
            P1.DateOfBirth = C.DateOfBirth;
            P1.ContactNumber = C.PhoneNumber;
            P1.CompleteAddress = C.CompleteAddress;
            P1.PinCode = C.PinCode;

            P1.SelectedCountry = C.StateMaster.CountryMaster.CountryID;
            P1.SelectedState = C.StateMaster.StateID;

            P1.SelectedLanguages = new int[C.LanguageAddresses.Count];

            for (int i = 0; i < C.LanguageAddresses.Count; i++)
            {
                P1.SelectedLanguages[i] = C.LanguageAddresses[i].LanguageMaster.LanguageID;
            }


            P1.States = Defaults.GetAllStateByCountryID(C.StateMaster.StateID);
            P1.Countries = Defaults.GetAllDefaultValues().Countries;
            P1.Languages = Defaults.GetAllDefaultValues().Languages;
            P1.Hobbies = Defaults.GetAllDefaultValues().Hobbies;
            return View(P1);
        }
        [HttpPost]
        public ActionResult Index(AddContact Person,int ID)
        {
            Person.States = Defaults.GetAllStateByCountryID(Person.SelectedCountry);
            Person.Countries = Defaults.GetAllDefaultValues().Countries;
            Person.Languages = Defaults.GetAllDefaultValues().Languages;
            Person.Hobbies = Defaults.GetAllDefaultValues().Hobbies;

            if (!ModelState.IsValid)
            {
                return View(Person);
            }
            else
            {

                Person P1 = new Person();

                P1.PersonID = ID;
                P1.UserName = Person.UserName;
                P1.Password = Person.Password;
                P1.FirstName = Person.FirstName;
                P1.LastName = Person.LastName;
                P1.Gender = Person.Gender;
                P1.DateOfBirth = Person.DateOfBirth;
                P1.PhoneNumber = Person.ContactNumber;
                P1.CompleteAddress = Person.CompleteAddress;
                P1.PinCode = Person.PinCode;
                P1.StateID = Person.SelectedState;

                List<LanguageMaster> LM = new List<LanguageMaster>();
                foreach (int SL in Person.SelectedLanguages)
                {
                    LanguageMaster LM1 = new LanguageMaster();
                    LM1.LanguageID = SL;
                    LM.Add(LM1);
                }

                List<LanguageAddress> LA = new List<LanguageAddress>();
                foreach (LanguageMaster LM1 in LM)
                {
                    LanguageAddress LA1 = new LanguageAddress();
                    LA1.LanguageID = LM1.LanguageID;
                    LA.Add(LA1);
                }
                P1.LanguageAddresses = LA;



                var status = _Contact.UpdateContact(P1);
                return RedirectToAction("Index", "ContactDetails");
            }
        }
        [HttpGet]
        public JsonResult GetAllState(int ID)
        {
            var States = Defaults.GetAllStateByCountryID(ID);
            return Json(States, JsonRequestBehavior.AllowGet);
        }
       
       

    }
}
