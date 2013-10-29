<cfcomponent >

	<cfset Entities = Request.obj.CreateCFC('Domain.Entities.Person') />
	<cfset Contact = Request.obj.CreateCFC('Infrastructure.Repository.ContactRepository') />

	<cffunction name="GetContactName" access="remote" returnType="string" output="false" >
		<cfset Entities.FirstName = Contact.GetContactName() />
		<cfreturn Entities.FirstName />
	</cffunction>


	<cffunction name="GetContactNameById" access="remote" returnType="string" output="false" >
		<cfargument name="ContactId" Type="numeric" required="true">
		<cfset Entities.FirstName = Contact.GetContactNameById(arguments.ContactId) />
		<cfreturn Entities.FirstName />
	</cffunction>


</cfcomponent>
