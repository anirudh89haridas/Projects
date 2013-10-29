<!--- 
Page Name: report.cfc
Created By: 
Created Date:
Modified By:
Modified Date:
Description: Functions for feteching data from Database
 --->
<cfcomponent displayname="report">
	<cffunction name="getAllDetails" returntype="query" hint="Return the values between the date supplied">
		<cfargument name="startDate" type="date" required="true" hint="Start date to fetch values" />
		<cfargument name="endDate" type="date" required="true" hint="End date to fetch values" />
		<cfquery datasource="#application.dsnName#" name="getDetails">
			SELECT 	Y.devis_id, 
					ISNULL(SUM(YR.yquantite*YR.yprix),0) AS total, 
					Y.date_validation
			FROM [ydevis] AS Y
			LEFT JOIN [ydevis_reference] AS YR 
			ON Y.devis_id = YR.devis_id 
			WHERE [date_validation] BETWEEN <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.startDate#" /> 
			AND <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.endDate#" />
			AND Y.devis_status = 1
			GROUP BY Y.devis_id,Y.date_validation 
			ORDER BY Y.date_validation
		</cfquery>
		<cfreturn getDetails />
	</cffunction>
	
	<cffunction name="getDummyValues" returntype="query" hint="Return dummy data for testing">
		<!--- Create a new query, specifying the column data types --->
		<cfset myQuery = QueryNew("devis_id,date_validation,total ", "Integer, Date, Double")>

		<!--- Make Five rows in the query --->
		<cfset newRow = QueryAddRow(myQuery, 5)>

		<!--- Set the values of the cells in the query --->

		<cfset temp = QuerySetCell(myQuery, "devis_id", 1, 1)>
		<cfset temp = QuerySetCell(myQuery, "date_validation", "11/11/2012", 1)>
		<cfset temp = QuerySetCell(myQuery, "total", 455, 1)>

		<cfset temp = QuerySetCell(myQuery, "devis_id", 3, 2)>
		<cfset temp = QuerySetCell(myQuery, "date_validation", "12/03/2012", 2)>
		<cfset temp = QuerySetCell(myQuery, "total", 255, 2)>

		<cfset temp = QuerySetCell(myQuery, "devis_id", 5, 3)>
		<cfset temp = QuerySetCell(myQuery, "date_validation", "07/10/2013", 3)>
		<cfset temp = QuerySetCell(myQuery, "total", 125, 3)>

		<cfset temp = QuerySetCell(myQuery, "devis_id", 7, 4)>
		<cfset temp = QuerySetCell(myQuery, "date_validation", "06/09/2013", 4)>
		<cfset temp = QuerySetCell(myQuery, "total", 100, 4)>

		<cfset temp = QuerySetCell(myQuery, "devis_id", 8, 5)>
		<cfset temp = QuerySetCell(myQuery, "date_validation", "01/01/2013", 5)>
		<cfset temp = QuerySetCell(myQuery, "total", 663, 5)>
		<cfreturn myQuery />
	</cffunction>
</cfcomponent>