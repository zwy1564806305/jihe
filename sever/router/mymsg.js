const express = require('express');

const pool = require('../pool.js');

const router = express.Router();

router.get('/getMyMsg',(req,res)=>{
  var arr = [
    {
      time:"2020-10-12 17:15",
      username:"用户1",
      msg:"1刷卡看看风景在练习几次就搜就爱吃奥数的建筑进行了勘察酒叟都是剑荡九州惊险刺激手机号"
    },
    {
      time:"2020-10-12 12:00",
      username:"用户2",
      msg:"2刷卡看看风景在练习几次就搜就爱吃奥数的建筑进行了勘察酒叟都是剑荡九州惊险刺激手机号"
    },
    {
      time:"2020-10-12 14:45",
      username:"用户3",
      msg:"3刷卡看看风景在练习几次就搜就爱吃奥数的建筑进行了勘察酒叟都是剑荡九州惊险刺激手机号"
    },
    {
      time:"2020-10-12 19:35",
      username:"用户4",
      msg:"4刷卡看看风景在练习几次就搜就爱吃奥数的建筑进行了勘察酒叟都是剑荡九州惊险刺激手机号"
    },
  ];
  res.send(arr);
})

// 路由对象导出
module.exports = router;