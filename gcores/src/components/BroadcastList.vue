<template>
  <!-- 播单 -->
  <div class="broadcastList">
    <!-- broadcast-list 65% -->
    <div class="broadcastList-width65">
      <!-- broadcast-list title -->
      <div class="broadcastList-title">
        <span>播单</span>
      </div>
      <!-- broadcast-list check height -->
      <div class="broadcastList-outbox-padding" v-for="(temp) of BroadcastList_List" :key="temp.Broid">
        <div class="broadcastList-outbox">
          <div class="broadcastList-innerbox" :style="{backgroundColor:temp.BroColor}" @click="innerboxShow(temp.Broid)">
            <div>
              <img src="../assets/broadcast_img/CD.png" alt="">
              <img :src="require('../assets/broadcast_tab_img/' + temp.BroImg)" alt="">
              
            </div>
            <div>
              <p>{{temp.Broname}}</p>
            </div>
          </div>
        </div>
      </div>
      <!-- broadcast-list 页脚 -->
      <div class="broadcastList-footer">
        <div v-show="up_show" @click="setList(BroadcastList_nowPage-1)">
          上一页
        </div>
        <div v-for="(temp,i) of BroadcastList_Page" :key="i" @click="setList(i)" :class="{broadcastList_footer_circle:footerlist[i]}">{{i+1}}</div>
        <div v-show="down_show" @click="setList(BroadcastList_nowPage+1)">
          下一页
        </div>
      </div>
    </div>
    <v-BroTab v-show="BroadcastTabShow"></v-BroTab>
  </div>
</template>

<script>
export default {
  name:'v-broadcast-list',
  data(){
    return{
      footerlist:[],
      BroadcastList_totalPage:0,
      BroadcastList_Page:1,
      BroadcastList_nowPage:0,
      BroadcastList_List:[],
      up_show:false,
      down_show:true,
    }
  },
  methods:{
    setList(temp){
      // 换footer
      this.footerlist[this.BroadcastList_nowPage] = false;
      this.footerlist[temp] = true;
      // 清除当前页面
      this.BroadcastList_List = [];
      // 当前页面
      var nowPage = this.BroadcastList_nowPage;
      // 点击后跳转的页面
      this.BroadcastList_nowPage = temp;
      if(temp>0){
        this.up_show = true;
      }else{
        this.up_show = false;
      }
      if(temp<this.BroadcastList_Page-1){
        this.down_show = true;
      }else{
        this.down_show = false;
      }
      // 计算最大个数
      var maxNum = 0;
      if(temp<this.BroadcastList_totalPage-1){
        maxNum=(temp+1)*12;
      }else{
        maxNum=this.BroadcastList_totalPage;
      }
      // 排入元素
      this.axios.get(`/bro/getSomeBro?Brostart=${temp*12}&Brototal=${maxNum-temp*12}`).then(res=>{
        this.BroadcastList_List = res.data;
        this.$store.commit('setBroadcastTab',{
          BroadcastTab:res.data,
        })
      });
    },
    innerboxShow(temp){
      this.$store.commit('setBroadcastListNum',{
        BroadcastListNum:temp - (this.BroadcastList_nowPage*12)
      });
      this.axios.get(`/bro/getBroList?Broid=${temp}`).then(res=>{
        this.$store.commit('setBroadcastList',{
          BroadcastList:res.data
        });
        this.$store.commit('setBroadcastTabShow');
      });
    }
  },
  mounted() {
    this.axios.get(`/bro/getBroCount`).then(res=>{
      this.BroadcastList_totalPage = res.data[0]["count(1)"];
      this.BroadcastList_Page = parseInt(this.BroadcastList_totalPage/12)+1;
      if(this.BroadcastList_Page>0){
        this.footerlist[0]=true;
      }
      if(this.BroadcastList_Page>1){
        for(var i=1;i<this.BroadcastList_Page;i++){
          this.footerlist[i]=false
        }
      }
    })
    this.axios.get(`/bro/getSomeBro?Brostart=0&Brototal=12`).then(res=>{
      this.BroadcastList_List = res.data;
      this.$store.commit('setBroadcastTab',{
        BroadcastTab:res.data
      })
    });
  },
  computed: {
    BroadcastTabShow: function(){
      return this.$store.state.BroadcastTabShow;
    }
  },
}
</script>

<style>
/* broadcastList */
.broadcastList{
  width: 100%;
  background-color: transparent;
  position: relative;
}
/* broadcastList-width65 */
.broadcastList-width65{
  width: 65%;
  position: relative;
  margin: 0 auto;
  display: flex;
  font-size: 0.18rem;
  flex-wrap: wrap;
}
/* broadcastList-title */
.broadcastList-title{
  width: 100%;
  position: relative;
  text-align: left;
  margin-left: 1%;
  padding:1% 0 0;
  box-sizing: border-box;
}
/* broadcastList-outbox */
.broadcastList-outbox-padding{
  width: 33.3%;
  padding-bottom: 18%;
  height: 0;
  box-sizing: border-box;
  position: relative;
  display: flex;
}
/* broadcastList-outbox */
.broadcastList-outbox{
  position: absolute;
  margin-top:3%;
  width: 100%;
  height: 85%;
  padding: 0 3%;
  box-sizing: border-box;
}
/* broadcastList-innerbox */
.broadcastList-innerbox{
  width: 100%;
  height: 100%;
  border-radius: 0.2vw;
  padding: 4%;
  box-sizing: border-box;
  display: flex;
}
.broadcastList-innerbox>div:first-child{
  height: 100%;
  width: 50%;
  position: relative;
}
.broadcastList-innerbox>div:first-child>img:first-child{
  position: absolute;
  height: 100%;
  left: 15%;
  /* z-index: 500; */
}
.broadcastList-innerbox>div:first-child>img:last-child{
  position: absolute;
  height: 100%;
  left: 0;
  /* z-index: 499; */
}
.broadcastList-innerbox>div:last-child{
  height: 100%;
  width: 50%;
  font-size: 0.14rem;
  color: white;
  text-align: right;
}
/* broadcastList-footer */
.broadcastList-footer{
  font-size: 0.1rem;
  width: 100%;
  display: flex;
  justify-content: center;
  padding-bottom: 0.2rem;
  text-align: center;
  cursor: pointer;
}
.broadcastList-footer>div{
  box-sizing: border-box;
  width: 0.4rem;
  height: 0.4rem;
  padding: 0.1rem;
  border-radius: 0.2rem;
  margin: 0 0.05rem;
}
.broadcastList-footer>div:first-child,
.broadcastList-footer>div:last-child{
  width: 0.8rem;
  border: 0.01rem solid black;
}
/* 尾部样式 */
.broadcastList_footer_circle{
  background-color: #2b2d33;
  color: white;
}
</style>