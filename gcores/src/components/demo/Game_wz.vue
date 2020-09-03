<template>
  <div class="refer">
    <div>
      <!-- <div class="banner1">
        <banner></banner>
        <div class="aaa">1</div>
      </div> -->
      <div>
        <ul class="refer_ul">
          <li class="refer_li" v-for="(li,k) of refer" :key="k">
            <div class="li_fir_div">
              <img :src="li.Pimage" />
              <div>{{li.Ptitle}}</div>
              <div></div>
            </div>
            <div class="li_sec_div">
              <div>
                {{li.Ptype}}
                <p></p>
                <div>
                  <div class="sec_tou">
                    <div>
                      <img src="../../assets/images/newImgs/sec_tou.jpg" />
                    </div>
                    <span>{{li.Ptype}}</span>
                    <span>15849人订阅</span>
                    <hr />
                    <button>订阅</button>
                  </div>
                </div>
              </div>
            </div>
            <div class="li_thi_div">
              <p>{{li.Pname}}</p>
            </div>
            <div class="li_fou_div">
              <div class="four_div1">
                <div>
                  <img src="../../assets/images/newImgs/iconTou.gif" />
                </div>
                <div>
                  <h3>{{li.Pauthor}}</h3>
                  <div>{{li.Ptime}}分钟前</div>
                </div>
                <div>
                  <div class="four_div3">
                    <p></p>
                    <div>
                      <img src="../../assets/images/newImgs/iconTou.gif" />
                    </div>
                    <span>{{li.Pauthor}}</span>
                    <span>999人关注</span>
                    <hr />
                    <span>ta的最新发布</span>
                    <ul>
                      <li v-for="(newLi,n) of newArr" :key="n">{{newLi}}</li>
                    </ul>
                    <hr />
                    <div>
                      <button>关注</button>
                      <button>私信</button>
                    </div>
                  </div>
                </div>
              </div>
              <div class="four_div2">
                <div>
                  <img src="../../assets/images/newImgs/zan.png" />
                  {{li.Pup}}
                </div>
                <div>
                  <img src="../../assets/images/newImgs/msg.png" />
                  {{li.Pcomment}}
                </div>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </div>
    <div class="page">
      <ul>
        <li
          @click="prevPage"
          :disabled="isTrue1==1"
          :class="isShow1==1?'page_prev':'page_prev_hidden'"
        >
          <div>上一页</div>
        </li>
        <li
          @click="changePage(k+1)"
          :class="page==k+1?'page_center_check ':' page_center'"
          v-for="(pageItem,k) of pagecount"
          :key="k"
        >
          <div>{{pageItem}}</div>
        </li>
        <li
          @click="nextPage"
          :disabled="isTrue2==1"
          :class="isShow2==1?'page_next':'page_next_hidden'"
        >
          <div>下一页</div>
        </li>
      </ul>
    </div>
    
  </div>
</template>

<script>
// import banner from "./banner"
export default {
  data() {
    return {
      refer: [],
      isShow1: 0, //上一页  页码数<=1时 的样式，1：默认  0：灰色
      isShow2: 1, //下一页  页码数>1时 的样式， 1：默认  0：灰色
      isTrue1: 1, //上一页  页码数<=1时 按钮是否禁用  1：禁用  0：不禁用
      isTrue2: 0, //上一页  页码数>1时 按钮是否禁用   1：禁用  0：不禁用
      page: 1,
      pagecount: 1,
      newArr: ["西游记", "水浒传", "红楼梦", "三国"],
    };
  },
  methods: {
    aaa() {
      //请求当前页码的数据方法
      this.axios.get("/Game_wz", { params: { page: this.page } }).then((res) => {
        let data = res.data.results;
        this.pagecount = res.data.pagecount;
        data.forEach((li) => {
          li.Pimage = require("../../assets/images/newImgs/" + li.Pimage);
          this.refer.push(li);
        });
      });
    },
    changePage(pgk) {
      //跳转到当前页码界面
      this.page = pgk; //获取当前页码数值
      if (this.page == 1) {
        this.isShow1 = 0;
        this.isShow2 = 1;
        this.isTrue1 = 1;
        this.isTrue2 = 0;
      } else if (this.page > 1 && this.page < this.pagecount) {
        this.isShow1 = 1;
        this.isShow2 = 1;
        this.isTrue1 = 0;
        this.isTrue2 = 0;
        this.refer.length = 0;
      } else if (this.page == this.pagecount) {
        this.isShow1 = 1;
        this.isShow2 = 0;
        this.isTrue1 = 0;
        this.isTrue2 = 1;
      }
      // console.log(this.page);
      this.refer.length = 0; //将当前数组清空  this.refer=[]
      this.aaa(); //请求当前页码数据
    },
    prevPage() {
      //切换上一页
      if (this.page > 1 && this.page < this.pagecount) {
        this.isShow1 = 1;
        this.isShow2 = 1;
        this.isTrue1 = 0;
        this.isTrue2 = 0;
        this.page -= 1;
        this.refer.length = 0;
        this.aaa();
      } else if (this.page == this.pagecount) {
        this.isShow1 = 1;
        this.isShow2 = 1;
        this.isTrue1 = 0;
        this.isTrue2 = 0;
        this.page -= 1;
        this.refer.length = 0;
        this.aaa();
      }
      if (this.page == 1) {
        this.isShow1 = 0;
        this.isShow2 = 1;
        this.isTrue1 = 1;
        this.isTrue2 = 0;
      }
    },
    nextPage() {
      //切换下一页
      if (this.page == 1) {
        this.isTrue1 = 1;
        this.isShow2 = 1;
        this.isTrue1 = 0;
        this.isTrue2 = 0;
        this.page += 1;
        this.refer.length = 0;
        this.aaa();
      } else if (this.page > 1 && this.page < this.pagecount) {
        this.isShow1 = 1;
        this.isShow2 = 1;
        this.isTrue1 = 0;
        this.isTrue2 = 0;
        this.page += 1;
        this.refer.length = 0;
        this.aaa();
      }
      if (this.page == this.pagecount) {
        this.isTrue1 = 1;
        this.isShow2 = 0;
        this.isTrue1 = 0;
        this.isTrue2 = 1;
        return;
      }
      console.log(this.page);
    },
  },
  mounted() {
    this.axios.get("/Game_wz", { params: { page: this.page } }).then((res) => {
      let data = res.data.results;
      this.pagecount = res.data.pagecount;
      console.log(data);
      // console.log(this.pagecount);
      data.forEach((li) => {
        li.Pimage = require("../../assets/images/newImgs/" + li.Pimage);
        this.refer.push(li);
      });
    });
  },
  // components:{
  //   banner
  // }
};
</script>

<style scoped>
.refer {
  width: 100%;
  background-color: #f7f7f8;
  padding-bottom: 0.3rem;
}
.refer > div:first-child {
  width: 65%;
  margin: 0 auto;
  background-color: #f7f7f8;
  display: flex;
  flex-direction: column;
}
/* .banner1{
  width: 100%;
} */
/* .aaa{
  width: 34%;
  background: red;
} */
.refer > div > div:last-child {
  width: 100%;
  /* margin-bottom: 4%; */
  padding-top:4%;
}
/* ul 样式 设置浮动 */
.refer_ul {
  width: 100%;
  display: flex;
  flex-wrap: wrap;
  /* justify-content:space-between */
}
/* li 样式 */
.refer_li {
  width: 31.33%;
  margin-right: 2%;
  background-color: white;
  font-size: 0;
  margin-bottom:5%;
}
/* li下第一个div 样式，设置头像，和鼠标悬停样式 */
.li_fir_div {
  position: relative;
  width: 100%;
  cursor: pointer;
}
.li_fir_div > img {
  display: block;
  width: 100%;
  border-top-left-radius: 2.5%;
  border-top-right-radius: 2.5%;
  z-index: 99;
}
/* 悬停透明阴影 */
.li_fir_div > div:nth-child(3) {
  display: none;
  position: absolute;
  top: 0%;
  left: 0%;
  width: 100%;
  height: 100%;
  border-top-left-radius: 2.5%;
  border-top-right-radius: 2.5%;
  background-color: rgba(0, 0, 0, 0.7);
}
/* 悬停文字 */
.li_fir_div > div:nth-child(2) {
  display: none;
  position: absolute;
  padding-left: 5%;
  top: 40%;
  width: 90%;
  height: 100%;
  font-size: 0.16rem;
  color: white;
  z-index: 999;
  text-align: center;
}
.li_fir_div:hover > div:nth-child(2) {
  display: block;
}
.li_fir_div:hover > div:nth-child(3) {
  display: block;
}

/* li 下第二个div 样式  */
.li_sec_div {
  /* position: relative; */
  margin-top: 5%;
  width: 95%;
  text-align: left;
}
.li_sec_div > div {
  position: relative;
  width: 20%;
  color: red;
  font-size: 0.13rem;
  margin-left: 5%;
  cursor: pointer;
}
.li_sec_div > div > p {
  position: absolute;
  top: -110%;
  left: -25%;
  width: 200%;
  height: 0.2rem;
}
/* 鼠标悬停在 资讯 上 出现的内容 */
.li_sec_div > div > div {
  display: none;
}
.sec_tou {
  display: flex;
  flex-direction: column;
  align-items: center;
  position: absolute;
  top: -2.05rem;
  left: -1rem;
  width: 1.5rem;
  background-color: white;
  border: 0.01rem #ddd solid;
  outline: #bbb 0.05rem;
}
.sec_tou > div {
  margin-top: 10%;
}
.sec_tou > span:nth-child(2) {
  margin-top: 10%;
  color: #323232;
  font-size: 0.15rem;
}
.sec_tou > span:nth-child(3) {
  margin-top: 6%;
  color: #545454;
  font-size: 0.14rem;
}
.sec_tou > hr {
  width: 90%;
  color: #ccc;
}
.sec_tou > button {
  width: 0.8rem;
  height: 0.3rem;
  color: #545454;
  background-color: white;
  border: 0.01rem #535353 solid;
  border-radius: 0.15rem;
  margin-bottom: 10%;
  outline: 0;
  cursor: pointer;
}
/* 悬停 button 按钮 */
.sec_tou > button:hover {
  background-color: #323232;
  color: white;
}
/* 悬停在 资讯 上 */
.li_sec_div > div:hover > div {
  display: block;
}
/* li 下第三个div 样式 */
.li_thi_div {
  margin-top: 5%;
  width: 95%;
  text-align: left;
}
.li_thi_div:hover {
  opacity: 0.8;
}
.li_thi_div > p {
  color: #323232;
  font-size: 0.16rem;
  margin-left: 5%;
  cursor: pointer;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
}
/* li  下第四个div 样式 */
.li_fou_div {
  margin-top: 5%;
  width: 95%;
  display: flex;
  justify-content: space-between;
  margin-bottom: 5%;
}
.four_div1 {
  display: flex;
  margin-top: 6%;
  width: 50%;
  margin-left: 5%;
  cursor: pointer;
}
.four_div1 > div:first-child:hover,
.four_div1 > div:nth-child(2):hover {
  opacity: 0.8;
}
.four_div1 > div:first-child {
  width: 20%;
}
.four_div1 > div:first-child > img {
  display: block;
  width: 100%;
  border-radius: 50%;
}
.four_div1 > div:nth-child(2) {
  display: flex;
  flex-direction: column;
}
.four_div1 > div:nth-child(2) > h3 {
  width: 150%;
  color: #5a5a5a;
  font-size: 0.12rem;
  text-align: left;
  margin-left: 5%;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
.four_div1 > div:nth-child(2) > div {
  width: 150%;
  margin-top: 5%;
  color: #8e8e8e;
  font-size: 0.12rem;
  text-align: left;
  margin-left: 5%;
}
.four_div2 {
  display: flex;
  width: 30%;
  justify-content: space-between;
  margin-top: 8%;
}
.four_div2 > div:first-child {
  color: #8e8e8e;
  font-size: 0.12rem;
}
.four_div2 > div:last-child {
  color: #8e8e8e;
  font-size: 0.12rem;
}

/* 鼠标悬停在 头像上 出现的内容 */
.four_div1 > div:last-child {
  display: none;
  position: relative;
}
.four_div1:hover > div:last-child {
  display: block;
}
.four_div3 {
  position: absolute;
  top: 0.5rem;
  left: -1.5rem;
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 2rem;
  background-color: white;
  border: 0.01rem #ddd solid;
  outline: #bbb 0.05rem;
  z-index: 999;
}
.four_div3 > p {
  position: absolute;
  width: 1rem;
  height: 0.3rem;
  top: -0.27rem;
  left: 0.5rem;
}
.four_div3 > div:nth-child(2) {
  margin-top: 10%;
  width: 30%;
}
.four_div3 > div:nth-child(2) > img {
  display: block;
  border-radius: 50%;
  width: 100%;
}
.four_div3 > span:nth-child(3) {
  margin-top: 8%;
  color: #323232;
  font-size: 0.15rem;
}
.four_div3 > span:nth-child(4) {
  margin-top: 5%;
  color: #848484;
  font-size: 0.14rem;
}
.four_div3 > hr:nth-child(5) {
  margin-top: 10%;
  width: 80%;
  color: #ccc;
}
.four_div3 > span:nth-child(6) {
  color: #323232;
  font-size: 0.16rem;
  margin-top: 10%;
  margin-left: -0.65rem;
}
.four_div3 > ul:nth-child(7) {
  margin-top: 5%;
  display: flex;
  flex-direction: column;
}
.four_div3 > ul > li {
  padding-top: 0.05rem;
  color: #848484;
  font-size: 0.14rem;
  margin-left: -0.78rem;
}
.four_div3 > hr:nth-child(8) {
  margin-top: 8%;
  width: 80%;
  color: #ccc;
}
.four_div3 > div:last-child {
  display: flex;
  justify-content: space-between;
  width: 80%;
  margin-top: 8%;
}
.four_div3 > div:last-child > button {
  margin-top: 8%;
  width: 0.65rem;
  height: 0.3rem;
  color: #545454;
  background-color: white;
  border: 0.01rem #535353 solid;
  border-radius: 0.08rem;
  margin-bottom: 10%;
  outline: 0;
  cursor: pointer;
}
/* 悬停 button 按钮 */
.four_div3 > div:last-child > button:hover {
  background-color: #323232;
  color: white;
}

/* 尾部跳转按钮导航 */
.page {
  width: 40%;
  margin: 0 auto;
  margin-top: 2%;
  /* margin-bottom: 20%; */
  /* background-color: #fff; */
}
.page > ul {
  display: flex;
  justify-content: space-between;
  align-items: center;
  text-align: center;
}
.page > ul > li {
  color: #323232;
  font-size: 0.14rem;
}
/* 上一页，下一页可点击状态 */
.page_prev > div,
.page_next > div {
  width: 0.85rem;
  height: 0.35rem;
  border: #323232 solid 0.01rem;
  line-height: 0.35rem;
  border-radius: 0.1rem;
  cursor: pointer;
}
/* 上一页，下一页不可点击状态 */
.page_prev_hidden > div,
.page_next_hidden > div {
  width: 0.85rem;
  height: 0.35rem;
  color: #aaa;
  border: #bbb solid 0.01rem;
  line-height: 0.35rem;
  border-radius: 0.1rem;
  cursor: pointer;
}
/* 页码默认未选中样式 */
.page_center > div {
  width: 0.35rem;
  height: 0.35rem;
  line-height: 0.35rem;
  border: #ccc solid 0.01rem;
  border-radius: 50%;
  cursor: pointer;
}
/* 页码选中后样式 */
.page_center_check > div {
  width: 0.35rem;
  height: 0.35rem;
  line-height: 0.35rem;
  border: #323232 solid 0.01rem;
  background-color: #323232;
  border-radius: 50%;
  cursor: pointer;
  color: white;
}
</style>