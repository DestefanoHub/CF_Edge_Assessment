<!--- 

	Task 1: 
	________

	Write code to find and display all duplicate numbers (and the number of occurrences) in the following array: 

	[11,2,15,2,2,64,15]

 --->

 <cfscript>
	numArray = [11,2,15,2,2,64,15];
	dupStruct = {};

	for(i = 1; i <= numArray.len(); i++){
		numDup = numArray.findAll(numArray[i]);

		if(numDup.len() > 1 && !dupStruct.keyExists(numArray[i])){
			dupStruct.insert(numArray[i], numDup);
		}
	}

	cfloop(collection=dupStruct, item='key'){
		writeOutput('#encodeForHTML(key)# occurs #encodeForHTML(dupStruct[key].len())# times <br/>');
	}
 </cfscript>