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
    Enter a Specialty to view who can help you: <br>
    <input type="text" name="specialty">
    <br>
    <input type="submit">
</form>


<?php

if (isset($_REQUEST['specialty'])) {
    $specialty = $_REQUEST['specialty'];

    $query_doctors = "SELECT First_Name, Last_Name, Phone_Number
                            FROM DOCTOR
                            WHERE Specialty='$specialty'";

    $result_doctors = mysqli_query($link, $query_doctors);

    print "<pre>";
    print "<table border=1>";
    print "<tr><td>First Name</td><td>Last Name</td><td>Phone Number</td>";

    while($row = mysqli_fetch_assoc($result_doctors))
    {
        print "\n";
        print "<tr><td> $row[First_Name] </td><td> $row[Last_Name] </td><td> $row[Phone_Number] </td></tr>";
    }

    print "</table>";
    print "</pre>";

    mysqli_free_result($result_doctors);

    mysqli_close($link);

}


include 'View/footer.php';
print '</center>';
?>

</body>

</html>