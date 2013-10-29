<cfcomponent displayname="MyTest1" extends="mxunit.framework.TestCase" output="false">

	<cfset Entities = Request.obj.CreateCFC('Domain.Entities.Person') />
	<cfset Contact = Request.obj.CreateCFC('Services.Contact') />

	<cffunction name="testCase1" access="remote">
		<cfset var expected = 'Anirudh Haridas'>
		<cfset var actual = Contact.GetContactName() >
		<cfset assertEquals(expected,actual)>
	</cffunction>


</cfcomponent>
