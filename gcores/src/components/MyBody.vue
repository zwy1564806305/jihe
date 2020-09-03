<template>
  <div class="my-body">
    <div class="my-body-main" :class="myBodyMainMargin">
      <div class="home" v-if="this.$store.state.type == '首页'">
        <v-banner></v-banner>
        <v-real-time></v-real-time>
        <v-broadcast></v-broadcast>
        <v-special-small></v-special-small>
      </div>
      <div class="abc" v-else-if="this.$store.state.type == '咨讯'">
        <v-refer></v-refer>
      </div>
      <div class="varticle" v-else-if="this.$store.state.type == '文章'">
        <v-article></v-article>
      </div>
      <div class="broadcast" v-else-if="this.$store.state.type == '播单'">
        <v-broadcast-list></v-broadcast-list>
      </div>
      <div class="setting" v-else-if="this.$store.state.type == '专题'">
        <v-special></v-special>
      </div>
      <div class="setting" v-else-if="this.$store.state.type == '个人中心'">
        <v-setting></v-setting>
      </div>
      <div class="discount" v-else-if="this.$store.state.type == '游戏折扣'">
        <v-discount></v-discount>
      </div>
      <div class="unfinsh" v-else>
        页面正在开发<br>
        敬请期待
      </div>
      <v-footer></v-footer>
    </div>
  </div>
</template>

<script>

import vSpecialSmall from './demo/specialSmall'
// 轮播图板块
import vBanner from './demo/MainBanner'
// 首页咨讯板块
import vRealTime from './demo/RealTime'
// 播单推荐
import vBroadcast from './Broadcast'
// 播单页面
import vBroadcastList from './BroadcastList'
// 咨讯页面
import vRefer from './demo/Refer'
// 个人中心
import vSetting from './demo/setting'
// 专题页面
import vSpecial from './demo/Special'
// 文章页面
import vArticle from './demo/Article'
// 游戏折扣
import vDiscount from './Discount'
// 电台详情页
import vTransceiver from './demo/transceiver'

import vInformation from './demo/information'

export default {
  name:"v-dhd",
  data(){
    return{
      a:sessionStorage.getItem('root'),
      myBodyMainMargin:{
        my_body_main_max:true,
        my_body_main_min:false,
      },
    }
  },
  computed: {
    reduce: function(){
      // console.log(this.$store.state.reduce);
      return this.$store.state.reduce;
    },
  },
  watch: {
    reduce(val){
      if(this.$store.state.reduce==true) {
        // console.log(1);
        this.myBodyMainMargin.my_body_main_max=false;
        this.myBodyMainMargin.my_body_main_min=true;
      }
      else{
        // console.log(2);
        this.myBodyMainMargin.my_body_main_max=true;
        this.myBodyMainMargin.my_body_main_min=false;
      }
    },
  },
  components:{
    vSpecialSmall,
    vBroadcast,
    vBroadcastList,
    vBanner,
    vRealTime,
    vRefer,
    vSetting,
    vSpecial,
    vArticle,
    vDiscount,
    vTransceiver,
    vInformation,
  }
}
</script>

<style>
  /* body css */
  .my-body{
    width: 100%;
    display: flex;
  }
  .my-body-main{
    flex: auto;
    transition: 0.5s linear;
  }
  .my_body_main_max{
    margin-left: 2.3rem;
    overflow: hidden;
  }
  .my_body_main_min{
    margin-left: 0.8rem;
    overflow: hidden;
  }
  .unfinsh{
    font-family: "楷书";
    margin-top: 0.4rem;
    text-align: center;
  }
</style>