<cfcomponent output="false">

	<cfset Entities = Request.obj.CreateCFC('Domain.Entities.Person')/>

	<cffunction name="GetContactName" returnType="string" >
		<cfset Entities.FirstName = "Anirudh Haridas" />
		<cfreturn Entities.FirstName/>
	</cffunction>


	<cffunction name="GetContactNameById" returnType="string" >
		<cfargument name="ContactId" Type="numeric" required="true">
		<cfset Entities.FirstName = arguments.ContactId & "Anirudh Haridas" />
		<cfreturn Entities.FirstName/>
	</cffunction>


</cfcomponent>
