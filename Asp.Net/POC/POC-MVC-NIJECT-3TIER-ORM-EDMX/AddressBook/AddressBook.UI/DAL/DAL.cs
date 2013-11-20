using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace AddressBook.DAL
{
    public class DAL
    {

        public bool UserIsValid(int CountryID)
        {
            bool authentication = false;
            string Query = string.Format("select * From CountryMaster where CountryID={0}", CountryID);



            using (SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBook"].ToString()))
            {
                SqlCommand CMD = new SqlCommand(Query, Conn);

                Conn.Open();

                SqlDataReader SDR = CMD.ExecuteReader();

                // Call Read before accessing data. 
                while (SDR.Read())
                {
                    var k = SDR["CountryName"].ToString();

                }

                // Call Close when done reading.
                Conn.Close();
            }

            return authentication;
        }
    }
}