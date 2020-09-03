/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 100413
Source Host           : localhost:3306
Source Database       : tables

Target Server Type    : MYSQL
Target Server Version : 100413
File Encoding         : 65001

Date: 2020-08-02 15:17:56
*/
SET NAMES UTF8;
DROP DATABASE IF EXISTS gcores;
CREATE DATABASE gcores CHARSET=UTF8;
USE gcores;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
-- 登录注册(用户表)
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(111) NOT NULL AUTO_INCREMENT,
  `username` char(8) NOT NULL,
  `password` varchar(13) NOT NULL DEFAULT '',
  `type` varchar(11) NOT NULL DEFAULT '',
  `phone` char(11) NOT NULL DEFAULT '',
  `nickname` varchar(24) DEFAULT '',
  `avatar` LONGTEXT,
  `gender` boolean DEFAULT '1',
  `comment` int(16) DEFAULT '0',
  `follow` int(16) DEFAULT '0',
  `thank` int(16) DEFAULT '0',
  PRIMARY KEY (`uid`,`phone`),
  UNIQUE KEY `uname` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
-- 轮播图(轮播图表)
CREATE TABLE banner(
    Bid BIGINT Not Null,
    Bimage VARCHAR(80) Not Null
);
-- 商品信息表
CREATE TABLE pro_info(
    Pid BIGINT  PRIMARY KEY auto_increment, 
    Pimage VARCHAR(80) Not Null,
    Ptype VARCHAR(16) ,
    Pname VARCHAR(32) Not Null,
    Ptitle VARCHAR(50),
    Pauthor VARCHAR(16),
    Ptime VARCHAR(16),
    Pup INT ,
    Pcomment INT ,
    Pnub INT 
);
-- 播单图表
CREATE TABLE broadcast (
  Broid bigint NOT NULL PRIMARY KEY,
  Broname VARCHAR(16) NOT NULL,
  BroInfo VARCHAR(50),
  BroImg VARCHAR(100) NOT NULL,
  BroColor VARCHAR(10) NOT NULL
);
-- 播单列表图表
CREATE TABLE broadcast_list (
  BroListid bigint NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Broid bigint NOT NULL ,FOREIGN KEY(Broid) REFERENCES broadcast(Broid),
  BroListName VARCHAR(32) NOT NULL,
  BroListType VARCHAR(16) NOT NULL,
  BroListDuration VARCHAR(16) NOT NULL,
  Pcomment Int(8),
  BroListImg VARCHAR(100) NOT NULL,
  Burl VARCHAR(100),
  BsingUrl VARCHAR(100)
);
-- 专题图片表
CREATE TABLE pro_special(
Pid BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
Pimage VARCHAR(80) NOT NULL
);
-- 收藏歌单表
CREATE TABLE love_song(
  ABid BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  -- 外键用户id
  AUid int NOT NULL,
  ABroListid bigint NOT NULL,
  ABroListDuration VARCHAR(16) NOT NULL,
  ABroListImg VARCHAR(100) NOT NULL,
  ABroListName VARCHAR(32) NOT NULL,
  ABroListType VARCHAR(16) NOT NULL,
  ABsingUrl VARCHAR(100),
  APcomment Int(8)
);
--游戏折扣分类表
CREATE TABLE gameList (
	queryName varchar(16),
	queryValues int(8),
	ikey varchar(16) 
);
--折扣游戏表
CREATE TABLE games (
	gamerurl varchar(140),
	gameName varchar(16),
	gameDintensity float(5,1),
	gameLanguage char(16),
	gameDmeta int,
	gamePlace varchar(16),
	gamePrice float(5,2),
	gameIntime int(8),
	gamePublicTime int(8),
	gameChinese boolean,
	gamePf varchar(16),
	gameCf varchar(16)
);
--即将发售分类表
CREATE TABLE willshow (
	willList varchar(16) not null,
	willValues int(2),
	ikey varchar(16)
);
--即将发售游戏
CREATE TABLE willgames (
	wgameurl varchar(140),
	wgameName varchar(16),
	wgamePrice float(5,2),
	wgameLanguage char(16),
	wgameTimme varchar(16),
	wgameChinese boolean,
	wgamefeatures varchar(16)
);
-- 电台详情页表
CREATE TABLE main_content(
    Mid BIGINT PRIMARY KEY AUTO_INCREMENT ,
    Mtitle VARCHAR (32) NOT NULL ,
    Mstory VARCHAR (32),
    Mtime VARCHAR (24),
    Mcontent1 VARCHAR (1000),
    Mcontent2 VARCHAR (1000),
    userId BIGINT ,
    FOREIGN KEY(userId) REFERENCES pro_info(Pid)
);
-- 游戏搜索
CREATE TABLE `gamesSearch` (
  `gid` int(20) NOT NULL AUTO_INCREMENT,
  `gname` varchar(40) NOT NULL ,
  `gimg` varchar(40) NOT NULL,
  `gtag` varchar(100),
  `gcut` decimal(3,2),
  `gprice` decimal(6,2),
  `gplace` varchar(10),
  PRIMARY KEY (`gid`)
);
-- 详情页1表
DROP TABLE IF EXISTS `artilescontent`;
CREATE TABLE `artilescontent` (
  `Arid` bigint(20) NOT NULL,
  `Artitle` varchar(64) NOT NULL,
  `ArSubtitle` varchar(32) DEFAULT NULL,
  `Arimage` varchar(255) DEFAULT NULL,
  `Arimagetwo` varchar(255) DEFAULT NULL,
  `Arauthor` varchar(255) DEFAULT NULL,
  `Artime` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`Arid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
-- 用户表
INSERT INTO `user` VALUES ('1', 'zhangsan', '111111', '0', '13500000000','','data:image/png;base64,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','','','','');
INSERT INTO `user` VALUES ('2', 'lisi', '123456', '0', '13800000000','','','','','','');
INSERT INTO `user` VALUES ('3', 'wangwu', '123456', '0', '13700000000','','','','','','');
INSERT INTO `user` VALUES ('9', 'zhaoliu', '222222', '0', '13600000000','','','','','','');
INSERT INTO `user` VALUES ('4', '张五', '123456', '0', '13800000000','','','','','','');
INSERT INTO `user` VALUES ('5', '张四', '123456', '0', '13700000000','','','','','','');
INSERT INTO `user` VALUES ('6', '张三', '222222', '0', '13600000000','','','','','','');

-- 轮播图表
INSERT INTO banner VALUES(1,"l1.jpg");
INSERT INTO banner VALUES(2,"l2.jpg");
INSERT INTO banner VALUES(3,"l3.jpg");

-- 商品信息表
-- 头部banner商品信息
INSERT INTO pro_info VALUES(null,"bottom1.jpg","","男人的浪漫 内藤泰弘的世界 铳墓Gungrave（游戏篇）","","栗子头","2019-02-03",130,16,5);
INSERT INTO pro_info VALUES(null,"bottom2.jpg","","竟然还有计算机语言？《炉石传说》新环境“通灵学院”里藏着那些梗","","NJBK","2020-07-31",99,35,5);
INSERT INTO pro_info VALUES(null,"bottom3.jpg","","《克苏鲁的召唤》跑团游戏是如何诞生的：混沌元素早期发展简史","","乐博睿文化","2020-08-01",30,4,5);
INSERT INTO pro_info VALUES(null,"bottom4.jpg","","领航员和路书：拉力车手眼睛的延伸","拉力车手旁边为什么会有个人在讲Bbox？","末日发动机","6小时前",30,10,5);
INSERT INTO pro_info VALUES(null,"bottom5.jpg","","不停止忧虑，也不停止欢笑 | 发售倒计时：《斩妖行》","为了自己的诚意，全力以赴","四十二","一天前",58,64,5);
INSERT INTO pro_info VALUES(null,"bottom6.jpg","","婚礼设计真奇妙，就缺朋友走一套 天天ACG 7.22~8.05","还没朋友，就开始聊婚礼与中年危机","第二份食物","16小时前",92,135,5);
INSERT INTO pro_info VALUES(null,"main_top_1.gif","","g","","","","","",6);
-- 咨询板块商品信息
INSERT INTO pro_info VALUES(null,"ad1.jpg","","《控制》DLC“AWE”将于8月27日发售，State of Play直播汇总","","","15",99,99,0);
INSERT INTO pro_info VALUES(null,"ad2.jpg","","对谈《骑马与砍杀2 霸主》创始人 Armagan Yavuz","","","25",99,99,0);
INSERT INTO pro_info VALUES(null,"ad3.jpg","","《彼岸花》开发组CEO亲自介绍游戏开发背景","","","37",99,99,0);
INSERT INTO pro_info VALUES(null,"ad4.jpg","","Gfest直播：《博德之门3》详细中文字幕实机游玩演示","","","40",99,99,0);
INSERT INTO pro_info VALUES(null,"ad5.jpg","","连线柳叶刀工作室，Gfest直播《边境》实机对战演示","","","52",99,99,0);
INSERT INTO pro_info VALUES(null,"ad6.jpg","","Gfest直播：《看门狗：军团》Inside Albion任务体验","","","20",99,99,0);
INSERT INTO pro_info VALUES(null,"ad7.jpg","","《四海兄弟：最终版》将拥有更细致的城市和更丰满的角色","","","22",99,99,0);
INSERT INTO pro_info VALUES(null,"ad8.jpg","","Gfest公布《光环：无限》团队负责人游戏试玩解说","","","33",99,99,0);
INSERT INTO pro_info VALUES(null,"ad9.jpg","","【叹气】《全职猎人》今日再破连续停更纪录","","","35",99,99,0);
INSERT INTO pro_info VALUES(null,"ad10.jpg","","下周节目预告8.10~8.16","","","36",99,99,0);
INSERT INTO pro_info VALUES(null,"ad11.jpg","","TV动画《半妖的夜叉姬》PV&声优阵容公开，10月3日开播","","","35",99,99,0);
INSERT INTO pro_info VALUES(null,"ad12.jpg","","8→∞｜八月八日丁卯点阵体预售直播交流","","","55",99,99,0);
INSERT INTO pro_info VALUES(null,"ad13.jpg","","一曲情歌献给离开Xbox Game Pass的游戏们：来自微软的搞笑广告短片","","","58",99,99,0);
INSERT INTO pro_info VALUES(null,"ad14.jpg","","微软：目前没有改变Xbox Live Gold的计划","","","59",99,99,0);
INSERT INTO pro_info VALUES(null,"ad15.jpg","","《控制》公布新DLC“AWE”最新预告视频","","","12",99,99,0);
INSERT INTO pro_info VALUES(null,"ad16.jpg","","拒绝云游戏，苹果宣布Project xCloud与Stadia违反应用商店规则","","","10",99,99,0);
INSERT INTO pro_info VALUES(null,"ad17.jpg","","《破晓之翼》第7集《天空》正式公开，系列正式完结","","","30",99,99,0);
INSERT INTO pro_info VALUES(null,"ad18.jpg","","《FIFA21》更新全新预告片，展示本作多项新功能","","","44",99,99,0);
INSERT INTO pro_info VALUES(null,"ad19.jpg","","《英雄萨姆4》将在9月24日正式发售","","","52",99,99,0);
INSERT INTO pro_info VALUES(null,"ad20.jpg","","投篮条变了！《NBA 2K21》本世代版本新预告释出","","","45",99,99,0);
-- 最新板块商品信息
INSERT INTO pro_info VALUES(null,"ne1.jpg","有感而发","再体验一次广袤大地的狩猎旅途：PC版《地平线：零之曙光》上手体验","PC版就是可以为所欲为","雪豆","15",99,99,1);
INSERT INTO pro_info VALUES(null,"ne2.jpg","知识挖掘机","从炮灰到精锐：属于吉姆的进化之路","不只是炮灰的量产机","感觉良好","10",99,99,1);
INSERT INTO pro_info VALUES(null,"ne3.jpg","安利大帝","中国PS4游戏销量榜单 | 2020年7月","游戏核心玩法略显枯燥繁复，但与主题达成了奇妙的契合","Jackie","20",99,99,1);
INSERT INTO pro_info VALUES(null,"ne4.jpg","聊聊产业","《空箱》测评：一个国产反乌托邦寓言独立游戏","无头杂兵与古代加特林","Youand","30",99,99,1);
INSERT INTO pro_info VALUES(null,"ne5.jpg","电台","《战锤40,000》九版拆包体验（上）","【GW深圳官店】不屈对战大包悦享","TKazuya","12",99,99,2);
INSERT INTO pro_info VALUES(null,"ne6.jpg","安利大帝","《现代艺术史》：现代艺术领域最重要巨著，国内首度正版足本引进","真·一本书带你读懂现代艺术","后浪","55",99,99,2);
INSERT INTO pro_info VALUES(null,"ne7.jpg","故事烩","轻奇幻 | 普拉切特的一天（10","普拉切特老爷姑且算是个公务员，他从回忆的梦境里惊醒，开始了枯燥且忙碌的一天。","火彩_","17",99,99,2);
INSERT INTO pro_info VALUES(null,"ne8.jpg","吉考斯工业","这个周末一起和吉考斯在北京 751 火车市集夏日摇滚聚会躁起来吧！","有喝有玩还有好音乐！","yn27","45",99,99,3);
INSERT INTO pro_info VALUES(null,"ne9.jpg","视觉动物","明星制作人与公司背后的英雄们（3）：Arkane三杰","这次介绍的是为Arkane工作室工作过的三位艺术创作者","山谷深处","54",99,99,3);
INSERT INTO pro_info VALUES(null,"ne10.jpg","有感而发","《即兴精酿》：最有味道的融合爵士专辑","混乱发酵，最为致命。","黑胶盒子","35",99,99,3);
INSERT INTO pro_info VALUES(null,"ne11.jpg","电台","《猎魔人》系列有声书已在机核上线！","2020精装新修订版《猎魔人》全七册也已经开始预售（有独家赠品","河童","53",99,99,3);
INSERT INTO pro_info VALUES(null,"ne12.jpg","视觉动物","《对马岛之魂》截图分享","有内味了","二狗_TwoDog","46",99,99,3);
INSERT INTO pro_info VALUES(null,"ne13.jpg","人物","为什么大家都爱特立独行的KAWS?","为什么大家都爱特立独行的KAWS?","WhamToy万木","47",99,99,3);
INSERT INTO pro_info VALUES(null,"ne14.jpg","资讯","China JOY 2020 游记：周末我逛了逛全程戴口罩的游戏展","没有「御三家」，还能看点啥","叉小包","58",99,99,3);
INSERT INTO pro_info VALUES(null,"ne15.jpg","有感而发","《泰拉瑞亚》：小小沙盒里的史诗冒险","旅途永不终结","短路天兵","59",99,99,3);
INSERT INTO pro_info VALUES(null,"ne16.jpg","知识挖掘机","狸猫换太子，从《济科足球》来聊聊任天堂的“未授权游戏”","父母给孩子买了一张足球游戏，打开一看竟然是……","雪豆","59",99,99,3);
INSERT INTO pro_info VALUES(null,"ne17.jpg","有感而发","《控制》DLC“AWE”将于8月27日发售，State of Play直播汇总","PC版就是可以为所欲为","雪豆","15",99,99,3);
INSERT INTO pro_info VALUES(null,"ne18.jpg","安利大帝","对谈《骑马与砍杀2 霸主》创始人 Armagan Yavuz","无头杂兵与古代加特林","Youand","25",99,99,3);
INSERT INTO pro_info VALUES(null,"ne19.jpg","文章","《彼岸花》开发组CEO亲自介绍游戏开发背景","混乱发酵，最为致命。","后浪","37",99,99,3);
INSERT INTO pro_info VALUES(null,"ne20.jpg","资讯","Gfest直播：《博德之门3》详细中文字幕实机游玩演示","PC版就是可以为所欲为","雪豆","40",99,99,3);
INSERT INTO pro_info VALUES(null,"ne21.jpg","视觉动物","连线柳叶刀工作室，Gfest直播《边境》实机对战演示","真·一本书带你读懂现代艺术","Youand","52",99,99,3);
INSERT INTO pro_info VALUES(null,"ne22.jpg","安利大帝","Gfest直播：《看门狗：军团》Inside Albion任务体验","混乱发酵，最为致命。","yn27","20",99,99,3);
INSERT INTO pro_info VALUES(null,"ne23.jpg","文章","《四海兄弟：最终版》将拥有更细致的城市和更丰满的角色","有喝有玩还有好音乐！","Youand","22",99,99,3);
INSERT INTO pro_info VALUES(null,"ne24.jpg","资讯","Gfest公布《光环：无限》团队负责人游戏试玩解说","真·一本书带你读懂现代艺术","雪豆","33",99,99,3);
INSERT INTO pro_info VALUES(null,"ne25.jpg","官方活动","【叹气】《全职猎人》今日再破连续停更纪录","无头杂兵与古代加特林","后浪","35",99,99,3);
INSERT INTO pro_info VALUES(null,"ne26.jpg","资讯","下周节目预告8.10~8.16","混乱发酵，最为致命。","yn27","36",99,99,3);
INSERT INTO pro_info VALUES(null,"ne27.jpg","文章","TV动画《半妖的夜叉姬》PV&声优阵容公开，10月3日开播","PC版就是可以为所欲为","yn27","35",99,99,3);
INSERT INTO pro_info VALUES(null,"ne28.jpg","有感而发","8→∞｜八月八日丁卯点阵体预售直播交流","混乱发酵，最为致命。","yn27","55",99,99,3);
INSERT INTO pro_info VALUES(null,"ne29.jpg","电台","一曲情歌献给离开Xbox Game Pass的游戏们：来自微软的搞笑广告短片","混乱发酵，最为致命。","yn27","58",99,99,3);
INSERT INTO pro_info VALUES(null,"ne30.jpg","官方活动","微软：目前没有改变Xbox Live Gold的计划","真·一本书带你读懂现代艺术","后浪","59",99,99,3);
INSERT INTO pro_info VALUES(null,"ne31.jpg","电台","《控制》公布新DLC“AWE”最新预告视频","无头杂兵与古代加特林","yn27","12",99,99,3);
INSERT INTO pro_info VALUES(null,"ne32.jpg","资讯","拒绝云游戏，苹果宣布Project xCloud与Stadia违反应用商店规则","有喝有玩还有好音乐！","yn27","10",99,99,3);
INSERT INTO pro_info VALUES(null,"ne33.jpg","文章","《破晓之翼》第7集《天空》正式公开，系列正式完结","PC版就是可以为所欲为","雪豆","30",99,99,3);
INSERT INTO pro_info VALUES(null,"ne34.jpg","安利大帝","《FIFA21》更新全新预告片，展示本作多项新功能","有喝有玩还有好音乐！","yn27","44",99,99,3);
INSERT INTO pro_info VALUES(null,"ne35.jpg","资讯","《英雄萨姆4》将在9月24日正式发售","无头杂兵与古代加特林","后浪","52",99,99,3);
INSERT INTO pro_info VALUES(null,"ne36.jpg","电台","投篮条变了！《NBA 2K21》本世代版本新预告释出","真·一本书带你读懂现代艺术","雪豆","45",199,909,3);
INSERT INTO pro_info VALUES(null,"ne37.jpg","文章","连线柳叶刀工作室，Gfest直播《边境》实机对战演示","真·一本书带你读懂现代艺术","Youand","52",29,49,3);
INSERT INTO pro_info VALUES(null,"ne38.jpg","安利大帝","Gfest直播：《看门狗：军团》Inside Albion任务体验","混乱发酵，最为致命。","yn27","20",99,99,3);
INSERT INTO pro_info VALUES(null,"ne39.jpg","文章","《四海兄弟：最终版》将拥有更细致的城市和更丰满的角色","有喝有玩还有好音乐！","Youand","22",91,99,3);
INSERT INTO pro_info VALUES(null,"ne40.jpg","电台","Gfest公布《光环：无限》团队负责人游戏试玩解说","真·一本书带你读懂现代艺术","雪豆","33",949,95,3);
-- 咨询详情页侧边栏
INSERT INTO pro_info VALUES(null,"i1.png","","浅谈玩家类型和游戏动机（一）","","","",12,23,7);
INSERT INTO pro_info VALUES(null,"i2.png","","除了“打击感”咱还有啥？聊聊怎么设计动作游戏（七）","","","",12,23,7);
INSERT INTO pro_info VALUES(null,"i3.png","","我和合租室友有关《最后生还者2》与沉浸感的争论","","","",69,29,7);
INSERT INTO pro_info VALUES(null,"i4.png","","赛·托姆布雷：与世隔绝的抽象主义大师","","","",64,18,7);
INSERT INTO pro_info VALUES(null,"i5.png","","爱与鞭策：回顾日剧《女王的教室》","","","",98,68,7);
INSERT INTO pro_info VALUES(null,"i6.png","","如何通过劳动养活一个《骑马与砍杀：战团》服务器的人","","","",68,23,7);
INSERT INTO pro_info VALUES(null,"i7.png","","解析《头号玩家》的背景设定和视觉效果","","","",46,97,7);
INSERT INTO pro_info VALUES(null,"i8.png","","动画中的强迫症：站在患者角度的诠释和解读","","","",56,72,7);
INSERT INTO pro_info VALUES(null,"i9.png","","从炮灰到精锐：属于吉姆的进化之路","","","",189,235,7);
INSERT INTO pro_info VALUES(null,"i10.png","","《空箱》测评：一个国产反乌托邦寓言独立游戏","","","",88,111,7);
-- 文章模块
INSERT INTO pro_info VALUES(null,"ar1.jpg","文章","Gfest公布《光环：无限》团队负责人游戏试玩解说","真·一本书带你读懂现代艺术","雪豆","33",121,109,20);
INSERT INTO pro_info VALUES(null,"ar2.jpg","电台","从“致敬《1984》”到“戏仿‘1984’”：EPIC与苹果的争端，起源于36年前","商业就是这样的","Monsterday","47",23,12,20);
INSERT INTO pro_info VALUES(null,"ar3.jpg","电台","直到世界的尽头：安利两部关于海军冒险的虚构作品","“霍恩布洛尔”系列和“奥布雷与马图林”系列传奇","饭克里夫大尉","2",28,18,20);
INSERT INTO pro_info VALUES(null,"ar4.jpg","电台","游戏后感丨乙女游戏《Collar×Malice》：正义、回忆与恶意","全篇剧透","饼干_","4",88,78,20);
INSERT INTO pro_info VALUES(null,"ar5.jpg","文章","《丸霸无双》水友淘汰赛选手招募启动｜Spark图一乐","锤大进不如互相锤，越锤越快洛~","Kounoshin","40",122,11,20);
INSERT INTO pro_info VALUES(null,"ar6.jpg","资讯","聊聊游戏剧情的结局：不是叙事的终点，而是叙事的过程说","有这么一些游戏，它们披着“多结局”的皮，但其实只有一个“真结局”","purpleowi","45",45,49,20);
INSERT INTO pro_info VALUES(null,"ar7.jpg","资讯","上海时装秀：LV写给玩具的情书","潮流玩具成为LV上海春夏男装秀的重要元素","WhamToys玩慕","35",999,189,20);
INSERT INTO pro_info VALUES(null,"ar8.jpg","文章","真人电影《飙速宅男》开场映像公开，日本8月14日上映","看观众评价还不错的样子","冰镇猫","33",66,15,20);
INSERT INTO pro_info VALUES(null,"ar9.jpg","文章","“西奈雄狮”的真实故事：聊聊《坦克世界》成就的背后历史","现实中IS系列重型坦克在二战结束后唯一一次大战以及其他的故事","西米恩说","45",1541,1049,20);
INSERT INTO pro_info VALUES(null,"ar10.jpg","资讯","好的故事千篇一律：用故事圈理论解构《最后生还者》初代","真·一本书带你读懂现代艺术","雪豆","33",121,109,20);
INSERT INTO pro_info VALUES(null,"ar11.jpg","资讯","Gfest公布《光环：无限》团队负责人游戏试玩解说","对比引发全球炎上的2代，1代剧情到底成功在哪里？","supper","36",171,209,20);
INSERT INTO pro_info VALUES(null,"ar12.jpg","文章","再体验一次广袤大地的狩猎旅途：PC版《地平线：零之曙光》上手体验","PC版就是可以为所欲为","雪豆","15",929,929,20);
INSERT INTO pro_info VALUES(null,"ar13.jpg","文章","游戏后感丨乙女游戏《Collar×Malice》：正义、回忆与恶意","全篇剧透","饼干_","4",88,78,20);
INSERT INTO pro_info VALUES(null,"ar14.jpg","知识挖掘机","从炮灰到精锐：属于吉姆的进化之路","不只是炮灰的量产机","感觉良好","10",789,899,20);
INSERT INTO pro_info VALUES(null,"ar15.jpg","资讯","中国PS4游戏销量榜单 | 2020年7月","游戏核心玩法略显枯燥繁复，但与主题达成了奇妙的契合","Jackie","20",542,219,20);
INSERT INTO pro_info VALUES(null,"ar16.jpg","资讯","《空箱》测评：一个国产反乌托邦寓言独立游戏","无头杂兵与古代加特林","Youand","30",524,555,20);
INSERT INTO pro_info VALUES(null,"ar17.jpg","资讯","《战锤40,000》九版拆包体验（上）","【GW深圳官店】不屈对战大包悦享","TKazuya","12",523,952,20);
INSERT INTO pro_info VALUES(null,"ar18.jpg","资讯","《现代艺术史》：现代艺术领域最重要巨著，国内首度正版足本引进","真·一本书带你读懂现代艺术","后浪","55",784,449,20);
INSERT INTO pro_info VALUES(null,"ar19.jpg","电台","轻奇幻 | 普拉切特的一天（10","普拉切特老爷姑且算是个公务员，他从回忆的梦境里惊醒，开始了枯燥且忙碌的一天。","火彩_","17",231,199,20);
INSERT INTO pro_info VALUES(null,"ar20.jpg","资讯","这个周末一起和吉考斯在北京 751 火车市集夏日摇滚聚会躁起来吧！","有喝有玩还有好音乐！","yn27","45",99,99,3);
INSERT INTO pro_info VALUES(null,"ar21.jpg","电台","明星制作人与公司背后的英雄们（3）：Arkane三杰","这次介绍的是为Arkane工作室工作过的三位艺术创作者","山谷深处","54",429,399,20);
INSERT INTO pro_info VALUES(null,"ar22.jpg","电台","《即兴精酿》：最有味道的融合爵士专辑","混乱发酵，最为致命。","黑胶盒子","35",459,239,20);
INSERT INTO pro_info VALUES(null,"ar23.jpg","资讯","《猎魔人》系列有声书已在机核上线！","2020精装新修订版《猎魔人》全七册也已经开始预售（有独家赠品","河童","53",321,221,20);
INSERT INTO pro_info VALUES(null,"ar24.jpg","电台","《对马岛之魂》截图分享","有内味了","二狗_TwoDog","46",456,556,20);
INSERT INTO pro_info VALUES(null,"ar25.jpg","文章","为什么大家都爱特立独行的KAWS?","为什么大家都爱特立独行的KAWS?","WhamToy万木","47",91,99,20);
INSERT INTO pro_info VALUES(null,"ar26.jpg","电台","China JOY 2020 游记：周末我逛了逛全程戴口罩的游戏展","没有「御三家」，还能看点啥","叉小包","58",99,99,20);
INSERT INTO pro_info VALUES(null,"ar27.jpg","文章","《泰拉瑞亚》：小小沙盒里的史诗冒险","旅途永不终结","短路天兵","59",29,91,20);
INSERT INTO pro_info VALUES(null,"ar28.jpg","电台","狸猫换太子，从《济科足球》来聊聊任天堂的“未授权游戏”","父母给孩子买了一张足球游戏，打开一看竟然是……","雪豆","59",59,92,20);
INSERT INTO pro_info VALUES(null,"ar29.jpg","电台","《控制》DLC“AWE”将于8月27日发售，State of Play直播汇总","PC版就是可以为所欲为","雪豆","15",123,222,20);
INSERT INTO pro_info VALUES(null,"ar30.jpg","资讯","对谈《骑马与砍杀2 霸主》创始人 Armagan Yavuz","无头杂兵与古代加特林","Youand","25",145,111,20);
INSERT INTO pro_info VALUES(null,"ar31.jpg","文章","《彼岸花》开发组CEO亲自介绍游戏开发背景","混乱发酵，最为致命。","后浪","37",452,119,20);
INSERT INTO pro_info VALUES(null,"ar32.jpg","资讯","Gfest直播：《博德之门3》详细中文字幕实机游玩演示","PC版就是可以为所欲为","雪豆","40",752,654,20);
INSERT INTO pro_info VALUES(null,"ar33.jpg","电台","连线柳叶刀工作室，Gfest直播《边境》实机对战演示","真·一本书带你读懂现代艺术","Youand","52",456,321,20);
INSERT INTO pro_info VALUES(null,"ar34.jpg","资讯","Gfest直播：《看门狗：军团》Inside Albion任务体验","混乱发酵，最为致命。","yn27","20",741,123,20);
INSERT INTO pro_info VALUES(null,"ar35.jpg","文章","《四海兄弟：最终版》将拥有更细致的城市和更丰满的角色","有喝有玩还有好音乐！","Youand","22",852,456,20);
INSERT INTO pro_info VALUES(null,"ar36.jpg","电台","Gfest公布《光环：无限》团队负责人游戏试玩解说","真·一本书带你读懂现代艺术","雪豆","33",963,452,20);
INSERT INTO pro_info VALUES(null,"ar37.jpg","电台","【叹气】《全职猎人》今日再破连续停更纪录","无头杂兵与古代加特林","后浪","35",147,452,20);
INSERT INTO pro_info VALUES(null,"ar38.jpg","电台","下周节目预告8.10~8.16","混乱发酵，最为致命。","yn27","36",258,321,10);
INSERT INTO pro_info VALUES(null,"ar39.jpg","文章","TV动画《半妖的夜叉姬》PV&声优阵容公开，10月3日开播","PC版就是可以为所欲为","yn27","35",369,654,20);
INSERT INTO pro_info VALUES(null,"ar40.jpg","资讯","8→∞｜八月八日丁卯点阵体预售直播交流","混乱发酵，最为致命。","yn27","55",471,582,20);
INSERT INTO pro_info VALUES(null,"ar41.jpg","资讯","一曲情歌献给离开Xbox Game Pass的游戏们：来自微软的搞笑广告短片","混乱发酵，最为致命。","yn27","58",714,285,20);
INSERT INTO pro_info VALUES(null,"ar42.jpg","资讯","微软：目前没有改变Xbox Live Gold的计划","真·一本书带你读懂现代艺术","后浪","59",357,124,20);
INSERT INTO pro_info VALUES(null,"ar43.jpg","电台","《控制》公布新DLC“AWE”最新预告视频","无头杂兵与古代加特林","yn27","12",99,99,20);
INSERT INTO pro_info VALUES(null,"ar44.jpg","电台","拒绝云游戏，苹果宣布Project xCloud与Stadia违反应用商店规则","有喝有玩还有好音乐！","yn27","10",99,109,20);
INSERT INTO pro_info VALUES(null,"ar45.jpg","电台","《破晓之翼》第7集《天空》正式公开，系列正式完结","PC版就是可以为所欲为","雪豆","30",99,99,20);
INSERT INTO pro_info VALUES(null,"ar46.jpg","资讯","《FIFA21》更新全新预告片，展示本作多项新功能","有喝有玩还有好音乐！","yn27","44",352,199,20);
INSERT INTO pro_info VALUES(null,"ar47.jpg","资讯","《英雄萨姆4》将在9月24日正式发售","无头杂兵与古代加特林","后浪","52",199,200,20);
INSERT INTO pro_info VALUES(null,"ar48.jpg","文章","投篮条变了！《NBA 2K21》本世代版本新预告释出","真·一本书带你读懂现代艺术","雪豆","45",199,909,20);
INSERT INTO pro_info VALUES(null,"ar49.jpg","文章","连线柳叶刀工作室，Gfest直播《边境》实机对战演示","真·一本书带你读懂现代艺术","Youand","52",29,49,20);
INSERT INTO pro_info VALUES(null,"ar50.jpg","文章","Gfest直播：《看门狗：军团》Inside Albion任务体验","混乱发酵，最为致命。","yn27","20",100,99,20);
INSERT INTO pro_info VALUES(null,"ar51.jpg","文章","《四海兄弟：最终版》将拥有更细致的城市和更丰满的角色","有喝有玩还有好音乐！","Youand","22",91,99,20);
INSERT INTO pro_info VALUES(null,"ar52.jpg","文章","Gfest公布《光环：无限》团队负责人游戏试玩解说","真·一本书带你读懂现代艺术","雪豆","33",949,995,20);

-- 播单图表数据
INSERT INTO `broadcast` (`Broid`,`Broname`,`BroInfo`,`BroImg`,`BroColor`) VALUES 
(1,'爱车之人','我们与汽车的故事',"bro1.jpg",'#94818e'),
(2,'《暗黑破坏神》的历史','玩家们对于《Diablo》的游戏可能耳熟能详，但是在它后隐藏的波澜壮阔的历史，却很少有人能够知晓',"bro2.jpg",'#290803'),
(3,'啥也不干，只玩游戏','我们的游戏玩后感',"bro3.jpg",'#7f202f'),
(4,'在机核，聊足球','闲侃比赛，聊聊作品',"bro4.jpg",'#978780'),
(5,'不插电，也好玩：桌游系列节目','聊聊各式各样的桌游，以及这些桌游背后的故事',"bro5.png",'#9d9d9d'),
(6,'在机核，聊足球','闲侃比赛，聊聊作品',"bro4.jpg",'#978780'),
(7,'在机核，聊足球','闲侃比赛，聊聊作品',"bro4.jpg",'#978780'),
(8,'在机核，聊足球','闲侃比赛，聊聊作品',"bro4.jpg",'#978780'),
(9,'在机核，聊足球','闲侃比赛，聊聊作品',"bro4.jpg",'#978780'),
(10,'在机核，聊足球','闲侃比赛，聊聊作品',"bro4.jpg",'#978780'),
(11,'在机核，聊足球','闲侃比赛，聊聊作品',"bro4.jpg",'#978780'),
(12,'在机核，聊足球','闲侃比赛，聊聊作品',"bro4.jpg",'#978780'),
(13,'在机核，聊足球','闲侃比赛，聊聊作品',"bro4.jpg",'#978780'),
(14,'在机核，聊足球','闲侃比赛，聊聊作品',"bro4.jpg",'#978780'),
(15,'在机核，聊足球','闲侃比赛，聊聊作品',"bro4.jpg",'#978780'),
(16,'在机核，聊足球','闲侃比赛，聊聊作品',"bro4.jpg",'#978780'),
(17,'在机核，聊足球','闲侃比赛，聊聊作品',"bro4.jpg",'#978780'),
(18,'在机核，聊足球','闲侃比赛，聊聊作品',"bro4.jpg",'#978780');

-- 播单列表图表数据
INSERT INTO `broadcast_list` (`BsingUrl`,`Burl`,`Broid`,`BroListName`,`BroListType`,`BroListDuration`,`Pcomment`,`BroListImg`) VALUES 
('天外来物.mp3','',1,'《JDM战国史》第二章：那是爱车之人的黄金时代（上）','Gadio Pro','62:16',205,'bro1-1.jpg'),
('dxh.mp3','',1,'回想起自己第一天开车上路，无地自容','Gadio Pro','62:16',22,'bro1-2.jpg'),
('TaylorSwift.mp3','',1,'你可能没听说过这些车，但它们是最纯正的JDM','Gadio Pro','62:16',12,'bro1-3.jpg'),
('明年今日.mp3','',1,'《JDM战国史》第一章：那些日本品牌终于开始造车了','Gadio Pro','62:16',202,'bro1-4.jpg'),
('逆战.mp3','',1,'《JDM战国史》第零章：你知道的那些日本车厂，最早与车没什么关系','Gadio Pro','62:16',21,'bro1-5.jpg'),
('倩女幽魂.mp3','',1,'办公室里的“爱车之人”想与你分享他们和汽车的故事','Gadio Pro','62:16',502,'bro1-6.jpg'),
('深夜书店.mp3','',2,'暗黑破坏神故事：奈非天的觉醒（完结）','Gadio Pro','62:16',242,'bro2-1.jpg'),
('天外来物.mp3','',2,'直到地狱的尽头，至死方休——暗黑破坏神2的猎魔故事','Gadio Pro','62:16',447,'bro2-2.jpg'),
('我的一个道姑朋友.mp3','',2,'王权没有永恒：《暗黑破坏神》1代整个就是出悲剧','Gadio Pro','62:16',77,'bro2-3.jpg'),
('夜空中最亮的星.mp3','',2,'暗黑破坏神的故事：三魔之猎','Gadio Pro','62:16',85,'bro2-4.jpg'),
('勇气.mp3',2,'','暗黑破坏神故事：庇护之地的人类史诗','Gadio Pro','62:16',96,'bro2-5.jpg'),
('天外来物.mp3','',2,'暗黑破坏神故事：天堂群英与庇护之地的建立','Gadio Pro','62:16',41,'bro2-6.jpg'),
('dxh.mp3','',2,'暗黑破坏神的故事：世界起源','Gadio Pro','62:16',76,'bro2-7.jpg'),
('TaylorSwift.mp3','',3,'啥也不干，只玩游戏：二次元与黑泽明','Gadio Life','62:16',121,'bro3-1.jpg'),
('深夜书店.mp3','',3,'啥也不干只玩游戏：春眠不觉晓，游戏真不少','Gadio Life','62:16',75,'bro3-2.jpg'),
('逆战.mp3','',3,'啥也不干，只玩游戏：DOOM动森齐上架，时间不够真可怕','Gadio Life','62:16',74,'bro3-3.jpg'),
('深夜书店.mp3','',3,'啥也不干，只玩游戏：在家憋得我什么都玩！','Gadio Life','62:16',97,'bro3-4.jpg'),
('天外来物.mp3','',3,'啥也不干，只玩游戏：争当横滨活雷锋','Gadio Life','62:16',65,'bro3-5.jpg'),
('TaylorSwift.mp3','',3,'啥也不干，只玩游戏：11月的时间都去哪了','Gadio Life','62:16',22,'bro3-6.jpg'),
('dxh.mp3','',3,'啥也不干，狂玩《死亡搁浅》，当然还有《COD》和《天外世界》','Gadio Life','62:16',49,'bro3-7.jpg'),
('TaylorSwift.mp3','',3,'啥也不干，就玩游戏：十一窝家里都玩了点啥','Gadio Life','62:16',76,'bro3-8.jpg'),
('逆战.mp3','',3,'啥也不干，只玩游戏：9月下半旬的玩后感','Gadio Life','62:16',64,'bro3-9.jpg'),
('天外来物.mp3','',4,'闲侃世界杯——决赛篇','Gadio Life','62:16',97,'bro4-1.jpg'),
('dxh.mp3','',4,'闲侃世界杯——八强篇','Gadio Life','62:16',35,'bro4-2.jpg'),
('TaylorSwift.mp3','',4,'闲侃世界杯——小组赛篇','Gadio Life','62:16',36,'bro4-3.jpg'),
('TaylorSwift.mp3','',4,'《足球小将》的诞生与影响，聊一聊这部让无数人爱上足球的经典作','Gadio Life','62:16',38,'bro4-4.jpg'),
('TaylorSwift.mp3','',5,'亚特兰蒂斯的神秘与乐趣','Gadio Pro','62:16',57,'bro5-1.jpg'),
('逆战.mp3','',5,'桌游还能用来讲故事？给您介绍一些专门讲故事的桌游','Gadio Pro','62:16',97,'bro5-2.jpg'),
('天外来物.mp3','',5,'桌游中的大自然','Gadio Pro','62:16',46,'bro5-3.jpg'),
('倩女幽魂.mp3','',5,'孤身一人别难过，单人桌游伴你乐','Gadio Pro','62:16',87,'bro5-4.jpg'),
('TaylorSwift.mp3','',5,'用人之道乃是帝王之道，工人摆放类桌游的快乐就是这么朴实无华','Gadio Pro','62:16',4564,'bro5-5.jpg'),
('倩女幽魂.mp3','',5,'《大富翁》和《层层叠》的诞生背后，还有一场无奈的“亲子争夺战”','Gadio Pro','62:16',434,'bro5-6.jpg'),
('天外来物.mp3','',5,'想体验城市规划的快乐？这类桌游可以满足你','Gadio Pro','62:16',757,'bro5-7.jpg'),
('TaylorSwift.mp3','',5,'假期来了，给您安利九款超级有趣的桌游','Gadio Pro','62:16',644,'bro5-8.jpg'),
('dxh.mp3','',5,'两个世界闻名神秘组织的秘密，都在这里','Gadio Pro','62:16',987,'bro5-9.jpg'),
('深夜书店.mp3','',5,'金字塔封住了千年的时光，但没压住超越时间的乐趣','Gadio Pro','62:16',434,'bro5-10.jpg'),
('倩女幽魂.mp3','',5,'桌面上的西部世界','Gadio Pro','62:16',757,'bro5-11.jpg'),
('明年今日.mp3','',5,'乐高与桌游的故事','Gadio Pro','62:16',543,'bro5-12.jpg'),
('dxh.mp3','',5,'桌游还能用来做些什么？','Gadio Pro','62:16',77,'bro5-13.jpg'),
('天外来物.mp3','',5,'当桌游遇上黑科技','Gadio Pro','62:16',1,'bro5-14.jpg'),
('dxh.mp3','',5,'为什么很多众筹界的明星项目往往都是桌游？','Gadio Pro','62:16',876,'bro5-15.jpg'),
('dxh.mp3','',5,'情报类桌游，讲讲桌游里情报、战争与秘密行动','Gadio Pro','62:16',74,'bro5-16.jpg'),
('天外来物.mp3','',5,'商业类桌游——藏在桌游里的生意经 ','Gadio Pro','62:16',46,'bro5-17.jpg'),
('TaylorSwift.mp3','',5,'给你推荐一个有趣的桌游展，并且告诉你去了怎么玩','Gadio Pro','62:16',127,'bro5-18.jpg'),
('深夜书店.mp3','',5,'在这款桌游里，他们想让克苏鲁赢得美国大选','Gadio Pro','62:16',67,'bro5-19.jpg'),
('dxh.mp3','',5,'给你推荐几款世界上最著名的桌游','Gadio Pro','62:16',243,'bro5-20.jpg'),
('dxh.mp3','',5,'游戏起源－从桌子上开始','Gadio Pro','62:16',453,'bro5-21.jpg'),
('TaylorSwift.mp3','',6,'闲侃世界杯——决赛篇','Gadio Life','62:16',21,'bro4-1.jpg'),
('明年今日.mp3明年今日.mp3','',7,'闲侃世界杯——决赛篇','Gadio Life','62:16',96,'bro4-1.jpg'),
('天外来物.mp3','',8,'闲侃世界杯——决赛篇','Gadio Life','62:16',55,'bro4-1.jpg'),
('TaylorSwift.mp3','',9,'闲侃世界杯——决赛篇','Gadio Life','62:16',43,'bro4-1.jpg'),
('dxh.mp3','',10,'闲侃世界杯——决赛篇','Gadio Life','62:16',75,'bro4-1.jpg'),
('明年今日.mp3','',11,'闲侃世界杯——决赛篇','Gadio Life','62:16',972,'bro4-1.jpg'),
('明年今日.mp3','',12,'闲侃世界杯——决赛篇','Gadio Life','62:16',4857,'bro4-1.jpg'),
('明年今日.mp3','',13,'闲侃世界杯——决赛篇','Gadio Life','62:16',46,'bro4-1.jpg'),
('天外来物.mp3','',14,'闲侃世界杯——决赛篇','Gadio Life','62:16',17,'bro4-1.jpg'),
('明年今日.mp3','',15,'闲侃世界杯——决赛篇','Gadio Life','62:16',45,'bro4-1.jpg'),
('dxh.mp3','',16,'闲侃世界杯——决赛篇','Gadio Life','62:16',97,'bro4-1.jpg'),
('明年今日.mp3','',17,'闲侃世界杯——决赛篇','Gadio Life','62:16',42,'bro4-1.jpg'),
('明年今日.mp3','',18,'闲侃世界杯——决赛篇','Gadio Life','62:16',96,'bro4-1.jpg');

-- 专题图片表
insert into pro_special values(null,'col_1.jpg');
insert into pro_special values(null,'col_2.jpg');
insert into pro_special values(null,'col_3.jpg');
insert into pro_special values(null,'col_4.jpg');
insert into pro_special values(null,'col_5.jpg');
insert into pro_special values(null,'col_6.jpg');
insert into pro_special values(null,'col_7.jpg');
insert into pro_special values(null,'col_8.jpg');
insert into pro_special values(null,'col_9.jpg');
insert into pro_special values(null,'col_10.jpg');
insert into pro_special values(null,'col_11.jpg');
insert into pro_special values(null,'col_12.jpg');
insert into pro_special values(null,'col_13.jpg');
insert into pro_special values(null,'col_14.jpg');
insert into pro_special values(null,'col_15.jpg');
insert into pro_special values(null,'col_16.jpg');
insert into pro_special values(null,'col_17.jpg');
insert into pro_special values(null,'col_18.jpg');
insert into pro_special values(null,'col_19.jpg');
insert into pro_special values(null,'col_20.jpg');
insert into pro_special values(null,'col_21.jpeg');
insert into pro_special values(null,'col_22.jpg');
insert into pro_special values(null,'col_23.jpg');
insert into pro_special values(null,'col_24.jpg');
insert into pro_special values(null,'col_25.jpg');
insert into pro_special values(null,'col_26.jpg');
insert into pro_special values(null,'col_27.jpg');
insert into pro_special values(null,'col_28.jpeg');
insert into pro_special values(null,'col_29.jpg');
insert into pro_special values(null,'col_30.jpg');
insert into pro_special values(null,'col_31.jpg');
insert into pro_special values(null,'col_32.jpg');
insert into pro_special values(null,'col_33.jpg');
insert into pro_special values(null,'col_34.jpg');
insert into pro_special values(null,'col_35.jpg');
insert into pro_special values(null,'col_36.jpg');
insert into pro_special values(null,'col_37.jpg');
insert into pro_special values(null,'col_38.jpg');
insert into pro_special values(null,'col_39.jpg');
insert into pro_special values(null,'col_40.jpg');
insert into pro_special values(null,'col_41.jpg');
insert into pro_special values(null,'col_42.jpg');
insert into pro_special values(null,'col_43.jpg');
insert into pro_special values(null,'col_44.jpg');
insert into pro_special values(null,'col_45.jpg');
insert into pro_special values(null,'col_46.jpg');
insert into pro_special values(null,'col_47.jpg');
insert into pro_special values(null,'col_48.jpg');
insert into pro_special values(null,'col_49.jpg');
insert into pro_special values(null,'col_50.jpg');
insert into pro_special values(null,'col_51.jpg');
insert into pro_special values(null,'col_52.jpg');
insert into pro_special values(null,'col_53.jpg');
insert into pro_special values(null,'col_54.jpg');
insert into pro_special values(null,'col_55.jpg');
insert into pro_special values(null,'col_56.jpg');
insert into pro_special values(null,'col_57.jpg');
insert into pro_special values(null,'col_58.jpg');
insert into pro_special values(null,'col_59.jpg');
insert into pro_special values(null,'col_60.jpg');
insert into pro_special values(null,'col_61.jpg');
insert into pro_special values(null,'col_62.jpg');
insert into pro_special values(null,'col_63.jpg');
insert into pro_special values(null,'col_64.jpg');
insert into pro_special values(null,'col_65.jpg');
insert into pro_special values(null,'col_66.jpg');
insert into pro_special values(null,'col_67.jpg');
insert into pro_special values(null,'col_68.jpg');
insert into pro_special values(null,'col_69.jpg');
insert into pro_special values(null,'col_70.jpg');
insert into pro_special values(null,'col_71.jpg');
insert into pro_special values(null,'col_72.jpg');
insert into pro_special values(null,'col_73.jpg');
insert into pro_special values(null,'col_74.jpg');
insert into pro_special values(null,'col_75.jpg');
insert into pro_special values(null,'col_76.jpg');
insert into pro_special values(null,'col_77.jpg');
insert into pro_special values(null,'col_78.jpg');
insert into pro_special values(null,'col_79.jpg');
insert into pro_special values(null,'col_80.jpg');
insert into pro_special values(null,'col_81.jpg');
insert into pro_special values(null,'col_82.jpg');
insert into pro_special values(null,'col_83.jpg');
insert into pro_special values(null,'col_84.jpg');
insert into pro_special values(null,'col_85.jpg');
insert into pro_special values(null,'col_86.jpg');
insert into pro_special values(null,'col_87.jpg');
insert into pro_special values(null,'col_88.jpg');
insert into pro_special values(null,'col_89.jpg');
insert into pro_special values(null,'col_90.jpg');
insert into pro_special values(null,'col_91.jpg');

-- 游戏折扣表
INSERT INTO gameList VALUES ('全部','null','gamelist');
INSERT INTO gameList VALUES ('Steam','1','gamelist');
INSERT INTO gameList VALUES ('Switch','2','gamelist');
INSERT INTO gameList VALUES ('PS4','3','gamelist');
INSERT INTO gameList VALUES ('Xbox','4','gamelist');

--折扣游戏
INSERT INTO games VALUES ('https://image.gcores.com/75d4b60c-bd58-416a-9f64-27665fb8d827.jpg?x-oss-process=image/resize,limit_1,m_fill,w_128,h_60/quality,q_90','山谷',2.9,'中国区','','steam',68.00,20160824,20170921,false,'1','9');
INSERT INTO games VALUES ('https://image.gcores.com/ff74c165-f92e-4708-9d27-7825c1315a51.jpg?x-oss-process=image/resize,limit_1,m_fill,w_128,h_60/quality,q_90','难死塔',4,'中国区',80,'steam',48.00,20160802,20200121,true,'1','8');
INSERT INTO games VALUES ('https://image.gcores.com/28265408-8dd7-4ce2-b2f5-3a9363e6f7eb.jpg?x-oss-process=image/resize,limit_1,m_fill,w_128,h_60/quality,q_90','赤痕 夜之仪式',5.9,'中国区','','steam',138,20190618,20191019,true,'1','8');
INSERT INTO games VALUES ('https://image.gcores.com/78c2770d-4c97-4825-b0ec-a3d9d339c3d0.jpg?x-oss-process=image/resize,limit_1,m_fill,w_128,h_60/quality,q_90','黎明杀机',3.9,'中国区',71,'steam',82,20160614,20200512,true,'1','8');
INSERT INTO games VALUES ('https://image.gcores.com/a89ca332-6738-4ae1-aba0-886b6f86377f.jpg?x-oss-process=image/resize,limit_1,m_fill,w_128,h_60/quality,q_90','抱歉 詹姆斯',4.7,'中国区','','steam',15,20171111,20190203,true,'1','8');
INSERT INTO games VALUES ('https://image.gcores.com/08ec1fe7-80dd-4277-b1c0-23967af80922.jpg?x-oss-process=image/resize,limit_1,m_fill,w_128,h_60/quality,q_90','潜渊症',6,'中国区','','steam',89,20190606,20200520,true,'1','8');
INSERT INTO games VALUES ('https://image.gcores.com/97215d88-a79a-4804-a853-f5e7d70a1c37.jpg?x-oss-process=image/resize,limit_1,m_fill,w_128,h_60/quality,q_90','只只大冒险',7.9,'中国区','','steam',58,0,20200606,true,'1','8');
INSERT INTO games VALUES ('https://image.gcores.com/a9940b78-3cec-4a0f-961d-93ce10c1add0.jpg?x-oss-process=image/resize,limit_1,m_fill,w_128,h_60/quality,q_90','疑案追声',5.8,'中国区',72,'steam',38,20190329,20200801,true,'1','8');
INSERT INTO games VALUES ('https://image.gcores.com/e170e0ad-a2b3-492d-91b4-0de18064b172.jpg?x-oss-process=image/resize,limit_1,m_fill,w_128,h_60/quality,q_90','荒野大镖客 救赎2',8,'中国区',93,'steam',249,20190329,20170911,true,'1','8');
INSERT INTO games VALUES ('https://image.gcores.com/ed666658-c4d1-492a-9461-f79bd76b911e.jpg?x-oss-process=image/resize,limit_1,m_fill,w_128,h_60/quality,q_90','斩服少女 异布',1.5,'中国香港区',93,'ps4',421.36,20190726,20180121,false,'3','9');
INSERT INTO games VALUES ('https://image.gcores.com/cf777ea7-7585-47dd-b635-3b24f8fa20e7.jpg?x-oss-process=image/resize,limit_1,m_fill,w_128,h_60/quality,q_90','老人之旅',8,'墨西哥区','','switch',53.85,20170518,20191225,false,'2','9');
INSERT INTO games VALUES ('https://image.gcores.com/17809f2e-5bd0-4a3e-8e85-2eb99145d947.jpg?x-oss-process=image/resize,limit_1,m_fill,w_128,h_60/quality,q_90','大神',5,'挪威区','','switch',130.62,20060420,20200621,false,'2','9');
INSERT INTO games VALUES ('https://image.gcores.com/c841dd8c-2d36-45d3-bef5-09fe4c876f02.jpg?x-oss-process=image/resize,limit_1,m_fill,w_128,h_60/quality,q_90','洛克人11 命运的齿轮!!',5,'俄罗斯区','','switch',178.48,20181004,20191216,true,'2','8');
INSERT INTO games VALUES ('https://image.gcores.com/24bd9c69-9c34-4864-baa1-e072ce641cbe.jpg?x-oss-process=image/resize,limit_1,m_fill,w_128,h_60/quality,q_90','洛克人X遗产合集',5,'挪威区','','switch',130.62,20180725,20201118,true,'2','8');
INSERT INTO games VALUES ('https://image.gcores.com/b491d38b-4f27-4878-a790-7faed4a42d83.jpg?x-oss-process=image/resize,limit_1,m_fill,w_128,h_60/quality,q_90','龙珠 Fighter Z',2.5,'中国香港区','','xbox',430.66,20180126,20190423,false,'4','9');
INSERT INTO games VALUES ('https://image.gcores.com/a815f935-df52-4637-9b1a-58478b022490.jpg?x-oss-process=image/resize,limit_1,m_fill,w_128,h_60/quality,q_90','自己',7,'加拿大区','','switch',46.10,20200116,20190713,true,'2','8');
INSERT INTO games VALUES ('https://image.gcores.com/29a43f2a-7167-48e3-bfe1-cc39d076447a.jpg?x-oss-process=image/resize,limit_1,m_fill,w_128,h_60/quality,q_90','喵咪斗恶龙2',7,'墨西哥区','','switch',90.20,20190924,20191201,true,'2','8');

--即将出售菜单
INSERT INTO willshow VALUES ('Steam','5','willshow');
INSERT INTO willshow VALUES ('Switch','6','willshow');
INSERT INTO willshow VALUES ('PS4','7','willshow');
INSERT INTO willshow VALUES ('Xbox','8','willshow');

--即将出售游戏
INSERT INTO willgames VALUES ('https://image.gcores.com/88746810-9d91-4d2b-98e2-508b304d9c93.jpg?x-oss-process=image/resize,limit_1,m_fill,w_128,h_60/quality,q_90','变形记','','','本周出售',false,'5678');
INSERT INTO willgames VALUES ('https://image.gcores.com/7eb8009a-7ea6-4d65-92fd-429bde96f331.jpg?x-oss-process=image/resize,limit_1,m_fill,w_128,h_60/quality,q_90','谓何','','','本月出售',false,'5');
INSERT INTO willgames VALUES ('https://image.gcores.com/90533748-acd9-4058-8251-d1855264b66f.jpg?x-oss-process=image/resize,limit_1,m_fill,w_128,h_60/quality,q_90','浴血黑帮 傀儡师',80.00,'中国区','本月出售',true,'6');
INSERT INTO willgames VALUES ('https://image.gcores.com/62a33db9-a1d3-4a93-8d1b-1a3f0a706553.jpg?x-oss-process=image/resize,limit_1,m_fill,w_128,h_60/quality,q_90','钢铁收割','','','九月',false,'5');
INSERT INTO willgames VALUES ('https://image.gcores.com/da8a572f-73d5-4f81-9498-6387110dd9b6.jpg?x-oss-process=image/resize,limit_1,m_fill,w_128,h_60/quality,q_90','NBA 2K21','','','九月',false,'6');
INSERT INTO willgames VALUES ('https://image.gcores.com/d1960a15-0ffc-4a56-a4aa-ef524c47d01f.jpg?x-oss-process=image/resize,limit_1,m_fill,w_128,h_60/quality,q_90','漫威复仇者',299.00,'中国区','九月',true,'7');
INSERT INTO willgames VALUES ('https://image.gcores.com/6444b3c4-e998-41d7-b16e-50fda95701a4.jpg?x-oss-process=image/resize,limit_1,m_fill,w_128,h_60/quality,q_90','看门狗 军团',418.05,'美国区','十月',false,'6');
INSERT INTO willgames VALUES ('https://image.gcores.com/39037888-dc69-4596-bef4-68a8827e2009.jpg?x-oss-process=image/resize,limit_1,m_fill,w_128,h_60/quality,q_90','FIFA 21',376.24,'美国区','十月',false,'5');
INSERT INTO willgames VALUES ('https://image.gcores.com/bae0a211-6409-4b79-b2e2-7ae667c9a41f.?x-oss-process=image/resize,limit_1,m_fill,w_128,h_60/quality,q_90','孤岛惊魂6',421.91,'中国香港区','2021年二月',true,'8');

-- 电台详情页数据
INSERT INTO main_content VALUES(null,"对牛弹琴！GadioNews08.08","世界上最远的距离","2020-08-08","本周新闻：新一期State of Play上线，《洞穴冒险2》9月15日发售；《街霸5 冠军版》公开更新计划，火引弹、罗丝即将加入游戏；XGP公开八月游戏阵容，《暗黑血统：创世纪》和《最终幻想7 HD》等你领；《皮克敏3 豪华版》10月30日发售，游戏自带中文；克里斯托弗·诺兰《信条》定档9月4日，终于！本周主题：对牛弹琴。 ","",5);
INSERT INTO main_content VALUES(null,"海军史故事：不列颠皇家海军军官的“赏金猎人”生活","“还能这么发工资呢？？？”","2020-08-10","1700年代，英国皇家海军展现出惊人的战斗力。荷兰、西班牙、法国，任何不列颠海上霸权的阻拦者都已经或者即将被打败，这种战斗力从何而来呢？本期我们来讲讲穷凶极恶的海军战斗力的“组织条件”，事实上令人哭笑不得的英国皇家海军军官的生活方式——当时军舰上的水手的生活十分悲惨，而军官们也没好到哪去... ","",6);
INSERT INTO main_content VALUES(null,"小北欧神话 卷七 —— 屠龙者萨迦","伏尔松格家的故事，堂堂连载！","2020-08-11","从本期开始，小北欧神话系列中的诸神故事暂告段落，我们进入到米德加德的人类史诗部分，开始经典的伏尔松格萨迦。这段故事对欧洲的很多史诗故事皆有深远的影响，故事主角西格德（西格鲁德），也是后来日耳曼史诗《尼伯龙根之歌》齐格菲的原型。小北欧神话的故事进入最终阶段，诸神黄昏前的人类英雄悲歌，就此拉开序幕。 ","说到这个，你听说过屠龙者的故事吗？那一日，一位名叫西格德的小伙子手持神剑格拉姆，来到被瘴气污染的平原上... ",7);
INSERT INTO main_content VALUES(null,"第二期 追车枪战 ｜ TRPG故事《傻【哔】太多，摇滚太少》","快加速！快开枪！","2020-08-12","发生在20世纪70年代的美国，四位青年人的音乐节之旅正式展开。几人好不容易逃离了商场，岂料黑衣人并未善罢甘休，驾车前来追赶。一场在公路上的追车枪战即将上演。 ","",8);
INSERT INTO main_content VALUES(null,"护航大作 GadioNews08.16","世代更替不能急","2020-08-16","本周新闻：《光环 无限》宣布延期，小野义德将从CAPCOM离职，DC FanDome将于8月22日举办，北京电影节海报风波，COD新作，火线夜之城第二期上线。本周主题：护航大作。 
","",9);
INSERT INTO main_content VALUES(null,"对牛弹琴！GadioNews08.08","世界上最远的距离","2020-08-08","本周新闻：新一期State of Play上线，《洞穴冒险2》9月15日发售；《街霸5 冠军版》公开更新计划，火引弹、罗丝即将加入游戏；XGP公开八月游戏阵容，《暗黑血统：创世纪》和《最终幻想7 HD》等你领；《皮克敏3 豪华版》10月30日发售，游戏自带中文；克里斯托弗·诺兰《信条》定档9月4日，终于！本周主题：对牛弹琴。 ","",5);
INSERT INTO main_content VALUES(null,"海军史故事：不列颠皇家海军军官的“赏金猎人”生活","“还能这么发工资呢？？？”","2020-08-10","1700年代，英国皇家海军展现出惊人的战斗力。荷兰、西班牙、法国，任何不列颠海上霸权的阻拦者都已经或者即将被打败，这种战斗力从何而来呢？本期我们来讲讲穷凶极恶的海军战斗力的“组织条件”，事实上令人哭笑不得的英国皇家海军军官的生活方式——当时军舰上的水手的生活十分悲惨，而军官们也没好到哪去... ","",6);
INSERT INTO main_content VALUES(null,"小北欧神话 卷七 —— 屠龙者萨迦","伏尔松格家的故事，堂堂连载！","2020-08-11","从本期开始，小北欧神话系列中的诸神故事暂告段落，我们进入到米德加德的人类史诗部分，开始经典的伏尔松格萨迦。这段故事对欧洲的很多史诗故事皆有深远的影响，故事主角西格德（西格鲁德），也是后来日耳曼史诗《尼伯龙根之歌》齐格菲的原型。小北欧神话的故事进入最终阶段，诸神黄昏前的人类英雄悲歌，就此拉开序幕。 ","说到这个，你听说过屠龙者的故事吗？那一日，一位名叫西格德的小伙子手持神剑格拉姆，来到被瘴气污染的平原上... ",7);
INSERT INTO main_content VALUES(null,"第二期 追车枪战 ｜ TRPG故事《傻【哔】太多，摇滚太少》","快加速！快开枪！","2020-08-12","发生在20世纪70年代的美国，四位青年人的音乐节之旅正式展开。几人好不容易逃离了商场，岂料黑衣人并未善罢甘休，驾车前来追赶。一场在公路上的追车枪战即将上演。 ","",8);
INSERT INTO main_content VALUES(null,"护航大作 GadioNews08.16","世代更替不能急","2020-08-16","本周新闻：《光环 无限》宣布延期，小野义德将从CAPCOM离职，DC FanDome将于8月22日举办，北京电影节海报风波，COD新作，火线夜之城第二期上线。本周主题：护航大作。 
","",9);
INSERT INTO main_content VALUES(null,"对牛弹琴！GadioNews08.08","世界上最远的距离","2020-08-08","本周新闻：新一期State of Play上线，《洞穴冒险2》9月15日发售；《街霸5 冠军版》公开更新计划，火引弹、罗丝即将加入游戏；XGP公开八月游戏阵容，《暗黑血统：创世纪》和《最终幻想7 HD》等你领；《皮克敏3 豪华版》10月30日发售，游戏自带中文；克里斯托弗·诺兰《信条》定档9月4日，终于！本周主题：对牛弹琴。 ","",5);
INSERT INTO main_content VALUES(null,"海军史故事：不列颠皇家海军军官的“赏金猎人”生活","“还能这么发工资呢？？？”","2020-08-10","1700年代，英国皇家海军展现出惊人的战斗力。荷兰、西班牙、法国，任何不列颠海上霸权的阻拦者都已经或者即将被打败，这种战斗力从何而来呢？本期我们来讲讲穷凶极恶的海军战斗力的“组织条件”，事实上令人哭笑不得的英国皇家海军军官的生活方式——当时军舰上的水手的生活十分悲惨，而军官们也没好到哪去... ","",6);
INSERT INTO main_content VALUES(null,"小北欧神话 卷七 —— 屠龙者萨迦","伏尔松格家的故事，堂堂连载！","2020-08-11","从本期开始，小北欧神话系列中的诸神故事暂告段落，我们进入到米德加德的人类史诗部分，开始经典的伏尔松格萨迦。这段故事对欧洲的很多史诗故事皆有深远的影响，故事主角西格德（西格鲁德），也是后来日耳曼史诗《尼伯龙根之歌》齐格菲的原型。小北欧神话的故事进入最终阶段，诸神黄昏前的人类英雄悲歌，就此拉开序幕。 ","说到这个，你听说过屠龙者的故事吗？那一日，一位名叫西格德的小伙子手持神剑格拉姆，来到被瘴气污染的平原上... ",7);
INSERT INTO main_content VALUES(null,"第二期 追车枪战 ｜ TRPG故事《傻【哔】太多，摇滚太少》","快加速！快开枪！","2020-08-12","发生在20世纪70年代的美国，四位青年人的音乐节之旅正式展开。几人好不容易逃离了商场，岂料黑衣人并未善罢甘休，驾车前来追赶。一场在公路上的追车枪战即将上演。 ","",8);
INSERT INTO main_content VALUES(null,"护航大作 GadioNews08.16","世代更替不能急","2020-08-16","本周新闻：《光环 无限》宣布延期，小野义德将从CAPCOM离职，DC FanDome将于8月22日举办，北京电影节海报风波，COD新作，火线夜之城第二期上线。本周主题：护航大作。 
","",9);
INSERT INTO main_content VALUES(null,"对牛弹琴！GadioNews08.08","世界上最远的距离","2020-08-08","本周新闻：新一期State of Play上线，《洞穴冒险2》9月15日发售；《街霸5 冠军版》公开更新计划，火引弹、罗丝即将加入游戏；XGP公开八月游戏阵容，《暗黑血统：创世纪》和《最终幻想7 HD》等你领；《皮克敏3 豪华版》10月30日发售，游戏自带中文；克里斯托弗·诺兰《信条》定档9月4日，终于！本周主题：对牛弹琴。 ","",5);
INSERT INTO main_content VALUES(null,"海军史故事：不列颠皇家海军军官的“赏金猎人”生活","“还能这么发工资呢？？？”","2020-08-10","1700年代，英国皇家海军展现出惊人的战斗力。荷兰、西班牙、法国，任何不列颠海上霸权的阻拦者都已经或者即将被打败，这种战斗力从何而来呢？本期我们来讲讲穷凶极恶的海军战斗力的“组织条件”，事实上令人哭笑不得的英国皇家海军军官的生活方式——当时军舰上的水手的生活十分悲惨，而军官们也没好到哪去... ","",6);
INSERT INTO main_content VALUES(null,"小北欧神话 卷七 —— 屠龙者萨迦","伏尔松格家的故事，堂堂连载！","2020-08-11","从本期开始，小北欧神话系列中的诸神故事暂告段落，我们进入到米德加德的人类史诗部分，开始经典的伏尔松格萨迦。这段故事对欧洲的很多史诗故事皆有深远的影响，故事主角西格德（西格鲁德），也是后来日耳曼史诗《尼伯龙根之歌》齐格菲的原型。小北欧神话的故事进入最终阶段，诸神黄昏前的人类英雄悲歌，就此拉开序幕。 ","说到这个，你听说过屠龙者的故事吗？那一日，一位名叫西格德的小伙子手持神剑格拉姆，来到被瘴气污染的平原上... ",7);
INSERT INTO main_content VALUES(null,"第二期 追车枪战 ｜ TRPG故事《傻【哔】太多，摇滚太少》","快加速！快开枪！","2020-08-12","发生在20世纪70年代的美国，四位青年人的音乐节之旅正式展开。几人好不容易逃离了商场，岂料黑衣人并未善罢甘休，驾车前来追赶。一场在公路上的追车枪战即将上演。 ","",8);
INSERT INTO main_content VALUES(null,"护航大作 GadioNews08.16","世代更替不能急","2020-08-16","本周新闻：《光环 无限》宣布延期，小野义德将从CAPCOM离职，DC FanDome将于8月22日举办，北京电影节海报风波，COD新作，火线夜之城第二期上线。本周主题：护航大作。 
","",9);
INSERT INTO main_content VALUES(null,"对牛弹琴！GadioNews08.08","世界上最远的距离","2020-08-08","本周新闻：新一期State of Play上线，《洞穴冒险2》9月15日发售；《街霸5 冠军版》公开更新计划，火引弹、罗丝即将加入游戏；XGP公开八月游戏阵容，《暗黑血统：创世纪》和《最终幻想7 HD》等你领；《皮克敏3 豪华版》10月30日发售，游戏自带中文；克里斯托弗·诺兰《信条》定档9月4日，终于！本周主题：对牛弹琴。 ","",5);
INSERT INTO main_content VALUES(null,"海军史故事：不列颠皇家海军军官的“赏金猎人”生活","“还能这么发工资呢？？？”","2020-08-10","1700年代，英国皇家海军展现出惊人的战斗力。荷兰、西班牙、法国，任何不列颠海上霸权的阻拦者都已经或者即将被打败，这种战斗力从何而来呢？本期我们来讲讲穷凶极恶的海军战斗力的“组织条件”，事实上令人哭笑不得的英国皇家海军军官的生活方式——当时军舰上的水手的生活十分悲惨，而军官们也没好到哪去... ","",6);
INSERT INTO main_content VALUES(null,"小北欧神话 卷七 —— 屠龙者萨迦","伏尔松格家的故事，堂堂连载！","2020-08-11","从本期开始，小北欧神话系列中的诸神故事暂告段落，我们进入到米德加德的人类史诗部分，开始经典的伏尔松格萨迦。这段故事对欧洲的很多史诗故事皆有深远的影响，故事主角西格德（西格鲁德），也是后来日耳曼史诗《尼伯龙根之歌》齐格菲的原型。小北欧神话的故事进入最终阶段，诸神黄昏前的人类英雄悲歌，就此拉开序幕。 ","说到这个，你听说过屠龙者的故事吗？那一日，一位名叫西格德的小伙子手持神剑格拉姆，来到被瘴气污染的平原上... ",7);
INSERT INTO main_content VALUES(null,"第二期 追车枪战 ｜ TRPG故事《傻【哔】太多，摇滚太少》","快加速！快开枪！","2020-08-12","发生在20世纪70年代的美国，四位青年人的音乐节之旅正式展开。几人好不容易逃离了商场，岂料黑衣人并未善罢甘休，驾车前来追赶。一场在公路上的追车枪战即将上演。 ","",8);
INSERT INTO main_content VALUES(null,"护航大作 GadioNews08.16","世代更替不能急","2020-08-16","本周新闻：《光环 无限》宣布延期，小野义德将从CAPCOM离职，DC FanDome将于8月22日举办，北京电影节海报风波，COD新作，火线夜之城第二期上线。本周主题：护航大作。 
","",9);
INSERT INTO main_content VALUES(null,"对牛弹琴！GadioNews08.08","世界上最远的距离","2020-08-08","本周新闻：新一期State of Play上线，《洞穴冒险2》9月15日发售；《街霸5 冠军版》公开更新计划，火引弹、罗丝即将加入游戏；XGP公开八月游戏阵容，《暗黑血统：创世纪》和《最终幻想7 HD》等你领；《皮克敏3 豪华版》10月30日发售，游戏自带中文；克里斯托弗·诺兰《信条》定档9月4日，终于！本周主题：对牛弹琴。 ","",5);
INSERT INTO main_content VALUES(null,"海军史故事：不列颠皇家海军军官的“赏金猎人”生活","“还能这么发工资呢？？？”","2020-08-10","1700年代，英国皇家海军展现出惊人的战斗力。荷兰、西班牙、法国，任何不列颠海上霸权的阻拦者都已经或者即将被打败，这种战斗力从何而来呢？本期我们来讲讲穷凶极恶的海军战斗力的“组织条件”，事实上令人哭笑不得的英国皇家海军军官的生活方式——当时军舰上的水手的生活十分悲惨，而军官们也没好到哪去... ","",6);
INSERT INTO main_content VALUES(null,"小北欧神话 卷七 —— 屠龙者萨迦","伏尔松格家的故事，堂堂连载！","2020-08-11","从本期开始，小北欧神话系列中的诸神故事暂告段落，我们进入到米德加德的人类史诗部分，开始经典的伏尔松格萨迦。这段故事对欧洲的很多史诗故事皆有深远的影响，故事主角西格德（西格鲁德），也是后来日耳曼史诗《尼伯龙根之歌》齐格菲的原型。小北欧神话的故事进入最终阶段，诸神黄昏前的人类英雄悲歌，就此拉开序幕。 ","说到这个，你听说过屠龙者的故事吗？那一日，一位名叫西格德的小伙子手持神剑格拉姆，来到被瘴气污染的平原上... ",7);
INSERT INTO main_content VALUES(null,"第二期 追车枪战 ｜ TRPG故事《傻【哔】太多，摇滚太少》","快加速！快开枪！","2020-08-12","发生在20世纪70年代的美国，四位青年人的音乐节之旅正式展开。几人好不容易逃离了商场，岂料黑衣人并未善罢甘休，驾车前来追赶。一场在公路上的追车枪战即将上演。 ","",8);
INSERT INTO main_content VALUES(null,"护航大作 GadioNews08.16","世代更替不能急","2020-08-16","本周新闻：《光环 无限》宣布延期，小野义德将从CAPCOM离职，DC FanDome将于8月22日举办，北京电影节海报风波，COD新作，火线夜之城第二期上线。本周主题：护航大作。 
","",9);
INSERT INTO main_content VALUES(null,"对牛弹琴！GadioNews08.08","世界上最远的距离","2020-08-08","本周新闻：新一期State of Play上线，《洞穴冒险2》9月15日发售；《街霸5 冠军版》公开更新计划，火引弹、罗丝即将加入游戏；XGP公开八月游戏阵容，《暗黑血统：创世纪》和《最终幻想7 HD》等你领；《皮克敏3 豪华版》10月30日发售，游戏自带中文；克里斯托弗·诺兰《信条》定档9月4日，终于！本周主题：对牛弹琴。 ","",5);
INSERT INTO main_content VALUES(null,"海军史故事：不列颠皇家海军军官的“赏金猎人”生活","“还能这么发工资呢？？？”","2020-08-10","1700年代，英国皇家海军展现出惊人的战斗力。荷兰、西班牙、法国，任何不列颠海上霸权的阻拦者都已经或者即将被打败，这种战斗力从何而来呢？本期我们来讲讲穷凶极恶的海军战斗力的“组织条件”，事实上令人哭笑不得的英国皇家海军军官的生活方式——当时军舰上的水手的生活十分悲惨，而军官们也没好到哪去... ","",6);
INSERT INTO main_content VALUES(null,"小北欧神话 卷七 —— 屠龙者萨迦","伏尔松格家的故事，堂堂连载！","2020-08-11","从本期开始，小北欧神话系列中的诸神故事暂告段落，我们进入到米德加德的人类史诗部分，开始经典的伏尔松格萨迦。这段故事对欧洲的很多史诗故事皆有深远的影响，故事主角西格德（西格鲁德），也是后来日耳曼史诗《尼伯龙根之歌》齐格菲的原型。小北欧神话的故事进入最终阶段，诸神黄昏前的人类英雄悲歌，就此拉开序幕。 ","说到这个，你听说过屠龙者的故事吗？那一日，一位名叫西格德的小伙子手持神剑格拉姆，来到被瘴气污染的平原上... ",7);
INSERT INTO main_content VALUES(null,"第二期 追车枪战 ｜ TRPG故事《傻【哔】太多，摇滚太少》","快加速！快开枪！","2020-08-12","发生在20世纪70年代的美国，四位青年人的音乐节之旅正式展开。几人好不容易逃离了商场，岂料黑衣人并未善罢甘休，驾车前来追赶。一场在公路上的追车枪战即将上演。 ","",8);
INSERT INTO main_content VALUES(null,"护航大作 GadioNews08.16","世代更替不能急","2020-08-16","本周新闻：《光环 无限》宣布延期，小野义德将从CAPCOM离职，DC FanDome将于8月22日举办，北京电影节海报风波，COD新作，火线夜之城第二期上线。本周主题：护航大作。 
","",9);
INSERT INTO main_content VALUES(null,"这个周末一起和吉考斯在北京 751 火车市集夏日摇滚聚会躁起来吧","世界上最远的距离","2020-08-08","本周新闻：新一期State of Play上线，《洞穴冒险2》9月15日发售；《街霸5 冠军版》公开更新计划，火引弹、罗丝即将加入游戏；XGP公开八月游戏阵容，《暗黑血统：创世纪》和《最终幻想7 HD》等你领；《皮克敏3 豪华版》10月30日发售，游戏自带中文；克里斯托弗·诺兰《信条》定档9月4日，终于！本周主题：对牛弹琴。 ","",5);
INSERT INTO main_content VALUES(null,"明星制作人与公司背后的英雄们（3）：Arkane三杰","“还能这么发工资呢？？？”","2020-08-10","1700年代，英国皇家海军展现出惊人的战斗力。荷兰、西班牙、法国，任何不列颠海上霸权的阻拦者都已经或者即将被打败，这种战斗力从何而来呢？本期我们来讲讲穷凶极恶的海军战斗力的“组织条件”，事实上令人哭笑不得的英国皇家海军军官的生活方式——当时军舰上的水手的生活十分悲惨，而军官们也没好到哪去... ","",6);
INSERT INTO main_content VALUES(null,"《即兴精酿》：最有味道的融合爵士专辑","伏尔松格家的故事，堂堂连载！","2020-08-11","从本期开始，小北欧神话系列中的诸神故事暂告段落，我们进入到米德加德的人类史诗部分，开始经典的伏尔松格萨迦。这段故事对欧洲的很多史诗故事皆有深远的影响，故事主角西格德（西格鲁德），也是后来日耳曼史诗《尼伯龙根之歌》齐格菲的原型。小北欧神话的故事进入最终阶段，诸神黄昏前的人类英雄悲歌，就此拉开序幕。 ","说到这个，你听说过屠龙者的故事吗？那一日，一位名叫西格德的小伙子手持神剑格拉姆，来到被瘴气污染的平原上... ",7);
INSERT INTO main_content VALUES(null,"第二期 追车枪战 ｜ TRPG故事《傻【哔】太多，摇滚太少》","快加速！快开枪！","2020-08-12","发生在20世纪70年代的美国，四位青年人的音乐节之旅正式展开。几人好不容易逃离了商场，岂料黑衣人并未善罢甘休，驾车前来追赶。一场在公路上的追车枪战即将上演。 ","",8);
INSERT INTO main_content VALUES(null,"护航大作 GadioNews08.16","世代更替不能急","2020-08-16","本周新闻：《光环 无限》宣布延期，小野义德将从CAPCOM离职，DC FanDome将于8月22日举办，北京电影节海报风波，COD新作，火线夜之城第二期上线。本周主题：护航大作。 
","",9);
INSERT INTO main_content VALUES(null,"对牛弹琴！GadioNews08.08","世界上最远的距离","2020-08-08","本周新闻：新一期State of Play上线，《洞穴冒险2》9月15日发售；《街霸5 冠军版》公开更新计划，火引弹、罗丝即将加入游戏；XGP公开八月游戏阵容，《暗黑血统：创世纪》和《最终幻想7 HD》等你领；《皮克敏3 豪华版》10月30日发售，游戏自带中文；克里斯托弗·诺兰《信条》定档9月4日，终于！本周主题：对牛弹琴。 ","",5);
INSERT INTO main_content VALUES(null,"海军史故事：不列颠皇家海军军官的“赏金猎人”生活","“还能这么发工资呢？？？”","2020-08-10","1700年代，英国皇家海军展现出惊人的战斗力。荷兰、西班牙、法国，任何不列颠海上霸权的阻拦者都已经或者即将被打败，这种战斗力从何而来呢？本期我们来讲讲穷凶极恶的海军战斗力的“组织条件”，事实上令人哭笑不得的英国皇家海军军官的生活方式——当时军舰上的水手的生活十分悲惨，而军官们也没好到哪去... ","",6);
INSERT INTO main_content VALUES(null,"小北欧神话 卷七 —— 屠龙者萨迦","伏尔松格家的故事，堂堂连载！","2020-08-11","从本期开始，小北欧神话系列中的诸神故事暂告段落，我们进入到米德加德的人类史诗部分，开始经典的伏尔松格萨迦。这段故事对欧洲的很多史诗故事皆有深远的影响，故事主角西格德（西格鲁德），也是后来日耳曼史诗《尼伯龙根之歌》齐格菲的原型。小北欧神话的故事进入最终阶段，诸神黄昏前的人类英雄悲歌，就此拉开序幕。 ","说到这个，你听说过屠龙者的故事吗？那一日，一位名叫西格德的小伙子手持神剑格拉姆，来到被瘴气污染的平原上... ",7);
INSERT INTO main_content VALUES(null,"第二期 追车枪战 ｜ TRPG故事《傻【哔】太多，摇滚太少》","快加速！快开枪！","2020-08-12","发生在20世纪70年代的美国，四位青年人的音乐节之旅正式展开。几人好不容易逃离了商场，岂料黑衣人并未善罢甘休，驾车前来追赶。一场在公路上的追车枪战即将上演。 ","",8);
INSERT INTO main_content VALUES(null,"护航大作 GadioNews08.16","世代更替不能急","2020-08-16","本周新闻：《光环 无限》宣布延期，小野义德将从CAPCOM离职，DC FanDome将于8月22日举办，北京电影节海报风波，COD新作，火线夜之城第二期上线。本周主题：护航大作。 
","",9);

-- 游戏搜索
INSERT INTO `gamesSearch` (`gname`,`gimg`,`gtag`,`gcut`,`gprice`,`gplace`) VALUES 
('最终幻想4','FINAL_IV.jpg','','','',''),
('最终幻想世界','FINAL_WORLD.jpg','中文','','166.00','中国区'),
('最终幻想 纷争NT','FINAL_FZ.jpeg','','','208.41','美国区'),
('最终幻想4','FINAL_IV.jpg','','','',''),
('最终幻想4','FINAL_IV.jpg','','','',''),
('最终幻想4','FINAL_IV.jpg','','','',''),
('最终幻想4','FINAL_IV.jpg','','','',''),
('最终幻想4','FINAL_IV.jpg','','','',''),
('最终幻想4','FINAL_IV.jpg','','','',''),
('最终幻想4','FINAL_IV.jpg','','','',''),
('最终幻想4','FINAL_IV.jpg','','','',''),
('最终幻想4','FINAL_IV.jpg','','','',''),
('最终幻想4','FINAL_IV.jpg','','','',''),
('最终幻想4','FINAL_IV.jpg','','','',''),
('最终幻想4','FINAL_IV.jpg','','','','');

-- 详情页表
INSERT INTO `artilescontent`VALUES('78', 'Gfest公布《光环：无限》团队负责人游戏试玩解说', '要我在2077肯定粉《光环：无限》', 'https://image.gcores.com/1699a8fe-b863-4e40-a964-39b868838eed.jpg?x-oss-process=image/resize,limit_1,m_lfit,w_800/quality,q_90', ' https://image.gcores.com/a3f0062e-eb20-4a9e-8ed5-07890c72b8a8.jpg?x-oss-process=image/resize,limit_1,m_fill,w_44,h_44/quality,q_90/bright,-20', '肖尔', '21小时前');
INSERT INTO `artilescontent`VALUES('79', '2020年8月第二周手办模型情报总汇', '本周有FGO、假面骑士手办模型情报', 'https://image.gcores.com/65354b0a-0536-4623-9b25-c5172e39fd1d.jpg?x-oss-process=image/resize,limit_1,m_lfit,w_2000,h_2000/quality,q_90', 'https://image.gcores.com/aac08f53-55e6-416f-8890-cc8a4139a0bb.jpg?x-oss-process=image/resize,limit_1,m_fill,w_44,h_44/quality,q_90/bright,-20', '雨宫 恋', '8小时前');
INSERT INTO `artilescontent`VALUES('80', '跟着传送带进入新时代：《异星工厂》结束Early Access进入1.0版本', '8年了，整整8.5年，你知道这8年里我是怎么过的吗，《异星工厂》', 'https://image.gcores.com/ba63ca2d-fb06-4657-af0d-774258ccb9f1.jpg?x-oss-process=image/resize,limit_1,m_lfit,w_800/quality,q_90', 'https://image.gcores.com/542a42df-4d1c-4685-8591-7fc1d800e794.jpg?x-oss-process=image/resize,limit_1,m_fill,w_44,h_44/quality,q_90/bright,-20', '四十二', '2小时前');