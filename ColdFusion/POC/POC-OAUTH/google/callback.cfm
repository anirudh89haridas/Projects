callback

<cffunction name="getAccessToken">
	<cfargument name="code" required="false" default="" type="string">
	<cfset var postBody = "code=" & UrlEncodedFormat(arguments.code) & "&">
	<cfset postBody = postBody & "client_id=" & UrlEncodedFormat(application.clientid) & "&">
	<cfset postBody = postBody & "client_secret=" & UrlEncodedFormat(application.clientsecret) & "&">
	<cfset postBody = postBody & "redirect_uri=" & UrlEncodedFormat(application.callback) & "&">
	<cfset postBody = postBody & "grant_type=authorization_code">
	

	<cfhttp method="post" url="https://accounts.google.com/o/oauth2/token">
		<cfhttpparam name="Content-Type" type="header" value="application/x-www-form-urlencoded">
		<cfhttpparam type="body" value="#postBody#">
	</cfhttp>


    <cfreturn deserializeJSON(cfhttp.filecontent.tostring())>
</cffunction>


<cffunction name="getRefreshToken">
<cfargument name="refresh" required="false" default="" type="string">
<cfset var postBody = "client_id=" & UrlEncodedFormat(application.clientid) & "&">
<cfset postBody = postBody & "client_secret=" & UrlEncodedFormat(application.clientsecret) & "&">
    <cfset postBody = postBody & "refresh_token=#arguments.refresh#&">
<cfset postBody = postBody & "grant_type=refresh_token">
<cfhttp method="post" url="https://accounts.google.com/o/oauth2/token">
<cfhttpparam name="Content-Type" type="header" value="application/x-www-form-urlencoded">
<cfhttpparam type="body" value="#postBody#">
</cfhttp>
    <cfreturn deserializeJSON(cfhttp.filecontent.tostring())>
</cffunction>

<cfset session.token = getAccessToken(code)>
<cfdump var="#session.token#">

<a href="test.cfm">TEST</a>