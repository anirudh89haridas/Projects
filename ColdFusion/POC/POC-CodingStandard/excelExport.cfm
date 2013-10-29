<!--- 
Page Name: excelExport.cfm
Created By: Roshith MP
Created Date: 9 July 2013
Modified By:
Modified Date:
Description: Export the values for selected date range to excel 
 --->
<!--- begin variable decleration --->
<cfset variables.startDate = "" />
<cfset variables.endDate = "" />
<cfset variables.grandTotal = 0 />

<cfset variables.result = QueryNew("") />
<!--- end variable decleration --->

<!--- begin control block --->
<cfif isDefined('url.exportToExcel')>
	<cfset setUrlValues() />
	<cfif isValidForm()>
		<cfset getDetails() />
	</cfif>
</cfif>
<!--- end control block --->

<!--- begin functions --->
<cffunction name="setUrlValues" returntype="void" hint="Set url values to variables">
	<cfif IsDefined('url.startDate')>
		<cfset variables.startDate = url.startDate />
	</cfif>
	<cfif IsDefined('url.endDate')>
		<cfset variables.endDate = url.endDate />
	</cfif>
</cffunction>
 
<cffunction name="isValidForm" returntype="boolean" hint="Validate the form values">
	<cfif Len(Trim(variables.startDate))>
		<cfif NOT IsDate(variables.startDate)>
			<cfreturn false />
		</cfif>
	<cfelse>
		<cfreturn false />
	</cfif>
	<cfif Len(Trim(variables.endDate))>
		<cfif NOT IsDate(variables.endDate)>
			<cfreturn false />
		</cfif>
	<cfelse>
		<cfreturn false />
	</cfif>
	<cfif DateCompare(variables.startDate, variables.endDate) EQ 1>
		<cfreturn false />
	</cfif>
	<cfreturn true />
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

<!--- download as excel --->
<cfheader name="Content-Disposition" value="inline; filename=report.xls">
<cfcontent type="application/vnd.ms-excel" reset="true">
<style>
	.bold{
		font-weight: bold;
	}
</style>
<table width="100%" border="1">
	<tr id="rowHeader">
		<th>#</th>
		<th>ID</th>
		<th>Date</th>
		<th>Sum</th>
	</tr>
	<cfif variables.result.recordCount EQ 0>
		<tr><td colspan="4" align="center"> No items found! </td></tr>
	<cfelse>
		<cfoutput query="variables.result">
			<tr>
				<td align="center">#variables.result.currentRow#</td>
				<td align="center">#variables.result.devis_id#</td>
				<td align="center">#DateFormat(variables.result.date_validation,application.dateMask)#</td>
				<td align="right">#NumberFormat(variables.result.total,'__.__')#</td>
			</tr>
		</cfoutput>
		<tr>
			<td></td>
			<td></td>
			<td align="right" class="bold">Grand Total</td>
			<td align="right" class="bold"><cfoutput>#NumberFormat(variables.grandTotal,'__.__')#</cfoutput></td>
		</tr>
	</cfif>
</table>