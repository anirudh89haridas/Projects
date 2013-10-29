<!--- Get the URL. --->
<cfset strURL = (
CGI.server_name &
GetDirectoryFromPath( CGI.script_name ) &
"index.cfm"
) />
<!--- Create the XML data to post. --->
<cfset filePath = "#expandpath('.')#\generatedmessage.txt">
<cfset strXML = FileRead(filePath)>
 
 
 <cfset objRequest = GetHttpRequestData() />
<!---
Post the XML data to catch page. We are going
to post this value as an XML object will actually
just post it as an XML body.
--->
<cfhttp
url="#strURL#"
method="POST"
useragent="#CGI.http_user_agent#"
result="objGet">
 
<!---
When posting the xml data, remember to trim
the value so that it is valid XML.
--->
<cfhttpparam
type="XML"
value="#strXML.Trim()#"
/>
 
</cfhttp>

<!--- Output the return message. --->



 
