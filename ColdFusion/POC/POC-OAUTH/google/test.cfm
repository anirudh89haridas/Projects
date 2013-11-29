<cfset sampleURL = "http://www.flipkart.com/">    
<cfset  body = {"longUrl"=sampleURL}>

    <cfset body = serializeJson(body)>
<cfhttp url="https://www.googleapis.com/urlshortener/v1/url" method="post" result="esult">
    <cfhttpparam type="header" name="Authorization" value="OAuth #session.token.access_token#" >
 	<cfhttpparam type="header" name="Content-Type" value="application/json">
   <cfhttpparam type="body" value="#body#">
</cfhttp>

<cfdump var="#deserializeJSON(esult.filecontent.tostring())#">

 

<cfhttp url="https://www.googleapis.com/urlshortener/v1/url/history">
   <cfhttpparam type="header" name="Authorization" value="OAuth #session.token.access_token#" > 
</cfhttp>
<cfdump var="#deserializeJSON(cfhttp.filecontent.tostring())#">
<cfset sampleURL = "http://www.coldfusionjedi.com/">
<cfset test = googleURLShorten(sampleURL)>
<cfdump var="#test#">
<cffunction name="googleURLShorten" output="false" returnType="any">
    <cfargument name="url" type="string" required="true">
    <cfset var httpResult = "">
    <cfset var result = "">

    <cfset var body = {"longUrl"=arguments.url}>

    <cfset body = serializeJson(body)>
    
    <cfhttp url="https://www.googleapis.com/urlshortener/v1/url" method="post" result="httpResult">
        <cfhttpparam type="header" name="Content-Type" value="application/json">
        <cfhttpparam type="body" value="#body#">
    </cfhttp>
    <cfset result = httpResult.filecontent.toString()>
    <cfreturn deserializeJSON(result)>
</cffunction>
