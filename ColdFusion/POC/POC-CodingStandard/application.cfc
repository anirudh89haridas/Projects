<!--- 
Page Name: application.cfc
Created By: Roshith MP
Created Date: 9 July 2013
Modified By:
Modified Date:
Description: Page which executes prior to any coldfusion page and can handle events reliably.
 --->
<cfcomponent displayname="application" output="true">
	<cfset this.name = "Report" />
	<cfset this.applicationTimeout = CreateTimeSpan( 0, 0, 1, 0 ) />
	<!--- Define the page request properties. --->
	<cfsetting requesttimeout="20" showdebugoutput="false" enablecfoutputonly="false" />
	
	<cffunction name="onApplicationStart" output="true">
		<!--- set DSN name --->
		<cfset application.dsnName = "mabase" />
		<!--- set date format for the application --->
		<cfset application.dateMask = "mm/dd/yyyy" />
	</cffunction>
	<cffunction name="onRequestStart" output="true">
		<!--- set true to use dummy value, DB connection not needed --->
		<cfset request.isDummyValue = true />
	</cffunction>
</cfcomponent>	