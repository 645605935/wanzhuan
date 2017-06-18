<?php
error_reporting(E_ALL ^ E_NOTICE); 
date_default_timezone_set('PRC');


$data = file_get_contents('http://api.kaijiangtong.com/live/?name=jczq&format=json&uid=768005&token=26b9ddf4de91b0cd124a144655b9dabda65d5e29');
$array = json_decode($data,true);
echo "<pre>";
print_r($array);


?>