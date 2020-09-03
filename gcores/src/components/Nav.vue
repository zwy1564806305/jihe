<template>
  <div class="nav" :class="nav_change">
    <!-- logo -->
    <div class="nav-logo">
      <router-link to="#">
        <span v-if="!reduce">GAMECORES</span>
        <img src="../assets/nav_img/google.png" alt v-else />
      </router-link>
      <a href="javascript:;" @click="navChange">
        <img src="../assets/nav_img/angle-left.png" v-if="!reduce" />
        <img src="../assets/nav_img/angle-right.png" v-else />
      </a>
    </div>
    <!-- body -->
    <div class="nav-body" @click="navBody">
      <!-- main -->
      <div class="nav-main">
        <ul>
          <li v-for="(asrc,i) of mainlist" :key="i" @click="changePage(asrc.name)">
            <!-- <a :href="asrc.href"> -->
            <router-link :to='asrc.href'>
              <div>
                <img :src="asrc.src" alt />
              </div>
              <span>{{asrc.name}}</span>
            </router-link>
            <!-- </a> -->
          </li>
        </ul>
      </div>
      <!-- shop -->
      <div class="nav-shop">
        <ul>
          <li v-for="(asrc,i) of shoplist" :key="i" @click="changePage(asrc.name),isLogin()">
            <!-- <a :href="asrc.href"> -->
            <router-link :to="asrc.href">
              <div>
                <img :src="asrc.src" alt />
              </div>
              <span>{{asrc.name}}</span>
            </router-link>
            <!-- </a> -->
          </li>
        </ul>
      </div>
      <!-- other -->
      <div class="nav-other">
        <ul v-if="!reduce">
          <li v-for="(asrc,i) of otherlist" :key="i" @click="changePage(asrc.name)">
            <!-- <a :href="asrc.href"> -->
            <router-link :to="asrc.href">
              <div>
                <img :src="asrc.src" alt />
              </div>
              <span>{{asrc.name}}</span>
            </router-link>
            <!-- </a> -->
          </li>
        </ul>
        <ul v-else>
          <li v-for="(asrc,i) of otherlist2" :key="i" @click="changePage(asrc.name)">
            <!-- <a :href="asrc.href"> -->
            <router-link :to="asrc.href">
              <div>
                <img :src="asrc.src" alt />
              </div>
              <span>{{asrc.name}}</span>
            </router-link>
            <!-- </a> -->
          </li>
        </ul>
      </div>
      <!-- onlinegame -->
      <div class="nav-onlinegame">
        <ul v-if="!reduce">
          <li v-for="(asrc,i) of onlinegamelist" :key="i" @click="changePage(asrc.name)">
            <!-- <a :href="asrc.href"> -->
            <router-link :to="asrc.href">
              <div>
                <img :src="asrc.src" alt />
              </div>
              <span>{{asrc.name}}</span>
            </router-link>
            <!-- </a> -->
          </li>
        </ul>
        <ul v-else>
          <li v-for="(asrc,i) of onlinegamelist2" :key="i" @click="changePage(asrc.name)">
            <!-- <a :href="asrc.href"> -->
            <router-link :to="asrc.href">
              <div>
                <img :src="asrc.src" alt />
              </div>
              <span>{{asrc.name}}</span>
            </router-link>
            <!-- </a> -->
          </li>
        </ul>
      </div>
      <!-- tag -->
      <div class="nav-tag" v-if="!reduce">
        <div>
          <a href="javaScript:;" @click="tagHidden">
            <span>标签</span>
            <img src="../assets/nav_img/caret-up.png" alt v-if="tag_hidden" />
            <img src="../assets/nav_img/caret-down.png" alt v-else />
          </a>
        </div>
        <ul v-show="tag_hidden">
          <li v-for="(asrc,i) of taglist" :key="i" @click="changePage(asrc.name)">
            <!-- <a :href="asrc.href"> -->
            <router-link :to="asrc.href">
              <div>
                <img :src="asrc.src" alt />
              </div>
              <span>{{asrc.name}}</span>
            </router-link>
            <!-- </a> -->
          </li>
        </ul>
      </div>
      <div class="nav-tag" v-else>
        <ul>
          <li>
            <a href="#" @click="tagHidden">
              <div>
                <img src="../assets/nav_img/tag.png" />
              </div>
              <span>标签</span>
            </a>
          </li>
        </ul>
        <ul v-show="tag_hidden">
          <li v-for="(asrc,i) of taglist" :key="i">
            <a :href="asrc.href">
              <div>
                <img :src="asrc.src" alt />
              </div>
              <span>{{asrc.name}}</span>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <!-- download -->
    <div class="nav-download">
      <ul>
        <li v-for="(asrc,i) of downloadlist" :key="i">
          <a :href="asrc.href">
            <div>
              <img :src="asrc.src" alt />
            </div>
            <span>{{asrc.name}}</span>
          </a>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  props:["abc"],
  name:'v-nav',
  data() {
    return {
      mainlist: [
        { 
          href: "/", 
          src: require("../assets/nav_img/home.png"), 
          name: "首页" ,
          hovered: false,
        },
        {
          href: "/searchRouter",
          src: require("../assets/top_img/search.png"),
          name: "搜索",
          hovered: false,
        },
        {
          href: "/newsRouter",
          src: require("../assets/nav_img/clipboard.png"),
          name: "咨讯",
          hovered: false,
        },
        {
          href: "/unfinsh",
          src: require("../assets/nav_img/podcast.png"),
          name: "电台",
          hovered: false,
        },
        { href: "/articleRouter", 
        src: require("../assets/nav_img/adn.png"), 
        name: "文章" ,
        hovered: false,
        },
        {
          href: "/unfinsh",
          src: require("../assets/nav_img/splotch.png"),
          name: "话题",
          hovered: false,
        },
        {
          href: "/broadcastRouter",
          src: require("../assets/nav_img/video.png"),
          name: "播单",
          hovered: false,
        },
        {
          href: "/specialRouter",
          src: require("../assets/nav_img/folder.png"),
          name: "专题",
          hovered: false,
        },
      ],
      shoplist: [
        {
          href: "/selfRouter",
          src: require("../assets/nav_img/store.png"),
          name: "个人中心",
          hovered: true,
        },
      ],
      otherlist: [
        {
          href: "/gameRouter",
          src: require("../assets/nav_img/percentage.png"),
          name: "游戏折扣",
          hovered: false,
        },
        {
          href: "/unfinsh",
          src: require("../assets/nav_img/robot.png"),
          name: "次时代专题",
          hovered: false,
        },
      ],
      otherlist2: [
        {
          href: "#",
          src: require("../assets/nav_img/percentage.png"),
          name: "游戏折扣",
          hovered: false,
        },
        {
          href: "#",
          src: require("../assets/nav_img/robot.png"),
          name: "次时代",
          hovered: false,
        },
      ],
      onlinegamelist: [
        {
          href: "/unfinsh",
          src: require("../assets/nav_img/gamepad.png"),
          name: "线上游戏联欢会",
          hovered: false,
        },
      ],
      onlinegamelist2: [
        {
          href: "#",
          src: require("../assets/nav_img/gamepad.png"),
          name: "G fest",
          hovered: false,
        },
      ],
      downloadlist: [
        {
          href: "#",
          src: require("../assets/nav_img/tablet-alt.png"),
          name: "下载APP",
          hovered: false,
        },
      ],
      taglist: [
        {
          href: "/gamesRouter",
          src: require("../assets/nav_img/tag.png"),
          name: "游戏",
        },
        {
          href: "/unfinsh",
          src: require("../assets/nav_img/tag.png"),
          name: "二次元",
        },
        {
          href: "/unfinsh",
          src: require("../assets/nav_img/tag.png"),
          name: "书影音",
        },
        {
          href: "/unfinsh",
          src: require("../assets/nav_img/tag.png"),
          name: "生活",
        },
        {
          href: "/unfinsh",
          src: require("../assets/nav_img/tag.png"),
          name: "科技",
        },
        {
          href: "/unfinsh",
          src: require("../assets/nav_img/tag.png"),
          name: "设计与艺术",
        },
      ],
      nav_change: {
        nav1: true,
        nav2: false,
      },
      tag_hidden: true,
    };
  },
  methods: {
    // 页面跳转
    isLogin(){
      if(sessionStorage.getItem('root')==null || sessionStorage.getItem('root')=='null'){
        this.$router.push('/login')
      }
    },
    // 点击增加高亮
    navBody(e){
      var temp = document.querySelectorAll(".nav-body a");
      temp.forEach(v=>{
        v.classList.remove('hovered');
      });
      e.stopPropagation();
      if(e.target.nodeName=='A'){
        e.target.classList.add("hovered");
      }
    },
    // 页面跳转
    changePage(name){
      this.$store.commit('change_page',name);
    },
    tagHidden() {
      if (this.tag_hidden == true) {
        this.tag_hidden = false;
      } else {
        this.tag_hidden = true;
      }
    },
    navChange() {
      if (this.reduce == false) {
        this.$store.commit('setReduce');
        this.nav_change.nav1 = false;
        this.nav_change.nav2 = true;
      } else {
        this.$store.commit('setReduce');
        this.nav_change.nav1 = true;
        this.nav_change.nav2 = false;
      }
    },
  },
  computed: {
    reduce: function(){
      return this.$store.state.reduce;
    },
  },
  mounted(){
    var temp = document.querySelector(".nav-body a");
    temp.classList.add("hovered");
  }
};
</script>

<style>
/* nav css */
.nav {
  transition: 0.5s linear;
  display: flex;
  flex-direction: column;
  position: fixed;
  height: 100%;
  top: 0;
  left: 0;
}
.nav1 {
  width: 2.3rem;
  background-color: white;
}
.nav2 {
  width: 0.8rem;
  background-color: white;
}
.nav > div:first-child {
  height: 0.61rem;
  box-sizing: border-box;
}
.nav > div:first-child {
  padding: 0.1rem 0;
}
.nav > div :nth-child(2) {
  padding: 0;
}
.nav > div:nth-child(2) > div {
  padding: 0.1rem 0;
}
/* logo css */
.nav .nav-logo {
  display: flex;
  border-bottom: 0.01rem solid #f0f0f0;
  justify-content: space-between;
}
.nav .nav-logo a {
  display: block;
  text-decoration: none;
  padding: 0 0.2rem;
  font-size: 0.25rem;
  font-weight: 700;
  color: #f44336;
  line-height: 0.4rem;
}
.nav2 .nav-logo a {
  padding: 0 0 0 0.15rem;
}
.nav .nav-logo a:last-child {
  padding: 0;
  margin-right: 0;
}
.nav .nav-logo a:first-child img {
  height: 0.4rem;
  margin: 0;
}
.nav .nav-logo a:last-child img {
  height: 0.23rem;
  margin: 0;
}

/* main css */
.nav .nav-main {
  border-bottom: 0.01rem solid #f0f0f0;
}
.nav .nav-main ul {
  list-style: none;
  padding: 0;
}
/* 整体布局1 */
.nav1 > div a {
  justify-content: left;
  display: flex;
  padding: 0.1rem 0.2rem;
  font-size: 0.12rem;
  font-weight: 600;
  color: #515151;
  text-decoration: none;
}
.nav .nav-body a:hover {
  background-color: #ededed;
}
.hovered{
  background-color: #ededed;
}
.nav2 > div a {
  justify-content: center;
  align-items: center;
  display: flex;
  flex-direction: column;
  padding: 0.1rem 0.1rem;
  font-size: 0.12rem;
  font-weight: 600;
  color: #515151;
  text-decoration: none;
}
.nav1 > div a div {
  width: 0.3rem;
  text-align: center;
}
.nav1 > div a img {
  height: 0.18rem;
  margin-right: 0.2rem;
}
.nav2 > div a img {
  height: 0.18rem;
  margin-bottom: 0.05rem;
}
.nav1 > div a span {
  line-height: 0.18rem;
}
/* shop css */

/* tag css */
.nav1 .nav-tag > div > a {
  display: flex;
  justify-content: space-between;
}
.nav1 .nav-tag > div > a > img {
  right: 0;
  margin: 0;
}
/* body css */
.nav .nav-body {
  flex: auto;
  overflow-x: hidden;
  overflow-y: visible;
}
.nav .nav-body::-webkit-scrollbar {
  width: 0.04rem;
}
.nav .nav-body > div {
  border-bottom: 0.01rem solid #f0f0f0;
}
.nav .nav-body::-webkit-scrollbar-thumb {
  -webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
  background: rgba(0, 0, 0, 0.2);
}
</style>