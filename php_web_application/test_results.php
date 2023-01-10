<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8:">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointments</title>
    <link rel="stylesheet" href="stylesheet.css">
   
</head>

<body>

<?php
print '<center>';
include 'View/header.php';
include 'ConnectionData.txt';
?>

<form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
    Enter Patient SSN to View Test Results: <br>
    <input type="text" name="ssn">
    <br>
    <input type="submit">
</form>


<?php

if (isset($_REQUEST['ssn'])) {
    $ssn = $_REQUEST['ssn'];

    $query_testresults = "SELECT Doctor_Name, Test_Type, Result
                            FROM MEDICAL_TEST
                            WHERE Patient_SSN = '$ssn'";

    $result_testresults = mysqli_query($link, $query_testresults);

    print "<pre>";
    print "<table border=1>";
    print "<tr><td>Type of Test</td><td>Result</td><td>Issuing Physician</td>";

    while($row = mysqli_fetch_assoc($result_testresults))
    {
        print "\n";
        print "<tr><td> $row[Test_Type] </td><td> $row[Result] </td><td> $row[Doctor_Name] </td></tr>";
    }

    print "</table>";
    print "</pre>";

    mysqli_free_result($result_testresults);

    mysqli_close($link);

}


include 'View/footer.php';
print '</center>';
?>

</body>

</html>
