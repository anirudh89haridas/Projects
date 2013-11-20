using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


using Ninject.Modules;
using AddressBook.BLL;
using AddressBook.BLL.Interfaces;


namespace AddressBook.DependencyResolver
{    
    public class BLL : NinjectModule
    {
        public override void Load()
        {
            Bind<IContact>().To<Contact>();
            Bind<IMaster>().To<Master>();
        }
    }
}
