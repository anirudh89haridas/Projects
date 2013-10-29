<cfcomponent persistent="true" table="personal">

    <cfproperty name="PersonalID" fieldtype="id" generator="native">

    <cfproperty name="EmployeeObj" fieldtype="one-to-one" cfc="Employee" linktable="EmployeePersonal" fkcolumn="PersonalID" inverseJoinColumn="EmployeeID" cascade="all" inverse="true">

    <cfproperty name="SSN">

    <cfproperty name="FatherName">

</cfcomponent>
