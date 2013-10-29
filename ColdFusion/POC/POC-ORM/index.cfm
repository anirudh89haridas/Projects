
	<cfset Employee = Request.obj.CreateCFC('Domain.Entities.Employee')/>
<cfset empObj = EntityNew('Domain.Entities.Employee')>
        <cfset empObj.setFirstName("James")>
        <cfset empObj.setLastName("Bond")>
       
        <cfset EntitySave(empObj)>
		<cfset ormflush()>
