<template>
  <!-- broadcast -->
  <div class="broadcast">
    <div class="broadcast-pr">
      <!-- broadcast 主体 -->
      <div class="broadcast-main">
        <!-- broadcast 导航 -->
        <div class="broadcast-nav">
          <!-- <a href="#" @click="abc"> -->
          <router-link to="/broadcastRouter" @click="abc">
            <div>播单推荐</div>
            <img src="../assets/broadcast_img/chevron-right.png" alt />
          </router-link>
          <!-- </a> -->
        </div>
        <!-- broadcast 轮播 -->
        <button class="broadcast-list-button1" @click="listLeft" v-show="btn1">
          <img src="../assets/broadcast_img/chevron-left.png" alt />
        </button>
        <button class="broadcast-list-button2" @click="listRight" v-show="btn2">
          <img src="../assets/broadcast_img/chevron-right.png" alt />
        </button>
        <div class="broadcast-list">
          <div class="broadcast-list-width" :style="leftCSS">
            <div class="broadcast-list-item" v-for="(item,k) of broadcast_list" :key="k">
              <div :style="{backgroundColor:item.color}">
                <div class="broadcast-list-img">
                  <img src="../assets/broadcast_img/CD.png" alt />
                </div>
                <div class="broadcast-list-img2">
                  <img :src="item.img" alt />
                </div>
                <div class="broadcast-list-info">
                  <p>{{item.text}}</p>
                  <button class="broadcast-list-button" @click="openItem(item.id)">查看播单</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 引入BroadcastTab子组件 -->
    <v-BroTab v-show="BroadcastTabShow"></v-BroTab>
  </div>
</template>

<script>
export default {
  name:'v-broadcast',
  data() {
    return {
      btn1: false,
      btn2: true,
      leftCSS: { left: "0%", width: "100%" },
      broadcast_list:[],
      // broadcastTabShow:false,
    };
  },
  methods: {
    abc(){
      this.$store.state.type='播单'
    },
    listLeft() {
      var temp = parseInt(this.leftCSS.left.split("%")[0]);
      this.leftCSS.left = `${temp + 100}%`;
      if (temp + 100 >= 0) {
        this.btn1 = false;
      }
      var temp2 = parseInt(this.leftCSS.width.split("%")[0]);
      if (Math.abs(temp + 100) < temp2 - 100) {
        this.btn2 = true;
      }
    },
    listRight() {
      var temp = parseInt(this.leftCSS.left.split("%")[0]);
      this.leftCSS.left = `${temp - 100}%`;
      if (temp - 100 < 0) {
        this.btn1 = true;
      }
      var temp2 = parseInt(this.leftCSS.width.split("%")[0]);
      if (Math.abs(temp - 100) >= temp2 - 100) {
        this.btn2 = false;
      }
    },
    openItem(temp){
      console.log(temp);
      this.$store.commit('setBroadcastListNum',{
        BroadcastListNum:temp
      });
      this.axios.get(`/bro/getBroList?Broid=${temp}`).then(res=>{
        this.$store.commit('setBroadcastList',{
          BroadcastList:res.data
        });
        console.log(3);
        console.log(this.$store.state.BroadcastList);
        this.$store.commit('setBroadcastTabShow');
      });
    },
  },
  mounted() {
    this.leftCSS.width = `${(this.broadcast_list.length / 3) * 100}%`;
    this.axios.get(`/bro/getSomeBro?Brostart=0&Brototal=12`).then(res=>{
      // console.log(res.data);
      this.$store.commit('setBroadcastTab',{
        BroadcastTab:res.data
      })
    });
  },
  // 获取变化
  computed: {
    BroadcastTab: function(){
      return this.$store.state.BroadcastTab;
    },
    BroadcastTabShow: function(){
      return this.$store.state.BroadcastTabShow;
    }
  },
  // 监视变化
  watch: {
    BroadcastTab(val){
      var temp = this.$store.state.BroadcastTab;
      // console.log(temp);
      for(var i=0;i<temp.length;i++){
        var app =require('../assets/broadcast_tab_img/' + temp[i].BroImg)
        var bro = {
          id:temp[i].Broid,
          img:app,
          color:temp[i].BroColor,
          text:temp[i].Broname
        }
        this.broadcast_list.push(bro);
      };
      // console.log(this.broadcast_list);
      this.leftCSS.width = `${(this.broadcast_list.length / 3) * 100}%`;
    },
  },
};
</script>

<style>
/* broadcast */
.broadcast {
  font-size: 0.2rem;
  font-weight: 600;
  width: 100%;
  margin: 0 auto;
  background-color: #fcfcfc;
  padding: 0.3rem 0;
}
.broadcast-pr{
  font-size: 0.2rem;
  font-weight: 600;
  width: 65%;
  margin: 0 auto;
}
/* broadcast-main */
.broadcast-main {
  position: relative;
  width: 100%;
  height: 0;
  padding-bottom: 18%;
}
/* broadcast-nav */
.broadcast-nav {
  position: absolute;
  display: flex;
  align-items: center;
  width: 100%;
  height: 20%;
  top: 0;
}
.broadcast-nav > a {
  display: flex;
  position: relative;
  align-items: center;
  text-decoration: none;
  color: #323232;
  height: 100%;
  /* 这个width属性没有的话，缩小时会发生文字易位问题，后面可以改一下 */
  /* width: 15%; */
  left: 1.5%;
}
.broadcast-nav > a > div {
  font-size: 0.18rem;
  max-height: 100%;
}
.broadcast-nav > a > img {
  max-height: 50%;
  margin-left: 0.05rem;
}
/* broadcast-list */
.broadcast-list {
  position: absolute;
  width: 100%;
  height: 80%;
  bottom: 0;
  overflow: hidden;
}
/* broadcast-list-button1 */
.broadcast-list-button1 {
  background-color: transparent;
  position: absolute;
  left: -0.6rem;
}
.broadcast-list-button2 {
  background-color: transparent;
  position: absolute;
  right: -5%;
}
.broadcast-list-button1:hover,
.broadcast-list-button2:hover {
  background-color: rgba(148, 148, 156, 0.2);
}
.broadcast-list-button2,
.broadcast-list-button1 {
  top: 20%;
  width: 4%;
  height: 80%;
  border-radius: 0.08rem;
  border: 0;
  outline: none;
  cursor: pointer;
  display: flex;
}
.broadcast-list-button2 > img,
.broadcast-list-button1 > img {
  width: 100%;
  margin: auto 0;
}
/*  */
.broadcast-list-width {
  width: 300%;
  height: 100%;
  position: absolute;
  display: flex;
  transition: 0.5s linear;
  transition-property: left;
  left: 0;
}
.broadcast-list-item {
  width: 33.333%;
  height: 100%;
  box-sizing: border-box;
  padding: 0 0.4%;
}
.broadcast-list-item > div {
  width: 100%;
  height: 100%;
  box-sizing: border-box;
  padding: 5% 0;
  border-radius: 0.03rem;
  position: relative;
  display: flex;
}
.broadcast-list-img {
  position: absolute;
  left: 12%;
  height: 90%;
}
.broadcast-list-img2 {
  position: absolute;
  left: 4%;
  height: 90%;
}
.broadcast-list-img > img {
  position: absolute;
  height: 90%;
  border-radius: 5%;
}
.broadcast-list-img2 > img {
  position: absolute;
  height: 90%;
  border-radius: 5%;
}
.broadcast-list-info {
  position: absolute;
  right: 4%;
  height: 80%;
  width: 45%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: flex-end;
}
.broadcast-list-info p {
  font-size: 0.12rem;
  color: white;
  text-align: right;
}
.broadcast-list-button {
  width: 60%;
  height: 30%;
  border: 0;
  font-size: 0.14rem;
  background-color: rgba(132, 132, 136, 0.2);
  color: white;
  border-radius: 0.16rem;
  outline: none;
  cursor: pointer;
}
</style>