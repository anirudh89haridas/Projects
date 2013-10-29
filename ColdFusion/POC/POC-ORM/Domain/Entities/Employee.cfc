<cfcomponent persistent="true" table="employee">

    <cfproperty name="EmployeeID" generator="native">

    <cfproperty name="PersonalObj" fieldtype="one-to-one" linktable="EmployeePersonal" fkcolumn="EmployeeID" inversejoincolumn="PersonalID" cfc="personal" cascade="all" singularname="PersonalObj">

    <cfproperty name="LastName">

    <cfproperty name="FirstName">

</cfcomponent>
