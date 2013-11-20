using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;

namespace AddressBook.ViewModel
{
    public class AddContact
    {
        [Required, Display(Name = "User Name:"), MaxLength]
        [RegularExpression("^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$", ErrorMessage = "User Name must be a valid E-mail Address")]        
        public string UserName { get; set; }
        [Required]
        public string Password { get; set; }
        [Required]
        public string ConfirmPassword { get; set; }
        [Required]
        public string FirstName { get; set; }
        [Required]
        public string LastName { get; set; }
        [Required]
        public string Gender { get; set; }
        [Required]
        public long? ContactNumber { get; set; }
        [Required]
        public string CompleteAddress { get; set; }
        [Required]
        public string PinCode { get; set; }
        [Display(Name = "Date"), DataType(DataType.Date), Required, DisplayFormat(DataFormatString = "{dd/MMMM/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime? DateOfBirth { get; set; }
        [Required]
        public HttpPostedFileBase UploadPhoto { get; set; }
        [Required]
        public int SelectedCountry { get; set; }
        public List<SelectListItem> Countries { get; set; }
        [Required]
        public int SelectedState { get; set; }
        public List<SelectListItem> States { get; set; }
        [Required]
        public int[] SelectedLanguages { get; set; }
        public List<SelectListItem> Languages { get; set; }
        [Required]
        public bool[] IsHobbies { get; set; }
        public List<SelectListItem> Hobbies { get; set; }
    }
}