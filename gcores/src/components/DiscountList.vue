<template>
  <div class="loadingPlaceholder loadingPlaceholder-wrapper loadingPlaceholder-disabled" style="background:transparent">
    <!--  如果渲染的字段大于0  也就是有渲染结果  则下面的道歉div不显示 -->
            <ul v-if="data.length > 0" class="u_stylelessList">
                <li v-for="(item,index) in data" :key="index">
                    <a class="gameInfo" href="#">
                        <img class="gameInfo_img gameInfo_gameImg" :src="item.gamerurl" alt="">
                        <div class="gameInfo_body">
                            <div class="gameInfo_text">
                                <p v-text="item.gameName"></p>
                                <p>
                                    <span class="gameInfo_tag gameInfo_tag-discount">{{item.gameDintensity}}折</span>
                                    <span :class="[{'n':(item.gameDmeta=='0')},
                                           {'g':(item.gameDmeta>=75 && item.gameDmeta<=100)},
                                           {'y':(item.gameDmeta<75)},
                                            ]">metacritic {{item.Dmeta}}</span>
                                    <span class="gameInfo_tag gameInfo_tag-chinese" v-if="item.gameChinese== 1 " >中文</span>        
                                    <span class="gameInfo_tag gameInfo_tag-steam" v-if="item.gamePlace=='steam'" >steam</span>
                                    <span class="gameInfo_tag gameInfo_tag-switch" v-else-if="item.gamePlace=='switch'">switch</span>
                                    <span class="gameInfo_tag gameInfo_tag-xbox" v-else-if="item.gamePlace=='xbox'">xbox</span>
                                    <span class="gameInfo_tag gameInfo_tag-ps" v-else>ps4</span>
                                </p>
                            </div>
                            <div class="gameInfo_append gameInfo_price gameInfo_append-withArrow">
                                <span class="gameInfo_arrow">
                                <img class="svg-inline" src="../assets/discount/arrow_right.png" alt="">
                                </span>
                                <p>￥{{Math.ceil(item.gamePrice*(item.gameDintensity/10))}}</p>
                                <p>
                                    {{item.gameLanguage}}
                                <span class="ml-1 u_deletedText">{{item.gamePrice}}</span>
                                </p>
                            </div>
                        </div>
                    </a>
                </li>
            </ul>
            <!-- 与上面的筛选条件向呼应 -->
            <div v-else class="sorry">
                <img src="https://image.gcores.com/ceb3f915-dd4b-4f2e-94c9-a6b62caf5410.jpg?x-oss-process=image/resize,limit_1,m_lfit,w_800/quality,q_90" alt="">
                <span class="toSorry">找不到符合的游戏哦~</span>
                <span class="tosorry">建议减少查找条件~</span>
                <span class="bear">&nbsp;ฅ՞•ﻌ•՞ฅ</span>
            </div>       
        </div>
      <!-- <ul v-if="data.length > 0"  class="u_stylelessList">
          <li v-for="(item,index) in data" :key='index'>
            <a class="gameInfo" href="#">
                <img class="gameInfo_img gameInfo_gameImg" :src="item.gamerurl" alt="">
                <div class="gameInfo_body">
                    <div class="gameInfo_text">
                        <p v-text="item.gameName"></p>
                        <p>
                            <span class="gameInfo_tag gameInfo_tag-discount">{{item.gameDintensity}}折</span>
                            <span :class="[{'n':(item.gameDmeta=='0')},
                                           {'g':(item.gameDmeta>=75 && item.gameDmeta<=100)},
                                           {'y':(item.gameDmeta<75)},
                            ]">metacritic {{item.Dmeta}}</span>
                            <span class="gameInfo_tag gameInfo_tag-chinese" v-if="item.gameChinese==0" >中文</span>
                            <span class="gameInfo_tag gameInfo_tag-steam" v-if="item.gamePlace=='steam'" >steam</span>
                            <span class="gameInfo_tag gameInfo_tag-switch" v-else-if="item.gamePlace=='switch'">switch</span>
                            <span class="gameInfo_tag gameInfo_tag-xbox" v-else-if="item.gamePlace=='xbox'">xbox</span>
                            <span class="gameInfo_tag gameInfo_tag-ps" v-else>ps4</span>
                        </p>
                    </div>
                    <div class="gameInfo_append gameInfo_price gameInfo_append-withArrow">
                        <span class="gameInfo_arrow">
                            <img class="svg-inline" src="../assets/discount/arrow_right.png" alt="">
                        </span>
                        <p>￥{{Math.ceil(item.gamePrice*(item.gameDintensity/10))}}</p>
                        <p>
                            {{item.gameLanguage}}
                            <span class="ml-1 u_deletedText">{{item.gamePrice}}</span>
                        </p>
                    </div>
                </div>
            </a>
          </li>
      </ul> -->
      
</template>

<script type="text/javascript">
export default {
    name:'discount-list',
    props:{
        data:{
            type: Array,
            default () {
                return [];
            }
        }
    },
}
</script>

<style scoped>
.loadingPlaceholder-disabled{
    height: auto;
    min-height: auto;
    opacity: 1;
}
.loadingPlaceholder-wrapper{
    display: block;
    margin: 0;
}
.loadingPlaceholder{
    position: relative;
    align-items: center;
    justify-content: center;
}
.u_stylelessList{
    padding-left:0;
    list-style: none;
    margin-bottom: 0.16rem;
}
.gameInfo{
    display: flex;
    align-items: center;
    color: #464646;
    font-size: 0.16rem;
    width: 6.6rem;
    height: .78rem;
}
.gameInfo:hover{
    opacity: .8;
}
.gameInfo_img{
    flex: 0 0 auto;
    margin-right: 0.26rem;
}
.gameInfo_gameImg{
    width: 1.28rem;
    height: .6rem;
    border-radius:4px;
}
.gameInfo_body{
    display: flex;
    align-items: center;
    min-height: .68rem;
    flex: 1 1 auto;
    padding: .12rem 0;
    border-bottom:1px dashed palevioletred;
}
.gameInfo_text{
    flex: 1 1 auto;
    margin-top:-.1rem;
    font-family: sans-serif;
}
p{
    margin-top:0.05rem;
    
}
.gameInfo p{
    margin-bottom: 0.03rem;
}
.gameInfo_tag.gameInfo_tag-discount{
    background:#ff4f19;
}
.gameInfo_tag{
    line-height: 1;
    font-size: .13rem;
    padding: .03rem .07rem;
    border-radius: .02rem;
    margin-right: .04rem;
    color: #fff;
    white-space: nowrap; 
}
.gameInfo_tag.gameInfo_tag-chinese{
    background: #719dea;
}
.gameInfo_tag.gameInfo_tag-steam{
    background: #2b475e;
}
.gameInfo_tag.gameInfo_tag-switch{
    background: #e60012;
}
.gameInfo_tag.gameInfo_tag-xbox{
    background: #0f7c10;
}
.gameInfo_tag.gameInfo_tag-ps{
    background: #084595;
}
.n{
    display: none
}
.g{
    line-height: 1;
    font-size: .13rem;
    padding: .03rem .07rem;
    border-radius: .02rem;
    margin-right: .04rem;
    color: #fff;
    white-space: nowrap;
    background:#6c3;
}
.y{
    line-height: 1;
    font-size: .13rem;
    padding: .03rem .07rem;
    border-radius: .02rem;
    margin-right: .04rem;
    color: #fff;
    white-space: nowrap;
    background: #fe9500;
}
.gameInfo_append.gameInfo_append-withArrow{
    padding-right: .21rem;
}
.gameInfo_append{
    position: relative;
    flex: 0 0 auto;
    text-align: right;
}
.gameInfo_arrow{
    position: absolute;
    right: -.26rem;
    top: 50%;
    margin-top: -0.065rem;
    font-size: .13rem;
    line-height: 1;
    color: #ddd;
}
.svg-inline{
    display: inline-block;
    font-size: inherit;
}
.gameInfo_price>p{
    font-size: .14rem;
    color: #ff4f19;
    font-weight: 600;
}
.gameInfo_price>p:last-child{
    font-size: .12rem;
    color: #aaa!important;
}
.ml-1{
    margin-left: .04rem;
}
.u_deletedText{
    text-decoration: line-through;
}
.sorry{
    font-size: .25rem;
    color: #f44133;
    font-weight: 600;
    /* position:absolute;
    top: 0;
    z-index: -3; */
}
.toSorry{
    position: absolute;
    writing-mode: tb-rl;
}
.tosorry{
    position:absolute;
    writing-mode: tb-rl;
    margin-left:.35rem ;
}
.bear{
    color:black;
}
</style>