-- phpMyAdmin SQL Dump
-- version 4.0.0
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 年 04 月 30 日 08:48
-- 服务器版本: 5.5.34-log
-- PHP 版本: 5.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `ek`
--

-- --------------------------------------------------------

--
-- 表的结构 `ez_auth_group`
--

CREATE TABLE IF NOT EXISTS `ez_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` text NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=430 ;

--
-- 转存表中的数据 `ez_auth_group`
--

INSERT INTO `ez_auth_group` (`id`, `title`, `description`, `status`, `rules`, `pid`) VALUES
(2, '生产组', '生产组', 1, '', 0),
(3, '模具维修组', '模具维修组', 1, '372,371,443,215,368,373,370,328,382,383,384,385', 0),
(4, '设备维修组', '设备维修组', 1, '', 0),
(420, '主管/工程师', '主管/工程师', 1, '', 2),
(421, '班长', '班长', 1, '', 2),
(422, '组员', '组员', 1, '', 2),
(5, '返修组', '返修组', 1, '', 0),
(412, '模具维修人', '模具维修人', 1, '21,372,371,34,411,414,415,439,440,443,215,373,382', 3),
(413, '模具维修工程师/主管', '模具维修工程师/主管', 1, '372,15', 3),
(414, '生产', '生产', 1, '', 3),
(415, '设备维修人', '设备维修人', 1, '', 4),
(416, '设备维修工程师/主管', '设备维修工程师/主管', 1, '', 4),
(417, '生产', '生产', 1, '', 4),
(418, '返修人', '返修人', 1, '', 5),
(419, '返修班长', '返修班长', 1, '', 5),
(423, '成品管理员', '成品管理员', 1, '', 2),
(424, '板料管理员', '板料管理员', 1, '', 2),
(1, '管理组', '管理组', 1, '21,372,371,34,414,415,439,440,443,25,15,214,215,366,374,368,367,327,373,370,328,434,435,381,382,383,384,385,503,504,505,506,507,508,509,511,512,513,515,521,520,519,518,517,516,496,500,501,497,498,499,538,547,546,545,544,543,542,541,540,539,533,535,536,534,523,531,530,529,528,527,525,526,524', 0),
(426, '访客', '访客', 1, '371,15,215,374,368,367,373,370,328,435,512,513,521,535,531,525,526,524', 1),
(427, '管理员', '管理员', 1, '21,371,25,15,214,215,366,374,368,367,327,373,370,328,434,435,381,382,383,384,385,503,504,505,506,507,508,509,511,512,513,515,521,520,519,518,517,516,496,500,501,497,498,499,538,547,546,545,544,543,542,541,540,539,533,535,536,534,523,531,530,529,528,527,525,526,524', 1),
(429, '普通管理员', '管理员', 1, '21,371,25,15,374,368,367,373,370,328,435,382,383,384,385,504,505,506,507,508,509,512,513,521,520,519,518,517,516,500,501,497,498,499,547,546,545,544,543,542,541,540,539,535,536,534,531,530,529,528,527,525,526,524', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ez_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `ez_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ez_auth_group_access`
--

INSERT INTO `ez_auth_group_access` (`uid`, `group_id`) VALUES
(3, 426),
(152, 4),
(153, 4),
(154, 4),
(155, 4),
(156, 4),
(157, 4),
(158, 4),
(159, 4),
(160, 4),
(161, 4),
(162, 4),
(163, 4),
(164, 4),
(165, 4),
(182, 0),
(208, 422),
(215, 420),
(216, 422),
(219, 420);

-- --------------------------------------------------------

--
-- 表的结构 `ez_auth_rule`
--

CREATE TABLE IF NOT EXISTS `ez_auth_rule` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '节点名称',
  `title` varchar(50) NOT NULL COMMENT '菜单名称',
  `type` int(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否激活 1：是 2：否',
  `condition` varchar(100) NOT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `pid` smallint(6) unsigned NOT NULL COMMENT '父ID',
  `level` tinyint(1) unsigned NOT NULL COMMENT '节点等级',
  `data` varchar(255) DEFAULT NULL COMMENT '附加参数',
  `sort` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序权重',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '菜单显示类型 0:不显示 1:导航菜单 2:左侧菜单',
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='节点表' AUTO_INCREMENT=551 ;

--
-- 转存表中的数据 `ez_auth_rule`
--

INSERT INTO `ez_auth_rule` (`id`, `name`, `title`, `type`, `status`, `condition`, `remark`, `pid`, `level`, `data`, `sort`, `display`) VALUES
(1, 'Admin', '根节点', 1, 1, '', '不可删除', 0, 1, NULL, 0, 0),
(373, 'Admin/Type/edit', '分类编辑', 1, 1, '', NULL, 327, 3, NULL, 0, 2),
(13, 'Type', '扩展功能', 1, 1, '', '', 1, 0, '', 6, 1),
(14, 'Index', '我的面板', 1, 1, '', '', 1, 0, '', 1, 1),
(15, 'Admin/Index/index', '首页', 1, 1, '', '快捷菜单', 25, 3, '?s=/Admin/Index/main', 10, 2),
(374, 'Admin/AuthRule/edit', '菜单编辑', 1, 1, '', NULL, 366, 3, NULL, 0, 2),
(18, 'User', '用户管理', 1, 1, '', '', 1, 0, '', 3, 1),
(190, 'add', '添加', 1, 1, '', '', 183, 3, '', 0, 0),
(21, 'User', '用户管理', 1, 1, '', '', 18, 2, '', 0, 2),
(25, 'Index', '我的面板', 1, 1, '', '', 14, 2, '', 0, 2),
(370, 'Admin/Type/add', '添加分类', 1, 1, '', NULL, 327, 3, NULL, 0, 2),
(371, 'Admin/User/homeUser', '用户列表', 1, 1, '', NULL, 21, 3, NULL, 2, 2),
(368, 'Admin/AuthRule/add', '添加菜单', 1, 1, '', NULL, 366, 3, NULL, 0, 2),
(213, 'Config', '网站配置', 1, 1, '', '', 1, 0, '', 2, 0),
(214, 'Config', '网站配置', 1, 1, '', '', 213, 2, '', 0, 2),
(215, 'Admin/Config/setting', '网站配置', 1, 1, '', '', 214, 3, '?s=/Admin/Config/setting', 0, 2),
(365, 'AuthRule', '菜单管理', 1, 1, '', NULL, 1, 0, NULL, 4, 1),
(366, 'AuthRule', '菜单管理', 1, 1, '', NULL, 365, 2, NULL, 0, 2),
(367, 'Admin/AuthRule/index', '权限列表', 1, 1, '', NULL, 366, 3, NULL, 0, 2),
(382, 'Admin/AuthManager/index', '用户组列表', 1, 1, '', NULL, 381, 3, NULL, 0, 2),
(383, 'Admin/AuthManager/addGroup', '添加用户组', 1, 1, '', NULL, 381, 3, NULL, 0, 2),
(435, 'Admin/Log/index', '日志列表', 1, 1, '', NULL, 434, 3, NULL, 0, 2),
(436, 'Admin/Banji/del_banji_card', '删除班级学习卡的对应关系', 1, 1, '', NULL, 404, 3, NULL, 0, 2),
(327, 'Type', '分类管理', 1, 1, '', '', 13, 2, '', 0, 2),
(328, 'Admin/Type/index', '分类列表', 1, 1, '', '', 327, 3, '?s=/Admin/Type/index', 0, 2),
(433, 'Log', '日志管理', 1, 1, '', NULL, 1, 0, NULL, 7, 1),
(434, 'Log', '日志管理', 1, 1, '', NULL, 433, 2, NULL, 0, 2),
(380, 'AuthManager', '用户组管理', 1, 1, '', NULL, 1, 0, NULL, 5, 1),
(381, 'AuthManager', '用户组管理', 1, 1, '', NULL, 380, 2, NULL, 0, 2),
(384, 'Admin/AuthManager/editGroup', '编辑用户组', 1, 1, '', NULL, 381, 3, NULL, 0, 2),
(385, 'Admin/AuthManager/authSet', '权限配置', 1, 1, '', NULL, 381, 3, NULL, 0, 2),
(500, 'Admin/Panel/panel_33', '拖盘管理', 1, 1, '', NULL, 496, 3, NULL, 0, 2),
(501, 'Admin/Panel/panel_00', '板料统计', 1, 1, '', NULL, 496, 3, NULL, 0, 2),
(502, 'Course', '生产管理', 1, 1, '', NULL, 1, 0, NULL, 13, 1),
(503, 'Course', '生产管理', 1, 1, '', NULL, 502, 2, NULL, 0, 2),
(504, 'Admin/Course/index', '生产排程', 1, 1, '', NULL, 503, 3, NULL, 0, 2),
(505, 'Admin/Course/index_2', '生产记录', 1, 1, '', NULL, 503, 3, NULL, 0, 2),
(506, 'Admin/Course/baobiao1', '产量统计报表', 1, 1, '', NULL, 503, 3, NULL, 0, 2),
(507, 'Admin/Course/baobiao2', '产线报表', 1, 1, '', NULL, 503, 3, NULL, 0, 2),
(508, 'Admin/Course/baobiao', '节拍报表', 1, 1, '', NULL, 503, 3, NULL, 0, 2),
(509, 'Admin/Course/liaojia', '料架管理', 1, 1, '', NULL, 503, 3, NULL, 0, 2),
(510, 'Banji', '成品管理', 1, 1, '', NULL, 1, 0, NULL, 12, 1),
(511, 'Banji', '成品管理', 1, 1, '', NULL, 510, 2, NULL, 0, 2),
(512, 'Admin/Banji/index_3', '成品追溯', 1, 1, '', NULL, 511, 3, NULL, 0, 2),
(513, 'Admin/Banji/index_4', '成品库存', 1, 1, '', NULL, 511, 3, NULL, 0, 2),
(514, 'Stop', '停线管理', 1, 1, '', NULL, 1, 0, NULL, 11, 1),
(515, 'Stop', '停线管理', 1, 1, '', NULL, 514, 2, NULL, 0, 2),
(495, 'Panel', '板料库', 1, 1, '', NULL, 1, 0, NULL, 10, 0),
(496, 'Panel', '板料库', 1, 1, '', NULL, 495, 2, NULL, 0, 2),
(497, 'Admin/Panel/panel_12', '板料管理', 1, 1, '', NULL, 496, 3, NULL, 0, 2),
(498, 'Admin/Panel/panel_11', '线上库存', 1, 1, '', NULL, 496, 3, NULL, 0, 2),
(499, 'Admin/Panel/panel_22', '板料追溯', 1, 1, '', NULL, 496, 3, NULL, 0, 2),
(548, 'Admin/Banji/index_1', '缺陷记录', 1, 1, '', NULL, 511, 3, NULL, 0, 2),
(549, 'Admin/Banji/index_2', '抽检记录', 1, 1, '', NULL, 511, 3, NULL, 0, 2),
(550, 'Admin/User/ajax_add_user', '添加用户', 1, 1, '', NULL, 21, 3, NULL, 0, 2),
(547, 'Admin/Site/banci_2', '班次管理', 1, 1, '', NULL, 538, 3, NULL, 0, 2),
(546, 'Admin/Site/tuopan', '拖盘管理', 1, 1, '', NULL, 538, 3, NULL, 0, 2),
(545, 'Admin/Site/yibiao', '仪表管理', 1, 1, '', NULL, 538, 3, NULL, 0, 2),
(544, 'Admin/Site/liaojia', '料架管理', 1, 1, '', NULL, 538, 3, NULL, 0, 2),
(543, 'Admin/Site/parts_1', '零件管理', 1, 1, '', NULL, 538, 3, NULL, 0, 2),
(542, 'Admin/Site/carts_1', '车型管理', 1, 1, '', NULL, 538, 3, NULL, 0, 2),
(541, 'Admin/Site/mould', '模具管理', 1, 1, '', NULL, 538, 3, NULL, 0, 2),
(540, 'Admin/Site/device', '设备管理', 1, 1, '', NULL, 538, 3, NULL, 0, 2),
(539, 'Admin/Site/banliao', '板料管理', 1, 1, '', NULL, 538, 3, NULL, 0, 2),
(538, 'Site', '基础数据', 1, 1, '', NULL, 537, 2, NULL, 0, 2),
(537, 'Site', '基础数据', 1, 1, '', NULL, 1, 0, NULL, 9, 1),
(535, 'Admin/Energy/index2', '产量能耗报表', 1, 1, '', NULL, 533, 3, NULL, 0, 2),
(536, 'Admin/Energy/index3', '能耗趋势报表', 1, 1, '', NULL, 533, 3, NULL, 0, 2),
(534, 'Admin/Energy/index1', '电能仪表明细表', 1, 1, '', NULL, 533, 3, NULL, 0, 2),
(533, 'Energy', '能源管理', 1, 1, '', NULL, 532, 2, NULL, 0, 2),
(532, 'Energy', '能源管理', 1, 1, '', NULL, 1, 0, NULL, 8, 1),
(531, 'Admin/Card/index3_3', '设备维修工时报表', 1, 1, '', NULL, 523, 3, NULL, 0, 2),
(530, 'Admin/Card/index3_2', '模具保养工时报表', 1, 1, '', NULL, 523, 3, NULL, 0, 2),
(529, 'Admin/Card/index3_1', '模具维修工时报表', 1, 1, '', NULL, 523, 3, NULL, 0, 2),
(528, 'Admin/Card/index8', '成品返修工单', 1, 1, '', NULL, 523, 3, NULL, 0, 2),
(527, 'Admin/Card/index7', '过程工单', 1, 1, '', NULL, 523, 3, NULL, 0, 2),
(525, 'Admin/Card/index5', '生产工单', 1, 1, '', NULL, 523, 3, NULL, 0, 2),
(526, 'Admin/Card/index6', '设备工单', 1, 1, '', NULL, 523, 3, NULL, 0, 2),
(524, 'Admin/Card/index4', '模具工单', 1, 1, '', NULL, 523, 3, NULL, 0, 2),
(523, 'Card', '工单管理', 1, 1, '', NULL, 522, 2, NULL, 0, 2),
(522, 'Card', '工单管理', 1, 1, '', NULL, 1, 0, NULL, 0, 1),
(521, 'Admin/Stop/echart_2_3', '停线时长TOP10报表', 1, 1, '', NULL, 515, 3, NULL, 0, 2),
(520, 'Admin/Stop/echart_2_2', '停线设备TOP10报表', 1, 1, '', NULL, 515, 3, NULL, 0, 2),
(519, 'Admin/Stop/echart_2_1', '停线原因TOP10报表', 1, 1, '', NULL, 515, 3, NULL, 0, 2),
(518, 'Admin/Stop/echart_1_2', '停线设备词云图报表', 1, 1, '', NULL, 515, 3, NULL, 0, 2),
(517, 'Admin/Stop/echart_1_1', '停线原因词云图报表', 1, 1, '', NULL, 515, 3, NULL, 0, 2),
(516, 'Admin/Stop/index', '停线列表', 1, 1, '', NULL, 515, 3, NULL, 0, 2);

-- --------------------------------------------------------

--
-- 表的结构 `ez_config`
--

CREATE TABLE IF NOT EXISTS `ez_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '网站名称',
  `title` varchar(50) NOT NULL COMMENT '网站标题',
  `keywords` varchar(255) NOT NULL COMMENT '关键字',
  `description` varchar(255) NOT NULL COMMENT '网站描述',
  `status` tinyint(1) unsigned NOT NULL COMMENT '网站状态（0关闭1开启）',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `qq` varchar(255) NOT NULL COMMENT 'qq',
  `logo` varchar(100) NOT NULL COMMENT '网站logo',
  `phone` varchar(100) NOT NULL COMMENT '手机',
  `tags` text NOT NULL COMMENT '网站标签',
  `editer` longtext NOT NULL COMMENT '临时编辑器内容',
  `time` int(10) NOT NULL COMMENT '时间',
  `ip` varchar(15) NOT NULL COMMENT '服务器IP',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='网站配置' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ez_config`
--

INSERT INTO `ez_config` (`id`, `name`, `title`, `keywords`, `description`, `status`, `email`, `qq`, `logo`, `phone`, `tags`, `editer`, `time`, `ip`) VALUES
(1, '百度', '台州沃尔沃冲压车间生产管理系统', '台州沃尔沃冲压车间生产管理系统', '台州沃尔沃冲压车间生产管理系统', 1, '34214123@qq.com', '345', 'config/0/0/1/14796917558511.png', '15899998888', '台州沃尔沃冲压车间生产管理系统', '32132132132132131<img src="data:image/jpeg;base64,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"><div><img src="data:image/jpeg;base64,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"><br></div>', 1484964059, '118.89.46.84');

-- --------------------------------------------------------

--
-- 表的结构 `ez_log`
--

CREATE TABLE IF NOT EXISTS `ez_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `url` varchar(100) NOT NULL COMMENT '操作方法',
  `model` varchar(100) NOT NULL COMMENT '模块',
  `controller` varchar(100) NOT NULL COMMENT '操作',
  `action` varchar(100) NOT NULL COMMENT '方法',
  `username` varchar(100) NOT NULL COMMENT '操作人用户名',
  `uid` int(11) NOT NULL COMMENT '操作人',
  `time` int(10) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='日志记录表' AUTO_INCREMENT=2234 ;

--
-- 转存表中的数据 `ez_log`
--

INSERT INTO `ez_log` (`id`, `title`, `url`, `model`, `controller`, `action`, `username`, `uid`, `time`) VALUES
(526, '暂无2', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 2, 1461751772),
(527, '暂无2', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 2, 1461751889),
(528, '暂无3', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 3, 1461752222),
(529, '暂无3', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 3, 1461752690),
(530, '暂无3', 'Admin/Login/index', 'Admin', 'Login', 'index', 'zhangyu', 3, 1461753952),
(2233, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1493443955),
(2232, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1493439885),
(2231, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1493344189),
(2230, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1493281630),
(2229, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1493209317),
(2228, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1493174499),
(2227, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1493171671),
(2226, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492997151),
(2225, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492951107),
(2224, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492778633),
(2223, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492750513),
(2222, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492693580),
(2221, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492686818),
(2220, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin88', 219, 1492686811),
(2219, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1492686805),
(2218, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492686514),
(2217, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492685895),
(2216, '权限配置', 'Admin/AuthManager/authSet', 'Admin', 'AuthManager', 'authSet', 'admin', 1, 1492685872),
(2215, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492684873),
(2214, '权限配置', 'Admin/AuthManager/authSet', 'Admin', 'AuthManager', 'authSet', 'admin', 1, 1492667029),
(2213, '编辑用户组', 'Admin/AuthManager/editGroup', 'Admin', 'AuthManager', 'editGroup', 'admin', 1, 1492666973),
(2212, '添加用户组', 'Admin/AuthManager/addGroup', 'Admin', 'AuthManager', 'addGroup', 'admin', 1, 1492666937),
(2211, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1492666637),
(2210, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492666213),
(2209, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492665281),
(2208, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492664900),
(2207, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492664216),
(2206, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492655476),
(2205, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492655143),
(2204, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492611891),
(2203, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1492611873),
(2202, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492611812),
(2201, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1492611762),
(2200, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492592734),
(2199, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492565327),
(2198, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492485192),
(2197, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492478619),
(2196, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492410185),
(2195, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492410143),
(2194, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492400816),
(2193, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492397518),
(2192, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492392942),
(2191, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492229603),
(2190, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492132795),
(2189, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492055723),
(2188, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492051931),
(2187, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492051601),
(2186, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492051089),
(2185, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492048451),
(2184, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1492045648),
(2183, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491980765),
(2182, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491967710),
(2181, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491966254),
(2180, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491959628),
(2179, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491890093),
(2178, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491881010),
(2177, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491879634),
(2176, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491874010),
(2175, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491793023),
(2174, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491792505),
(2173, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491788921),
(2172, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491551780),
(2171, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491551686),
(2170, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491529091),
(2169, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491498422),
(2168, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1491467728),
(2167, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1491467709),
(2166, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491467554),
(2165, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491467080),
(2164, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491456021),
(2163, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491444992),
(2162, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491404196),
(2161, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491360857),
(2160, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491355275),
(2159, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491355233),
(2158, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491355221),
(2157, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491354995),
(2156, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491318576),
(2155, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491317449),
(2154, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491312688),
(2153, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491300326),
(2152, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491232538),
(2151, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491058360),
(2150, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1491052704),
(2149, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491052637),
(2148, '菜单编辑', 'Admin/AuthRule/edit', 'Admin', 'AuthRule', 'edit', 'admin', 1, 1491040123),
(2147, '菜单编辑', 'Admin/AuthRule/edit', 'Admin', 'AuthRule', 'edit', 'admin', 1, 1491040117),
(2146, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491040094),
(2145, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1491039888),
(2144, '权限配置', 'Admin/AuthManager/authSet', 'Admin', 'AuthManager', 'authSet', 'admin', 1, 1491039868),
(2143, '权限配置', 'Admin/AuthManager/authSet', 'Admin', 'AuthManager', 'authSet', 'admin', 1, 1491039818),
(2142, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1491039766),
(2141, '权限配置', 'Admin/AuthManager/authSet', 'Admin', 'AuthManager', 'authSet', 'admin', 1, 1491039749),
(2140, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1491039222),
(2139, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491039156),
(2138, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1491039115),
(2137, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1491039087),
(2136, '菜单编辑', 'Admin/AuthRule/edit', 'Admin', 'AuthRule', 'edit', 'admin', 1, 1491037629),
(2135, '菜单编辑', 'Admin/AuthRule/edit', 'Admin', 'AuthRule', 'edit', 'admin', 1, 1491037493),
(2134, '菜单编辑', 'Admin/AuthRule/edit', 'Admin', 'AuthRule', 'edit', 'admin', 1, 1491037480),
(2133, '菜单编辑', 'Admin/AuthRule/edit', 'Admin', 'AuthRule', 'edit', 'admin', 1, 1491037434),
(2132, '菜单编辑', 'Admin/AuthRule/edit', 'Admin', 'AuthRule', 'edit', 'admin', 1, 1491037362),
(2131, '菜单编辑', 'Admin/AuthRule/edit', 'Admin', 'AuthRule', 'edit', 'admin', 1, 1491037352),
(2130, '菜单编辑', 'Admin/AuthRule/edit', 'Admin', 'AuthRule', 'edit', 'admin', 1, 1491037320),
(2129, '菜单编辑', 'Admin/AuthRule/edit', 'Admin', 'AuthRule', 'edit', 'admin', 1, 1491037158),
(2128, '菜单编辑', 'Admin/AuthRule/edit', 'Admin', 'AuthRule', 'edit', 'admin', 1, 1491037007),
(2127, '菜单编辑', 'Admin/AuthRule/edit', 'Admin', 'AuthRule', 'edit', 'admin', 1, 1491036981),
(2126, '菜单编辑', 'Admin/AuthRule/edit', 'Admin', 'AuthRule', 'edit', 'admin', 1, 1491036904),
(2125, '菜单编辑', 'Admin/AuthRule/edit', 'Admin', 'AuthRule', 'edit', 'admin', 1, 1491036539),
(2124, '菜单编辑', 'Admin/AuthRule/edit', 'Admin', 'AuthRule', 'edit', 'admin', 1, 1491036491),
(2123, '菜单编辑', 'Admin/AuthRule/edit', 'Admin', 'AuthRule', 'edit', 'admin', 1, 1491036483),
(2122, '菜单编辑', 'Admin/AuthRule/edit', 'Admin', 'AuthRule', 'edit', 'admin', 1, 1491036156),
(2121, '菜单编辑', 'Admin/AuthRule/edit', 'Admin', 'AuthRule', 'edit', 'admin', 1, 1491035209),
(2120, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491034970),
(2119, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491034722),
(2118, '菜单编辑', 'Admin/AuthRule/edit', 'Admin', 'AuthRule', 'edit', 'admin', 1, 1491034684),
(2117, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491031406),
(2116, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1491031376),
(2115, '编辑用户组', 'Admin/AuthManager/editGroup', 'Admin', 'AuthManager', 'editGroup', 'admin', 1, 1491030430),
(2114, '编辑用户组', 'Admin/AuthManager/editGroup', 'Admin', 'AuthManager', 'editGroup', 'admin', 1, 1491030419),
(2113, '编辑用户组', 'Admin/AuthManager/editGroup', 'Admin', 'AuthManager', 'editGroup', 'admin', 1, 1491030409),
(2112, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1491030395),
(2111, '编辑用户组', 'Admin/AuthManager/editGroup', 'Admin', 'AuthManager', 'editGroup', 'admin', 1, 1491030362),
(2110, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491026930),
(2109, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1491026463),
(2108, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491025473),
(2107, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1491023994),
(2106, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491023832),
(2105, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1491023821),
(2104, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1491023795),
(2103, '权限配置', 'Admin/AuthManager/authSet', 'Admin', 'AuthManager', 'authSet', 'admin', 1, 1491023779),
(2102, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491023748),
(2101, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1491023715),
(2100, '权限配置', 'Admin/AuthManager/authSet', 'Admin', 'AuthManager', 'authSet', 'admin', 1, 1491023705),
(2099, '权限配置', 'Admin/AuthManager/authSet', 'Admin', 'AuthManager', 'authSet', 'admin', 1, 1491023676),
(2098, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491020114),
(2097, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1491020073),
(2096, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491019916),
(2095, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491018638),
(2094, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1491009453),
(2093, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490948697),
(2092, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490947143),
(2091, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490942184),
(2090, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1490942167),
(2089, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490942025),
(2088, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1490940959),
(2087, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1490940263),
(2086, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490940249),
(2085, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490940063),
(2084, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1490939978),
(2083, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'member1', 4, 1490939941),
(2082, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1490939883),
(2081, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490939808),
(2080, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490939773),
(2079, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490939731),
(2078, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1490939639),
(2077, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490939415),
(2076, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1490939379),
(2075, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490939217),
(2074, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'member1', 4, 1490939146),
(2073, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490939031),
(2072, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490938837),
(2071, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1490938771),
(2070, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1490938598),
(2069, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490938539),
(2068, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1490938508),
(2067, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490938457),
(2066, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1490938380),
(2065, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1490937697),
(2064, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1490937697),
(2063, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1490937697),
(2062, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490937550),
(2061, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490924912),
(2060, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490923814),
(2059, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490866225),
(2058, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490864077),
(2057, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490859096),
(2056, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490837619),
(2055, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490774623),
(2054, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490768361),
(2053, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490767451),
(2052, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490751700),
(2051, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490749163),
(2050, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490685255),
(2049, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490684839),
(2048, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490678080),
(2047, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490674730),
(2046, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490667549),
(2045, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490665242),
(2044, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490624755),
(2043, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490624586),
(2042, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'fangke', 3, 1490621840),
(2041, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490621663),
(2040, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490619738),
(2039, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'guanliyuan', 2, 1490608603),
(2038, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'guanliyuan', 2, 1490608379),
(2037, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490608131),
(2036, '添加用户组', 'Admin/AuthManager/addGroup', 'Admin', 'AuthManager', 'addGroup', 'admin', 1, 1490603994),
(2035, '添加用户组', 'Admin/AuthManager/addGroup', 'Admin', 'AuthManager', 'addGroup', 'admin', 1, 1490603950),
(2034, '编辑用户组', 'Admin/AuthManager/editGroup', 'Admin', 'AuthManager', 'editGroup', 'admin', 1, 1490603698),
(2033, '添加用户组', 'Admin/AuthManager/addGroup', 'Admin', 'AuthManager', 'addGroup', 'admin', 1, 1490603566),
(2032, '添加用户组', 'Admin/AuthManager/addGroup', 'Admin', 'AuthManager', 'addGroup', 'admin', 1, 1490603554),
(2031, '编辑用户组', 'Admin/AuthManager/editGroup', 'Admin', 'AuthManager', 'editGroup', 'admin', 1, 1490603499),
(2030, '编辑用户组', 'Admin/AuthManager/editGroup', 'Admin', 'AuthManager', 'editGroup', 'admin', 1, 1490603467),
(2029, '编辑用户组', 'Admin/AuthManager/editGroup', 'Admin', 'AuthManager', 'editGroup', 'admin', 1, 1490603343),
(2028, '添加用户组', 'Admin/AuthManager/addGroup', 'Admin', 'AuthManager', 'addGroup', 'admin', 1, 1490603316),
(2027, '编辑用户组', 'Admin/AuthManager/editGroup', 'Admin', 'AuthManager', 'editGroup', 'admin', 1, 1490603296),
(2026, '编辑用户组', 'Admin/AuthManager/editGroup', 'Admin', 'AuthManager', 'editGroup', 'admin', 1, 1490603276),
(2025, '添加用户组', 'Admin/AuthManager/addGroup', 'Admin', 'AuthManager', 'addGroup', 'admin', 1, 1490603255),
(2024, '添加用户组', 'Admin/AuthManager/addGroup', 'Admin', 'AuthManager', 'addGroup', 'admin', 1, 1490603242),
(2023, '添加用户组', 'Admin/AuthManager/addGroup', 'Admin', 'AuthManager', 'addGroup', 'admin', 1, 1490603226),
(2022, '添加用户组', 'Admin/AuthManager/addGroup', 'Admin', 'AuthManager', 'addGroup', 'admin', 1, 1490603208),
(2021, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490594079),
(2020, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490594050),
(2019, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490581797),
(2018, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490580204),
(2017, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490579474),
(2016, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490578506),
(2015, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490562187),
(2014, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490536383),
(2013, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490503298),
(2012, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490453900),
(2011, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490450273),
(2010, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490346286),
(2009, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490345639),
(2008, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490344401),
(2007, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490343913),
(2006, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490343855),
(2005, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490324146),
(2004, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490320445),
(2003, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490320153),
(2002, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490319593),
(2001, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490319303),
(2000, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490260004),
(1999, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259964),
(1998, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259942),
(1997, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259903),
(1996, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259881),
(1995, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259856),
(1994, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259823),
(1993, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259799),
(1992, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259774),
(1991, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259746),
(1990, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259739),
(1989, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259716),
(1988, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259661),
(1987, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259634),
(1986, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259600),
(1985, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259592),
(1984, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259569),
(1983, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259538),
(1982, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259516),
(1981, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259448),
(1980, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259422),
(1979, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259404),
(1978, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259383),
(1977, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259365),
(1976, '菜单编辑', 'Admin/AuthRule/edit', 'Admin', 'AuthRule', 'edit', 'admin', 1, 1490259343),
(1975, '菜单编辑', 'Admin/AuthRule/edit', 'Admin', 'AuthRule', 'edit', 'admin', 1, 1490259331),
(1974, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259304),
(1973, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259287),
(1972, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259247),
(1971, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259215),
(1970, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259187),
(1969, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259159),
(1968, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259133),
(1967, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259095),
(1966, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259077),
(1965, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259068),
(1964, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490259033),
(1963, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490258978),
(1962, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490258949),
(1961, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490258940),
(1960, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490258915),
(1959, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490258888),
(1958, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490258553),
(1957, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490258533),
(1956, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490258493),
(1955, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490258371),
(1954, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490258349),
(1953, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490258337),
(1952, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490258174),
(1951, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490258107),
(1950, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490258079),
(1949, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490258049),
(1948, '菜单编辑', 'Admin/AuthRule/edit', 'Admin', 'AuthRule', 'edit', 'admin', 1, 1490257764),
(1947, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490257747),
(1946, '菜单编辑', 'Admin/AuthRule/edit', 'Admin', 'AuthRule', 'edit', 'admin', 1, 1490257683),
(1945, '菜单编辑', 'Admin/AuthRule/edit', 'Admin', 'AuthRule', 'edit', 'admin', 1, 1490257676),
(1944, '菜单编辑', 'Admin/AuthRule/edit', 'Admin', 'AuthRule', 'edit', 'admin', 1, 1490257581),
(1943, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490257557),
(1942, '添加菜单', 'Admin/AuthRule/add', 'Admin', 'AuthRule', 'add', 'admin', 1, 1490257524),
(1941, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490257021),
(1940, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490256997),
(1939, '菜单编辑', 'Admin/AuthRule/edit', 'Admin', 'AuthRule', 'edit', 'admin', 1, 1490256964),
(1938, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490251694),
(1937, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490251549),
(1936, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490251509),
(1935, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490250130),
(1934, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490250028),
(1933, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490249260),
(1932, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490234437),
(1931, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490232299),
(1930, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490232166),
(1929, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490232099),
(1928, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490231347),
(1927, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490171019),
(1926, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490170481),
(1925, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490168229),
(1924, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490167588),
(1923, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490166849),
(1922, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490166551),
(1921, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490165095),
(1920, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490153506),
(1919, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490148744),
(1918, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490148573),
(1917, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490083942),
(1916, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490075521),
(1915, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490068897),
(1914, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490062017),
(1913, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490057910),
(1912, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1490002248),
(1911, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1489991618),
(1910, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1489979995),
(1909, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1489971889),
(1908, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1489744188),
(1907, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1489736744),
(1906, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1489729674),
(1905, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1489726126),
(1904, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1489717829),
(1903, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1489717805),
(1902, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1489717798),
(1901, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1489717416),
(1900, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1489717298),
(1899, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1489716988),
(1898, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1489715067),
(1897, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1489712288),
(1896, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1489673993),
(1895, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1489642450),
(1894, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1489632552),
(1893, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1489630667),
(1892, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1489625733),
(1891, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1489570803),
(1890, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1489568970),
(6, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 4, 1489542079),
(5, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 5, 1489542989),
(4, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1489543503),
(3, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1489544848),
(2, '暂无规则', 'Admin/Login/index', 'Admin', 'Login', 'index', 'admin', 1, 1489561055);

-- --------------------------------------------------------

--
-- 表的结构 `ez_page_buttons`
--

CREATE TABLE IF NOT EXISTS `ez_page_buttons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page` varchar(255) NOT NULL,
  `button` varchar(255) NOT NULL,
  `time` int(10) NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='每个页面都有哪些操作按钮' AUTO_INCREMENT=127 ;

--
-- 转存表中的数据 `ez_page_buttons`
--

INSERT INTO `ez_page_buttons` (`id`, `page`, `button`, `time`, `remark`) VALUES
(1, 'Card/index4', 'sure_1', 1491962090, 'sure_1'),
(3, 'Card/index4', 'sure_2', 1491962098, 'sure_2'),
(4, 'Card/index4', 'sure_3', 1491962104, 'sure_3'),
(11, '', 'search_btn', 1490767734, '顶部搜索'),
(12, 'Card/index5', 'search_btn', 1490767952, '顶部搜索'),
(7, 'Card/index4', 'id-btn-dialog2_gongxu', 1490606847, '派工'),
(88, 'Card/index4', 'cancel_1', 1491962577, 'cancel_1'),
(13, 'Card/index6', 'search_btn', 1490769925, '顶部搜索'),
(14, 'User/index3_1', 'search_btn', 1490775125, '顶部搜索'),
(15, 'User/index3_1', 'id-btn-dialog2_add', 1490771641, '添加会员'),
(16, 'User/index3_1', 'id-btn-dialog2_show', 1490775022, '查看'),
(17, 'User/index3_1', 'id-btn-dialog2_edit', 1490775036, '编辑'),
(18, 'User/index3_1', 'id-btn-dialog2_del', 1490775050, '删除'),
(126, 'Card/panel_12', 'id-btn-dialog2-status', 1492665854, '11111'),
(21, 'Card/index_1', 'add_errors', 1490842384, '保存问题'),
(27, 'Site/banci_2', 'submit_btn', 1490862913, '立即提交'),
(28, 'Site/banci_2', 'add_banci_btn', 1490863034, '添加班次'),
(29, 'Site/banci_2', 'add_xiuxi_btn', 1490863259, '添加休息时间'),
(30, 'Site/banliao', 'id-btn-dialog2', 1490865477, '添加板料'),
(31, 'Site/banliao', 'search_btn', 1490865635, '顶部搜索'),
(32, 'Site/banliao', 'id-btn-dialog2_select_lingjian', 1490865968, '选择按钮'),
(36, 'Card/panel_00', 'search_btn', 1490928904, '顶部搜索'),
(37, 'Card/index_2', 'search_btn', 1490928974, '顶部搜索'),
(38, 'Card/index_2', 'id-btn-dialog2_del', 1490930586, '删除'),
(39, 'Card/index_2', 'id-btn-dialog2_edit', 1490948729, '修改'),
(40, 'Card/liaojia', 'search_btn', 1490948812, '顶部搜索'),
(41, 'Card/baobiao', 'search_btn', 1490948858, '顶部搜索'),
(43, 'Site/banliao', 'id-btn-dialog2_del', 1491009818, '删除'),
(44, 'Site/banliao', 'id-btn-dialog2_edit', 1491009828, '编辑'),
(45, 'Site/device', 'id-btn-dialog2_edit', 1491010035, '编辑'),
(46, 'Site/device', 'id-btn-dialog2_del', 1491010046, '删除'),
(47, 'Site/device', 'id-btn-dialog2_add', 1491010208, '添加'),
(48, 'Site/device', 'search_btn', 1491010223, '顶部搜索'),
(49, 'Site/mould', 'id-btn-dialog2', 1491010499, '添加模具'),
(50, 'Site/mould', 'id-btn-dialog2_gongxu', 1491010520, '添加模具工序'),
(51, 'Site/mould', 'search_btn', 1491010536, '搜索'),
(52, 'Site/mould', 'id-btn-dialog2_edit', 1491010583, '编辑'),
(53, 'Site/mould', 'id-btn-dialog2_del', 1491010593, '删除'),
(54, 'Site/carts_1', 'search_btn', 1491010880, '搜索'),
(55, 'Site/carts_1', 'id-btn-dialog2', 1491010900, '添加'),
(56, 'Site/carts_1', 'id-btn-dialog2_del', 1491010963, '删除'),
(57, 'Site/carts_1', 'id-btn-dialog2_edit', 1491010971, '编辑'),
(58, 'Site/carts_1', 'id-btn-dialog2_select_lingjian', 1491011028, '右侧选择按钮'),
(59, 'Site/parts_1', 'search_btn', 1491011642, '顶部搜索'),
(60, 'Site/parts_1', 'id-btn-dialog2_add', 1491011659, '添加'),
(61, 'Site/parts_1', 'id-btn-dialog2_set_red_tag', 1491011761, '预置'),
(62, 'Site/parts_1', 'id-btn-dialog2_del', 1491011818, '删除'),
(63, 'Site/parts_1', 'id-btn-dialog2_edit', 1491011825, '编辑'),
(64, 'Site/liaojia', 'id-btn-dialog2', 1491012042, '添加'),
(65, 'Site/liaojia', 'search_btn', 1491012060, '搜索'),
(66, 'Site/liaojia', 'id-btn-dialog2_select_part', 1491012241, '添加适用零件'),
(67, 'Site/liaojia', 'id-btn-dialog2_edit', 1491012413, '编辑'),
(68, 'Site/liaojia', 'id-btn-dialog2_del', 1491012422, '删除'),
(69, 'Site/yibiao', 'id-btn-dialog2_add', 1491012660, '添加'),
(70, 'Site/yibiao', 'search_btn', 1491012677, '顶部搜索'),
(71, 'Site/yibiao', 'id-btn-dialog2_del', 1491012739, '删除'),
(72, 'Site/yibiao', 'id-btn-dialog2_edit', 1491012752, '编辑'),
(73, 'Site/tuopan', 'id-btn-dialog2_add', 1491012933, '添加'),
(74, 'Site/tuopan', 'search_btn', 1491012951, '顶部搜索'),
(75, 'Site/tuopan', 'id-btn-dialog2_del', 1491013135, '删除'),
(76, 'Site/tuopan', 'id-btn-dialog2_edit', 1491013143, '编辑'),
(86, 'Site/device', 'id-btn-dialog2_select_part', 1491960927, '右侧部位选择按钮'),
(87, 'Site/mould', 'id-btn-dialog2_select_lingjian', 1491961264, '右侧选择零件按钮'),
(89, 'Card/index4', 'cancel_2', 1491962583, 'cancel_2'),
(90, 'Card/index4', 'cancel_3', 1491962588, 'cancel_3'),
(91, 'Card/index4', 'sure_show', 1491962647, '查看'),
(92, 'Card/index4', 'id-btn-dialog2_del', 1491962698, '删除'),
(93, 'Card/index5', 'btn-open', 1491963056, '激活'),
(94, 'Card/index5', 'btn-close', 1491963077, '关闭'),
(95, 'Card/index5', 'id-btn-dialog2_del', 1491963104, '删除'),
(96, 'Card/index6', 'sure_1', 1491963484, 'sure_1'),
(97, 'Card/index6', 'sure_2', 1491963489, 'sure_2'),
(98, 'Card/index6', 'sure_3', 1491963493, 'sure_3'),
(99, 'Card/index6', 'cancel_1', 1491963502, 'cancel_1'),
(100, 'Card/index6', 'cancel_2', 1491963507, 'cancel_2'),
(101, 'Card/index6', 'cancel_3', 1491963510, 'cancel_3'),
(102, 'Card/index6', 'sure_show', 1491963568, '查看'),
(103, 'Card/index6', 'id-btn-dialog2_del', 1491963583, '删除'),
(104, 'Card/index6', 'id-btn-dialog2_gongxu', 1491963640, '派工'),
(105, 'Card/index7', 'search_btn', 1491963932, '搜索'),
(106, 'Card/index7', 'sure_1', 1491963942, 'sure_1'),
(107, 'Card/index7', 'sure_2', 1491963947, 'sure_2'),
(108, 'Card/index7', 'sure_3', 1491963952, 'sure_3'),
(109, 'Card/index7', 'cancel_1', 1491963969, 'cancel_1'),
(110, 'Card/index7', 'cancel_2', 1491963973, 'cancel_2'),
(111, 'Card/index7', 'cancel_3', 1491963977, 'cancel_3'),
(112, 'Card/index7', 'sure_show', 1491963994, '查看'),
(113, 'Card/index7', 'id-btn-dialog2_gongxu', 1491964008, '派工'),
(114, 'Card/index7', 'id-btn-dialog2_del', 1491964032, '删除'),
(115, 'Card/index8', 'search_btn', 1491964287, '顶部搜索按钮'),
(116, 'Card/index8', 'sure_1', 1491964300, 'sure_1'),
(117, 'Card/index8', 'sure_2', 1491964304, 'sure_2'),
(118, 'Card/index8', 'cancel_1', 1491964312, 'cancel_1'),
(119, 'Card/index8', 'cancel_2', 1491964315, 'cancel_2'),
(120, 'Card/index8', 'sure_show', 1491964349, '查看'),
(121, 'Card/index8', 'id-btn-dialog2_gongxu', 1491964369, '派工'),
(122, 'Card/index8', 'id-btn-dialog2_del', 1491964379, '删除'),
(123, 'Card/index1', 'search_btn', 1491964459, '顶部搜索按钮'),
(124, 'Card/index3', 'search_btn', 1491964522, '顶部搜索按钮'),
(125, 'Card/index2', 'search_btn', 1491964541, '顶部搜索按钮');

-- --------------------------------------------------------

--
-- 表的结构 `ez_role_buttons`
--

CREATE TABLE IF NOT EXISTS `ez_role_buttons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) NOT NULL,
  `page` varchar(255) NOT NULL,
  `buttons` text NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='每个用户每个页面具有哪些按钮操作权限' AUTO_INCREMENT=24 ;

--
-- 转存表中的数据 `ez_role_buttons`
--

INSERT INTO `ez_role_buttons` (`id`, `gid`, `page`, `buttons`, `time`) VALUES
(1, 412, 'Card/index4', 'sure_1,sure_2,sure_3,id-btn-dialog2_gongxu,cancel_1,cancel_2,cancel_3,sure_show,id-btn-dialog2_del', 1492411285),
(2, 413, 'Card/index4', 'sure_1,del', 1490580452),
(3, 414, 'Card/index4', 'sure_2,sure_3,del', 1490580492),
(18, 426, 'Card/index_1', 'add_errors', 1490940081),
(4, 415, 'Card/index4', 'sure_1', 1492411248),
(5, 416, 'Card/index4', 'haha', 1490580500),
(6, 427, 'Card/index4', '', 1490683673),
(8, 427, 'Card/index5', '', 1490769012),
(7, 426, 'Card/index4', 'sure_2,sure_3', 1490621734),
(9, 427, 'Card/index6', '', 1490769957),
(10, 427, 'User/index3_1', 'search_btn,id-btn-dialog2_add,id-btn-dialog2_show,id-btn-dialog2_edit,id-btn-dialog2_del', 1492667025),
(11, 427, 'Card/panel_12', 'search_btn,id-btn-dialog2_in,id-btn-dialog2_out,id-btn-dialog2_status,id-btn-dialog2_del', 1492411022),
(12, 427, 'Card/index', '', 1490841029),
(13, 427, 'Card/index_1', 'add_errors', 1490842557),
(20, 0, 'Card/index8', '', 1491964297),
(14, 427, 'Site/banci_2', '', 1490862934),
(15, 427, 'Card/panel_11', 'search_btn,id-btn-dialog2_detail,id-btn-dialog2_fanku,id-btn-dialog2_cancel', 1490928323),
(16, 427, 'Site/banliao', 'id-btn-dialog2,search_btn', 1490867575),
(17, 427, 'Card/index_2', 'search_btn,id-btn-dialog2_del,id-btn-dialog2_edit', 1490948748),
(19, 427, 'Site/tuopan', 'id-btn-dialog2_add,search_btn', 1491012983),
(21, 426, 'Card/panel_12', '', 1492611845),
(22, 426, 'Card/index', '', 1492611859),
(23, 420, 'Card/index_1', 'add_errors', 1492665899);

-- --------------------------------------------------------

--
-- 表的结构 `ez_type`
--

CREATE TABLE IF NOT EXISTS `ez_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL COMMENT '名字 ',
  `en_title` varchar(255) NOT NULL COMMENT '英文标题',
  `short_name` varchar(55) DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL COMMENT '父级id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1为开启0为关闭',
  `level` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '层级默认为0',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序默认为0',
  `desc` text NOT NULL COMMENT '描述',
  `en_desc` text NOT NULL COMMENT '英文描述',
  `img` varchar(100) NOT NULL COMMENT '图片',
  `class_id` int(11) NOT NULL DEFAULT '999' COMMENT '班级ID，仅为班级分类使用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=1239 ;

--
-- 转存表中的数据 `ez_type`
--

INSERT INTO `ez_type` (`id`, `title`, `en_title`, `short_name`, `pid`, `status`, `level`, `sort`, `desc`, `en_desc`, `img`, `class_id`) VALUES
(1, '根', 'GEN', NULL, 0, 1, 0, 1, '', '', '', 0),
(1238, '文章分类', '', NULL, 1, 1, 1, 11, '', '', '', 999);

-- --------------------------------------------------------

--
-- 表的结构 `ez_user`
--

CREATE TABLE IF NOT EXISTS `ez_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id（自动增长）',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `truename` varchar(100) NOT NULL,
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `gid` int(11) NOT NULL COMMENT '所属用户组',
  `auths` text NOT NULL COMMENT '教师所拥有的更细的权限',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1:启用 0:禁止',
  `phone` varchar(15) NOT NULL,
  `img` varchar(100) NOT NULL COMMENT '头像',
  `time` int(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `password` (`password`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=220 ;

--
-- 转存表中的数据 `ez_user`
--

INSERT INTO `ez_user` (`id`, `username`, `truename`, `password`, `gid`, `auths`, `status`, `phone`, `img`, `time`, `email`) VALUES
(1, 'admin', '超级管理员', 'e10adc3949ba59abbe56e057f20f883e', 427, '', 1, '13800138000', '/layui/587f6865d0a69.jpg', 0, '10000@qq.com'),
(2, 'guanliyuan', '管理员', 'e10adc3949ba59abbe56e057f20f883e', 427, '', 1, '', '/layui/58bd2cc493ca1.jpg', 1488439500, ''),
(3, 'fangke', '访客', 'e10adc3949ba59abbe56e057f20f883e', 426, '', 1, '', '/layui/58bd08eb974f1.png', 1488439555, ''),
(4, 'member1', '模具维修人', 'e10adc3949ba59abbe56e057f20f883e', 412, '', 1, '', '/layui/58bd2cbf5a80a.jpg', 1488439578, ''),
(5, 'zhangtr', '张腾瑞', 'e10adc3949ba59abbe56e057f20f883e', 423, '', 1, '', '/layui/58bd08e215c5e.png', 1488439588, ''),
(6, '213213', '123213213', 'e10adc3949ba59abbe56e057f20f883e', 420, '', 1, '', '/layui/58cb3f4ab7253.png', 1488439714, ''),
(206, '321321321', '321', 'e10adc3949ba59abbe56e057f20f883e', 2, '', 1, '', '/layui/58cb3f36692ee.png', 1489631440, ''),
(207, '3213213211', '3213213', 'e10adc3949ba59abbe56e057f20f883e', 412, '', 1, '', '/layui/58cb3f36692ee.png', 1489631450, ''),
(208, '32132132112', '32132132', 'e10adc3949ba59abbe56e057f20f883e', 422, '', 1, '', '/layui/58cb3d498e4bc.jpg', 1489631457, ''),
(219, 'admin88', 'admin88', '472a84ce7f8d3ee6b25253204092e262', 420, '', 1, '', '', 1492686796, ''),
(215, '4324324324', '张三虎', NULL, 420, '', 1, '', '/layui/58f8523a0b41c.png', 1492669012, ''),
(216, 'qrqwerqw', 'fdafda', NULL, 422, '', 1, '', '/layui/58f852bb360a2.png', 1492669134, '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
