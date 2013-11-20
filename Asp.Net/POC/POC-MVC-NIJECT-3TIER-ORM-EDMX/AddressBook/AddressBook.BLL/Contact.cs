using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using AddressBook.Domain.Entities;

using AddressBook.Infrastructure.Interfaces;
using AddressBook.BLL.Interfaces;

namespace AddressBook.BLL
{
    public class Contact : IContact
    {
        private IContactRepository _ContactRepository;

        public Contact(IContactRepository ContactRepository)
        {
            _ContactRepository = ContactRepository;
        }

        public List<Person> GetAllContact()
        {
         
                List<Person> People =_ContactRepository.GetAllContact();             
                return People;
            
        }

        public Person GetContactByID(int PersonID)
        {
           
                Person Person = _ContactRepository.GetContactByID(PersonID);
                return Person;
           
        }
        public bool InsertContact(Person Person)
        {
            bool Status = _ContactRepository.InsertContact(Person);
            return Status; 
        }

        public bool DeleteContactByID(int PersonID)
        {
                      
                bool Status=_ContactRepository.DeleteContactByID(PersonID);                       
                return Status;           
            
        }


        public bool UpdateContact(Person Person)
        {

            bool Status = _ContactRepository.UpdateContact(Person);
            return Status;
            
        }
    }
}
