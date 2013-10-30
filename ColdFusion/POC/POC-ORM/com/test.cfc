<cfcomponent persistent="true" table="test">
      <cfproperty name="id" generator="identity" fieldtype="id" hint="I am the unique ID of this table." notnull="true" >
    <!---
    * Note that the attributes 'ormtype' and 'length' are used
    * only when the tables are auto-generated.  There are other
    * similar attributes like dbdefault, index, notnull, precision,
    * scale, sqltype, unique and uniquekey.
    --->
      <cfproperty name="name" ormtype="string" validate="string" validateparams="{ minlength=1, maxlength=50 }" fieldtype="column" length="50" notnull="true">
	  

	

</cfcomponent>