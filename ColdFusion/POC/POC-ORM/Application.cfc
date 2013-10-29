<!--------------------------------------------------------------------------------
	File:		Application.cfm
	Author:		Anirudh Haridas
	Desc:		General Application settings 					
	Update History:	
	08/28/2006 - Anirudh Haridas
	Built the first run of the page.
	--------------------------------------------------------------------------------->
<cfcomponent output="false" hint="I define application settings and event handlers.">

	<!--- Set request settings. --->
	<cfsetting showdebugoutput="true"/>
	<!--- Define application settings. --->
	<cfset THIS.Name = "AddressBook" />
	<cfset THIS.ApplicationTimeout = CreateTimeSpan( 0, 0, 10, 0 ) />
	<cfset THIS.SessionManagement = true />
	<cfset THIS.SessionTimeout = CreateTimeSpan( 0, 0, 0, 20 ) />
	<cfset THIS.ApplicationRoot = getDirectoryFromPath(getCurrentTemplatePath())/>
	<cfset THIS.RequestURL = getDirectoryFromPath(getPageContext().getRequest().getRequestURL())/>
	<cfset THIS.datasource = "ColdFusionORM"/>
	<cfset THIS.ormenabled = "true"> 



	

	<cffunction name="onApplicationStart">
		<!--- application start up --->
	</cffunction>


	<cffunction name="onSessionStart" hint="I run when a session needs to be initialized.">
		<!--- session start--->
	</cffunction>


	<cffunction name="onRequestStart" hint="I run when a request needs to be initialized.">
		<!--- request start --->
		<cfset Request.obj = THIS/>		
		
       <!--- <cfset ormflush()>--->

	</cffunction>


	<cffunction name="CreateCFC" returntype="any">
		<cfargument name="path" required="true" />
		<cfreturn CreateObject('component', Arguments.path)/>
	</cffunction>


</cfcomponent>
