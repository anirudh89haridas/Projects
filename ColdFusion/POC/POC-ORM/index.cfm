<cfset empObj = EntityNew("Domain.Entities.Employee")>
        <cfset empObj.setFirstName("James")>
        <cfset empObj.setLastName("Bond")>
        <cfset perObj = EntityNew("Domain.Entities.Personal")>
        <cfset perObj.setSSN("1-1-100")>
        <cfset perObj.setFatherName("Bond")>
        <cfset perObj.setEmployeeObj(empObj)>
        <cfset empObj.setPersonalObj(perObj)>
        <cfset EntitySave(empObj)>