using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AddressBook.Domain.Entities;
using AddressBook.Infrastructure.Interfaces;
using System.Data.Entity.Validation;


namespace AddressBook.Infrastructure.Data.Repositories
{
    public class ContactRepository : IContactRepository
    {

        public List<Person> GetAllContact()
        {
            using (var Context = new EDMX.AddressBookEntities())
            {
                List<Person> People = (from person in Context.People
                                       select new Person() { PersonID = person.PersonID, FirstName = person.FirstName, LastName = person.LastName }).ToList<Person>();
                //select new usertable() { user_id = u.user_id, username = u.username, role = new role() { role_id = u.role.role_id } }
                return People;
            }
        }

        public Person GetContactByID(int PersonID)
        {
            using (var Context = new EDMX.AddressBookEntities())
            {


                Person People = (from P in Context.People
                                 join PA in Context.PersonAddresses on P.PersonAddressID equals PA.PersonAddressID
                                 join S in Context.StateMasters on PA.StateID equals S.StateID
                                 join C in Context.CountryMasters on S.CountryID equals C.CountryID
                                 select new Person
                                 {
                                     PersonID = P.PersonID,
                                     PersonAddressID = P.PersonAddressID,
                                     UserName = P.UserName,
                                     FirstName = P.FirstName,
                                     LastName = P.LastName,
                                     Password = P.Password,
                                     PhoneNumber = PA.PhoneNumber,
                                     PhotoName = PA.PhotoName,
                                     PinCode = PA.PinCode,
                                     Gender = PA.Gender,
                                     CompleteAddress = PA.CompleteAddress,
                                     DateOfBirth = PA.DateOfBirth,
                                     StateMaster = new StateMaster()
                                     {
                                         StateName = S.StateName,
                                         StateID = PA.StateID,
                                         CountryMaster = new CountryMaster()
                                         {
                                             CountryID = S.CountryID,
                                             CountryName = C.CountryName
                                         }
                                     }



                                 }).FirstOrDefault<Person>();
                People.LanguageAddresses = (from LA in Context.LanguageAddresses
                                            join LM in Context.LanguageMasters on LA.LanguageID equals LM.LanguageID
                                            where LA.PersonAddressID == People.PersonAddressID
                                            select new LanguageAddress
                                            {
                                                LanguageMaster = new LanguageMaster()
                                                {
                                                    LanguageID = LA.LanguageID,
                                                    LanguageName = LM.LanguageName
                                                }
                                            }).ToList<LanguageAddress>();

                return People;
            }
        }

        public bool InsertContact(Person Person)
        {

            using (var Context = new EDMX.AddressBookEntities())
            {
                try
                {
                    EDMX.PersonAddress PA = new EDMX.PersonAddress();
                    PA.StateID = Person.StateID;
                    PA.Gender = Person.Gender;
                    PA.DateOfBirth = Person.DateOfBirth;
                    PA.PhoneNumber = Person.PhoneNumber;
                    PA.CompleteAddress = Person.CompleteAddress;
                    PA.PinCode = Person.PinCode;

                    Context.PersonAddresses.AddObject(PA);
                    Context.SaveChanges();
                    foreach (LanguageAddress LID in Person.LanguageAddresses)
                    {
                        EDMX.LanguageAddress LA = new EDMX.LanguageAddress();
                        LA.LanguageID = LID.LanguageID;
                        LA.PersonAddressID = PA.PersonAddressID;
                        Context.LanguageAddresses.AddObject(LA);

                    }

                    EDMX.Person P = new EDMX.Person();
                    P.PersonAddressID = PA.PersonAddressID;
                    P.UserName = Person.UserName;
                    P.Password = Person.Password;
                    P.FirstName = Person.FirstName;
                    P.LastName = Person.LastName;
                    Context.People.AddObject(P);

                    Context.SaveChanges();

                    // save changes to the database  

                    return true;
                }
                catch (DbEntityValidationException e)
                {
                    // throw new Exception("Could not save changes.");
                    return false;
                }

            }
        }
        public bool DeleteContactByID(int PersonID)
        {
            using (var Context = new EDMX.AddressBookEntities())
            {

                var People = Context.People.Where(x => x.PersonID == PersonID);

                foreach (EDMX.Person person in People)
                {
                    var PAID = person.PersonAddressID;
                    if (PAID != null)
                    {
                        Context.People.DeleteObject(person);
                        var PeopleAddress = Context.PersonAddresses.Where(x => x.PersonAddressID == PAID);
                        var LanguageAddress = Context.LanguageAddresses.Where(x => x.PersonAddressID == PAID);
                        var HobbyAddress = Context.HobbyAddresses.Where(x => x.PersonAddressID == PAID);
                        foreach (EDMX.LanguageAddress languageAddress in LanguageAddress)
                        {
                            Context.LanguageAddresses.DeleteObject(languageAddress);

                        }
                        foreach (EDMX.HobbyAddress hobbyAddress in HobbyAddress)
                        {
                            Context.HobbyAddresses.DeleteObject(hobbyAddress);

                        }
                        foreach (EDMX.PersonAddress personAddress in PeopleAddress)
                        {
                            Context.PersonAddresses.DeleteObject(personAddress);

                        }
                    }

                }

                try
                {
                    // save changes to the database  
                    Context.SaveChanges();
                    return true;
                }
                catch
                {
                    // throw new Exception("Could not save changes.");
                    return false;
                }

            }
        }


        public bool UpdateContact(Person Person)
        {

            using (var Context = new EDMX.AddressBookEntities())
            {
                var People = Context.People.Where(x => x.PersonID == Person.PersonID);
                

                foreach (EDMX.Person person in People)
                {
                    var LanguageAddress = Context.LanguageAddresses.Where(x => x.PersonAddressID == person.PersonAddressID);
                    
                    foreach (EDMX.LanguageAddress LID in LanguageAddress)
                    {
                        Context.LanguageAddresses.DeleteObject(LID);                                 

                    }
                    foreach (LanguageAddress LID in Person.LanguageAddresses)
                    {
                        EDMX.LanguageAddress LA = new EDMX.LanguageAddress();
                        LA.LanguageID = LID.LanguageID;
                        LA.PersonAddressID =(int)person.PersonAddressID;
                        Context.LanguageAddresses.AddObject(LA);

                    }
                    person.PersonAddress.Gender = Person.Gender;
                    person.PersonAddress.DateOfBirth = Person.DateOfBirth;
                    person.PersonAddress.PhoneNumber = Person.PhoneNumber;
                    person.PersonAddress.CompleteAddress = Person.CompleteAddress;
                    person.PersonAddress.PinCode = Person.PinCode;
                    person.PersonAddress.StateID = Person.StateID;
                    person.UserName = Person.UserName;
                    person.Password = Person.Password;
                    person.FirstName = Person.FirstName;
                    person.LastName = Person.LastName;
                   
                  
                }



                try
                {
                    // save changes to the database  
                    Context.SaveChanges();
                    return true;
                }
                catch
                {
                    // throw new Exception("Could not save changes.");
                    return false;
                }
            }
        }
    }
}
