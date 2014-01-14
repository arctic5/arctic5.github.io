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
	$usercheck = $_POST["username"];
	$passcheck = $_POST["password"];
	$db_query = mysql_query("SELECT * FROM users WHERE username = '" . $usercheck  . "'");
	if (mysql_num_rows($db_query) == 1){
		$record = mysql_fetch_array($db_query);
		if (md5($passcheck) == $record['password']){
			echo "Welcome, " . $usercheck . "! You are now logged in. <br/>";
			$_SESSION['user']= $usercheck;
			$_SESSION['pass']= $passcheck;
			}
		else
			echo "Sorry, wrong password. <br/>";
	}
	else
		echo "Sorry, wrong username. <br/>";

?>
<a href="index.php">Click here</a> to return to the main page.

<?php include("footer.php"); ?>

	</body>
</html>