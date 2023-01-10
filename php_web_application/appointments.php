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
    Enter SSN to View Appointments: <br>
    <input type="text" name="ssn">
    <br>
    <input type="submit">
</form>


<?php

if (isset($_REQUEST['ssn'])) {
    $ssn = $_REQUEST['ssn'];

    $query_appointments = "SELECT T1.Appointment_Number, T1.Appointment_Date, T1.Appointment_Time, T1.Room_number, DOCTOR.Last_Name
                            FROM
                            (SELECT* FROM APPOINTMENT WHERE Patient_SSN='$ssn') AS T1
                            INNER JOIN DOCTOR
                            ON T1.Doctor_ID=DOCTOR.Doctor_ID";

    $result_appointments = mysqli_query($link, $query_appointments);

    print "<pre>";
    print "<table border=1>";
    print "<tr><td>Appointment Number</td><td>Appointment Date</td><td>Appointment Time</td><td>Room Number</td><td>Doctor's Last Name</td>";

    while($row = mysqli_fetch_assoc($result_appointments))
    {
        print "\n";
        print "<tr><td> $row[Appointment_Number] </td><td> $row[Appointment_Date] </td><td> $row[Appointment_Time] </td><td> $row[Room_number] </td><td> $row[Last_Name] </td></tr>";
    }

    print "</table>";
    print "</pre>";

    mysqli_free_result($result_appointments);

    mysqli_close($link);

}


include 'View/footer.php';
print '</center>';
?>

</body>

</html>