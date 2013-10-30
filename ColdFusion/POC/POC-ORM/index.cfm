<!---
* This example demonstrates Auto-generation of tables.
* This example will teach you
* - how to auto-generate tables in ORM
* - to fill data into the auto-generated tables
* - DDL-only attributes
* - how to use custom Naming Strategy

* 'test_datasource' is a datasource which should be created
* as a pre-requisite for this example. Artists table contains
* a list of artists records.  Art table contains a list of art
* records.  Artists table has a one-to-many relationship with
* Art table. These table would be created used in this example.
--->

<!---Load the artists and dump it--->


<cfset testc = createObject("component","com.service")  />

<cfdump var="#testc.getTest()#">