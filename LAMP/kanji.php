<!DOCTYPE html>
<html>

<h2> 今日の漢字は: </h2>

<h1 style=font-size:200px>
<?php
/* ejemplo 1 */

$str = "人一丨口日目儿見凵山出十八木未丶来大亅了子心土冂田思二丁彳行寸寺時卜上丿刀分厶禾私中彐尹事可亻何自乂又皮彼亠方生月門間扌手言女本乙气気干年三耂者刂前勹勿豕冖宀家今下白勺的云牛物立小文矢知入乍作聿書学合";

$i=rand(0,100) ;
echo mb_substr($str,  $i, 1) ;

echo "<script language='javascript' type='text/javascript'>";
echo "alert('roの漢字へようこそ');";
echo "</script>";

?>

</h1>
<?php
//Programa para ver la IP del servidor local y remota
$ip_server = $_SERVER['SERVER_ADDR']; 
echo "IP local: $ip_server "; 
?> 

<?php 
$ipr = $_SERVER['REMOTE_ADDR']; 
echo " IP remoto: $ipr", "<br>"; 

echo "<pre>$salida2</pre>";
?>

</html>
