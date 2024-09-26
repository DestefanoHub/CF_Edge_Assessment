<!--- 

	Task 11: 
	________

	Using the 'DeveloperTests' database, write a query that sums up the total annual purchases per customer for the year 2019, ordered by most purchases to least.  Display the top ten in a table, alternating each row's background color.

 --->
<cfscript>
	/* 
		Some purchases don't have a customer record associated to them (orders.customerId is null), the inner join here filters out those records because they 
		are likely made by different customers and the sum of those order prices would be errorenous data.
	 */
	sqlStatement = "
		SELECT COUNT(orders.orderId) AS totalOrders, SUM(orders.purchaseAmount) AS totalPurchaseAmount, customer.fullname, customer.customerId 
		FROM orders
		JOIN customer ON orders.customerId = customer.customerId
		WHERE purchaseDate BETWEEN '2019-01-01' AND '2019-12-31'
		GROUP BY orders.customerId
		ORDER BY totalOrders DESC, totalPurchaseAmount DESC
		LIMIT 10
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
				<th>Customer ID</th>
				<th>Customer</th>
				<th>Total Purchases</th>
				<th>Total Amount</th>
			</tr></thead>
			<tbody>
				<cfscript>
					rowCount = 1;

					cfloop(query='resultSet'){
						rowClass = (rowCount % 2 == 0) ? 'evenRow' : 'oddRow';

						writeOutput('<tr class="#rowClass#">');
						writeOutput('<td>#encodeForHTML(customerId)#</td>');
						writeOutput('<td>#encodeForHTML(fullname)#</td>');
						writeOutput('<td>#encodeForHTML(totalOrders)#</td>');
						writeOutput('<td>$#encodeForHTML(totalPurchaseAmount)#</td>');
						writeOutput('</tr>');
						rowCount++;
					}
				</cfscript>
			</tbody>
		</table>
	</body>
</html>