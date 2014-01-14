<?php
     $db_con = mysql_connect("mysql-w","w2023843admin","jasonwong99");
          if (!$db_con){
          die('Could not connect: ' . mysql_error());
     }
     mysql_select_db("w2023843_login");
?>