<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8:">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CPSC332 Project Test Page</title>
    <link rel="stylesheet" href="stylesheet.css">
   
</head>

<body>

<?php
print '<center>';
include 'View/header.php';
include 'ConnectionData.txt';
?>

<img class="main-img" src="background.jpg" alt="health background">
<p class="main-text">
    Come visit us. Our highly skilled, experienced doctors are among the best in the world.
    <br>
    We'll deliver coordinated care that's upposrted by industry leading research, advanced
    <br>
    medical technology, and efficient workflows, tools, and systems!
</p>


<?php
include 'View/footer.php';
print '</center>';
?>


</body>

</html>