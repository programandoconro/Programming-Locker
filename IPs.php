//Programa para ver la IP del servidor local y remota

<h1>Local<h1> 
<h4><h4> 

<?php


$ip_server = $_SERVER['SERVER_ADDR']; 

echo "IP del servidor local: $ip_server"; 

?> 

<h1>Remoto<h1/> 
<h4><h4>
<?php 


$ipr = $_SERVER['REMOTE_ADDR']; 

echo "IP del servidor remoto: $ipr", "<br>"; 

?> 






