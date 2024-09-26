<!--- 

	Task 7: 
	________

	Given the following struct, write code to output its keys and their values alphabetically in a table; the table should have two columns, Key and Value, and should be sorted alphabetically on the Key column:

	{
	    "lastname" : "Smith",
	    "ssn" : 123456789,
	    "firstname" : "John",
	    "address1" : "123 Main St.",
	    "address2" : "#42",
	    "city" : "Anytown",
	    "zipcode" : "01234"
	}

 --->
<cfscript>
	exampleStructBox = {
		"lastname" : "Smith",
	    "ssn" : 123456789,
	    "firstname" : "John",
	    "address1" : "123 Main St.",
	    "address2" : "##42",
	    "city" : "Anytown",
	    "zipcode" : "01234"
	};

	keyList = exampleStructBox.keyArray();
	keyListSorted = keyList.sort('textnocase', 'asc');
</cfscript>

<!DOCTYPE html>
<html lang='en'>
	<head>
		<style>
			#myTable{
				min-width: 20em;
				border: 1px solid black;
				border-collapse: collapse;
			}

			#myTable th, #myTable td{
				border: 1px solid black;
			}
		</style>
	</head>
	<body>
		<table id='myTable'>
			<thead><tr><th>Key</th><th>Value</th></tr></thead>
			<tbody>
				<cfscript>
					for(i = 1; i <= keyListSorted.len(); i++){
						writeOutput('<tr>');
						writeOutput('<td>#encodeForHTML(keyListSorted[i])#</td>');
						writeOutput('<td>#encodeForHTML(exampleStructBox[keyListSorted[i]])#</td>');
						writeOutput('</tr>');
					}
				</cfscript>
			</tbody>
		</table>
	</body>
</html>