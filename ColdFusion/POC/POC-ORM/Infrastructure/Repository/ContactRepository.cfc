<cfcomponent output="false">

	<cfset Entities = Request.obj.CreateCFC('Domain.Entities.Person')/>


	<cffunction name="GetContactName" returnType="string" >
		<cfset Entities.FirstName = "Anirudh Haridas" />
	
		<cfquery name="check" datasource="#Request.obj.datasource#">
		SELECT * 
		FROM
		Person
		</cfquery>
		<cfdump var="#Request.obj#" />
		<cfdump var="#Entities#" />
		<cfdump var="#check#" />
		<cfabort/>
		<cfreturn Entities.FirstName/>
	</cffunction>


	<cffunction name="GetContactNameById" returnType="string" >
		<cfargument name="ContactId" Type="numeric" required="true">
		<cfset Entities.FirstName = arguments.ContactId & "Anirudh Haridas" />
		<cfreturn Entities.FirstName/>
	</cffunction>


</cfcomponent>
