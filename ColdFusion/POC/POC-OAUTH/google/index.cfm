index

<cfset authurl = "https://accounts.google.com/o/oauth2/auth?" & 
    "client_id=#urlEncodedFormat(application.clientid)#" & 
     "&redirect_uri=#urlEncodedFormat(application.callback)#" & 
	 "&state=aaa" & 	
    "&scope=https://www.googleapis.com/auth/urlshortener&response_type=code&access_type=offline">
<cfoutput>
authurl=#authurl#<p>

<a href="#authurl#">Login</a>
</cfoutput>

