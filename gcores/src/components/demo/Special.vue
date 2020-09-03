<template>
  <div class="special">
    <div>
      <h2>专题</h2>
      <div>
        <ul class="special_ul">
          <li class="special_li" v-for="(item,k) of special" :key="k">
           <div><img :src="item.Pimage"></div>
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
          :class="isShow2==1?'page_next':'page_next_hidden'">
          <div>下一页</div>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  name:"v-special",
  data() {
    return {
      special: [],
      isShow1: 0, //上一页  页码数<=1时 的样式，1：默认  0：灰色
      isShow2: 1, //下一页  页码数>1时 的样式， 1：默认  0：灰色
      isTrue1: 1, //上一页  页码数<=1时 按钮是否禁用  1：禁用  0：不禁用
      isTrue2: 0, //上一页  页码数>1时 按钮是否禁用   1：禁用  0：不禁用
      page: 1,
      pagecount: 1,
    };
  },
  methods: {
    aaa() {
      //请求当前页码的数据方法
      this.axios.get("/special", { params: { page: this.page } }).then((res) => {
        let data = res.data.results;
        this.pagecount = res.data.pagecount;
        data.forEach((item) => {
          item.Pimage = require("../../assets/images/special/" + item.Pimage);
          this.special.push(item);
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
        this.special.length = 0;
      } else if (this.page == this.pagecount) {
        this.isShow1 = 1;
        this.isShow2 = 0;
        this.isTrue1 = 0;
        this.isTrue2 = 1;
      }
      // console.log(this.page);
      this.special.length = 0; //将当前数组清空  this.special=[]
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
        this.special.length = 0;
        this.aaa();
      } else if (this.page == this.pagecount) {
        this.isShow1 = 1;
        this.isShow2 = 1;
        this.isTrue1 = 0;
        this.isTrue2 = 0;
        this.page -= 1;
        this.special.length = 0;
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
        this.special.length = 0;
        this.aaa();
      } else if (this.page > 1 && this.page < this.pagecount) {
        this.isShow1 = 1;
        this.isShow2 = 1;
        this.isTrue1 = 0;
        this.isTrue2 = 0;
        this.page += 1;
        this.special.length = 0;
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
    this.axios.get("/special", { params: { page: this.page } }).then((res) => {
      // console.log(1111);
      let data = res.data.results;
      this.pagecount = res.data.pagecount;
      // console.log(data);
      // console.log(this.pagecount);
      data.forEach((item) => {
        item.Pimage = require("../../assets/images/special/" + item.Pimage);
        this.special.push(item);
      });
    });
  },
};
</script>

<style scoped>
.special {
  width: 100%;
  background-color: #f7f7f8;
  padding-bottom: 0.3rem;
}
.special > div:first-child {
  width: 65%;
  margin: 0 auto;
  background-color: #f7f7f8;
}
.special > div > div {
  width: 100%;
  /* margin-top: 5%; */
}
.special>div>h2{
    width: 100%;
    margin: 0;
    padding-top:0.3rem;
    text-align: left;
    color:#323232;
    font-size:0.18rem;
    font-weight: 600;
}
/* ul 样式 设置浮动 */
.special_ul {
  width: 100%;
  display: flex;
  flex-wrap: wrap;
  /* justify-content:space-between */
}
/* li 样式 */
.special_li {
  width: 23%;
  margin-right: 2%;
  background-color: white;
  font-size: 0;
  margin-top: 3%;
}
.special_li>div{
  width: 100%;
  border-radius: 0.05rem;
  cursor: pointer;
}
.special_li>div:hover{
    opacity: 0.8;
}
.special_li>div>img{
  width:100%;
  display: block;
  border-radius: 0.05rem;
}
/* 尾部跳转按钮导航 */
.page {
  width: 40%;
  margin: 0 auto;
  margin-top: 2%;
  margin-bottom: 0.3rem;
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