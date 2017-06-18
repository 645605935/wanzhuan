<?php
namespace Home\Controller;
use Think\CommonController;

class ApiController extends CommonController{
    public function _initialize(){
        parent::_initialize();
    }

    // 焦点图列表
    public function get_banner_list(){
        // echo json_encode($_GET);die;

        $where=array();
        if($_GET['pid']){
            $where['pid']=$_GET['pid'];
        }
        
        $list = M('Type')->where($where)->order('id desc')->select();
        foreach ($list AS $key => $value) {
            $list[$key]['img']      = "http://" .$_SERVER['HTTP_HOST']."/Uploads/". $value['img'];
        }
        // dump($list);die;

        echo json_encode($list);
    }

    // activity活动列表
    public function get_activity_list(){
        // echo json_encode($_GET);die;

        $where=array();
        if($_GET['city']){
            $where['city']=$_GET['city'];
        }
        if($_GET['type']){
            $where['type']=$_GET['type'];
        }
        
        $list = M('activity')->where($where)->order('id desc')->select();
        // foreach ($list AS $idx => $row) {
        //     $list[$idx]['goods_thumb']      = "http://" .$_SERVER['HTTP_HOST']."/". $row['goods_thumb'];
        //     $list[$idx]['goods_img']        = "http://" .$_SERVER['HTTP_HOST']."/". $row['goods_img'];
        // }
        // dump($list);die;

        echo json_encode($list);
    }

    // activity单个活动
    public function get_activity_row(){
        // echo json_encode($_GET);die;

        $where=array();
        if($_GET['activity_id']){
            $where['id']=$_GET['activity_id'];
        }
        
        $row = M('activity')->where($where)->find();
        // $row['img']      = "http://" .$_SERVER['HTTP_HOST']."/Uploads/". $row['img'];

        echo json_encode($row);
    }

    

    

    // news新闻列表
    public function get_news_list(){
        // echo json_encode($_GET);die;

        $where=array();
        // if($_GET['city']){
        //     $where['city']=$_GET['city'];
        // }
        // if($_GET['type']){
        //     $where['type']=$_GET['type'];
        // }
        
        $list = M('news')->where($where)->order('id desc')->select();
        // foreach ($list AS $idx => $row) {
        //     $list[$idx]['goods_thumb']      = "http://" .$_SERVER['HTTP_HOST']."/". $row['goods_thumb'];
        //     $list[$idx]['goods_img']        = "http://" .$_SERVER['HTTP_HOST']."/". $row['goods_img'];
        // }
        // dump($list);die;

        echo json_encode($list);
    }

    // news单个新闻
    public function get_news_row(){
        // echo json_encode($_GET);die;

        $where=array();
        if($_GET['newsId']){
            $where['news_id']=$_GET['newsId'];
        }
        
        $row = M('news')->where($where)->find();
        // $row['img']      = "http://" .$_SERVER['HTTP_HOST']."/Uploads/". $row['img'];

        echo json_encode($row);
    }


    // merchant商家列表
    public function get_merchant_list(){
        // echo json_encode($_GET);die;

        $where=array();
        // if($_GET['city']){
        //     $where['city']=$_GET['city'];
        // }
        // if($_GET['type']){
        //     $where['type']=$_GET['type'];
        // }
        
        $list = M('merchant')->where($where)->order('id desc')->select();
        // foreach ($list AS $idx => $row) {
        //     $list[$idx]['goods_thumb']      = "http://" .$_SERVER['HTTP_HOST']."/". $row['goods_thumb'];
        //     $list[$idx]['goods_img']        = "http://" .$_SERVER['HTTP_HOST']."/". $row['goods_img'];
        // }
        // dump($list);die;

        echo json_encode($list);
    }

    // merchant商家列表
    public function search_merchant_list(){
        // echo json_encode($_GET);die;

        $where=array();
        if($_GET['city']){
            $where['city']=$_GET['city'];
        }
        if($_GET['type']){
            $where['type']=$_GET['type'];
        }
        
        $list = M('merchant')->where($where)->order('id desc')->select();
        // foreach ($list AS $idx => $row) {
        //     $list[$idx]['goods_thumb']      = "http://" .$_SERVER['HTTP_HOST']."/". $row['goods_thumb'];
        //     $list[$idx]['goods_img']        = "http://" .$_SERVER['HTTP_HOST']."/". $row['goods_img'];
        // }
        // dump($list);die;

        echo json_encode($list);
    }

    

    // merchant单个商家
    public function get_merchant_row(){
        // echo json_encode($_GET);die;

        $where=array();
        if($_GET['merchantId']){
            $where['merchantId']=$_GET['merchantId'];
        }
        
        $row = M('merchant')->where($where)->find();
        // $row['img']      = "http://" .$_SERVER['HTTP_HOST']."/Uploads/". $row['img'];

        echo json_encode($row);
    }

    // city所有城市
    public function get_all_city(){
        // echo json_encode($_GET);die;

        $where=array();
        $where['pid']=1284;

        $list = M('type')->where($where)->order('id desc')->select();
        echo json_encode($list);
    }

    // type所有类型
    public function get_all_type(){
        // echo json_encode($_GET);die;

        $where=array();
        $where['pid']=1285;

        $list = M('type')->where($where)->order('id desc')->select();
        echo json_encode($list);
    }

    // user获取用户信息
    public function get_userinfo(){
        // echo json_encode($_GET);die;

        $where=array();
        if($_GET['uid']){
            $where['id']=$_GET['uid'];
        }
        
        $row = M('user')->where($where)->find();
        // $row['img']      = "http://" .$_SERVER['HTTP_HOST']."/Uploads/". $row['img'];

        echo json_encode($row);
    }

    
    // 用户所有收藏列表（三个表）
    public function get_user_all_fav(){
        // echo json_encode($_GET);die;

        $where=array();
        if($_GET['uid']){
            $where['uid']=$_GET['uid'];
        }
        $where['uid']=1;
        $_mer_list = M('mer_fav')->where($where)->order('time desc')->select();
        $_news_list = M('news_fav')->where($where)->order('time desc')->select();
        $_act_list = M('act_fav')->where($where)->order('time desc')->select();

        foreach ($_mer_list AS $key1 => $value1) {
        	$temp=M('merchant')->where(array('id'=>$value1['mid']))->find();
            $_mer_list[$key1]['img'] = "http://" .$_SERVER['HTTP_HOST']."/Uploads/". $temp['img'];
        }

        foreach ($_news_list AS $key2 => $value2) {
        	$temp=M('news')->where(array('id'=>$value2['nid']))->find();
            $_news_list[$key2]['img'] = "http://" .$_SERVER['HTTP_HOST']."/Uploads/". $temp['img'];
        }

        foreach ($_act_list AS $key3 => $value3) {
        	$temp=M('activity')->where(array('id'=>$value3['aid']))->find();
            $_act_list[$key3]['img'] = "http://" .$_SERVER['HTTP_HOST']."/Uploads/". $temp['img'];
        }

        $list=array();
        $list['mer_fav']=$_mer_list;
        $list['news_fav']=$_news_list;
        $list['act_fav']=$_act_list;

        echo json_encode($list);
    }


    
    // activity用户的活动收藏列表
    public function get_user_activity(){
        // echo json_encode($_GET);die;

        $_json=file_get_contents('php://input');
        $_arr=json_decode($_json,true);

        $ids=explode(',', $_arr['ids']);

        $where=array();
        $where['id']=array('in',$ids);

        $list = M('activity')->where($where)->select();

        echo json_encode($list);
    }

    // merchant用户的商家收藏列表
    public function get_user_merchant(){
        // echo json_encode($_GET);die;

        $_json=file_get_contents('php://input');
        $_arr=json_decode($_json,true);

        $ids=explode(',', $_arr['ids']);

        $where=array();
        $where['id']=array('in',$ids);

        $list = M('merchant')->where($where)->select();

        echo json_encode($list);
    }

    // news用户的新闻收藏列表
    public function get_user_news(){
        // echo json_encode($_GET);die;

        $_json=file_get_contents('php://input');
        $_arr=json_decode($_json,true);

        $ids=explode(',', $_arr['ids']);

        $where=array();
        $where['id']=array('in',$ids);

        $list = M('news')->where($where)->select();

        echo json_encode($list);
    }

    // news用户的退出
    public function user_loginOut(){
        $where=array();
        if($_GET['uid']){
            $where['id']=$_GET['uid'];
        }
        
        $data=array();
        $data['status']=-1;
        $data['loginOut_time']=time();
      
        $res = M('user')->where($where)->save($data);

        if($res){
            $data=array();
            $data['code']=0;
            $data['msg']='退出成功';
            echo json_encode($data);
        }else{
            $data=array();
            $data['code']=1;
            $data['msg']='退出失败';
            echo json_encode($data);
        }

        echo json_encode($data);
    }

    // 查找用户-登录
    public function find_user_by_wx_id(){
        // echo json_encode($_GET);die;

        $_json=file_get_contents('php://input');
        $_arr=json_decode($_json,true);

        $wx_id=$_arr['wx_id'];

        $where=array();
        $where['wx_id']=$wx_id;

        $row = M('user')->where($where)->find();

        if($row){
            $data=array();
            $data['code']=0;
            $data['msg']='success';
            $data['user_info']=$row;
        }else{
            $data=array();
            $data['code']=1;
            $data['msg']='error';
        }

        echo json_encode($data);
    }


    // 用户登录
    public function user_login(){
        // echo json_encode($_GET);die;

        $_json=file_get_contents('php://input');
        $_arr=json_decode($_json,true);

        $username=$_arr['username'];
        $password=md5($_arr['password']);

        $where=array();
        $where['username']=$username;
        $where['password']=$password;

        $row = M('user')->where($where)->find();

        if($row){
            $data=array();
            $data['code']=0;
            $data['msg']='success';
            $data['user_info']=$row;
            echo json_encode($data);
        }else{
            $data=array();
            $data['code']=1;
            $data['msg']='error';
            echo json_encode($data);
        }

        echo json_encode($data);
    }


    // 用户注册
    public function user_register(){
        // echo json_encode($_GET);die;

        $_json=file_get_contents('php://input');
        $_arr=json_decode($_json,true);

        $username=$_arr['username'];
        $password=md5($_arr['password']);

        $register_time=time();
        $data=array();
        $data['username']=$username;
        $data['password']=md5($password);
        $data['gid']=412;
        $data['register_time']=$register_time;
        $data['time']=$register_time;

        $id = M('user')->add($data);
        $row= M('user')->find($id);
        if($row){
            $data=array();
            $data['code']=0;
            $data['msg']='success';
            $data['user_info']=$row;
            echo json_encode($data);
        }else{
            $data=array();
            $data['code']=1;
            $data['msg']='error';
            echo json_encode($data);
        }

        echo json_encode($data);
    }


    // wx注册用户
    public function wx_register(){
        $_json=file_get_contents('php://input');
        $_arr=json_decode($_json,true);
        // echo json_encode($_arr);die;

        $password=$_arr['password'];
        $username=$_arr['username'];
        $wx_id=$_arr['wx_id'];
        $wx_user_info=$_arr['wx_user_info'];

        $data=array();
        $data['username']=$username;
        $data['password']=$password;
        $data['wx_id']=$wx_id;
        $data['wx_user_info']=$wx_user_info;

        $id=M('user')->add($data);
        $row=M('user')->find($id);

        if($row){
            $data=array();
            $data['code']=0;
            $data['msg']='注册成功';
            $data['user_info']=$row;
            echo json_encode($data);
        }else{
            $data=array();
            $data['code']=1;
            $data['msg']='注册失败';
            echo json_encode($data);
        }
    }

    // 保存足彩
    public function add_jingcaizuqiu_order(){
        $_json=file_get_contents('php://input');
        $_arr=json_decode($_json,true);

        $order_time=time();

        $data=array();
        $data['order_no']=substr(md5(time()), 0, 12);
        $data['uid']='274';
        $data['amount']='2';
        $data['number_info']=$_json;
        $data['type']='竞彩足球';
        $data['time']=$order_time;

        $id = M('jingcaizuqiu_order')->add($data);
        $data=array();
        if($id){
            $row=M('jingcaizuqiu_order')->find($id);
            $data['code']=0;
            $data['msg']='success';
            $data['data']=$row;
        }else{
            $data['code']=1;
            $data['msg']='error';
        }
        
        header("Access-Control-Allow-Origin: *");
        echo json_encode($data);
    }


    // jingcaizuqiu_order订单详情
    public function get_jingcaizuqiu_order_row(){
        // echo json_encode($_GET);die;

        $where=array();
        if($_GET['jingcaizuqiu_order_id']){
            $where['id']=$_GET['jingcaizuqiu_order_id'];
        }
        
        $row = M('jingcaizuqiu_order')->where($where)->find();

        echo json_encode($row);
    }

    // 获取竞彩足球列表
    public function get_jingcaizuqiu_list(){
        $where=array();
        // $where['id']=array('in',$ids);

        $list = M('jingcaizuqiu')->where($where)->limit(10)->select();

        echo json_encode($list);
    }
























































    // // 获取单个商品
    // public function get_one_goods(){
    //     // echo json_encode($_GET);die;

    //     $model_goods=M('goods');
    //     $model_goods_attr=M('goods_attr');
    //     $model_goods_gallery=M('goods_gallery');
    //     $goods_id=$_GET['goods_id'];

    //     $row = $model_goods->find($goods_id);
    //     $row['goods_thumb']      = "http://" .$_SERVER['HTTP_HOST']."/". $row['goods_thumb'];
    //     $row['goods_img']        = "http://" .$_SERVER['HTTP_HOST']."/". $row['goods_img'];

    //     //获取焦点图图片
    //     $gallery_list = $model_goods_gallery->where(array('goods_id'=>$goods_id))->select();
    //     foreach ($gallery_list AS $key => $value) {
    //         $gallery_list[$key]['img_url']      = "http://" .$_SERVER['HTTP_HOST']."/". $value['img_url'];
    //     }
    //     $row['_goods_gallery_img']        = $gallery_list;

    //     //根据颜色获取焦点图图片
    //     $attr_list = $model_goods_attr->where(array('goods_id'=>$goods_id, 'attr_id'=>211))->select();
    //     foreach ($attr_list AS $key => $value) {
    //         $attr_list[$key]['attr_img']      = "http://" .$_SERVER['HTTP_HOST']."/". $value['attr_img'];
    //     }
    //     $row['_goods_attr_img']        = $attr_list;

    //     // dump($list);die;
    //     echo json_encode($row);die;
    // }

    // // 获取品牌
    // public function get_brands(){
    //     // echo json_encode($_GET);die;

    //     $model_suppliers=M('suppliers');
    //     $brand_list = $model_suppliers->where(array('brand_status'=>1))->limit(16)->select();

    //     $list=array();
    //     foreach ($brand_list AS $idx => $row)
    //     {
    //         $list[$idx]['suppliers_id']      = $row['suppliers_id'];
    //         $list[$idx]['suppliers_name']    = $row['suppliers_name'];
    //         $list[$idx]['supp_brand']         = "http://" .$_SERVER['HTTP_HOST']."/".$row['supp_brand'];
    //     }

    //     $_list_= array();
    //     for($i=0;$i<ceil(count($list)/4);$i++){
    //         $_list_[$i] = array_slice($list, $i * 4 ,4);
    //     }

    //     echo json_encode($_list_);die;
    // }


    // // 根据qqId查找用户
    // public function find_user_by_qqId(){
    //     // echo json_encode($_GET);die;
    //     $qq_id=$_GET['qq_id'];
    //     $row = M('users')->where(array('qq_id'=>$qq_id))->find();

    //     if($row){
    //         $data=array();
    //         $data['code']=0;
    //         $data['msg']='找到，不用注册';
    //         $data['user_info']=$row;
    //         echo json_encode($data);
    //     }else{
    //         $data=array();
    //         $data['code']=1;
    //         $data['msg']='未找到，需要注册';
    //         echo json_encode($data);
    //     }
    // }

    // // 单个商家信息
    // public function find_suppliers_by_suppliers_id(){
    //     // echo json_encode($_GET);die;
    //     $suppliers_id=$_GET['suppliers_id'];
    //     $row = M('suppliers')->where(array('suppliers_id'=>$suppliers_id))->find();

    //     $row['supp_brand']="http://www.0zpm.com/".$row['supp_brand'];
    //     $row['supp_logo']="http://www.0zpm.com/".$row['supp_logo'];

    //     if($row){
    //         $data=array();
    //         $data['code']=0;
    //         $data['msg']='成功';
    //         $data['data']=$row;
    //         echo json_encode($data);
    //     }else{
    //         $data=array();
    //         $data['code']=1;
    //         $data['msg']='失败';
    //         echo json_encode($data);
    //     }
    // }

    // // 根据wxId查找用户
    // public function find_user_by_wxId(){
    //     // echo json_encode($_GET);die;
    //     $wx_id=$_GET['wx_id'];
    //     $row = M('users')->where(array('wx_id'=>$wx_id))->find();

    //     if($row){
    //         $data=array();
    //         $data['code']=0;
    //         $data['msg']='找到，不用注册';
    //         $data['user_info']=$row;
    //         echo json_encode($data);
    //     }else{
    //         $data=array();
    //         $data['code']=1;
    //         $data['msg']='未找到，需要注册';
    //         echo json_encode($data);
    //     }
    // }

    // // 删除地址
    // public function del_address(){
    //     // echo json_encode($_GET);die;
    //     $address_id=$_GET['address_id'];
    //     $res = M('user_address')->where(array('address_id'=>$address_id))->delete();

    //     if($res){
    //         $data=array();
    //         $data['code']=0;
    //         $data['msg']='删除成功';
    //         echo json_encode($data);
    //     }else{
    //         $data=array();
    //         $data['code']=1;
    //         $data['msg']='删除失败';
    //         echo json_encode($data);
    //     }
    // }


    // // qq注册用户
    // public function qq_register(){
    //     $_json=file_get_contents('php://input');
    //     $_arr=json_decode($_json,true);
    //     // echo json_encode($_arr);die;

    //     $password=$_arr['password'];
    //     $user_name=$_arr['user_name'];
    //     $qq_id=$_arr['qq_id'];
    //     $qq_user_info=$_arr['qq_user_info'];

    //     $data=array();
    //     $data['user_name']=$user_name;
    //     $data['password']=$password;
    //     $data['qq_id']=$qq_id;
    //     $data['qq_user_info']=$qq_user_info;

    //     $id=M('users')->add($data);
    //     $row=M('users')->find($id);

    //     if($id && $row){
    //         $data=array();
    //         $data['code']=0;
    //         $data['msg']='注册成功';
    //         $data['user_info']=$row;
    //         echo json_encode($data);
    //     }else{
    //         $data=array();
    //         $data['code']=1;
    //         $data['msg']='注册失败';
    //         echo json_encode($data);
    //     }
    // }

    // // wx注册用户
    // public function wx_register(){
    //     $_json=file_get_contents('php://input');
    //     $_arr=json_decode($_json,true);
    //     // echo json_encode($_arr);die;

    //     $password=$_arr['password'];
    //     $user_name=$_arr['user_name'];
    //     $wx_id=$_arr['wx_id'];
    //     $wx_user_info=$_arr['wx_user_info'];

    //     $data=array();
    //     $data['user_name']=$user_name;
    //     $data['password']=$password;
    //     $data['wx_id']=$wx_id;
    //     $data['wx_user_info']=$wx_user_info;

    //     $id=M('users')->add($data);
    //     $row=M('users')->find($id);

    //     if($row){
    //         $data=array();
    //         $data['code']=0;
    //         $data['msg']='注册成功';
    //         $data['user_info']=$row;
    //         echo json_encode($data);
    //     }else{
    //         $data=array();
    //         $data['code']=1;
    //         $data['msg']='注册失败';
    //         echo json_encode($data);
    //     }
    // }

    // // 添加收货地址
    // public function add_address(){
    //     $_json=file_get_contents('php://input');
    //     $_arr=json_decode($_json,true);
    //     // echo json_encode($_arr);die;

    //     $user_id=$_arr['user_id'];
    //     $consignee=$_arr['consignee'];
    //     $mobile=$_arr['mobile'];
    //     $address=$_arr['address'];
    //     $type=1;

    //     $data=array();
    //     $data['user_id']=$user_id;
    //     $data['consignee']=$consignee;
    //     $data['mobile']=$mobile;
    //     $data['address']=$address;
    //     $data['type']=$type;

    //     $id=M('user_address')->add($data);

    //     if($id){
    //         $data=array();
    //         $data['code']=0;
    //         $data['msg']='添加成功';
    //         $data['address_id']=$id;
    //         echo json_encode($data);
    //     }else{
    //         $data=array();
    //         $data['code']=1;
    //         $data['msg']='注册失败';
    //         echo json_encode($data);
    //     }
    // }

    // // 编辑收货地址
    // public function edit_address(){
    //     $_json=file_get_contents('php://input');
    //     $_arr=json_decode($_json,true);
    //     // echo json_encode($_arr);die;

    //     $address_id=$_arr['address_id'];
    //     $consignee=$_arr['consignee'];
    //     $mobile=$_arr['mobile'];
    //     $address=$_arr['address'];

    //     $data=array();
    //     $data['consignee']=$consignee;
    //     $data['mobile']=$mobile;
    //     $data['address']=$address;

    //     $res=M('user_address')->where(array('address_id'=>$address_id))->save($data);

    //     if($res){
    //         $data=array();
    //         $data['code']=0;
    //         $data['msg']='成功';
    //         echo json_encode($data);
    //     }else{
    //         $data=array();
    //         $data['code']=1;
    //         $data['msg']='失败';
    //         echo json_encode($data);
    //     }
    // }
    


    // // 登录
    // public function login(){
    //     $_json=file_get_contents('php://input');
    //     $_arr=json_decode($_json,true);
    //     // echo json_encode($_arr);die;

    //     $password=$_arr['password'];
    //     $user_name=$_arr['user_name'];

    //     $where=array();
    //     $where['user_name']=$user_name;
    //     $where['password']=$password;

    //     $row=M('users')->where($where)->find();

    //     if($row){
    //         $data=array();
    //         $data['code']=0;
    //         $data['msg']='登录成功';
    //         $data['data']=$row;
    //         echo json_encode($data);
    //     }else{
    //         $data=array();
    //         $data['code']=1;
    //         $data['msg']='登录失败';
    //         echo json_encode($data);
    //     }
    // }


    // // 地址列表
    // public function get_address_by_user_id(){
    //     // echo json_encode($_GET);die;
    //     $where=array();
    //     $where['user_id']=274;

    //     $list = M('user_address')->where($where)->select();
    //     foreach ($list as $key => $value) {
    //         $temp=explode('#', $list[$key]['address']);
    //         $list[$key]['address_1']=$temp[0];
    //         $list[$key]['address_2']=$temp[1];
    //     }
    //     echo json_encode($list);
    // }


    
    // // 根据address_id查找地址信息
    // public function find_address_by_address_id(){
    //     // echo json_encode($_GET);die;
    //     $address_id=$_GET['address_id'];
    //     $row = M('user_address')->where(array('address_id'=>$address_id))->find();

    //     if($row){
    //         $data=array();
    //         $data['code']=0;
    //         $data['msg']='成功';
    //         $data['data']=$row;
    //         echo json_encode($data);
    //     }else{
    //         $data=array();
    //         $data['code']=1;
    //         $data['msg']='失败';
    //         echo json_encode($data);
    //     }
    // }

    // // 获取假订单
    // public function get_false_order(){
    //     $list = M('falseorder')->limit(10)->select();

    //     foreach ($list as $key => $value) {
    //         $list[$key]['avatar']="http://" .$_SERVER['HTTP_HOST']."/".$value['avatar'];
    //     }

    //     echo json_encode($list);
    // }

}
