<?php
error_reporting(E_ALL ^ E_NOTICE); 
date_default_timezone_set('PRC');

//���ýӿڲ���
$name = 'jczq';
$uid = '768005';
$token = '26b9ddf4de91b0cd124a144655b9dabda65d5e29';

//���û����ļ�
$cache_url = "".$name.".txt";

//�����ļ���������ʱ�䣩
$filemtime = filemtime($cache_url);

//�����ļ�������Ƶ�����ã�
$second = '10';
echo "http://api.caipiaokong.com/lottery/?name=".$name."&format=json&uid=".$uid."&token=".$token."";die;
if ( time() - $filemtime > $second ) {

    //���ò���
    $data = file_get_contents("http://api.caipiaokong.com/lottery/?name=".$name."&format=json&uid=".$uid."&token=".$token."");

    //$data����
    $array = json_decode($data,true);
    if(is_array($array)) {
        file_put_contents($cache_url,$data,LOCK_EX);
    }

}

//��ȡ����
$data = file_get_contents($cache_url);
$array = json_decode($data,true);

//�������
print_r($array);

foreach($array as $key => $value) {

    $html .= "<table>";
    $html .= "<tr>";

    $html .= "<td>".$key."</td>";

    //��������ֽ�
    $number = explode(",",$array[$key]['number']);
    foreach($number as $k => $v) {
        $html .= "<td><strong>".$v."</strong></td>";
    }

    $html .= "<td><em>".$array[$key]['dateline']."</em></td>";

    $html .= "</tr>";
    $html .= "</table>";

}

echo $html;

?>