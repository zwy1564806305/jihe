<template>
  <div class="myMsg"  :class="{turnToRight:!msg_show}" tabindex="-1" @mouseleave="msgShow" ref="myMsg">
    <!--  :class="{turnToLeft:turnToLeft,turnToRight:!turnToLeft}" -->
    <div class="myMsg-top">
      <a href="#" :class="{bottom_line:checkone}" @click="Turnto(1)">通知</a>
      <a href="#" :class="{bottom_line:!checkone}" @click="Turnto(2)">私信</a>
    </div>
    <div class="myMsg-msg">
      <div class="myMsg-msg-holder" v-if="msg_list.length==0">
        <p>没有任何动态</p>
      </div>
      <div v-else>
        <div class="myMsg-msg-info" v-for="(temp,i) of msg_list" :key="i">
          <div class="myMsg-time">
            <div>{{temp.time}}</div>
          </div>
          <div class="myMsg-massage">
            <div class="myMsg-head-portrait">
              <img src="../assets/top_img/bullseye.png" alt="">
            </div>
            <div class="myMsg-massage-specificly">
              <div>
                <p>{{temp.username}}</p>
              </div>
              <div>
                <p>{{temp.msg}}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      checkone:true,
      msg_list:[],
    }
  },
  methods:{
    Turnto(temp){
      if(temp==1 && this.checkone==false){
        this.checkone=true;
        this.axios.get('/bro/getMyMsg').then(res=>{
          this.msg_list = res.data;
        });
        this.$refs.myMsg.focus();
      }
      else if(temp==2 && this.checkone==true){
        this.checkone=false;
        this.msg_list = [];
        this.$refs.myMsg.focus();
      }
    },
    msgShow(){
      this.$store.commit('setMsg_show');
    }
  },
  computed: {
    msg_show:function(){
      return this.$store.state.msg_show;
    }
  },
  mounted(){
    this.axios.get('/bro/getMyMsg').then(res=>{
      this.msg_list = res.data;
    })
  }
}
</script>

<style>
/* myMsg */
.myMsg{
  position: fixed;
  margin-top: 0.6rem;
  right: 0;
  width: 4rem;
  height: 100%;
  background-color: #f7f7f8;
  z-index: 10000;
  display: flex;
  flex-direction: column;
  font-size: 0.18rem;
  border-left: 0.01rem solid #dddddd;
  transition: all 0.5s linear;
  outline: none;
}
.turnToRight{
  right: -4.1rem;
}
/* myMsg-msg-holder */
.myMsg-msg-holder{
  font-size: 0.3rem;
  color: #dddddd;
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  text-align: center;
}
/* myMsg-top */
.myMsg .myMsg-top{
  height: 0.6rem;
  width: 100%;
  border-bottom: 0.01rem solid lightgrey;
  display: flex;
  align-items: center;
}
.myMsg .myMsg-top>a{
  text-decoration: none;
  padding: 0 0.05rem;
  margin: 0 0.05rem;
  color: #abacae;
  box-sizing: border-box;
  height: 100%;
  display: flex;
  align-items: center;
}
/* 下滑线 */
.myMsg .myMsg-top .bottom_line {
  color: black;
  border-bottom: 0.01rem solid black;
}
/* myMsg-msg */
.myMsg-msg{
  overflow: scroll;
  flex: auto;
}
.myMsg-msg>div{
  display: flex;
  flex-direction: column-reverse;
}
.myMsg-msg::-webkit-scrollbar{
  width: 0.04rem;
}
.myMsg-msg::-webkit-scrollbar-thumb{
  -webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
  background: rgba(0, 0, 0, 0.2);
}
/* myMsg-msg-info */
.myMsg .myMsg-msg-info{
  box-sizing: border-box;
  width: 100%;
  padding: 0.1rem;
  display: flex;
  flex-direction: column;
  position: relative;
}
/* myMsg-time */
.myMsg-time{
  width: 100%;
  margin-bottom: 0.05rem;
  font-size: 0.14rem;
  color: #5a5a5a;
  text-align: center;
}
/* myMsg-massage */
.myMsg-massage{
  display: flex;
  width: 100%;
}
/* myMsg-head-portrait */
.myMsg-head-portrait{
  width: 0.4rem;
  height: 0.4rem;
}
.myMsg-head-portrait>img{
  height: 100%;
}
/* myMsg-massage-specificly */
.myMsg-massage-specificly{
  display: flex;
  flex-direction: column;
  padding-left: 0.05rem;
}
.myMsg-massage-specificly p{
  text-align: left;
}
.myMsg-massage-specificly>div:first-child{
  font-size: 0.16rem;
  margin-bottom: 0.05rem;
  padding: 0.05rem 0;
}
.myMsg-massage-specificly>div:last-child{
  background-color: #ccc;
  color: #333;
  font-size: 0.16rem;
  font-family: PingFangSC,Open Sans,Helvetica Neue,Arial,Hiragino Sans GB,Microsoft YaHei,WenQuanYi Micro Hei,sans-serif;
  padding: 0.05rem;
  border-bottom-right-radius: 0.05rem;
  border-bottom-left-radius: 0.05rem;
  border-top-right-radius: 0.05rem;
}
</style>