<?php

namespace Home\Controller;

use Think\CommonController;



class IndexController extends CommonController{

    public function _initialize(){

        parent::_initialize();

    }



    // 登录--远程服务器

    public function index(){

        $url = $_SERVER['HTTP_HOST'];

        $temp_school=explode('.baidulab.', $url);

        $school=$temp_school[0];



        $url = $school;

        $this->school=D('School')->where(array('url'=>$url))->find();



        $this->url=$url;



        // 记住我  start

        $password = cookie('remember_password');

        $username = cookie('remember_username');

        $remember = cookie('remember_remember');

        

        if($password && $username){

            $this->assign('password',$password);

            $this->assign('username',$username);

            $this->assign('remember',$remember);

        }

        // 记住我  end

        

        $this->display();

    }



    //是否到期，可否继续登录

    public function ajaxIsCanLogin(){

        if(IS_POST){

            $url = $_SERVER['HTTP_HOST'];

            $temp_school=explode('.baidulab.', $url);

            $url=$temp_school[0];

            $school=D('School')->where(array('url'=>$url))->find();



            if( $school['start_time'] < time() && time() < $school['end_time']){

                $data['status']="1";

            }else{

                $data['status']="1";

            }

            echo json_encode($data);

        }

    }
}