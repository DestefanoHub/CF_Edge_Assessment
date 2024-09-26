<!--- 

	Task 4: 
	________

	Write code to check if a string contains only digits.

 --->

<cfscript>
	checkStringArray = [
		"Hello World!",
		"Your total is $14.99",
		"1234",
		"11.95"
	];

	checkStringArray.each(function(str){
		if(reFindNoCase("^\d+$", str)){
			writeOutput("The string #encodeForHTML(str)# contains only digits. <br/>");
		}
	});
</cfscript>