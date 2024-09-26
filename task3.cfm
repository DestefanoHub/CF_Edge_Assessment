<!--- 

	Task 3: 
	________

	You have an array of integers representing the series 1 - 100.  Write a method to find and display any missing numbers in this array.

 --->
 <cfscript>
	myNumbers = [];

	//I am building the array programmatically, and programmatically omitting certain numbers.
	for(i = 1; i <= 100; i++){
		if(i % 10 != 0){
			myNumbers.append(i);
		}
	}
	
	//While the array omits certain numbers programmatically for convenience, the function does not care which numbers are omitted.
	array function findMissingNumbers(required array arg){
		var missingNumsArray = [];

		for(var j = 1; j <= 100; j++){
			if(!arg.find(j)){
				missingNumsArray.append(j);
			}
		}

		return missingNumsArray;
	}

	writeDump(findMissingNumbers(myNumbers));
 </cfscript>