// 引入Express模块
const express = require('express');

// 引入CORS模块
const cors = require('cors');

// 加载FS(FileStstem)模块
const fs = require('fs');

// 加载Multer模块
const multer = require('multer');

//加载UUID模块
const uuid = require('uuid');

// 引入MYSQL模块
const mysql = require('mysql');

// 引入router
const broadcastRouter = require('./router/broadcast.js');

//引入body-parser模块
const bodyParser = require('body-parser');

//创建MYsql的连接池
const pool = mysql.createPool({
  // 数据库服务器地址
  host: '127.0.0.1',
  //数据库用户名
  user: 'root',
  //数据库密码
  password: '',
  //数据库服务器端口号
  port: 3306,
  //数据库名称
  database: 'gcores',
  //编码方式
  charset: 'utf8',
  //连接限制
  connectionLimit: 20
});

// 创建Express实例
const server = express();

// 将CORS作为Server的中间件使用
server.use(cors({
  origin: ['http://127.0.0.1:8080', 'http://localhost:8080']
}));

//将bodyParser作为Server中间件使用
server.use(bodyParser.urlencoded({
  extended: false
}));

const upload = multer({dest:'upload'});

// ************万艳(登录注册)************
// 用户登录
server.post('/login', (req, res) => {
  // 获取用户名
  let username = req.body.username;
  //获取密码信息
  let password = req.body.password;
  // console.log(username, password)
  //以用户名和密码为条件进行查找，如果找到，则代表用户名登录成功，否则代表登录失败
  let sql = 'SELECT uid FROM user WHERE username=? AND password=?';
  pool.query(sql, [username, password], (err, results) => {
    if (err) throw err;
    if (results.length == 1) {
      console.log(results)
      res.send({ message: '登录成功', code: 1 ,results:results});
    } else {
      res.send({ message: '登录失败', code: 0 });
    }
  })
});

// 用户注册
server.post('/register', (req, res) => {
  // console.log(1);
  // 获取用户提交的用户名等信息
  let username = req.body.username;
  //以用户名为条件进行查找操作，如果用户名存在，则产生合法的错误信息
  //如果用户名不存在，则将用户名的相关信息写入数据表 --xzqa_author
  let sql = 'SELECT COUNt(uid) AS count FROM user WHERE username=?'
  pool.query(sql, [username], (err, results) => {
    if (err) throw err;
    if (results[0].count) {
      //注册失败
      res.send({ message: '注册失败', code: 0 })
    } else {
      // console.log(10086);
      //注册成功
      //获取密码信息
      // let password = req.body.password;
      // console.log(password);
      let obj = req.body;
      //完成数据写入操作
      let sql = 'insert user(username,password,phone)values(?,?,?)'
      pool.query(sql, [obj.username, obj.password, obj.phone], (err, results) => {  
        if (err) throw err;
        res.send({ message: '注册成功', code: 1 })
        // console.log(results);
      })
    }
  })
});

// ************张伟垚(用户详细信息)************
// 获取用户详细信息
server.get('/setting',(req,res)=>{
  let uid = req.query.uid;
  // console.log(uid)
  let sql = 'select uid,username,password,phone,nickname,avatar,gender,comment,follow,thank from user where uid=?';
  pool.query(sql,[uid],(err,result)=>{
    if(err) throw err;
    // console.log(result)
    if(result.length>0){
      res.send({message:'查询成功',code:1,result:result});
    }else{
      res.send('查询失败')
    }
  })
});

// 修改头像昵称性别
server.put('/name',(req,res)=>{
  let uid = req.body.uid;
  let avatar = req.body.avatar;
  let username = req.body.username;
  let gender = req.body.gender;
  let sql = 'UPDATE user set avatar=?,username=?,gender=? where uid=?';
  pool.query(sql,[avatar,username,gender,uid],(err,result)=>{
    if(err) throw err;
    res.send({ message:'修改成功',code:1})
  })
})

// 修改手机号和密码
server.put('/phone',(req,res)=>{
  let uid = req.body.uid;
  let phone = req.body.phone;
  let password = req.body.password;
  let sql = 'UPDATE user set phone=?,password=? where uid=?';
  pool.query(sql,[phone,password,uid],(err,result)=>{
    if (err) throw err;
    res.send({ message:'修改成功',code:1})
    // console.log(result);
  })
});

// 修改通知消息
server.put('/adress',(req,res)=>{
  let uid = req.body.uid;
  let comment = req.body.comment;
  let follow = req.body.follow;
  let thank = req.body.thank;
  let sql = 'UPDATE user set comment=?,follow=?,thank=? where uid=?';
  pool.query(sql,[comment,follow,thank,uid],(err,result)=>{
    if (err) throw err;
    res.send({ message:'修改成功',code:1})
    // console.log(result);
  })
});

// 注销当前账号
server.delete('/deleteuser',(req,res)=>{
  let uid = req.query.uid;
  // console.log(uid)
  let sql = 'DELETE from user where uid=?';
  pool.query(sql,[uid],(err,result)=>{
    if(err) throw err;
    res.send({message:'删除成功',code:1})
  })
})

// ************林道旺(首页轮播图)************
// 获取轮播图图片
server.get('/banner',(req,res)=>{
  let sql='select Bid,Bimage from banner';
  pool.query(sql,(err,result)=>{
      if(err) throw err;
      res.send({message:'查询成功',code:1,result:result});
  })
});

// 获取轮播图推荐详情
server.get('/bannerBottom',(req,res)=>{
  let sql='select Pid,Pimage,Ptype,Pname,Ptitle,Pauthor,Ptime,Pup,Pcomment,Pnub from pro_info where Pnub=5';
  pool.query(sql,(err,result)=>{
      if(err) throw err;
      // console.log(result)
      res.send({message:'查询成功',code:1,result:result});
  })
});

// 顶部大图片
server.get('/top',(req,res)=>{
  let sql='select Pid,Pimage,Ptype,Pname,Ptitle,Pauthor,Ptime,Pup,Pcomment,Pnub from pro_info where Pnub=6';
  pool.query(sql,(err,result)=>{
      if(err) throw err;
      res.send({message:'查询成功',code:1,result:result});
  })
});

// 获取资讯列表信息information
server.get('/information',(req,res)=>{
  let sql='select Pid,Pimage,Ptype,Pname,Ptitle,Pauthor,Ptime,Pup,Pcomment,Pnub from pro_info where Pnub=7';
  pool.query(sql,(err,result)=>{
      if(err) throw err;
      res.send({message:'查询成功',code:1,result:result})
  })
});

//获取电台文章详情页
server.get('/eaasy',(req,res)=>{
  let sql='select Pup,Pcomment,Mid,Mtitle,Mstory,Mtime,Mcontent1,Mcontent2 from main_content left outer join pro_info on Mid=Pid;';
  pool.query(sql,(err,result)=>{
      if(err) throw err;
      res.send({message:'查询成功',code:1,result:result});
  })
})

// ************杨浩(首页咨询和最新板块)************
//获取首页咨询轮播图界面所有信息接口
server.get('/carousel', (req, res) => {
  // sql查询语句
  let sql = 'select Pid,Pimage,Pname,Ptime,Pup,Pcomment from pro_info where Pnub=0';
  pool.query(sql, (err, results) => {
    if (err) throw err;
    // 响应到客户端的信息
    res.send({ message: '查询成功', code: "1", results: results });
    //    console.log(results);
  })
});

//获取最新板块页面所有信息接口
server.get('/upNew',(req,res)=>{
     //sql查询语句
   let sql='select Pid,Pimage,Ptype,Pname,Ptitle,Pauthor,Ptime,Pup,Pcomment from pro_info where Pnub=1';
   pool.query(sql,(err,results)=>{
       if(err) throw err;
        // 响应到客户端的信息
       res.send({message:'查询成功',code:"1",results:results});
    //    console.log(1,results.length);
   })
});
//获取最新板块页面所有信息接口  upNew2
server.get('/upNew2',(req,res)=>{
    // sql查询语句
   let sql='select Pid,Pimage,Ptype,Pname,Ptitle,Pauthor,Ptime,Pup,Pcomment from pro_info where Pnub=2';
   pool.query(sql,(err,results)=>{
       if(err) throw err;
        // 响应到客户端的信息
       res.send({message:'查询成功',code:"1",results:results});
       //console.log(1,results.length);
  })
});

//获取最新板块页面所有信息接口 upNew3
server.get('/upNew3',(req,res)=>{
    let $page=parseInt(req.query.page);
    let pagesize=8;  //每页显示的数据量
    let offset=($page-1)*pagesize;
    // sql查询语句
    // console.log($page);
   let sql='select Pid,Pimage,Ptype,Pname,Ptitle,Pauthor,Ptime,Pup,Pcomment,Pnub from pro_info where Pnub=3 limit ' + offset + ',' + pagesize;
   pool.query(sql,(err,results)=>{
      if(err) throw err;
      //获取总记录数
      let sql='select count(Pid) as count from pro_info where pnub=3';
      pool.query(sql,(err,record)=>{
        let count =record[0].count;
        // console.log(count);
      //计算总页数，
        let pagecount=Math.ceil(count/pagesize);
        // console.log(pagecount);
        // 响应到客户端的信息
        res.send({message:'查询成功',code:"1",results:results,pagecount:pagecount});
       //console.log(1,results.length);
      })     
   })
});

//获取咨讯分页板块页面所有信息接口 refer
server.get('/refer',(req,res)=>{
  let $page=parseInt(req.query.page);
  let pagesize=6;  //每页显示的数据量
  let offset=($page-1)*pagesize;
  // sql查询语句
  // console.log($page);
 let sql='select Pid,Pimage,Ptype,Pname,Ptitle,Pauthor,Ptime,Pup,Pcomment,Pnub from pro_info where Pnub=3 limit ' + offset + ',' + pagesize;
 pool.query(sql,(err,results)=>{
    if(err) throw err;
    //获取总记录数
    let sql='select count(Pid) as count from pro_info where pnub=3';
    pool.query(sql,(err,record)=>{
      let count =record[0].count;
      // console.log(count);
    //计算总页数，
      let pagecount=Math.ceil(count/pagesize);
      // console.log(pagecount);
      // 响应到客户端的信息
      res.send({message:'查询成功',code:"1",results:results,pagecount:pagecount});
     //console.log(1,results.length);
    })     
 })
});

//获取专题分页板块页面所有信息接口 special
server.get('/special',(req,res)=>{
  let $page=parseInt(req.query.page);
  let pagesize=12;  //每页显示的数据量
  let offset=($page-1)*pagesize;
  // sql查询语句
  // console.log($page);
  let sql='select Pid,Pimage from pro_special limit ' + offset + ',' + pagesize;
  pool.query(sql,(err,results)=>{
    if(err) throw err;
    //获取总记录数
    let sql='select count(Pid) as count from pro_special';
    pool.query(sql,(err,record)=>{
      let count =record[0].count;
      // console.log(count);
      //计算总页数，
      let pagecount=Math.ceil(count/pagesize);
      // console.log(pagecount);
      // 响应到客户端的信息
      res.send({message:'查询成功',code:"1",results:results,pagecount:pagecount});
      //console.log(1,results.length);
    })     
 })
});

//获取文章分页板块页面所有信息接口 article
server.get('/article',(req,res)=>{
  let $page=parseInt(req.query.page);
  let pagesize=9;  //每页显示的数据量
  let offset=($page-1)*pagesize;
  // sql查询语句
  // console.log($page);
 let sql='select Pid,Pimage,Ptype,Pname,Ptitle,Pauthor,Ptime,Pup,Pcomment,Pnub from pro_info where Pnub=20 limit ' + offset + ',' + pagesize;
 pool.query(sql,(err,results)=>{
    if(err) throw err;
    //获取总记录数
    let sql='select count(Pid) as count from pro_info where pnub=20';
    pool.query(sql,(err,record)=>{
      let count =record[0].count;
      console.log(count);
    //计算总页数，
      let pagecount=Math.ceil(count/pagesize);
      console.log(pagecount);
      // 响应到客户端的信息
      res.send({message:'查询成功',code:"1",results:results,pagecount:pagecount});
     //console.log(1,results.length);
    })     
 })
});

//标签下---游戏界面
//获取game_dt接口
server.get('/Game_dt',(req,res)=>{
  let $page=parseInt(req.query.page);
  let pagesize=9;  //每页显示的数据量
  let offset=($page-1)*pagesize;
  // sql查询语句
  // console.log($page);
 let sql='select Pid,Pimage,Ptype,Pname,Ptitle,Pauthor,Ptime,Pup,Pcomment,Pnub from pro_info where Ptype="电台" limit ' + offset + ',' + pagesize;
 pool.query(sql,(err,results)=>{
    if(err) throw err;
    //获取总记录数
    let sql='select count(Pid) as count from pro_info where Ptype="电台"';
    pool.query(sql,(err,record)=>{
      let count =record[0].count;
      console.log(count);
    //计算总页数，
      let pagecount=Math.ceil(count/pagesize);
      console.log(pagecount);
      // 响应到客户端的信息
      res.send({message:'查询成功',code:"1",results:results,pagecount:pagecount});
     //console.log(1,results.length);
    })     
 })
});

//获取game_qb接口
server.get('/Game_qb',(req,res)=>{
  let $page=parseInt(req.query.page);
  let pagesize=9;  //每页显示的数据量
  let offset=($page-1)*pagesize;
  // sql查询语句
  // console.log($page);
 let sql='select Pid,Pimage,Ptype,Pname,Ptitle,Pauthor,Ptime,Pup,Pcomment,Pnub from pro_info where pnub=20 limit ' + offset + ',' + pagesize;
 pool.query(sql,(err,results)=>{
    if(err) throw err;
    //获取总记录数
    let sql='select count(Pid) as count from pro_info where pnub=20';
    pool.query(sql,(err,record)=>{
      let count =record[0].count;
      console.log(count);
    //计算总页数，
      let pagecount=Math.ceil(count/pagesize);
      console.log(pagecount);
      // 响应到客户端的信息
      res.send({message:'查询成功',code:"1",results:results,pagecount:pagecount});
     //console.log(1,results.length);
    })     
 })
});

//获取game_wz接口
server.get('/Game_wz',(req,res)=>{
  let $page=parseInt(req.query.page);
  let pagesize=9;  //每页显示的数据量
  let offset=($page-1)*pagesize;
  // sql查询语句
  // console.log($page);
 let sql='select Pid,Pimage,Ptype,Pname,Ptitle,Pauthor,Ptime,Pup,Pcomment,Pnub from pro_info where Ptype="文章" limit ' + offset + ',' + pagesize;
 pool.query(sql,(err,results)=>{
    if(err) throw err;
    //获取总记录数
    let sql='select count(Pid) as count from pro_info where Ptype="文章"';
    pool.query(sql,(err,record)=>{
      let count =record[0].count;
      console.log(count);
    //计算总页数，
      let pagecount=Math.ceil(count/pagesize);
      console.log(pagecount);
      // 响应到客户端的信息
      res.send({message:'查询成功',code:"1",results:results,pagecount:pagecount});
     //console.log(1,results.length);
    })     
 })
});

//获取game_zx接口
server.get('/Game_zx',(req,res)=>{
  let $page=parseInt(req.query.page);
  let pagesize=9;  //每页显示的数据量
  let offset=($page-1)*pagesize;
  // sql查询语句
  // console.log($page);
 let sql='select Pid,Pimage,Ptype,Pname,Ptitle,Pauthor,Ptime,Pup,Pcomment,Pnub from pro_info where Ptype="资讯" limit ' + offset + ',' + pagesize;
 pool.query(sql,(err,results)=>{
    if(err) throw err;
    //获取总记录数
    let sql='select count(Pid) as count from pro_info where Ptype="资讯"';
    pool.query(sql,(err,record)=>{
      let count =record[0].count;
      console.log(count);
    //计算总页数，
      let pagecount=Math.ceil(count/pagesize);
      console.log(pagecount);
      // 响应到客户端的信息
      res.send({message:'查询成功',code:"1",results:results,pagecount:pagecount});
     //console.log(1,results.length);
    })     
 })
});

// ************翁晗(首页播单推荐)************
// 获取全部bro
server.get('/bro/getBroAll',(req,res)=>{
  var sql = 'select * from broadcast';
  pool.query(sql,[],(err,result)=>{
    if(err) throw err;
    // console.log(result);
    res.send(result);
  });
});

// ************张伟垚(获取播放列表)************
// 获取当前添加的歌曲
server.get('/getPlaySong',(req,res)=>{
  var BroListid = req.query.BroListid;
  console.log(BroListid)
  var sql = 'select * from broadcast_list where BroListid=?';
  pool.query(sql,[BroListid],(err,result)=>{
    if(err) throw err;
    console.log(result)
    res.send({message:'查询成功',code:'1',result:result})
  })
});

// 获取播放全部的歌曲
server.get('/getPlaySongAll',(req,res)=>{
  var BroListidAll = req.query.BroListidAll;
  console.log(BroListidAll)
  var sql = 'select * from broadcast_list where BroListid in (?)';
  pool.query(sql,[BroListidAll],(err,result)=>{
    if(err) throw err;
    // console.log(result);
    res.send({message:'查询成功',code:'1',result:result});
  })
});

// 收藏当前播放列表
server.post('/loveSong',(req,res)=>{
  var song = req.body;
  var sql = 'INSERT INTO love_song set ?';
  pool.query(sql,[song],(err,result)=>{
    if(err) throw err;
    res.send({message:'收藏成功',code:'1'})
  })
});

// 获取用户存储的喜欢的音乐
server.get('/loveSong',(req,res)=>{
  var uid = req.query.uid;
  var sql = 'SELECT * FROM love_song where AUid=?';
  pool.query(sql,[uid],(err,result)=>{
    if(err) throw err;
    res.send({message:'获取歌单成功',code:'1',result:result})
  })
});

//*************王佳宇(游戏折扣)*************
server.get('/getGameList',(req,res)=>{
	// console.log(req.query.queryName);
	var GameList = req.query.queryName;
	var sql = 'select * from gameList';
	pool.query(sql,[GameList],(err,result)=>{
		if(err) throw err;
		res.send({message:'查询成功',code:'1',result:result});
	})
});

// 折扣游戏
server.get('/getGames',(req,res)=>{
 	var Games = req.query.Games;
	var sql = 'select * from games';
	pool.query(sql,[Games],(err,result)=>{
		if(err) throw err;
		res.send({message:'查询成功',code:'1',result:result});
	})
});

// 即将出售菜单
server.get('/getWillShow',(req,res)=>{
	var WillShow = req.query.Willshow;
	var sql = 'select * from willshow';
	pool.query(sql,[WillShow],(err,result)=>{
		if(err) throw err;
		res.send({message:'查询成功',code:'1',result:result});
	})
});

// 即将出售游戏
server.get('/getWillGames',(req,res)=>{
	var WillGames = req.query.willgames;
	var sql = 'select * from willgames';
	pool.query(sql,[WillGames],(err,result)=>{
		if(err) throw err;
		res.send({message:'查询成功',code:'1',result:result})
	})
});

// 获取详情页的信息
server.get('/content', (req, res) => {
  let Arid = req.query.Arid;
  console.log(Arid);
  let sql = "SELECT * FROM artilescontent WHERE Arid=?";
  pool.query(sql, [Arid], (err, results) => {
    if (err) throw err;
    console.log(results);
    res.send({ message: '查询成功', code: 1, results: results })
  })
});

// 引用broadcastRouter路由
server.use('/bro',broadcastRouter);

//指定服务器的监听端口号
server.listen(3000);