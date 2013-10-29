http://www.bennadel.com/blog/2398-Calling-CFFile-Upload-Twice-On-The-Same-File-For-Security-Purposes.htm
<!--- Param the form fields for the submit. --->
<cfparam name="form.submitted" type="boolean" default="false" />
<cfparam name="form.file" type="string" default="" />
 
<!--- I will hold errors generated during the upload processing. --->
<cfset errorMessage = "" />
 
<!--- I will hold the name of the uploaded file (if successful). --->
<cfset imagePath = "" />
 
 
<!--- Set the path for the uploads folder. --->
<cfset uploadDirectory = expandPath( "./uploads/" ) />
 
<!---
Set the path for our temporary directory - this is the
intermediary directory where will upload files that need to be
evaluated for safety.
 
NOTE: This should NOT be a web-accessible directory (however in
our demo, it is).
--->
<cfset tempDirectory = expandPath( "./secure/" ) />
 
 
<!--- ----------------------------------------------------- --->
<!--- ----------------------------------------------------- --->
 
 
<!--- Check to see if the form has been submitted. --->
<cfif form.submitted>
 
 
<cftry>
 
<!--- Make sure a file was selected. --->
<cfif !len( form.file )>
 
<cfthrow
type="FileNotFound"
message="Please select a file to upload."
/>
 
</cfif>
 
 
<!---
Make sure the file uploaded was actually an image. To do
this, we have to save the file to disk; however, we want
to make sure not to write to a place where an attacker
can stage a load-based attack on our file validation.
Let's use CFFILE to upload the file to the secure and
quarantined temp directory.
--->
<cffile
result="upload"
action="upload"
filefield="file"
destination="#tempDirectory#"
nameconflict="makeunique"
/>
 
<!--- Check if its an image file supported by ColdFusion. --->
<cfset uploadIsNotImage = !isImageFile( "#tempDirectory##upload.serverFile#" ) />
 
<!--- Delete the file now that we've validated it. --->
<cfset fileDelete( "#tempDirectory##upload.serverFile#" ) />
 
<!---
Check to see if we should continue processing. If the
file is not an image, there's nothing more to do.
--->
<cfif uploadIsNotImage>
 
<!--- ALERT: Possible Attack!! --->
<cfthrow
type="InvalidImageFile"
message="Please select a valid image file."
/>
 
</cfif>
 
 
<!---
If we've made it this far, then we know the user has
selected a valid image file. Now, we want to move the
file into the uploads directory. Let's use the CFFile
tag AGAIN in order to let ColdFusion handle the file
conflict resolution.
--->
<cffile
result="upload"
action="upload"
filefield="file"
destination="#uploadDirectory#"
nameconflict="makeunique"
/>
 
<!---
Set the path of the image so we can display it back
to the user.
--->
<cfset imagePath = "./uploads/#upload.serverFile#" />
 
 
<!--- Catch any upload processing errors. --->
<cfcatch>
 
<!--- Set the error message for the user. --->
<cfset errorMessage = cfcatch.message />
 
</cfcatch>
 
</cftry>
 
 
</cfif>
 
 
<!--- ----------------------------------------------------- --->
<!--- ----------------------------------------------------- --->
 
 
<!--- Reset the output buffer. --->
<cfcontent type="text/html; charset=utf-8" />
 
<cfoutput>
 
<!doctype html>
<html>
<head>
<title></title>
</head>
<body>
 
<h1>
Upload An Image
</h1>
 
 
<!--- Check to see if we have an error message to display. --->
<cfif len( errorMessage )>
 
<p>
<strong>Ooops:</strong> <em>#errorMessage#</em>
</p>
 
</cfif>
 
 
<form
method="post"
action="#cgi.script_name#"
enctype="multipart/form-data">
 
<input type="hidden" name="submitted" value="true" />
 
<p>
Please select an Image to upload:<br />
</p>
 
<p>
<input type="file" name="file" size="30" />
<input type="submit" value="Upload Image" />
</p>
 
</form>
 
 
<!---
Check to see if we have an uploaded image to display
back to the user.
--->
<cfif len( imagePath )>
 
<h3>
Your Upload:
</h3>
 
<p>
<img src="#imagePath#" width="400" />
</p>
 
</cfif>
 
</body>
</html>
 
</cfoutput>