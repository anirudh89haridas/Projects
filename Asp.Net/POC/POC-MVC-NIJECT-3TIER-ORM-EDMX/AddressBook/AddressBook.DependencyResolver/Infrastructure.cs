using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Ninject.Modules;

using AddressBook.Infrastructure.Data.Repositories;
using AddressBook.Infrastructure.Interfaces;

namespace AddressBook.DependencyResolver
{
    public class Infrastructure : NinjectModule
    {
        public override void Load()
        {
            Bind<IContactRepository>().To<ContactRepository>();
            Bind<IMasterRepository>().To<MasterRepository>();
        }
    }
}
