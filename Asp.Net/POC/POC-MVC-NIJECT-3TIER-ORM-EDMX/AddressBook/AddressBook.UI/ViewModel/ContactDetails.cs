using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AddressBook.ViewModel
{
    public class Contact
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string ImageName { get; set; }
    }
    public class ContactDetails
    {
        public string SearchName { get; set; }
        public List<Contact> Contacts { get; set; }
    }
}