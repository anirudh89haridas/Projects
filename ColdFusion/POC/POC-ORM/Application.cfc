<cfcomponent>
    <cfset this.name = "ORM_Autogen">
    <cfset this.ormenabled = "true">
    <!---
    * 'ColdFusionORM' is a datasource which should be created
    * as a pre-requisite for this example. Artists table contains
    --->
    <cfset this.datasource = "ColdFusionORM">

    <!---
    * To auto-generate tables, dbcreate should be specified.
    * dbcreate is 'none' by default.
    * It can be 'dropcreate' or 'update'.
    * Setting it to 'update' creates the table if it does not
    * exist or update the table if it exists.
    * Setting it to 'dropcreate' drops the table if it
    * exists and then creates it.

    <cfset this.ormsettings.dbcreate = "dropcreate">
    --->
    <!---
    * Path to the SQL script file that should be executed after
    * ORM is initialized.
    * Note that this applies only if dbcreate is set to dropcreate.
    * This must be the absolute file path or the path relative
    * to the application.
    * The SQL script file lets you populate the tables before
    * the application is accessed.

    <cfset this.ormsettings.sqlscript="mssqlscript.sql">
	  
  --->
    <!---
    * (Logical column name is the name of the property OR the value
    * of the column attribute if specified)
    * By default, when auto-generating the tables, the logical column
    * name is used as the column name.
    * If you want to change it, you should use the namingstrategy setting.

    * By default, namingstrategy="default". 

    * namingstrategy="smart": This strategy changes the logical table or
    * column name to uppercase. Also, if the logical table or column name
    * is in camel case, this strategy breaks the camelcased name and separates
    * the broken words using '_'.
    * For eg: firstName -> FIRST_NAME, dateOfBirth -> DATE_OF_BIRTH.

    * If you want to use a custom strategy, then, you should create a CFC,
    * implement the cfide.orm.INamingStrategy interface and specify the CFC
    * name for this setting.  In this example, I have demonstrated the
    * custom strategy.
    --->
    <cfset this.ormsettings.namingstrategy="lcasestrategy">
	
	 <!---
    ColdFusion-ORM uses hibernate as its under-lying engine.  ColdFusion-ORM generates
    the hbm.xml file which contains the hibernate mapping.  To save the hibernate mapping
    that is generated, you need to set savemapping flag to true.  In this case, CArtists.hbm.xml
    file will be generated in the same folder as that of the application.
    --->
    <cfset this.ormsettings.savemapping="true" />
</cfcomponent>