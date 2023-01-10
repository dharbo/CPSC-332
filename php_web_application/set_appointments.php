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
    Add an Appointment: <br>
    <label required for="appointment_num"> Appointment Number: </label>
    <input type="text" name="appointment_num">
    <br>
    <label required for="patient_ssn"> Patient SSN: </label>
    <input type="text" name="patient_ssn">
    <br>
    <label required for="doctor_Id"> Doctor ID: </label>
    <input type="text" name="doctor_Id">
    <br>
    <label required for="appointment_time"> Appointment Time (Ex. 12:30:00) </label>
    <input type="text" name="appointment_time">
    <br>
    <label required for="appointment_date"> Appointment Date (Ex. 2002-12-20) <label>
    <input type="text" name="appointment_date">
    <br>
    <input type="submit">
</form>

<?php

$room_num = rand(0, 20);

if (isset($_REQUEST['appointment_num'])) {
    $an = $_REQUEST['appointment_num'];
    $ps = $_REQUEST['patient_ssn'];
    $di = $_REQUEST['doctor_Id'];
    $at = $_REQUEST['appointment_time'];
    $ad = $_REQUEST['appointment_date'];

    $query_app = "INSERT INTO APPOINTMENT (Appointment_Number, Patient_SSN, Doctor_ID, Appointment_Time, Appointment_Date, Room_number)
VALUES ('$an', '$ps', '$di', '$at', '$ad', '$room_num');";

    $result = mysqli_query($link, $query_app);
    
    echo "Succesfully Submitted";

    mysqli_free_result($result);
    mysqli_close($link);

}



include 'View/footer.php';
print '</center>';
?>

</body>

</html>

