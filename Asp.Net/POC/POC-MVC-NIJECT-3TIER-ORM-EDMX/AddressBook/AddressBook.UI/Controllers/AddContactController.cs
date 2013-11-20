using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AddressBook.ViewModel;
using AddressBook.Domain.Entities;

using AddressBook.BLL.Interfaces;
using AddressBook.Common;

using AddressBook.DAL;

namespace AddressBook.Controllers
{

    public class AddContactController : Controller
    {
        private readonly IContact _Contact;
        private readonly IMaster _Master;
        private HttpContextBase Context { get; set; }
        private Common.Common Defaults;

        public AddContactController(IContact Contact, IMaster Master, HttpContextBase context)
        {
            this._Contact = Contact;
            this._Master = Master;
            this.Context = context;
            Defaults = new Common.Common(Contact, Master);
    
        }
        
        // GET: /AddContact/

        public ActionResult Index()
        {
            DAL.DAL k = new DAL.DAL();
            DAL.LINQ_TO_SQL.AddressBookDataContext oo = new DAL.LINQ_TO_SQL.AddressBookDataContext();
         
            var tt = from pp in oo.CountryMasters
                     select pp;
         
            
           
            var i=k.UserIsValid(1);

            return View(Defaults.GetAllDefaultValues());
        }
        [HttpPost]
        public ActionResult Index(AddContact Person)
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
                var status = _Contact.InsertContact(P1);
                return RedirectToAction("Index", "ContactDetails");
                //TempData["Person"] = Person; 
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
