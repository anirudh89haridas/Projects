<cfset testSuite = Request.obj.CreateCFC('Test.mxunit.framework.TestSuite').TestSuite() />
<cfset testSuite.addAll( "TestSuite1" ) />
<cfset testSuite.addAll( "TestSuite2" ) />
<cfset results = testSuite.run() />
