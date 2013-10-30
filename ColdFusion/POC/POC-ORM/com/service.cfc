<cfcomponent >
<cffunction name="getTest" returnType="any" >
		<cfset ORMReload() />
<cfreturn EntityLoad("test",{id=2}) />
</cffunction>
</cfcomponent>