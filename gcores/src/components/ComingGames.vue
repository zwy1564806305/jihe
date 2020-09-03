<template>
  <div class="loadingPlaceholder loadingPlaceholder-warpper loadingPlaceholder-disabled" style="background:transparent;">
      <div class="gamesPage_section" v-for="(item,index) in data" :key="index">
          <h3 >{{item.wgameTimme}}</h3>
          <ul class="u_stylelessList">
              <li>
                  <a class="gameInfo gameInfo-mutePrice" href="">
                      <img class="gameInfo_img gameInfo_gameImg" :src="item.wgameurl" alt="">
                      <div class="gameInfo_body">
                          <div class="gameInfo_text">
                              <p v-text="item.wgameName"></p>
                              <p>
                                  <span class="gameInfo_tag gameInfo_tag-chinese" v-if="item.wgameChinese==true" >中文</span>
                              </p>
                          </div>
                          <div class="gameInfo_append gameInfo_price gameInfo_append-withArrow">
                            <span class="gameInfo_arrow">
                                <img class="svg-inline" src="../assets/discount/arrow_right.png" alt="">
                            </span>
                            <p class="gameInfo_price-no" v-if="item.wgamePrice == 0">暂无价格</p>
                            <p class="gameInfo_price" v-else>￥{{item.wgamePrice}}</p>
                            <p>
                            {{item.wgameLanguage}}
                            </p>
                          </div>
                      </div>
                  </a>
              </li>
          </ul>
      </div>
      <p class="last-text">已全部加载</p>
  </div>
</template>

<script type="text/javascript">
export default {
    name:'cominggames-list',
    props:{
        data:{
            type:Array,
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
.gamesPage_section h3{
    font-size: .14rem;
    color: #323232;
    padding: .2rem 0;
    margin: 0;
    font-weight: 600;
}
.u_stylelessList{
    padding-left: 0;
    list-style: none;
    margin-top: 0;
    margin-bottom: .16rem;
}
.gameInfo{
    display: flex;
    align-items: center;
    color: #464646;
    font-size: .16rem;
}
.gameInfo:hover{
    opacity: .8;
}
.gameInfo_img{
    flex: 0 0 auto;
    margin-right: .26rem;
}
.gameInfo_gameImg{
    width: 1.28rem;
    height: .6rem;
    border-radius: .04rem;
}
.gameInfo_body{
    display: flex;
    align-items: center;
    min-height: .68rem;
    flex: 1 1 auto;
    padding: .13rem 0;
}
.gameInfo_text{
    flex: 1 1 auto;
    font-weight: 600;
}
.gameInfo p:last-child{
    margin: 0;
}
.gameInfo_tag{
    line-height: 1;
    font-size: .13rem;
    padding: .03rem .07rem;
    border-radius: .04rem;
    margin-right: .04rem;
    color: #fff;
    white-space: nowrap; 
}
.gameInfo_tag.gameInfo_tag-chinese{
    background: #719dea;
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
.gameInfo_price-no{
    font-size: .2rem;
    color: #aaa;
    font-weight: 600;
}
.gameInfo_price{
    color: #464646;
    font-size: .14rem;
    font-weight: 600;
}
.gameInfo_price>p:last-child{
    font-size: .13rem;
    color: #aaa!important;
}
.last-text{
    font-size: .14rem;
    color: #8e8e93!important;
    text-align: center!important;
    padding-bottom: .48rem!important;
    padding-top: .48rem!important;
    margin-bottom: .16rem;
}
</style>