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
    public class ContactDetailsController : Controller
    {
        private readonly IContact _Contact;
        private HttpContextBase Context { get; set; }

        public ContactDetailsController(IContact Contact, HttpContextBase context)
        {
            this._Contact = Contact;
            this.Context = context;

        }
        //
        // GET: /ContactDetails/
        public ActionResult Index()
        {
            //AddressDetails Person = (AddressDetails)TempData["Person"];
            var value = this.Context;
        
           
            return View(GetAllContacts());

        }
    
        [HttpPost]
        public ActionResult Index(ContactDetails Contacts)
        {
            Contacts.Contacts = GetAllContacts().Contacts;
            Contacts.SearchName = Contacts.SearchName;
            if (Request.IsAjaxRequest())
                return View("ContactList", Contacts);
            else
                return View(Contacts);
        }
        [HttpGet]
        public ActionResult DeleteContact(int ID)
        {
            bool Status = _Contact.DeleteContactByID(ID);
           
            return Json(Status, JsonRequestBehavior.AllowGet);
        }
        public ActionResult EditContact(int ID)
        {
            return RedirectToAction("Index", "EditContact", new { ID = ID });
        }
        public ContactDetails GetAllContacts()
        {
            List<Contact> Contacts = new List<Contact>();
            foreach (Person Person in _Contact.GetAllContact())
            {
                Contact Contact = new Contact();
                Contact.ID = Person.PersonID;
                Contact.Name = Person.FirstName + " " + Person.LastName;
                Contact.ImageName = "men.jpg";
                Contacts.Add(Contact);
            }


            ContactDetails ContactDetails = new ContactDetails { Contacts = Contacts };

            return ContactDetails;
        }
    
    }
}
