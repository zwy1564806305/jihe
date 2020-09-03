<template>
  <!-- BroadcastTab 遮罩层 -->
  <div class="BroadcastTab" @click="moveBroadcastTab">
    <!-- BroadcastTab-main 表单列表 -->
    <div class="BroadcastTab-main">
      <!-- BroadcastTab-title 头部分-->
      <div class="BroadcastTab-title">
        <!-- BroadcastTab-title 图片  -->
        <img :src="BroadcastTab.BroImg" alt="">
        <!-- BroadcastTab-title 信息 -->
        <div class="BroadcastTab-info">
          <div>
            <h3>{{BroadcastTab.Broname}}</h3>
            <p>{{BroadcastTab.BroInfo}}</p>
          </div>
          <div class="BroadcastTab-info-button">
            <div>
              <button>订阅</button>
              <button @click="AddAllPlayList">添加全部歌曲</button>
            </div>
            <div>
              <button @click="ListSort"><img src="../../assets/broadcast_tab_img/sort-alpha-down.png" alt=""></button>
              <button><img src="../../assets/broadcast_tab_img/share.png" alt=""></button>
            </div>
          </div>
        </div>
      </div>
      <!-- BroadcastTab-list 表单部分 -->
      <div class="BroadcastTab-program">
        <a href="#">节目</a>
        <p>{{BroadcastTab_list.length}}个节目</p>
      </div>
      <div class="BroadcastTab-List" v-for="(temp) of BroadcastTab_list" :key="temp.BroListid">
        <ul>
          <li>
            <div>
              <img :src="temp.BroListIgm" alt="">
              <div class="BroadcastTab-List-Info">
                <div>
                  <div>
                    <a href="javascript:;">{{temp.BroListName}}</a>
                  </div>
                  <div>
                    <a href="javascript:;">{{temp.BroListType}}</a>
                    <p>{{temp.BroListDuration}}</p>
                    <p>{{temp.Pcomment}}评论</p>
                  </div>
                </div>
                <div>
                  <a href="javascript:;" @click="AddPlayList(temp.BroListid)"><img src="../../assets/broadcast_tab_img/plus.png" alt=""></a>
                </div>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      BroadcastTab:{},
      BroadcastTab_list_arr:false,
      BroadcastTab_list:[],
      BroadcastTab_list2:[]
    }
  },
  methods:{
    moveBroadcastTab(e){
      var el1=e.target;
      var el2=e.currentTarget;
      if(el1==el2){
        this.$store.commit('setBroadcastTabShow');
        this.$store.commit('clearBroadcastList');
      }
    },
    AddAllPlayList(){
      this.$store.state.PlayList=[];
      var temp = this.$store.state.BroadcastList;
      console.log(temp);
      for(var i=0;i<temp.length;i++){
        this.$store.commit('addToPlayList',{
          BroListid:temp[i].BroListid
        })
      }
    },
    AddPlayList(temp){
      this.$store.state.PlayList=[];
      this.$store.commit('addToPlayList',{
        BroListid:temp,
      })
    },
    ListSort(){
      if(!this.BroadcastTab_list_arr){
        this.BroadcastTab_list_arr=true;
        this.BroadcastTab_list.sort(function(a,b){
          return a.BroListName.localeCompare(b.BroListName);
        });
        console.log(this.BroadcastTab_list2);
      }else{
        this.BroadcastTab_list_arr=false;
        this.BroadcastTab_list = this.BroadcastTab_list2.slice();
      }
    }
  },
  computed:{
    BroadcastList: function(){
      return this.$store.state.BroadcastList;
    },
  },
  watch:{
    BroadcastList(val){
      this.BroadcastTab_list = [];
      this.BroadcastTab = {};
      this.BroadcastTab_list_arr = false;
      var temp = this.$store.state.BroadcastList;
      var temp2 = this.$store.state.BroadcastTab;
      var num = this.$store.state.BroadcastListNum-1;
      this.BroadcastTab = {
        Broname:temp2[num].Broname,
        BroInfo:temp2[num].BroInfo,
        BroImg:require('../../assets/broadcast_tab_img/' + temp2[num].BroImg),
      }
      for(var i=0;i<temp.length;i++){
        var app =require('../../assets/broadcast_tab_img/' + temp[i].BroListImg);
        var bro = {
          BroListid:temp[i].BroListid,
          BroListName:temp[i].BroListName,
          BroListType:temp[i].BroListType,
          BroListDuration:temp[i].BroListDuration,
          Pcomment:temp[i].Pcomment,
          BroListIgm:app,
        };
        this.BroadcastTab_list.push(bro);
      }
      this.BroadcastTab_list2 = this.BroadcastTab_list.slice();
    }
  }
}
</script>

<style>
/* BroadcastTab 遮罩层 */
.BroadcastTab{
  position:fixed;
  z-index: 15000;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  overflow-x: hidden;
  overflow-y: visible;
}
.BroadcastTab::-webkit-scrollbar{
  width: 0;
}
/* BroadcastTab-main 表单列表 */
.BroadcastTab .BroadcastTab-main{
  position: relative;
  width: 8.5rem;
  box-sizing: border-box;
  margin: 1rem auto;
  padding: 0.2rem;
  background-color: white;
  border-radius: 0.05rem;
}
/* BroadcastTab-title 头部分 */
.BroadcastTab .BroadcastTab-title{
  width: 100%;
  display: flex;
}
.BroadcastTab .BroadcastTab-title>img{
  height: 100%;
}
/* BroadcastTab-info */
.BroadcastTab-info{
  flex: auto;
  height: 1.8rem;
  display: flex;
  flex-direction: column;
  padding: 0 0.2rem;
  justify-content: space-between;
  margin-bottom: 0.2rem;
}
.BroadcastTab-info>div:first-child{
  display: flex;
  flex-direction: column;
  align-items: flex-start;
}
.BroadcastTab-info>div:first-child>h3{
  margin-bottom: 0.2rem;
  font-size: 0.24rem;
}
.BroadcastTab-info>div:first-child>p{
  text-align: left;
  font-size: 0.14rem;
  color: #8e8e93;
  font-weight: 500;
}
/* BroadcastTab-info-button */
.BroadcastTab-info-button{
  display: flex;
  outline: none;
  width: 100%;
  justify-content: space-between;
}
.BroadcastTab-info-button>div{
  font-size: 0.18rem;
}
.BroadcastTab-info-button>div>button{
  padding: 0;
  height: 0.38rem;
  border-radius: 0.19rem;
  border: 0;
  font-size: 0.16rem;
  font-weight: 500;
  background-color: #f6f6f6;
}
.BroadcastTab-info-button>div:nth-child(1)>button:first-child{
  color: white;
  background-color: #2b2d33;
  margin-right: 0.2rem;
}
.BroadcastTab-info-button>div:nth-child(1)>button:last-child{
  color: black;
}
.BroadcastTab-info-button>div:nth-child(1)>button{
  padding: 0.08rem 0.24rem;
  outline: none;
  cursor: pointer;
}
.BroadcastTab-info-button>div:nth-child(2){
  display: flex;
}
.BroadcastTab-info-button>div:nth-child(2)>button:first-child{
  margin-right: 0.2rem;
}
.BroadcastTab-info-button>div:nth-child(2)>button{
  width: 0.38rem;
  display: flex;
  justify-content: center;
  align-items: center;
  outline: none;
  cursor: pointer;
}
.BroadcastTab-info-button>div>button>img{
  width: 0.20rem;
  height: 0.20rem;
}
/* BroadcastTab-program */
.BroadcastTab-program{
  display: flex;
  justify-content: space-between;
  margin-bottom: 0.2rem;
  border-bottom: 0.01rem solid lightgrey;
  align-items: center;
}
.BroadcastTab-program>a{
  text-decoration: none;
  font-size: 0.16rem;
  padding: 0.2rem 0.05rem;
  border-bottom: 0.01rem solid black;
  color: black;
}
.BroadcastTab-program>p{
  font-size: 0.14rem;
  color: black;
}
/* BroadcastTab-List */
.BroadcastTab-List li>div{
  display: flex;
  margin-bottom: 0.2rem;
}
.BroadcastTab-List li>div>img{
  height: 100%;
}
/* BroadcastTab-List-Info */
.BroadcastTab-List-Info{
  flex: auto;
  padding-left: 0.2rem;
  display: flex;
  justify-content: space-between;
}
.BroadcastTab-List-Info>div:first-child{
  display: flex;
  flex-direction: column;
  justify-content: space-around;
}
.BroadcastTab-List-Info>div:first-child a{
  text-decoration: none;
  color: black;
  font-size: 0.15rem;
}
.BroadcastTab-List-Info>div:first-child>div:first-child{
  font-size: 0.18rem;
}
.BroadcastTab-List-Info>div:first-child>div:last-child{
  display: flex;
}
.BroadcastTab-List-Info>div:first-child>div:last-child>a{
  color: #ff3d1d;
}
.BroadcastTab-List-Info>div:first-child>div:last-child>a,
.BroadcastTab-List-Info>div:first-child>div:last-child>p{
  font-size: 0.12rem;
  margin-right: 0.1rem;
  font-weight: 400;
}
.BroadcastTab-List-Info>div:last-child{
  display: flex;
  align-items: center;
}
.BroadcastTab-List-Info>div:last-child>a{
  display: flex;
  width: 0.3rem;
  height: 50%;
  margin-left: 0.3rem;
  align-items: center;
  justify-content: center;
}
.BroadcastTab-List-Info>div:last-child img{
  width: 0.14rem;
  height: 0.14rem;
}
</style>