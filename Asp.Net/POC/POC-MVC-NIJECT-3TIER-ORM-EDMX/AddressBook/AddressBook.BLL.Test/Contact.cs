using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using NUnit.Framework;
using AddressBook.BLL;

namespace AddressBook.BLL.Test
{
    [TestFixture]
    public class Contact
    {
        [Test]
        public void World()
        {
            Test1 k=new Test1();
            Assert.AreEqual("Hello",k.SayHello());
            // your testing happens here
        }
    }
}
