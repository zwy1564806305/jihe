<template>
  <div class="search">
    <div class="search-top">
      <div>
        <input
          type="text"
          placeholder="搜索内容"
          @focus="searchTextFocus"
          @blur="searchTextBlur"
          v-model="searchWhat"
          @keydown="keyEnter"
          class="search-top-input"
        />
        <button @click="searchOfInfo" class="search-top-button">搜索</button>
      </div>
      <div class="search-top-tail" v-show="tail_show">
        <!-- <div class="search-top-tail" > -->
      <div>
        <div v-show="(history.length>0)">
          <p>搜索历史</p>
          <div>
            <div class="search_tag" v-for="(temp,i) of history" :key="i" @click="tagSearch(temp)">
              <p>{{temp}}</p>
            </div>
            <div class="search_tag_clear" @click="clearHistory">
              <p>清除历史</p>
            </div>
          </div>
        </div>
        <div>
          <p>热门搜索</p>
          <div>
            <div
              class="search_tag"
              v-for="(temp,i) of hot_search"
              :key="i"
              @click="tagSearch(temp)"
            >
              <p>{{temp}}</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
    
    <div class="search-body">
      <!-- body 导航栏 -->
      <div class="search-body-nav">
        <ul>
          <li>
            <a href="#" @click="whichOneClass(0)" :class="{line_bottom:five_class==0}">综合</a>
          </li>
          <li>
            <a href="#" @click="whichOneClass(1)" :class="{line_bottom:five_class==1}">游戏</a>
          </li>
          <li>
            <a href="#" @click="whichOneClass(2)" :class="{line_bottom:five_class==2}">文章</a>
          </li>
          <li>
            <a href="#" @click="whichOneClass(3)" :class="{line_bottom:five_class==3}">电台</a>
          </li>
          <li>
            <a href="#" @click="whichOneClass(4)" :class="{line_bottom:five_class==4}">视频</a>
          </li>
          <li>
            <a href="#" @click="whichOneClass(5)" :class="{line_bottom:five_class==5}">用户</a>
          </li>
        </ul>
      </div>
      <!-- body 游戏栏 -->
      <div class="search-games" v-show="(search_game.length>0)">
        <div>
          <p>游戏</p>
          <img src="../assets/broadcast_img/angle-right.png" alt />
        </div>
        <div class="search-games-list">
          <div class="search-games-list-li" v-for="(temp,i) of search_game" :key="i">
            <div>
              <img :src="require('../assets/search_img/'+temp.gimg)" alt />
            </div>
            <div>
              <div>
                <p>{{temp.gname}}</p>
              </div>
              <div v-show="temp.gtag!=''">
                <div class="search-games-tag">
                  <span>{{temp.gtag}}</span>
                </div>
              </div>
              <div>
                <span v-if="temp.gprice!=''" class="search-games-price">￥{{temp.gprice.toFixed(2)}}</span>
                <span v-else class="search-games-price">暂无价格</span>
                <span>{{temp.gplace}}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- body 文章 -->
      <!-- body 电台 -->
      <!-- body 视频 -->
      <!-- body 用户栏 -->
      <div class="search-users" v-show="(search_user.length>0)">
        <div>
          <p>用户</p>
          <img src="../assets/broadcast_img/angle-right.png" alt />
        </div>
        <div class="search-users-list">
          <div class="search-users-list-li" v-for="(temp,i) of search_user" :key="i">
            <div>
              <img src="../assets/search_img/person1.png" alt />
            </div>
            <div>
              <div>
                <p>{{temp.username}}</p>
              </div>
              <div>
                <p>地方</p>
              </div>
            </div>
            <div>
              <button>关注</button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="search-fail">

    </div>
  </div>
</template>

<script>
export default {
  name:"v-search",
  data() {
    return {
      five_class: 0,
      tail_show: false,
      history: ["张", "最", "暗黑"],
      hot_search: ["战锤", "暗黑", "魔兽"],
      search_game: [],
      search_user: [],
      searchWhat: "",
    };
  },
  methods: {
    searchTextFocus() {
      this.tail_show = true;
    },
    searchTextBlur() {
      setTimeout(() => {
        this.tail_show = false;
      }, 300);
    },
    searchOfInfo() {
      // 判断是否加入history
      var islike = 0;
      for (var i = 0; i < this.history.length; i++) {
        if (this.searchWhat == this.history[i]) {
          islike = 1;
          break;
        }
      }
      if (islike == 0) {
        this.history.push(this.searchWhat);
      }
      // 清除数据
      this.search_game = [];
      this.search_user = [];
      // 查找用户
      if (this.searchWhat != "") {
        if (this.five_class == 0) {
          this.axios
            .get(`/bro/getUser?searchWhat=${this.searchWhat}`)
            .then((res) => {
              if(res.data.length>6){
                for(var i = 0;i<6;i++){
                  this.search_user.push(res.data[i]);
                }
              }else{
                this.search_user = res.data;
              }
            });
          this.axios
            .get(`/bro/getGames?searchWhat=${this.searchWhat}`)
            .then((res) => {
              if(res.data.length>3){
                for(var i = 0;i<3;i++){
                  this.search_game.push(res.data[i]);
                }
              }else{
                this.search_game = res.data;
              }
            });
        }
        else if(this.five_class == 1){
          this.axios
            .get(`/bro/getGames?searchWhat=${this.searchWhat}`)
            .then((res) => {
                this.search_game = res.data;
            });
        }else if(this.five_class == 5){
          this.axios
            .get(`/bro/getUser?searchWhat=${this.searchWhat}`)
            .then((res) => {
                this.search_user = res.data;
            });
        }
      }
    },
    keyEnter(e) {
      if (e.keyCode == "13") {
        this.searchOfInfo();
      }
    },
    clearHistory() {
      this.history = [];
    },
    tagSearch(temp) {
      this.searchWhat = temp;
      this.searchOfInfo();
    },
    whichOneClass(temp) {
      this.five_class = temp;
      this.searchOfInfo();
    },
  },
};
</script>

<style>
/* search */
.search {
  font-size: 0.18rem;
  width: 100%;
}
/* search-top 搜索页面头部分 */
.search-top {
  position: relative;
  width: 100%;
  height: 1rem;
  background-color: white;
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 500;
}
.search-top > div {
  display: flex;
  align-items: center;
  justify-content: center;
}
.search-top > div > input {
  width: 5rem;
  height: 0.4rem;
  box-sizing: border-box;
  padding: 0 0.1rem;
  outline: none;
}
.search-top-input{
  font-size: 0.2rem;
  height: 0.4rem;
  background-color: #ededed;
  border: none;
  outline: none;
  border-top-left-radius: 0.05rem;
  border-bottom-left-radius: 0.05rem;
}
.search-top-button {
  font-size: 0.20rem;
  width: 0.8rem;
  height: 0.4rem;
  color: #fff;
  background-color: #aaa;
  border: none;
  outline: none;
  border-top-right-radius: 0.05rem;
  border-bottom-right-radius: 0.05rem;
}
/* search-top-tail */

.search-top-tail {
  display: flex;
  position: absolute;
  width: 100%;
  background-color: white;
  top: 1rem;
  justify-content: center;
  transition: 0.5s linear;
  transition-duration: top;
  z-index: 499;
  border-bottom: 0.01rem solid gainsboro;
}
/* search-top-tail */
.search-top-tail > div {
  width: 11.4rem;
  box-sizing: border-box;
  padding: 0 0.5rem;
  display: flex;
  flex-direction: column;
  text-align: left;
}
.search-top-tail > div > div {
  width: 100%;
  height: 1rem;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
}
.search-top-tail > div > div > p {
  font-size: 0.12rem;
}
.search-top-tail > div > div > div {
  display: flex;
}
/* search_tag */
.search_tag {
  display: block;
  padding: 0.1rem;
  background-color: #f6f6f6;
  border-radius: 0.05rem;
  margin-right: 0.1rem;
  cursor: pointer;
  font-size: 0.14rem;
}
/* search_tag_clear */
.search_tag_clear {
  align-items: center;
  padding: 0.1rem;
  font-size: 0.12rem;
  display: flex;
  cursor: pointer;
}
/* search-body */
.search-body {
  width: 100%;
  display: flex;
  flex-direction: column;
  position: relative;
  align-items: center;
}
/* search-body-nav */
.search-body-nav {
  width: 11.4rem;
  height: 1rem;
  background: transparent;
  display: flex;
  box-sizing: border-box;
  padding-top: 0.2rem;
  border-bottom: 0.02rem solid grey;
  margin-bottom: 0.5rem;
}
.search-body-nav > ul {
  display: flex;
}
.search-body-nav > ul > li > a {
  position: relative;
  bottom: -0.02rem;
  height: 100%;
  box-sizing: border-box;
  text-decoration: none;
  color: black;
  padding: 0.2rem;
  display: flex;
  align-items: center;
  font-size: 0.16rem;
}

/* search-users -------------------------------------------------------------------------------- */
.search-users {
  display: flex;
  flex-direction: column;
  width: 11.4rem;
}
.search-users > div:first-child {
  text-align: left;
  width: 100%;
  margin-bottom: 0.2rem;
  display: flex;
  align-items: center;
}
.search-users > div:first-child > img {
  width: 0.2rem;
  height: 0.2rem;
}
/* search-users-list */
.search-users-list {
  display: flex;
  width: 100%;
  flex-wrap: wrap;
}
/* search-users-list-li */
.search-users-list-li {
  display: flex;
  width: 33.33%;
  height: 0.72rem;
  margin-bottom: 0.2rem;
}
.search-users-list-li > div:first-child > img {
  width: 0.72rem;
  height: 0.72rem;
  border-radius: 0.36rem;
  margin-right: 0.1rem;
}
.search-users-list-li > div:nth-child(2) {
  flex: auto;
  display: flex;
  flex-direction: column;
  text-align: left;
  justify-content: space-around;
  font-size: 0.14rem;
}
.search-users-list-li > div:last-child {
  display: flex;
  align-items: center;
  padding: 0 0.1rem;
}
.search-users-list-li > div:last-child > button {
  padding: 0.06rem 0.18rem;
  font-size: 0.14rem;
  border-radius: 0.17rem;
  border: 0.01rem solid #464646;
  background-color: white;
}
.search-users-list-li > div:last-child > button:hover {
  background-color: #464646;
  color: white;
}

/* search-games----------------------------------------------------------------------------- */
.search-games {
  display: flex;
  flex-direction: column;
  width: 11.4rem;
  margin-bottom: 0.3rem;
}
.search-games > div:first-child {
  text-align: left;
  width: 100%;
  margin-bottom: 0.2rem;
  display: flex;
  align-items: center;
}
.search-games > div:first-child > img {
  width: 0.2rem;
  height: 0.2rem;
}
/* search-games-list */
.search-games-list {
  display: flex;
  width: 100%;
  flex-wrap: wrap;
}
/* search-games-list-li */
.search-games-list-li {
  display: flex;
  width: 32.456%;
  height: 1.1rem;
  margin-bottom: 0.2rem;
  background-color: white;
  box-sizing: border-box;
  padding: 0.06rem 0.1rem;
  margin: 0 0.05rem 0.2rem;
}
.search-games-list-li > div:first-child {
  display: flex;
  align-items: center;
  padding-right: 0.2rem;
}
.search-games-list-li > div:last-child {
  display: flex;
  flex-direction: column;
  flex: auto;
  justify-content: space-around;
  text-align: left;
}
/* search-games-tag */
.search-games-tag {
  background-color: #719dea;
  display: inline-block;
  padding: 0.05rem;
  font-size: 0.12rem;
  color: white;
  border-radius: 0.03rem;
  box-sizing: border-box;
}
/* search-games-price */
.search-games-price {
  color: #ff4f19;
  margin-right: 0.1rem;
}
/* line-bottom */
.line_bottom{
  border-bottom: 0.02rem solid black;
}
/* search-fail */
.search-fail{
  height: 1rem;
}
</style>