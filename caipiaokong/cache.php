<?php
//�������ݳ���
date_default_timezone_set('PRC');

//�ӿ���ַ
// $apiurl = "http://api.caipiaokong.com/lottery/?name=******&format=******&uid=******&token=******";
$apiurl = "http://api.caipiaokong.com/lottery/?name=jczq&format=json&uid=768005&token=26b9ddf4de91b0cd124a144655b9dabda65d5e29";


//�����ļ���
$cachefile = "cache.xml";

//�����ļ���������ʱ�䣩
$filemtime = filemtime($cachefile);

//�����ļ�������Ƶ�����ã�
$second = '5';

if ( time() - $filemtime > $second ) {

    //���ò���
    $data = file_get_contents($apiurl);
    file_put_contents("".$cachefile."",$data,LOCK_EX);

}

?>