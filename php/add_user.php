<?php session_start(); 
include('config.php');
?>
<html>
<head>
<title>My Data</title>
		<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>

<?php include("header.php"); ?>
<p class="welcome" id="greeting">
<?php
  $db_query="INSERT INTO users (username, password) VALUES ('$_POST[addusername]',md5('$_POST[addpassword]'))";

if (!mysql_query($db_query))
  {
  die('Error: ' . mysql_error());
  }
echo "User Added";
?>
</p>
<a href="index.php">Click here</a> to return to the main page.
<?php include("footer.php"); ?>

	</body>
</html>