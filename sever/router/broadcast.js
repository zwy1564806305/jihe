// 创建路由器对象
const express = require('express');

// 引入连接池模块
const pool = require('../pool.js');

// 创建路由对象
const router = express.Router();

// 方法------------------------------------------------------
// 获取全部bro
router.get('/getBroAll',(req,res)=>{
  var sql = 'select * from broadcast';
  pool.query(sql,[],(err,result)=>{
    if(err) throw err;
    // console.log(result);
    res.send(result);
  });
});
// 获取单个bro
router.get('/getBro',(req,res)=>{
  var _Broid=req.query.Broid;
  var sql = 'select * from broadcast where Broid = ?';
  pool.query(sql,[_Broid],(err,result)=>{
    if(err) throw err;
    // console.log(result);
    res.send(result);
  });
});
// 获取bro表单的详细信息
router.get('/getBroList',(req,res)=>{
  var _Broid=req.query.Broid;
  var sql = 'select * from broadcast_list where Broid = ?';
  pool.query(sql,[_Broid],(err,result)=>{
    if(err) throw err;
    // console.log(result);
    res.send(result);
  });
});
// 获取特定地区的详细信息
router.get('/getSomeBro',(req,res)=>{
  var _start = parseInt(req.query.Brostart);
  var _total = parseInt(req.query.Brototal);
  var sql = 'select * from broadcast limit ?,?';
  pool.query(sql,[_start,_total],(err,result)=>{
    if(err) throw err;
    // console.log(result);
    res.send(result);
  });
})
// 获取有多少条数据
router.get('/getBroCount',(req,res)=>{
  var sql = 'select count(1) from broadcast';
  pool.query(sql,[],(err,result)=>{
    if(err) throw err;
    // console.log(result);
    res.send(result);
  });
});
// 首页评论
router.get('/getMyMsg',(req,res)=>{
  var arr = [
    {
      time:"2020-10-12 7:45",
      username:"阿柒",
      msg:"不知道dao是这块镜子的问题bai还是我自己本du身的问题，怎么照都是zhi这么帅"
    },
    {
      time:"2020-10-12 7:45",
      username:"一阿柒一",
      msg:"那么快就开dao始佩服我了？不要太佩服我，因为佩服我的人太多了，你注定上不了排行榜的,但也不要怕，我心里的一亩三分地永远就给你"
    },
    {
      time:"2020-10-12 7:45",
      username:"凌柒七",
      msg:"你是不是觉得我有点眼熟？你仔细点看，别因为我太帅了而不好意思看太久"
    },
    {
      time:"2020-10-12 7:45",
      username:"超乖的汪",
      msg:"你是不是又忍不住想我了？害我连续打了好几个喷嚏！次数这么多"
    },
  ];
  res.send(arr);
});
// 获取用户信息
router.get('/getUser',(req,res)=>{
  var $searchWhat = `%${req.query.searchWhat}%`;
  var temp = req.query.searchWhat.split("");
  var temp1 = `%`
  console.log(temp);
  for(var i=0;i<temp.length;i++){
    temp1+=`${temp[i]}%`;
    console.log(temp1);
  }
  console.log(temp1);
  // var sql = "select * from user where username like ? and username like ?"
  var sql = "select * from user where username like ?"
  pool.query(sql,[temp1],(err,result)=>{
    if(err) throw err;
    console.log(result);
    res.send(result);
  })
})
//-----------------------------------------------------------

// 获取游戏信息
router.get('/getGames',(req,res)=>{
  var $searchWhat = `%${req.query.searchWhat}%`
  var temp = req.query.searchWhat.split("");
  var temp1 = `%`
  console.log(temp);
  for(var i=0;i<temp.length;i++){
    temp1+=`${temp[i]}%`;
    console.log(temp1);
  }
  var sql = "select * from gamesSearch where gname like ?"
  pool.query(sql,[temp1],(err,result)=>{
    if(err) throw err;
    console.log(result);
    res.send(result);
  })
})
// ----------------------------------------------------------

// 路由对象导出
module.exports = router;