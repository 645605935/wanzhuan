<?php
namespace Home\Controller;
use Think\CommonController;

class PayController extends CommonController{
    public function _initialize(){
        parent::_initialize();
        
    }



    public function payment() {
        Vendor( 'pingpp.init');

        if (empty($_GET['channel']) || empty($_GET['amount'])) {
            echo 'channel or amount is empty';
            exit();
        }

        $channel = strtolower($_GET['channel']);
        $amount = 1;
        $number_info = $_GET['number_info'];
        $type = $_GET['type'];

        $order_no = substr(md5(time()), 0, 12);

        //此处生成订单
        $data=array();
        $data['channel']=$channel;
        $data['amount']=$amount;
        $data['number_info']=$number_info;
        $data['type']=$type;
        $data['order_no']=$order_no;
        $data['time']=time();

        $id=M('order_fotbal')->add($data);


        if($id){
            //$extra 在使用某些渠道的时候，需要填入相应的参数，其它渠道则是 array() .具体见以下代码或者官网中的文档。其他渠道时可以传空值也可以不传。
            $extra = array();
            switch ($channel) {
                case 'alipay' :
                    $extra = array();
                    break;
                case 'wx' :
                    $extra = array();
                    break;
            }


            \Pingpp\Pingpp::setApiKey('sk_live_e9K0K00G48K8WvDm5KOGeLC8');
            \Pingpp\Pingpp::setPrivateKeyPath(__DIR__ . '/rsa_private_key.pem');

            try {
                $ch = \Pingpp\Charge::create(
                    array(
                        'subject' => '竞彩彩票', 
                        'body' => '竞彩足球', 
                        'amount' => $amount, 
                        'order_no' => $order_no, 
                        'currency' => 'cny', 
                        'extra' => $extra, 
                        'channel' => $channel,
                        'client_ip' => get_client_ip(), 
                        'app' => array('id' => 'app_jD8GSGLeDmL0qTqL')
                    )
                );
                echo $ch;
            } catch (\Pingpp\Error\Base $e) { 
                //header('Status: ' . $e->getHttpStatus());
                header("Content-type:text/html;charset=utf-8");
                echo($e->getHttpBody());
            }
        }
    }


    // 支付成功
    public function charge_succeeded() {
        //PING++支付成功会向这个方法发送如下数据，此时根据接收数据进行订单状态的修改
        $event = json_decode(file_get_contents("php://input"));
        // 对异步通知做处理
        if (!isset($event->type)) {
            header($_SERVER['SERVER_PROTOCOL'] . ' 400 Bad Request');
            exit("fail");
        }
        switch ($event->type) {
            case "charge.succeeded":
                // 开发者在此处加入对支付异步通知的处理代码
                $order_no=$event->data->object->order_no;
                $channel=$event->data->object->channel;
                $time_paid=$event->data->object->time_paid;
                
                $data=array();
                $data['status']=1;
                $data['channel']=$channel;
                $data['time_paid']=$time_paid;
                
                M('jingcaizuqiu_order')->where(array('order_no'=>$order_no))->save($data);

                header($_SERVER['SERVER_PROTOCOL'] . ' 200 OK');
                break;
            case "refund.succeeded":
                // 开发者在此处加入对退款异步通知的处理代码
                header($_SERVER['SERVER_PROTOCOL'] . ' 200 OK');
                break;
            default:
                header($_SERVER['SERVER_PROTOCOL'] . ' 400 Bad Request');
                break;
        }
    }

}
