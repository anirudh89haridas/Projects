<!---
Page Name: index.cfm
Created By: Roshith MP
Created Date: 9 July 2013
Modified By:
Modified Date:
Description: Search for values in specified date range and display the result.
 --->
<cfinclude template="indexAction.cfm" />
<cfinclude template="header.cfm" />
<!--- begin mainContent --->
<div id="mainContent">
	<cfoutput>
		<div id="searchWrapper">
			<div class="errorMessage" id="errorMessage">
				<cfif Len(Trim(variables.error))>
					<div class="errorContent"><cfoutput>#variables.error#</cfoutput></div>
				</cfif>
			</div>
			<div class="frmFields">
				<cfform action="index.cfm" method="post" name="frmSearch" id="frmSearch">
					
					<div class="inputLabel">Start Date</div>
					<cfinput type="datefield" value="#variables.startDate#" label="Start Date" title="Start Date" name="startDate" id="startDate" mask="#application.dateMask#" />
					<span class="shade">[#application.dateMask#]</span>
					<div class="inputLabel">End Date</div>
					<cfinput type="datefield" value="#variables.endDate#" label="End Date" title="End Date" name="endDate" id="endDate" mask="#application.dateMask#" />
					<span class="shade">[#application.dateMask#]</span>
					<input type="submit" onClick="return validate();" value="Search" name="search" id="search" />
				</cfform>
			</div>
		</div>
	</cfoutput>
		<!--- begin listWrapper --->
		<div id="listWrapper">
			<table width="100%">
				<tr id="rowHeader">
					<td align="center">#</td>
					<td align="center">ID</td>
					<td align="center">Date</td>
					<td align="center" width="20%">Sum</td>
				</tr>
				<cfif variables.result.recordCount EQ 0>
					<tr><td colspan="4" align="center"> No items found! </td></tr>
				<cfelse>
					<cfoutput query="variables.result">
						<cfif variables.result.currentRow % 2 EQ 0>
							<cfset variables.rowStyle = "rowEven" />
						<cfelse>
							<cfset variables.rowStyle = "rowOdd" />
						</cfif>
						<tr id="#variables.rowStyle#">
							<td align="center">#variables.result.currentRow#</td>
							<td align="center">#variables.result.devis_id#</td>
							<td align="center">#DateFormat(variables.result.date_validation,application.dateMask)#</td>
							<td align="right">#NumberFormat(variables.result.total,'__.__')#</td>
						</tr>
					</cfoutput>
					<cfoutput>
						<tr>
							<td colspan="3" class="grandTotal">Grand Total</td>
							<td class="grandTotal">#NumberFormat(variables.grandTotal,'__.__')#</td>
						</tr>
						<tr>
							<td colspan="4" class="excelExport"><a href="excelExport.cfm?exportToExcel=true&startDate=#variables.startDate#&endDate=#variables.endDate#"><img border="0" src="resource/image/export_excel.png" title="Download as Excel" /></a></td>
						</tr>
					</cfoutput>
				</cfif>
			</table>
		</div>
		<!--- end listWrapper --->
</div>
<!--- end mainContent --->
<cfinclude template="footer.cfm" />