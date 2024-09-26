<!--- 

	Task 2: 
	________

	Write code to remove all duplicates from the following array, display the de-duped array:

	[11,2,15,2,2,64,15]

 --->
<cfscript>
	/* numArray = [11,2,15,2,2,64,15];
	uniqueNumArray = [];
	
	filteredArray = numArray.filter(function(item) {		
		if(uniqueNumArray.find(item) > 0){
			return false;
		}
		
		uniqueNumArray.append(item);
		return true;
	});

	writeDump(filteredArray); */
</cfscript>

<cfscript>
	numArray = [11,2,15,2,2,64,15];
	
	filteredArray = numArray.filter(function(item, index) {		
		var dupArray = numArray.findAll(item);

		/* 
			For clarification, this statement is checking:
				1. if the dupArray has more than one item in it, meaning that the current number appears more than once
				2. if the current filter index is not equal to the first index of the duplicate array
					a. this means that we have encountered a position with a duplicate number, and this is not the first
						instance of that duplicate.

				- If the array is larger than 1 AND the current index is not equal to the first first position of the duplicate,
					then this number is a duplicate and the first instance of it has already been added.
				- If the array is length 1, or the array is larger than one but the current index is equal to the first 
					instance of the duplicate, the current number is not a duplicate.
		 */ 
		if(dupArray.len() > 1 && index != dupArray[1]){
			return false;
		}
		
		return true;
	});

	writeDump(filteredArray);
 </cfscript>