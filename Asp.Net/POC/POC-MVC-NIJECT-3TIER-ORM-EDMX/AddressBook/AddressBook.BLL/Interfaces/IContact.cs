using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AddressBook.Domain.Entities;

namespace AddressBook.BLL.Interfaces
{
    public interface IContact
    {
        List<Person> GetAllContact();
        Person GetContactByID(int PersonID);
        bool InsertContact(Person Person);
        bool DeleteContactByID(int PersonID);
        bool UpdateContact(Person Person);
      
    }
}
