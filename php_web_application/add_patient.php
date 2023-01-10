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
    Fill out your information to be added as a patient: <br>
    
    <label required for="SSN">Social Security Number:</label>
    <input required type="text" name="SSN">
    <br>
    <label required for="firstName">First Name:</label>
    <input type="text" name="firstName">
    <br>
    <label required for="lastName">Last Name:</label>
    <input type="text" name="lastName">
    <br>
    <label required for="phoneNumber">Phone Number:</label>
    <input type="text" name="phoneNumber">
    <br>
    <label required for="streetName">Street Name: </label>
    <input type="text" name="streetName">
    <br>
    <label required for="streetNumber">Street Number: </label>
    <input type="text" name="streetNumber">
    <br>
    <label required for="city">City: </label>
    <input type="text" name="city">
    <br>
    <label required for="zipcode">zipcode: </label>
    <input type="text" name="zipcode">
    <br>
    <label required for="Insurance_ID">Insurance ID: </label>
    <input type="text" name="Insurance_ID">
    <br>
    <input type="submit">
</form>

<?php

if (isset($_REQUEST['SSN'])) {
    $ssn = $_REQUEST["SSN"];
    $firstName = $_REQUEST["firstName"];
    $lastName = $_REQUEST["lastName"];
    $phoneNumber = $_REQUEST["phoneNumber"];
    $streetName = $_REQUEST["streetName"];
    $streeNumber = $_REQUEST["streetNumber"];
    $city = $_REQUEST["city"];
    $zipcode = $_REQUEST["zipcode"];
    $insuranceId = $_REQUEST["Insurance_ID"];

    $insert_query = "INSERT INTO PATIENT (SSN, Last_Name, First_Name, Primary_Phone_Number, Street_Name, Street_Number, City, Zip_Code, Insurance_ID) VALUES
    ('$ssn', '$lastName', '$firstName', '$phoneNumber', '$streetName', 'streetNumber', '$city', '$zipcode', '$insuranceId');";

    $result = mysqli_query($link, $insert_query);

    echo "Form Submitted";

    mysqli_close($link);
}

include 'View/footer.php';
print '</center>';
?>
