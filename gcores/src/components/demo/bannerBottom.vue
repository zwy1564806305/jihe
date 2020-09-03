<template>
  <div class="bannerBottom">
    <div v-for="(v,i) of bottom" :key="i">
      <div>
        <a href="javascript:;">
          <img :src="v.Pimage" alt />
        </a>
      </div>
      <div>
        <div class="zs">
          <a href="javascript:;">知识挖掘机</a>
          <div>
            <div>
              <a href="javascript:;">
                <img src="../../assets/MainBanner/icon/tx.png" alt />
              </a>
            </div>
            <a href="javascript:;">
              <h6>知识挖掘机</h6>
            </a>
            <div>33133人订阅</div>
            <hr />
            <button>订阅</button>
          </div>
        </div>
        <a href="javascript:;" :title="v.Pname">
          <h3>{{v.Pname}}</h3>
        </a>
        <div>
          <div class="yh">
            <a href="javascript:;">
              <img src="../../assets/MainBanner/icon/tx.png" alt />
              <div>
                <h3>{{v.Pauthor}}</h3>
                <div>{{v.Ptime}}</div>
              </div>
            </a>
            <div class="stage">
              <div>
                <div>
                  <a href="javascript:;">
                    <img src="../../assets/MainBanner/icon/tx.png" alt />
                  </a>
                </div>
                <div class="yhmc">
                  <a href="javascript:;">{{v.Pauthor}}</a>
                </div>
                <div class="gzyh">
                  <a href="javascript:;">1088人关注</a>
                </div>
              </div>
              <hr />
              <div id="dt">
                <div>他的最新动态</div>
                <div>
                  <div>通过游戏与友情，我想把这些艺术家介绍给你（上）</div>
                  <div>吉考斯工业将在明晚 Gfest 上发布一系列重磅企划，各位敬请期待！</div>
                  <div>十周年经典回归！5 款票选人气 T 恤抢先上架机核铺</div>
                </div>
              </div>
              <hr />
              <div class="button">
                <button>关注</button>
                <button>私信</button>
              </div>
            </div>
          </div>
          <div id="dz">
            <span>
              <img src="../../assets/MainBanner/icon/good.svg" alt />
              {{v.Pup}}
            </span>
            <span>
              <img src="../../assets/MainBanner/icon/pl.svg" alt />
              {{v.Pcomment}}
            </span>
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
      bannerBottom: [], //全部数据
      bottom: [], //使用数据
    };
  },
  mounted() {
    // this.axios.get('/bannerBottom').then(res=>{
    // let repeat = false;//判断是否重新获取数据
    // for(let n=0;n<res.data.result.length;n++){
    // repeat = false;//每次循环重置为false
    // this.bannerBottom=res.data.result;// 将获取到的数据保存到bannerBottom
    // let random = Math.floor(Math.random()*6);//随机获取数字 像下取整
    // console.log(random);
    // for(let i=0;i<3;i++){
    // // if(this.bannerBottom[random]==this.bottom[i]){//判断随机下标的bannerBottom是否和bottom里的相同如果相同改变重置为true
    // repeat=true;
    // }
    // };
    // console.log(this.bannerBottom);
    // if(repeat==true){//如果repeat
    // continue;
    // }
    // repeat==false?this.bottom[n]=this.bannerBottom[random]:'1';
    // console.log(this.bottom[n].Pimage);
    // this.bottom[n].Pimage=require(`../../assets/MainBanner/x/${this.bottom[n].Pimage}`)
    // if(this.bottom.length==3){
    // break;
    // }
    // }
    // })
    this.axios.get("/bannerBottom").then((res) => {
      this.bannerBottom = res.data.result;
      var arr = [];
      arr[0] = Math.floor(Math.random() * this.bannerBottom.length);
      arr[1] = Math.floor(Math.random() * this.bannerBottom.length);
      while (arr[1] == arr[0]) {
        arr[1] = Math.floor(Math.random() * this.bannerBottom.length);
      }
      arr[2] = Math.floor(Math.random() * this.bannerBottom.length);
      while (arr[2] == arr[0] || arr[2] == arr[1]) {
        arr[2] = Math.floor(Math.random() * this.bannerBottom.length);
      }
      // console.log(arr);
      for (var key in arr) {
        this.bottom.push(this.bannerBottom[arr[key]]);
        this.bottom[key].Pimage=require(`../../assets/MainBanner/x/${this.bottom[key].Pimage}`)
      }
      // console.log(this.bottom);
    });
  },
  // updated(){
  // console.log(this.bottom)
  // }
};
</script>

<style scoped>
/* 轮播图版块下盒子样式 */
.bannerBottom {
  width: 100%;
  height: 46%;
  display: flex;
  text-align: justify;
}
.bannerBottom > div {
  width: 31%;
  height: 100%;
  background: white;
}
/* 给遍历出来的第一个和第二个设置外边距 */
.bannerBottom > div:nth-child(1) {
  margin: 0 2% 0 0;
}
.bannerBottom > div:nth-child(2) {
  margin: 0 2% 0 0;
}
/* 轮播图版块下图片区域样式 */
.bannerBottom > div > div:nth-child(1) {
  width: 100%;
  height: 41.5%;
}
.bannerBottom > div > div:nth-child(1) > a {
  width: 100%;
  display: block;
  font-size: 0;
}
.bannerBottom > div > div > a > img {
  width: 100%;
  border-radius: 0.04rem;
}
#dz {
  width: 1rem;
  display: flex;
  flex-flow: row nowrap;
  margin: auto 0;
}
/* 轮播图版块下文字区域样式 */
.bannerBottom > div > div:nth-child(2) {
  width: 100%;
  height: 57.5%;
  padding: 2%;
}
/* 知识挖掘机 */
.bannerBottom > div > div:nth-child(2) > div > a {
  display: block;
  color: red;
  font-size: 0.12rem;
}
.bannerBottom > div > div:nth-child(2) > a h3{
  max-width: 90%; /*不允许出现半汉字截断*/
  display: block;
  margin: 5% 0 0 0;
  font-size: 0.16rem;
  font-weight: bold;
  color: black;
  overflow: hidden; /*自动隐藏文字*/
  text-overflow: ellipsis; /*文字隐藏后添加省略号*/
  white-space: nowrap; /*强制不换行*/

}
.bannerBottom > div > div:nth-child(2) > div:nth-child(3) {
  margin: 5% 0 0 0;
  display: flex;
  justify-content: space-between;
}
.bannerBottom > div > div:nth-child(2) > div > div > a > img {
  border-radius: 50%;
  display: block;
  width: 35%;
}
.bannerBottom > div > div:nth-child(2) > div > div > a > div {
  /* height: 50%; */
  width: 100%;
  font-size: 0.12rem;
  margin: auto 0;
}
.bannerBottom > div > div > div > div > a > div > div {
  margin: 15% 0 0 0;
}
.bannerBottom > div > div:nth-child(2) > div > div:nth-child(1) > a {
  display: flex;
  /* width: 20%; */
}
.bannerBottom > div > div:nth-child(2) > div > div > span {
  display: block;
  font-size: 0.12rem;
  margin: 0 0 0 15%;
}
/* 知识挖掘机 */
.zs {
  position: relative;
}
.zs:hover > div {
  display: block;
}
.zs > div {
  position: absolute;
  top: -2.1rem;
  left: -0.6rem;
  width: 70%;
  border: 1px solid #ccc;
  display: none;
  text-align: center;
  padding: 5%;
  background: white;
  font-size: 0;
}
.zs > div > a {
  font-size: 0.2rem;
  font-weight: 800;
}
.zs > div > div:nth-child(3) {
  font-size: 0.14rem;
  margin: 0.1rem 0 0 0;
}
.zs hr {
  margin: 0.2rem 0 0 0;
}
.zs button {
  width: 1.2rem;
  height: 0.4rem;
  border: 1px solid black;
  border-radius: 0.3rem;
  margin: 0.2rem 0 0 0;
  cursor: pointer;
}
.zs button:hover {
  color: white;
  background: black;
  border-radius: 0.3rem;
  border: 1px solid black;
}
/* 用户详情 */
.yh {
  position: relative;
  width: 40%;
  padding: 2%;
}
.yh > div:nth-child(2) {
  position: absolute;
  top: -3.7rem;
  left: -0.7rem;
  padding: 5%;
  background: white;
  text-align: center;
  display: none;
  width: 200%;
  box-sizing: border-box;
}
.yh:hover > div:nth-child(2) {
  display: block;
}
.yhmc {
  font-size: 0.14rem;
  font-weight: 600;
  margin: 0.1rem 0 0 0;
}
.gzyh {
  font-size: 0.12rem;
  margin: 0.1rem 0 0 0;
}
.yh hr {
  margin: 0.2rem 0 0 0;
}
/* 点赞评论样式 */
#dz > span {
  position: relative;
  margin: auto 0.2rem;
}
#dz > span > img {
  position: absolute;
  /* top: -0.03rem; */
  left: -0.2rem;
}
#dt {
  text-align: left;
  margin: 0.15rem 0 0 0;
}
#dt > div:nth-child(1) {
  font-size: 0.16rem;
}
#dt > div:nth-child(2) {
  padding: 5%;
  font-size: 0.14rem;
}
#dt > div:nth-child(2) > div {
  margin: 0.05rem 0 0 0;
}
#dt > div:nth-child(2) > div:hover {
  text-decoration: underline;
}
.button {
  margin-top: 10%;
  font-size: 0;
}
.button > button {
  width: 40%;
  padding: 10px;
  border: 1px solid black;
  border-radius: 0.1rem;
  margin: 0 3%;
  cursor: pointer;
}
.button > button:hover {
  color: white;
  background: rgba(0, 0, 0, 1);
}
.stage {
  font-size: 0;
}
</style>