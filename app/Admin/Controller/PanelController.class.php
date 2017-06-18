<?php
namespace Admin\Controller;
use Common\Controller\AuthController;

class PanelController extends AuthController {
    
    public function _initialize() {
        parent::_initialize();
        global $user;
        $user=session('auth');
        $this->user=$user;
        $this->cur_c='Panel';

        $group=M('auth_group')->where(array('pid'=>0))->select();
        foreach ($group as $key => $value) {
            $group[$key]['_child']=M('auth_group')->where(array('pid'=>$value['id']))->select();
        }
        $this->group=$group;
    }

    public function jingcaizuqiu(){
        global $user;

        if($_GET['match_time_md']){
            $match_time_md=$_GET['match_time_md'];
        }else{
            $match_time_md=date('m-d',time());
        }

        $this->match_time_md=$match_time_md;
        $this->week=$this->weekday(strtotime($match_time_md));

        $where=array();
        $where['match_time_md']=$match_time_md;

        //已停止
        $list_stop=M('jingcaizuqiu')->where($where)->select();
   

        //还未开始
        $list=M('jingcaizuqiu')->where($where)->select();


        //时间分类
        $cur_time=time();

        $time_list=array();
        $time_list[]=$cur_time+0*24*60*60;
        $time_list[]=$cur_time+1*24*60*60;
        $time_list[]=$cur_time+2*24*60*60;
        $time_list[]=$cur_time+3*24*60*60;
        $time_list[]=$cur_time+4*24*60*60;
        $time_list[]=$cur_time+5*24*60*60;


        $time_list_=array();
        foreach ($time_list as $key => $value) {
            $time_list_[$key]['match_time_md'] = date('Y-m-d', $value);
            $time_list_[$key]['match_time_hi']  = date('H:i', $value);
            $time_list_[$key]['week']           = $this->weekday($value);
        }



        $this->list=$list;
        $this->list_stop=$list_stop;
        $this->time_list_=$time_list_;
        $this->display();
    }
    
    public function ajax_save_field_for_jingcaizuqiu(){
        $_json=file_get_contents('php://input');
        $_arr=json_decode($_json,true);

        $id=$_arr['id'];
        $name=$_arr['name'];
        $value=trim($_arr['value']);

        $res=$this->save_field($id, $name, $value);

        if($res){
            $data=array();
            $data['code']=0;
            $data['msg']='success';
        }else{
            $data=array();
            $data['code']=1;
            $data['msg']='error';
        }

        echo json_encode($data);
    } 

    public function save_field($id, $name, $value){
        global $user;
        $where=array();
        $where['id']=$id;

        $data=array();
        if($name=='match_time_ymd'){
            $data[$name]=$value;
            $data['week']=$this->weekday(strtotime($value));
        }else{
            $data[$name]=$value;
        }
        $data['time']=time();

        $res=M('jingcaizuqiu')->where($where)->save($data);

        return $res;
    } 

    public function add(){
        global $user;

        $data=array();
        $data['time']=time();
        $data['match_time_ymd']=$_GET['match_time_ymd'];

        $id=M('jingcaizuqiu')->add($data);
        if($id){
            $this->success('添加成功');
        }else{
            $this->error('添加失败');
        }
    } 


    /**
    * 根据时间戳返回星期几
    * @param string $time 时间戳
    * @return 星期几
    */
    public function weekday($time){
        if(is_numeric($time)){
            $weekday = array('周日','周一','周二','周三','周四','周五','周六');
            return $weekday[date('w', $time)];
        }
        return false;
    }

    // 采集中国体彩网的数据
    public function fnQueryList_lottery(){
        header("Content-type:text/html;charset=utf-8");
        import('Org.JAE.QueryList');

        //采集赛事数据
        $url = "http://www.lottery.gov.cn/football/counter.jspx";
        $reg = array(
            "match_id"=>array("","match_id"),
            "match_week"=>array("","match_week"),
            "match_time"=>array("","match_time"),
            "match"=>array("","match"),
            "rq_val"=>array("","rq_val"),
            "league_val"=>array("","league_val"),
            "pl_val"=>array("","pl_val"),

            "a_sheng"=>array(".saishi .shuju:eq(0) strong","text"),
            "a_ping"=>array(".saishi .shuju:eq(1) strong","text"),
            "a_fu"=>array(".saishi .shuju:eq(2) strong","text"),

            "b_rang"=>array(".saishi font","text"),
            "b_rang_sheng"=>array(".saishi .shuju:eq(3) strong","text"),
            "b_rang_ping"=>array(".saishi .shuju:eq(4) strong","text"),
            "b_rang_fu"=>array(".saishi .shuju:eq(5) strong","text"),

            "c_sheng_1_0"=>array(".saishiCon:eq(0) tr:eq(0) .shuju:eq(0) strong","text"),
            "c_sheng_2_0"=>array(".saishiCon:eq(0) tr:eq(0) .shuju:eq(1) strong","text"),
            "c_sheng_2_1"=>array(".saishiCon:eq(0) tr:eq(0) .shuju:eq(2) strong","text"),
            "c_sheng_3_0"=>array(".saishiCon:eq(0) tr:eq(0) .shuju:eq(3) strong","text"),
            "c_sheng_3_1"=>array(".saishiCon:eq(0) tr:eq(0) .shuju:eq(4) strong","text"),
            "c_sheng_3_2"=>array(".saishiCon:eq(0) tr:eq(0) .shuju:eq(5) strong","text"),
            "c_sheng_4_0"=>array(".saishiCon:eq(0) tr:eq(0) .shuju:eq(6) strong","text"),
            "c_sheng_4_1"=>array(".saishiCon:eq(0) tr:eq(0) .shuju:eq(7) strong","text"),
            "c_sheng_4_2"=>array(".saishiCon:eq(0) tr:eq(0) .shuju:eq(8) strong","text"),
            "c_sheng_5_0"=>array(".saishiCon:eq(0) tr:eq(0) .shuju:eq(9) strong","text"),
            "c_sheng_5_1"=>array(".saishiCon:eq(0) tr:eq(0) .shuju:eq(10) strong","text"),
            "c_sheng_5_2"=>array(".saishiCon:eq(0) tr:eq(0) .shuju:eq(11) strong","text"),
            "c_sheng_other"=>array(".saishiCon:eq(0) tr:eq(0) .shuju:eq(12) strong","text"),

            "c_ping_0_0"=>array(".saishiCon:eq(0) tr:eq(1) .shuju:eq(0) strong","text"),
            "c_ping_1_1"=>array(".saishiCon:eq(0) tr:eq(1) .shuju:eq(1) strong","text"),
            "c_ping_2_2"=>array(".saishiCon:eq(0) tr:eq(1) .shuju:eq(2) strong","text"),
            "c_ping_3_3"=>array(".saishiCon:eq(0) tr:eq(1) .shuju:eq(3) strong","text"),
            "c_ping_other"=>array(".saishiCon:eq(0) tr:eq(1) .shuju:eq(4) strong","text"),

            "c_fu_0_1"=>array(".saishiCon:eq(0) tr:eq(2) .shuju:eq(0) strong","text"),
            "c_fu_0_2"=>array(".saishiCon:eq(0) tr:eq(2) .shuju:eq(1) strong","text"),
            "c_fu_1_2"=>array(".saishiCon:eq(0) tr:eq(2) .shuju:eq(2) strong","text"),
            "c_fu_0_3"=>array(".saishiCon:eq(0) tr:eq(2) .shuju:eq(3) strong","text"),
            "c_fu_1_3"=>array(".saishiCon:eq(0) tr:eq(2) .shuju:eq(4) strong","text"),
            "c_fu_2_3"=>array(".saishiCon:eq(0) tr:eq(2) .shuju:eq(5) strong","text"),
            "c_fu_0_4"=>array(".saishiCon:eq(0) tr:eq(2) .shuju:eq(6) strong","text"),
            "c_fu_1_4"=>array(".saishiCon:eq(0) tr:eq(2) .shuju:eq(7) strong","text"),
            "c_fu_2_4"=>array(".saishiCon:eq(0) tr:eq(2) .shuju:eq(8) strong","text"),
            "c_fu_0_5"=>array(".saishiCon:eq(0) tr:eq(2) .shuju:eq(9) strong","text"),
            "c_fu_1_5"=>array(".saishiCon:eq(0) tr:eq(2) .shuju:eq(10) strong","text"),
            "c_fu_2_5"=>array(".saishiCon:eq(0) tr:eq(2) .shuju:eq(11) strong","text"),
            "c_fu_other"=>array(".saishiCon:eq(0) tr:eq(2) .shuju:eq(12) strong","text"),

            "d_zong_0"=>array(".saishiCon:eq(1) tr:eq(0) .shuju:eq(0) strong","text"),
            "d_zong_1"=>array(".saishiCon:eq(1) tr:eq(0) .shuju:eq(1) strong","text"),
            "d_zong_2"=>array(".saishiCon:eq(1) tr:eq(0) .shuju:eq(2) strong","text"),
            "d_zong_3"=>array(".saishiCon:eq(1) tr:eq(0) .shuju:eq(3) strong","text"),
            "d_zong_4"=>array(".saishiCon:eq(1) tr:eq(0) .shuju:eq(4) strong","text"),
            "d_zong_5"=>array(".saishiCon:eq(1) tr:eq(0) .shuju:eq(5) strong","text"),
            "d_zong_6"=>array(".saishiCon:eq(1) tr:eq(0) .shuju:eq(6) strong","text"),
            "d_zong_other"=>array(".saishiCon:eq(1) tr:eq(0) .shuju:eq(7) strong","text"),

            "e_ban_sheng_sheng"=>array(".saishiCon:eq(2) tr:eq(0) .shuju:eq(0) strong","text"),
            "e_ban_sheng_ping"=>array(".saishiCon:eq(2) tr:eq(0) .shuju:eq(1) strong","text"),
            "e_ban_sheng_fu"=>array(".saishiCon:eq(2) tr:eq(0) .shuju:eq(2) strong","text"),
            "e_ban_ping_sheng"=>array(".saishiCon:eq(2) tr:eq(0) .shuju:eq(3) strong","text"),
            "e_ban_ping_ping"=>array(".saishiCon:eq(2) tr:eq(0) .shuju:eq(4) strong","text"),
            "e_ban_ping_fu"=>array(".saishiCon:eq(2) tr:eq(0) .shuju:eq(5) strong","text"),
            "e_ban_fu_sheng"=>array(".saishiCon:eq(2) tr:eq(0) .shuju:eq(6) strong","text"),
            "e_ban_fu_ping"=>array(".saishiCon:eq(2) tr:eq(0) .shuju:eq(7) strong","text"),
            "e_ban_fu_fu"=>array(".saishiCon:eq(2) tr:eq(0) .shuju:eq(8) strong","text")

        );
        $rang = "#content .section";
        //使用curl抓取源码并以utf-8编码格式输出
        $hj = new \QueryList($url,$reg,$rang,'curl','utf-8');
        $arr = $hj->jsonArr;


        $d=M('jingcaizuqiu');
        foreach ($arr as $key => $value) {
            $match_week=explode(' ', $value['match_week']);
            $value['week']=$match_week[0];
            $value['changci']=$match_week[1];

            $match=explode('vs', $value['match']);
            $value['A']=trim($match[0]);
            $value['B']=trim($match[1]);

            $match_time=explode(' ', $value['match_time']);
            $value['match_time_md']=$match_time[0];
            $value['match_time_hi']=$match_time[1];

            $where=array();
            $where['match_id']=$value['match_id'];

            $data=array();
            $data=$value;
            $data['time']=time();

            if($res=$d->where($where)->find()){
                //更新
                unset($data['match_id']); 
                $d->where($where)->save($data);
            }else{
                //添加
                $d->add($data);
            }
        }

        dump($arr);
    }


    

}

?>