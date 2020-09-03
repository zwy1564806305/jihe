<template>
  <div class="top" :class="{outBody:out_body,inBody:in_body}">
    <!-- 占位div -->
    <div class="top-hold" :class="topHoldChange">
    </div>
    <!-- 主体div -->
    <div class="top-main">
      <!-- 搜索框 -->
      <!-- <div class="top-search">
        <div>
          <img src="../assets/top_img/search.png" alt="">
        </div>
        <input type="text" name="" id="" class="top-search-text" placeholder="搜索">
      </div> -->
      <!-- Top信息部分 -->
      <div class="top-info">
        <!-- 登录 -->
        <div class="top-login" v-if="isLogin">
          <router-link to="/login">
            <button>登录</button>
          </router-link>
        </div>
        <!-- 登录后信息 -->
        <div class="top-islogin" v-else>
          <div @mouseenter="topPutShow" @mouseleave="topPutNone">
            <a href="#">
              <button>投稿</button>
            </a>
            <div class="top-put" v-show="top_put">
              <a href="#"><img src="../assets/top_img/cog.png" alt=""><div>管理</div></a>
              <a href="#"><img src="../assets/top_img/list-alt.png" alt=""><span>咨讯</span></a>
              <a href="#"><img src="../assets/top_img/file-alt.png" alt=""><span>文章</span></a>
              <a href="#"><img src="../assets/top_img/youtube.png" alt=""><span>视频</span></a>
            </div>
          </div>
          <div  @mouseenter="topSetShow" @mouseleave="topSetNone">
            <a href="#">
              <img :src="this.$store.state.avatar" alt="">
            </a>
            <div class="top-set" v-show="top_set_show">
              <div v-for="(temp,i) of top_set" :key="i">
                <a :href="temp.href" @click="outTo(i)">{{temp.name}}</a>
              </div>
            </div>
          </div>
          <div>
            <a href="#" @click="msgShow()">
              <span>消息</span>
            </a>
          </div>
          <div>
            <a href="#" @click="msgShow()">
              <span>动态</span>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name:'v-top',
  data() {
    return {
      topHoldChange:{
        top_hold_max:true,
        top_hold_min:false,
      },
      isLogin:'',
      top_put:false,
      top_set_show:false,
      out_body:false,
      in_body:true,
      nowTop:0,
      top_set:{
        // Info:{href:"#",name:"个人主页"},
        Book:{href:"#",name:"我的书架"},
        Order:{href:"#",name:"我的订单"},
        Set:{href:"#",name:"设置"},
        Out:{href:"#",name:"退出"}
      },
      uid:sessionStorage.getItem('root'),
      uAvatar:''
    }
  },
  methods: {
    topPutShow(){
      this.top_put = true;
    },
    topPutNone(){
      this.top_put = false;
    },
    topSetShow(){
      this.top_set_show = true;
    },
    topSetNone(){
      this.top_set_show = false;
    },
    hasScroll(){
      var scrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop;
      var scroll = scrollTop - this.nowTop;
      this.nowTop = scrollTop;
      if(scrollTop<=60){
        this.out_body = false;
        this.in_body = true;
      }
      else if(scrollTop>60&&scroll<0){
        this.out_body = false;
        this.in_body = true;
      }
      else{
        this.out_body = true;
        this.in_body = false;
      }
    },
    changeIsLogin(){
      if(sessionStorage.getItem('root')==null || sessionStorage.getItem('root')=='null'){
        this.isLogin = true
      }else{
        this.isLogin = false
      }
      console.log('session为：'+sessionStorage.getItem('root'))
    },
    outTo(i){
      if(i=='Out'){
        this.isLogin = true;
        sessionStorage.setItem('root',null);
      }else if(i=='Info'){
        this.$router.push('/setting')
      }
    },
    msgShow(){
      this.$store.commit('setMsg_show');
      console.log(this.$store.state.msg_show);
    },
    // changeAvatar(){
    //   this.axios.get('/setting',{params:{uid:this.uid}})
    //   .then((res)=>{
    //     // console.log(this.uid)
    //     // console.log(res.data.result)
    //     this.uAvatar=res.data.result[0].avatar
    //   })
    // }
  },
  computed: {
    reduce: function(){
      return this.$store.state.reduce;
    },
  },
  watch: {
    reduce(val){
      if(this.$store.state.reduce==true) {
        this.topHoldChange.top_hold_max=false;
        this.topHoldChange.top_hold_min=true;
      }
      else{
        this.topHoldChange.top_hold_max=true;
        this.topHoldChange.top_hold_min=false;
      }
    },
  },
  created(){
    this.axios.get('/setting',{params:{uid:this.uid}})
      .then((res)=>{
        if(res.data!="查询失败"){
          this.$store.state.avatar=res.data.result[0].avatar
        }
      })
  },
  mounted(){
    window.addEventListener('scroll',this.hasScroll,true);
    var scrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop;
    this.nowTop = scrollTop;
    this.changeIsLogin();
    
  }
}
</script>

<style scoped>
  .outBody{
    top: -60px;
  }
  .inBody{
    top: 0;
  }
  /* top */
  .top{
    font-size: 0.12rem;
    transition: 0.5s linear;
    width: 100%;
    height: 0.6rem;
    position: fixed;
    display: flex;
    background-color: white;
  }
  /* top hold */
  .top-hold{
    transition: 0.5s linear;
  }
  .top_hold_max{
    width: 2.3rem;
  }
  .top_hold_min{
    width: 0.8rem;
  }
  /* top main */
  .top-main{
    width: auto;
    flex: auto;
    display: flex;
    position: relative;
    justify-content: center;
    align-items: center;
    box-shadow: 0 0 6px rgba(0,0,0,.1)
  }
  /* search css */
  .top-main .top-search{
    display: flex;
    align-items: center;
  }
  .top-main .top-search div{
    background-color: #ededed;
    height: 0.35rem;
    width: 0.35rem;
    justify-content: center;
    display: flex;
    align-items: center;
    border-top-left-radius: 0.05rem;
    border-bottom-left-radius: 0.05rem;
  }
  .top-main .top-search img{
    width: 70%;
    height: 70%;
  }
  .top-main .top-search .top-search-text{
    background-color: #ededed;
    border: 0;
    font-size: 0.18rem;
    width: 4.7rem;
    height: 0.35rem;
    border-top-right-radius: 0.05rem;
    border-bottom-right-radius: 0.05rem;
    padding: 0 0.1rem;
    outline: none;
  }
  /* top-info css */
  .top-info{
    position: absolute;
    right: 0;
    display: flex;
    align-items: center;
  }
  /* before login */
  .top-info .top-login{
    padding: 0 0.20rem;
  }
  .top-info .top-login button{
    height: 0.24rem;
    background-color: #363940;
    border: 0;
    padding: 0 0.10rem;
    color: white;
    border-radius: 0.12rem;
    cursor: pointer;
  } 
  /* isLogin */
  .top-info .top-islogin{
    padding: 0 0.20rem;
    display: flex;
    font-size: 0.14rem;
    font-weight: 600;
  }
  .top-info .top-islogin button{
    height: 0.24rem;
    background-color: #363940;
    border: 0;
    padding: 0 0.10rem;
    color: white;
    border-radius: 0.12rem;
    cursor: pointer;
  }
  .top-info .top-islogin > div > a{
    display: inline-block;
    padding: 0 0.15rem;
    height: 0.6rem;
    display: flex;
    align-items: center;
    justify-content: center;
    text-decoration: none;
    color: #363940;
    position: relative;
  }
  .top-info .top-islogin > div  img{
    width: 0.36rem;
    height: 0.36rem;
  }
  .top-info .top-islogin .top-put{
    position: absolute;
    display: flex;
    align-items: center;
    justify-content: space-around;
    width: 3rem;
    height: 0.8rem;
    top: 0.6rem;
    left: -0.95rem;
    background-color: white;
    border-radius: 0.05rem;
    box-shadow: 0 0 0.05rem 0.01rem lightgray;
    padding: 0.1rem 0;
    box-sizing: border-box;
    text-align: center;
  }
  .top-info .top-islogin .top-put > a{
    display: flex;
    flex-direction: column;
    justify-content: center;
    height: 100%;
    text-decoration: none;
    color: #363940;
  }
  .top-info .top-islogin .top-set{
    position: absolute;
    top: 0.6rem;
    left: 0.8rem;
    display: flex;
    flex-direction: column;
    border-radius: 0.05rem;
    box-shadow: 0 0 0.05rem 0.01rem lightgray;
    padding: 0.05rem;
    width: 1rem;
    background-color: white;
  }
  .top-info .top-islogin .top-set > div >a{
    display: block;
    padding: 0.15rem 0.2rem;
    text-decoration: none;
    color: #363940;
  }
</style>
