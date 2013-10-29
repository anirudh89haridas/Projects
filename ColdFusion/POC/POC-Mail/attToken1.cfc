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
			password="#password#"  maxrows="4" startRow="#arguments.startRow#" timeout="500">
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

<cffunction name="getTokenOtt" access="remote" returnType="struct" output="false">
<cfargument name="recievedDate" type="date" required="true" />
<cfargument name="mailContent" type="string" required="true" />
	<cfset Search = REFindNoCase(regularExpression, arguments.mailContent,1,true)/>
	<cfset strChar = Mid( arguments.mailContent, Search.pos[3], Search.len[3] ) /> 	
	<cfset insertDate = "#DateFormat(DateAdd('d',1, arguments.recievedDate ), 'yyyy-mm-dd')# 05:30:00.000" />	
	<cfset tokenDetails.TokenOTT = strChar />
	<cfset tokenDetails.date = insertDate />	
<cfreturn tokenDetails/ >
</cffunction>

</cfcomponent>