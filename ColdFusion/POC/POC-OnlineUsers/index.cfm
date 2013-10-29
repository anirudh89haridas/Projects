<html>
<head>
<title>session tracker</title>
</head>

<body>
<cfapplication name="mammam">
<cfsetting showdebugoutput="false"/>
<cfapplication sessionmanagement="true">

<cfset request.overallTotal = 0 />

<cfloop collection="#application#" item="applicationName">



<cfscript>
sessiontrackerObj= createObject("java","coldfusion.runtime.SessionTracker");
activesessions = sessiontrackerObj.getSessionCollection("#applicationName#");
WriteDump(activeSessions);
nosessions=ListLen(structkeyList(activeSessions));
</cfscript>
<cfif nosessions>
<cfoutput>
<h3>Total Sessions for #applicationName#: #nosessions#</h3>
</cfoutput>
<cfif structKeyExists(url,"showSessions")><cfdump var="#activesessions#"></cfif>
</cfif>
<cfset request.overallTotal = request.overallTotal + nosessions />

</cfloop>
<h3>OVERALL SESSIONS:

<cfoutput>#request.overallTotal#</cfoutput></h3>

</body>
</html>