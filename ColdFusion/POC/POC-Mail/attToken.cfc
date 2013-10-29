<cfcomponent output="false" >	
<cfsetting showdebugoutput="false"/>
<cfset port = 995 />
<cfset serverName = "etnr-cas-01.enterprise.corp" />
<cfset userName = "atttoken" />
<cfset password = "$3RV1C3@CCOUNT" />
<cfset regularExpression = "The new Tokencode for Token Serial number ([A-Za-z0-9\\-]+) at 8:30 a.m. EDT tomorrow morning will be ([A-Za-z0-9\\-]+)." />
<cfset tokenDetails = StructNew() />

<cffunction name="getMail" access="remote" returnType="xml" output="false">
<cfargument name="startRow" type="numeric" required="true" />
	<cfif arguments.startRow GT 0 and arguments.startRow LT 4>	
		<cftry>
			<cfset javaSystem = createObject("java", "java.lang.System") /> 
			<cfset jProps = javaSystem.getProperties() /> 
			<cfset jProps.setProperty("mail.pop3.socketFactory.class", "javax.net.ssl.SSLSocketFactory") /> 
			<cfset jProps.setproperty("mail.pop3.port",port) /> 
			<cfset jProps.setProperty("mail.pop3.socketFactory.port", port) />		
			<cfpop action="getall" name="mails" server="#serverName#" username="#userName#"
			password="#password#"  maxrows="2" startRow="#arguments.startRow#" timeout="500">
			<cfset tokenString = "<atttokens>"/>
			<cfloop query="mails">
				<cfset tokenStruct = getTokenOtt(HTMLEditFormat(mails.DATE),HTMLEditFormat(mails.TEXTBODY)) />
				<cfset tokenString &=  "<atttoken><atttokenid>#tokenStruct.TokenOTT#</atttokenid><atttokendate>#tokenStruct.date#</atttokendate></atttoken>" />							
			</cfloop>
			<cfset tokenString &= "</atttokens>"/>			
		<cfcatch>
			<cfset tokenString = "NULL" />
		</cfcatch>
		</cftry>
	<cfelse>
		<cfset tokenString = "NULL" />
	</cfif>	
<cfreturn tokenString />
</cffunction>

<cffunction name="getTokenOtt" returnType="struct" output="false">
<cfargument name="recievedDate" type="date" required="true" />
<cfargument name="mailContent" type="string" required="true" />
	<cfset Search = REFindNoCase(regularExpression, arguments.mailContent,1,true)/>
	<cfset strChar = Mid( arguments.mailContent, Search.pos[3], Search.len[3] ) /> 	
	<cfset tokenDetails.TokenOTT = strChar />
	<cfset tokenDetails.date = "#DateFormat(prepareDate(arguments.recievedDate), 'yyyy-mm-dd')# 05:30:00.000" /> 
<cfreturn tokenDetails/ >
</cffunction>

<cffunction name="prepareDate" returnType="date" output="false">
<cfargument name="recievedDate" type="date" required="true" />
	<cfset processDate1 = arguments.recievedDate />
	<cfset dayOfProcessDate1 = DayOfWeek(processDate1) />
	<cfset dayList1 = ""/>	
	<cfloop condition="dayOfProcessDate1 NEQ 3">	
		<cfset dayList1 &= ListAppend(dayList1, dayOfProcessDate1)>	
		<cfset processDate1 = DateAdd('d',1, processDate1) />
		<cfset dayOfProcessDate1 = DayOfWeek(processDate1) />					
	</cfloop>
	<cfset processDate2 = arguments.recievedDate />
	<cfset dayOfProcessDate2 = DayOfWeek(processDate2) />
	<cfset dayList2 = "" />	
	<cfloop condition="dayOfProcessDate2 NEQ 6">	
		<cfset dayList2 = ListAppend(dayList2, dayOfProcessDate2)>	
		<cfset processDate2 = DateAdd('d',1, processDate2) />
		<cfset dayOfProcessDate2 = DayOfWeek(processDate2) />				
	</cfloop>	
	<cfif ListLen(dayList1) LT ListLen(dayList2)>		
		<cfset processDate = processDate1 />
	<cfelse>
		<cfset processDate = processDate2 />		
	</cfif>
<cfreturn processDate/>
</cffunction>

</cfcomponent>