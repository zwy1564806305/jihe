<template>
  <div class="advisory">
    <div class="advisory_tit">
      <h2>
        <!-- <a href="javascript:" @click="abc"> -->
        <router-link to="/newsRouter" @click="abc">
          咨讯
          <img src="../../assets/images/advisory/zixun.png">
        </router-link>
        <!-- </a> -->
      </h2>
      <div>
        <div class="div_carousel">
            <!-- 轮播图开始 -->
          <ul class="ul_carousel" :style="change" > 
            <li class="li_carousel" v-for="(li,k) of carousel" :key="k">
              <a href="javascript:">
                <div class="li_carousel_d1">
                  <img :src="li.Pimage">
                </div>
                <div class="li_carousel_d2">
                  <span>{{li.Pname}}</span>
                </div>
                <div class="li_carousel_d3">
                  <span>{{li.Ptime}}分钟前 {{li.Pup}}喜欢 ·{{li.Pcomment}}评论</span>
                </div>
              </a>
            </li>
          </ul>
            <!-- 轮播图结束 -->
        </div>
        <div class="carousel_left" @click="moveLeft" v-show="ccc==1">
          <img src="../../assets/images/advisory/left.png" >
        </div>
        <div class="carousel_right" @click="moveRight" v-show="index==1">
          <img src="../../assets/images/advisory/right.png">
        </div>
      </div>
    </div>
    <New></New>
  </div>
</template>
<script>
import New from "./New"
export default {
    data(){
        return{
            carousel:[],  //保存轮播图模块所有信息的数组
            // arr:[1,2,3,4, 5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],
            // imgUrl:require('../../assets/images/advisory/ad1.jpg'),
            // spanDes:'【更新】官方正式确认《光环：无限》多人对战模式可免费游玩',
            // spanTime:'3',
            // spanLike:'18',
            // spanComments:'43',
            index:1,  //判断右边按钮状态 为1显示，为0不显示
            ccc:0,    //判断左边按钮状态 为1显示，为0不显示
            change:{
              marginLeft:"0%",   //左外边距默认值
            },
        }
    },
    methods: {
        abc(){
          this.$store.state.type='咨讯'
        },
        moveRight(){     //右按钮点击事件
          let arr=this.change.marginLeft.split("%")    //定义数组保存切割marginLeft后的值
          this.change.marginLeft=(parseInt(arr[0])-100)+"%"    // 每点击一次将当前外边距值加100%
          // console.log(this.change.marginLeft);
          if(this.change.marginLeft=="0%"){    //外边距值为0%时  ，左按钮隐藏，右按钮显示
            this.index=1;
            this.ccc=0;
          }else if(this.change.marginLeft=="-200%" || this.change.marginLeft=="-100%"){
            this.index=1;                      //外边距值为-200% 或-100%时，左右按钮都显示
            this.ccc=1;
          }else if(this.change.marginLeft=="-300%"){      //外边距值为-300%时，左按钮显示，右按钮隐藏     
            this.index=0;
            this.ccc=1;
          }
          // console.log(this.ccc);
        },
        moveLeft(){    //左按钮点击事件
          let arr=this.change.marginLeft.split("%")             //同上
          this.change.marginLeft=(parseInt(arr[0])+100)+"%"     //同上
          if(this.change.marginLeft=="0%"){                     //同上
            this.index=1;  
            this.ccc=0;
          }else if(this.change.marginLeft=="-200%" || this.change.marginLeft=="-100%"){
            this.index=1;                                        //同上
            this.ccc=1;
          }else if(this.change.marginLeft=="-300%"){              //同上
            this.index=0;
            this.ccc=1;
          }
        }
    },
     mounted(){
      this.axios.get('/carousel').then(res=>{
        // this.carousel=res.data.results;
        // console.log(this.carousel);
        let data=res.data.results;
        data.forEach(li=>{
          li.Pimage=require('../../assets/images/advisory/'+li.Pimage)
          this.carousel.push(li)
          // console.log(li);
        })

      })
    },  
    // watch:{
    //   marginLeft(){
    //     if(this.change.marginLeft=="-200%" || this.change.marginLeft=="-100%"){
    //       this.ccc=1;
    //       this.index=1;
    //     }
    //   }
    // },
   components:{
        New
    },
};
</script>
<style scoped>
.advisory {
  width: 100%;
  background-color: #fcfcfc;
  /* height: 100%; */
}
.advisory_tit {
  margin: 0 auto;
  width: 65%;
  /* height: 100%; */
  background-color: #fff;
}
.advisory_tit > div {
  margin: 0 auto;
  width: 100%;
  /* height: 100%; */
  /* color:royalblue; */
  position: relative;
}
.carousel_left {
  position: absolute;
  top: 0.1rem;
  left: -0.5rem;
  height: 2rem;
  width: 0.3rem;
  /* background-color:#fff; */
  cursor: pointer;
  border-radius: 0.02rem;
}
.carousel_left > img,
.carousel_right > img {
  display: block;
  margin-top: 0.85rem;
}
.carousel_left:hover,
.carousel_right:hover {
  background-color: #c7c7cc;
  opacity: 0.5;
}
.carousel_right {
  position: absolute;
  top: 0.1rem;
  right: -0.3rem;
  height: 2rem;
  width: 0.3rem;
  border-radius: 0.02rem;
  cursor: pointer;
}
.advisory_tit > h2 {
  margin: 0 auto;
  padding-top: 0.1rem;
  width: 100%;
  /* height: 10%; */
  /* padding-bottom: 2%; */
}
.advisory_tit > h2:hover {
  opacity: 0.9;
}
.advisory_tit > h2 > a {
  display: block;
  width: 8%;
  height: 0.3rem;
  text-align: left;
  text-align: top;
  text-decoration: none;
  color: #323232;
  font-size: 0.18rem;
  font-weight: 600;
  line-height: 0.3rem;
  position: relative;
}
.advisory_tit > h2 > a > img {
  position: absolute;
  top: 0.02rem;
}
.div_carousel {
  margin: 0 auto;
  width: 100%;
    background-color: #fff;
  /* height: 100%; */
  /* background-color: red; */
  overflow: hidden;
  /* background-color: salmon; */
  position: relative;
}
.ul_carousel {
  width:400%;
   /* -webkit-line-clamp: 5; */
  background-color: #fff;
  /* height: 100%; */
  display: flex;
  /* background-color:limegreen; */
  transition: all 0.8s linear;
}
.ul_carousel > li {
  margin-top: -0.1rem;
  margin-right: 0.2rem;
  font-size: 0;
  width:100%;
  list-style: none;
  /* z-index: 999999; */
}
.ul_carousel > li > a:hover {
  opacity: 0.9;
}
.ul_carousel > li > a {
  display: block;
  width: 100%;
  /* height: 100%; */
  text-decoration: none;
}
.li_carousel_d1 {
  margin-top: 0.15rem;
  width:100%
  /* height: 1.1rem; */
}
.li_carousel_d2 {
  margin-top: 0.3rem;
  margin-left: 0.15rem;
}
.li_carousel_d3 {
  margin-top: 0.15rem;
  margin-left: 0.15rem;
}
.li_carousel_d1 > img {
  width:100%;
  border-radius: 0.08rem;
  /* height: 100%; */
}
.li_carousel_d2 > span {
  display: block;
  line-height: 0.2rem;
  text-align: left;
  height: 0.5rem;
  color: #323232;
  font-size: 0.13rem;
  font-weight: 600;
  z-index: 10;
}
.li_carousel_d3 > span {
  display: block;
  height: 0.4rem;
  color: #8e8e93;
  font-size: 0.12rem;
  font-weight: 600;
  text-align: left;
  z-index: 10;
}
</style>
