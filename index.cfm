<!DOCTYPE html>
<html>
  <head>
    <title>Senior ColdFusion Developer - Code Challenges</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <style type="text/css">
      body { font-family: sans-serif; font-size: 12pt; }
      h1, h2 { padding-bottom: 8px; border-bottom: 1px solid #ccc; }
      h4 { margin-top: 20px; }
      ol li { font-weight: bold; margin-top: 30px; border-top: 1px solid #ccc; padding-top: 30px; }
      ol li:first-child { border-top: none; padding-top: 0; }
      li p, li pre { font-weight: normal; }
      li pre { font-size: 12pt; margin-top: 10px; }
      a.task-link { display: inline-block; float: right; margin-left: 20px; text-transform: uppercase; font-size: 10pt; }
      .instructions, .tasks { margin-top: 40px; }
    </style>
  </head>
  <body>
    <div class="container">

      <div class="intro">
        <h1>Senior ColdFusion Developer Assessment</h1>
        <p>You will be challenged with a series of coding tasks, some easy, some more difficult.  The purpose of these exercises is to allow us an opportunity to evaluate your programming knowledge and techniques.</p>
        <p>In many cases, there are multiple ways to solve a challenge, so you should choose the approach you feel is best or feel most comfortable with.  We will be reviewing all code you produce to solve these challenges; bear in mind we are interested in seeing your use of best practices, security concepts, and optimization strategies.</p>
      </div>

      <div class="instructions">

        <h2>Instructions</h2>

        <p>Commandbox is installed and in the Windows PATH already.  Coding challenges can be found in <b>D:\netpub\wwwroot\tasks\</b>.  Spin up a Commandbox / Lucee instance in this directory to allow real-time testing of your work.</p>

        <h4>Database Details</h4>
        <ul>
          <li>IP: 127.0.0.1</li>
          <li>Port: 443</li>
          <li>Database: DeveloperTests</li>
          <li>User: cfdeveloper</li>
          <li>Password: cfdevtest</li>
        </ul>

        <p>A datasource named <b>DeveloperTests</b> has been defined in the Application.cfc in this directory.</p>

      </div>

      <div class="tasks">

        <h2>Tasks</h2>

        <p>The coding challenges you need to complete are listed below.  In the current folder, there is a .cfm file named for each task.  Please complete each coding task in the named template provided.</p>

        <ol>
          
          <li>
            <a href="./task1.cfm" target="_blank" class="task-link">Link to task1.cfm &gt;</a>
            Write code to find and display all duplicate numbers (and the number of occurrences) in the following array: 
            <pre>[11,2,15,2,2,64,15]</pre>
          </li>
          
          <li>
            <a href="./task2.cfm" target="_blank" class="task-link">Link to task2.cfm &gt;</a>
            Write code to remove all duplicates from the following array, display the de-duped array:
            <pre>[11,2,15,2,2,64,15]</pre>
          </li>
          
          <li>
            <a href="./task3.cfm" target="_blank" class="task-link">Link to task3.cfm &gt;</a>
            You have an array of integers representing the series 1 - 100.  Write a method to find and display any missing numbers in this array.
          </li>
          
          <li>
            <a href="./task4.cfm" target="_blank" class="task-link">Link to task4.cfm &gt;</a>
            Write code to check if a string contains only digits.
          </li>
          
          <li>
            <a href="./task5.cfm" target="_blank" class="task-link">Link to task5.cfm &gt;</a>
            Write code to find the number of occurrences of the letter a in 'Today is Monday'.
          </li>
          
          <li>
            <a href="./task6.cfm" target="_blank" class="task-link">Link to task6.cfm &gt;</a>
            Write a method to generate random, secure passwords.
          </li>
          
          <li>
            <a href="./task7.cfm" target="_blank" class="task-link">Link to task7.cfm &gt;</a>
            Given the following struct, write code to output its keys and their values alphabetically in a table; the table should have two columns, Key and Value, and should be sorted alphabetically on the Key column:
<pre>
  {
      "lastname" : "Smith",
      "ssn" : 123456789,
      "firstname" : "John",
      "address1" : "123 Main St.",
      "address2" : "#42",
      "city" : "Anytown",
      "zipcode" : "01234"
  }
</pre>
          </li>
          
          <li>
            <a href="./task8.cfm" target="_blank" class="task-link">Link to task8.cfm &gt;</a>
            Write code to display the server's host name.
          </li>
          
          <li>
            <a href="./task9.cfc" target="_blank" class="task-link">Link to task9.cfc &gt;</a>
            Refactor the component's code to the extent you feel is warranted.
          </li>
          
          <li>
            <a href="./task10.cfm" target="_blank" class="task-link">Link to task10.cfm &gt;</a>
            Debug and correct the method shown. When this template is run, all patterns should return a threat level of 10.  You may run the template initially to see what the current results are; make any corrections necessary to ensure all patterns tested return a value of 10.
          </li>
          
          <li>
            <a href="./task11.cfm" target="_blank" class="task-link">Link to task11.cfm &gt;</a>
            Using the 'DeveloperTests' database, write a query that sums up the total annual purchases per customer for the year 2019, ordered by most purchases to least.  Display the top ten in a table, alternating each row's background color.
          </li>
          
          <li>
            <a href="./task12.cfm" target="_blank" class="task-link">Link to task12.cfm &gt;</a>
            Salespeople earn commission on each purchase made by the customers to which they're assigned.  Using the 'DeveloperTests' database, calculate the commission earned in dollars per salesperson for the month of March 2019, and restrict to only those salespeople that have 5 or more customers assigned.  Display the results in a table, ordered by most commission earned to least.
          </li>
          
          <li>
            <a href="./task13.cfm" target="_blank" class="task-link">Link to task13.cfm &gt;</a>
           Using the 'DeveloperTests' database, write a query that lists all salespeople who have earned less than 6,000 dollars in commission total since Jan 1, 2019.  Commission stored in the salesperson table is a percentage value, so a 5.25 commission rate should be understood to be they earn 5.25% of all purchases made by customers they are assigned to.  Display the results in a table, ordered from least amount of commission to greatest.
          </li>
          
          <li>
            <a href="./task14.cfm" target="_blank" class="task-link">Link to task14.cfm &gt;</a>
            Write code to get and display the Image of the Day from www.bing.com .
          </li>
          
          <li>
            Leave your completed work on the VM and send an email indicating you've completed the coding challenges to devadmin@edgeinformation.com .
          </li>

        </ol>

      </div>

      <br>

    </div>
 
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.min.js"></script>
  </body>
</html>