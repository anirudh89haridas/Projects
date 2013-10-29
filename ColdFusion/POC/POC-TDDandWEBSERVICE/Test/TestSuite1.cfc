<cfcomponent displayname="MyTest1" extends="mxunit.framework.TestCase" output="false">

	<!--- this will run before every single test in this test case --->

	<cffunction name="setUp" returntype="void" access="public" hint="put things here that you want to run before each test">
	</cffunction>

	<!--- this will run after every single test in this test case --->

	<cffunction name="tearDown" returntype="void" access="public" hint="put things here that you want to run after each test">
	</cffunction>

	<!--- this will run once after initialization and before setUp() --->

	<cffunction name="beforeTests" returntype="void" access="public" hint="put things here that you want to run before all tests">
		<cfset Entities = Request.obj.CreateCFC('Domain.Entities.Person') />
		<cfset Contact = Request.obj.CreateCFC('Services.Contact') />
	</cffunction>

	<!--- this will run once after all tests have been run --->

	<cffunction name="afterTests" returntype="void" access="public" hint="put things here that you want to run after all tests">
	</cffunction>


	<cffunction name="testCase1" access="public">
		<cfset var expected = 'Anirudh Haridas'>
		<cfset var actual = Contact.GetContactName() >
		<cfset assertEquals(expected,actual)>
	</cffunction>


	<cffunction name="testCase2" access="public">
		<cfset fail("Triggered manually")>
	</cffunction>


	<cffunction name="testCase3" access="public">
		<cfset assertTrue(somePrivateFunction(),"assert true test") />
	</cffunction>

	<!--- this won't get run b/c it's private --->

	<cffunction name="somePrivateFunction" access="private">
		<cfreturn false />
	</cffunction>


</cfcomponent>
