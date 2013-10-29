<!--- 
Page Name: indexAction.cfm
Created By: Roshith MP
Created Date: 9 July 2013
Modified By:
Modified Date:
Description: Performs all actions need to display the index.cfm page
 --->
<!--- begin variable decleration --->
<cfset variables.pageTitle = "Search Details" />
<cfset variables.startDate = "" />
<cfset variables.endDate = "" />
<cfset variables.grandTotal = 0 />
<cfset variables.rowStyle = "rowOdd" />

<cfset variables.result = QueryNew("") />
<cfset variables.error = "" />
<!--- end variable decleration --->

<!--- begin control block --->
<cfif IsDefined('form.search')>
	<!--- set form values and process it --->
	<cfset setFormValues() />
	<!--- validate form --->
	<cfif isValidForm()>
		<cfset getDetails() />
	</cfif>
</cfif>
<!--- end control block --->

<!--- begin functions --->
<cffunction name="setFormValues" returntype="void" hint="Set form values to variables">
	<cfif IsDefined('form.startDate')>
		<cfset variables.startDate = Replace(form.startDate,'-','/','all') />
	</cfif>
	<cfif IsDefined('form.endDate')>
		<cfset variables.endDate = Replace(form.endDate,'-','/','all') />
	</cfif>
</cffunction>

<cffunction name="isValidForm" returntype="boolean" hint="Validate the form values">
	<cfif Len(Trim(variables.startDate))>
		<cfif NOT IsDate(variables.startDate)>
			<cfset variables.error = variables.error & "Enter a valid start date! <br />" />
		</cfif>
	<cfelse>
		<cfset variables.error = variables.error & "Enter start date! <br />" />
	</cfif>
	<cfif Len(Trim(variables.endDate))>
		<cfif NOT IsDate(variables.endDate)>
			<cfset variables.error = variables.error & "Enter a valid end date! <br />" />
		</cfif>
	<cfelse>
		<cfset variables.error = variables.error & "Enter end date! <br />" />
	</cfif>
	<cfif NOT Len(Trim(variables.error))>
		<cfif DateCompare(variables.startDate, variables.endDate) EQ 1>
			<cfset variables.error = "Start date greater than end date!<br />" />
			<cfreturn false />
		<cfelse>
			<cfreturn true />
		</cfif>
	<cfelse>
		<cfreturn false />
	</cfif>
</cffunction>
<cffunction name="getDetails" returntype="void" hint="Get details">
	<cfset objDetails = CreateObject('component', 'com.report') />
	<cfif request.isDummyValue>
		<cfset variables.result = objDetails.getDummyValues() />
	<cfelse>
		<cfset variables.result = objDetails.getAllDetails(variables.startDate, variables.endDate) />
	</cfif>
	<cfquery dbtype="query" name="grandTotal">
		SELECT SUM(total) gTotal FROM variables.[result]
	</cfquery>
	<cfset variables.grandTotal = grandTotal.gTotal />
</cffunction> 

<!--- end functions --->
