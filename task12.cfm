<!--- 

	Task 12: 
	________

	Salespeople earn commission on each purchase made by the customers to which they're assigned.  Using the 'DeveloperTests' database, calculate the commission earned in dollars per salesperson for the month of March 2019, and restrict to only those salespeople that have 5 or more customers assigned.  Display the results in a table, ordered by most commission earned to least

 --->
<cfscript>
	/* 
		NOTE: This task DOES NOT state how to calculate commission, like task 13 explicitly does. However, since this task 
		specifically says 'calculate commission', I am using the approach from task 13 to calculate the commission by 
		using (rate * purchase amount total) / 100
	*/
	sqlStatement = "
		SELECT salesperson.salespersonId, salesperson.fullname, COUNT(customer.customerId) AS customerCount, SUM(orders.purchaseAmount * (CAST(commissionRate AS DECIMAL(12,2)))) AS commission
		FROM salesperson
		JOIN customer ON salesperson.salespersonId = customer.salespersonId
		JOIN orders ON customer.customerId = orders.customerId
		WHERE orders.purchaseDate BETWEEN '2019-03-01' AND '2019-03-31'
		GROUP BY salesperson.salespersonId
		HAVING customerCount >= 5
		ORDER BY commission DESC
	";
	sqlParams = [];
	sqlOptions = {datasource='DeveloperTests'}
	resultSet = queryExecute(sqlStatement, sqlParams, sqlOptions);
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

			.oddRow td{
				background-color: lightcoral;
			}

			.evenRow td{
				background-color: aqua;
			}
		</style>
	</head>
	<body>
		<table id='myTable'>
			<thead><tr>
				<th>Sales Person ID</th>
				<th>Sales Person</th>
				<th>Customer Count</th>
				<th>Commission</th>
			</tr></thead>
			<tbody>
				<cfscript>
					rowCount = 1;

					cfloop(query='resultSet'){
						rowClass = (rowCount % 2 == 0) ? 'evenRow' : 'oddRow';

						writeOutput('<tr class="#rowClass#">');
						writeOutput('<td>#encodeForHTML(salespersonId)#</td>');
						writeOutput('<td>#encodeForHTML(fullname)#</td>');
						writeOutput('<td>#encodeForHTML(customerCount)#</td>');
						writeOutput('<td>$#encodeForHTML(numberFormat(commission / 100, "9.99"))#</td>');
						writeOutput('</tr>');
						rowCOunt++;
					}
				</cfscript>
			</tbody>
		</table>
	</body>
</html>