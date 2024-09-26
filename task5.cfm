<!--- 

	Task 5: 
	________

	Write code to find the number of occurrences of the letter a in 'Today is Monday'.

 --->
 <cfscript>
	str = "Today is Monday";
	/* strArray = listToArray(uCase(str), "");
	dupArray = strArray.findAll("A");
	writeOutput("The letter 'a' was found #encodeForHTML(dupArray.len())# times in the sentence '#encodeForHTML(str)#'"); */

	reps = reFindNoCase('a', str, 1, false, "all").len();
	writeOutput("The letter 'a' was found #encodeForHTML(reps)# times in the sentence '#encodeForHTML(str)#'");
 </cfscript>