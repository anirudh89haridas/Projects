using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace AddressBook.Controllers
{
    public class LoginController : Controller
    {
        //
        // GET: /Login/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(Login User)
        {
            if (ModelState.IsValid)
            {
                if (User.UserName == "anirudh" && User.Password == "password")//Simulate date store with username and password 
                {
                    FormsAuthentication.SetAuthCookie(User.UserName, false);
                    return RedirectToAction("Index", "ContactDetails");
                }
                else
                {
                    ModelState.AddModelError("", "Invalid UserName OR Password");
                  
                }
            }
            return View(User);
        }

    }
}
