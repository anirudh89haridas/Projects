<cfcomponent implements="cfide.orm.INamingStrategy">
    <!---
    * ColdFusion calls this method for each table name to generate
    * the new table name. The logical table name is the input.
    --->
    <cffunction name="getTableName" returntype="String" access="public">
        <cfargument name="tableName" type="String"> 

        <cfreturn lCase(tableName)> 

    </cffunction>

    <!---
    * ColdFusion calls this method for each column name to generated the
    * new column name. The logical column name is the input.
    --->
    <cffunction name="getColumnName" returntype="String" access="public">
        <cfargument name="columnName" type="String">

        <cfreturn lCase(columnName)> 

    </cffunction>
</cfcomponent>