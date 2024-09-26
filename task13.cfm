<!--- 

	Task 13: 
	________

	Using the 'DeveloperTests' database, write a query that lists all salespeople who have earned less than 6,000 dollars in commission total since Jan 1, 2019.  Commission stored in the salesperson table is a percentage value, so a 5.25 commission rate should be understood to be they earn 5.25% of all purchases made by customers they are assigned to.  Display the results in a table, ordered from least amount of commission to greatest.

 --->
 <cfscript>
	sqlStatement = "
		SELECT salesperson.salespersonId, salesperson.fullname, commissionRate, SUM(orders.purchaseAmount * (CAST(commissionRate AS DECIMAL(12,2)))) AS commission
		FROM salesperson
		JOIN customer ON salesperson.salespersonId = customer.salespersonId
		JOIN orders ON customer.customerId = orders.customerId
		WHERE orders.purchaseDate >= '2019-01-01'
		GROUP BY salesperson.salespersonId
		HAVING (commission DIV 100) < 6000
		ORDER BY commission ASC
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
				<th>Commission Rate</th>
				<th>Total Commission</th>
			</tr></thead>
			<tbody>
	 			<cfscript>
					rowCount = 1;

					cfloop(query='resultSet'){
						rowClass = (rowCount % 2 == 0) ? 'evenRow' : 'oddRow';

						writeOutput('<tr class="#rowClass#">');
						writeOutput('<td>#encodeForHTML(salespersonId)#</td>');
						writeOutput('<td>#encodeForHTML(fullname)#</td>');
						writeOutput('<td>#encodeForHTML(commissionRate)#</td>');
						writeOutput('<td>$#encodeForHTML(numberFormat(commission / 100, "9.99"))#</td>');
						writeOutput('</tr>');
						rowCOunt++;
					}
				</cfscript>
			</tbody>
		</table>
	</body>
</html>