<!--- 

	Task 8: 
	________

	Write code to display the server's host name.

 --->
 <cfscript>
	writeOutput('Server Name: #encodeForHTML(cgi.SERVER_NAME)# <br/> HTTP Host: #encodeForHTML(cgi.HTTP_HOST)#');
 </cfscript>