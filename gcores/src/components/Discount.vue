<template>
  <div id="Discount">
    <div class="pageContainer">
      <div class="story_container">
        <div class="gamesPage_tabs">
          <a class="title" :class="{'active':show}" @click="notshow()">游戏折扣</a>
          <a class="title" :class="{'active':noshow}" @click="toshow()">即将发售</a>
        </div>
        <!-- 筛选条件       引入的数据         配置筛选事件(与$emit()呼应) -->
        <filter-box v-show="show" :data="gamesList" @filter="getQuery"></filter-box>
        <!-- 即将发售的筛选条件 -->
        <coming-box v-show="noshow" :data="willshow" @willshow="getwillQuery"></coming-box>
        <!-- 排序条件 -->
        <div v-show="show" class="gamesPage_filters">
          <sort-box @getKey="getSortKey" @getChinese="getChineseGames"></sort-box>
        </div>
        <!-- 打折游戏列表 -->
        <discount-list v-show="show" :data="games"></discount-list>
        <!-- 即将出售游戏列表 -->
        <coming-games v-show="noshow" :data="willgames"></coming-games>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import Axios from "axios";
import Vue from "vue";
import Vuex from "vuex";
import discountList from "../components/DiscountList";
import filterBox from "../components/FilterBox";
import sortBox from "../components/sortBox";
import ComingBox from "../components/Coming";
import ComingGames from "../components/ComingGames";

export default {
  name: "v-discount",
  components: {
    discountList,
    filterBox,
    sortBox,
    ComingBox,
    ComingGames,
  },
  data() {
    return {
      gamesList: [],
      games: [],
      gamesCopy: [],
      willshow: [],
      willgames: [],
      willgamesCopy: [],
      currentQuery: null,
      currentStock: null,
      currentKey: null,
      currentWillQuery: null,
      show: true,
      noshow: false,
    };
  },
  created() {
    this.getgamesListData();
    this.getgames();
    this.getwillshow();
    this.getwillgames()
  },
  methods: {
    toshow: function () {
      this.show = false;
      this.noshow = true;
    },
    notshow: function () {
      this.show = true;
      this.noshow = false;
    },
    getgamesListData() {
      this.axios.get("/getGameList").then((res) => {
        console.log(res.data);
        this.gamesList = res.data.result;
      });
    },
    getgames(){
      this.axios.get("/getGames").then((res) => {
        this.games = res.data.result;
        this.gamesCopy=res.data.result;
        console.log(this.games)
      })
    },
    getwillshow(){
      this.axios.get("/getWillShow").then((res) => {
        console.log(res.data);
        this.willshow = res.data.result;
      })
    },
    getwillgames() {
       this.axios.get('/getWillGames').then((res) => {
         console.log(res.data);
          this.willgames = res.data.result;
          this.willgamesCopy = res.data.result;
          console.log(this.willgames)
      })
    },
    getQuery(val) {
      this.currentQuery = val;
      this.sortgames();
      console.log(this.currentQuery)
    },
    getSortKey(key) {
      this.currentKey = key;
      this.sortgames();
      console.log(this.currentQuery)
    },
    getChineseGames(val) {
      this.currentStock = val;
      this.sortgames();
      console.log(this.currentQuery)
    },
    getwillQuery(val) {
      this.currentWillQuery = val;
      this.towillgames();
    console.log(this.currentQuery)
    },
    sortgames() {
      // 将对象里的值(筛选条件里的值:详见数据库里一起绑定的值)遍历出来 通过数据库里的值去过滤 如果数据包含条件的值则呈现出来
      this.games = [].concat(this.gamesCopy);
      console.log(this.games);
      if (this.currentQuery) {
        Object.keys(this.currentQuery).forEach((key) => {
          if (this.currentQuery[key]) {
        //     //失去这行代码 '全部'功能就无法实现
        //     // console.log(val,key)
        //     this.games = this.games.filter((item) => {
        //       return item.features.indexOf(this.currentQuery[key]) >= 0;
        //     });
        //   }
        // });
        var arr=[]
        for(var i in this.games){
          if(this.currentQuery.gamelist==this.games[i].gamePf){
            arr.push(this.games[i])
          }
        }
        this.games=arr
      }
        });
      }
      //仅查看英文
      if (this.currentStock) {
        this.games = this.games.filter((item) => {
          return item.gameCf=="8";
        });
      }
      if (this.currentKey) {
        // 根据最近折扣排序
        if (this.currentKey == "recommend") {
          this.games.sort((a, b) => {
            return b.gamePublicTime - a.gamePublicTime;
          });
        } else if (this.currentKey == "new") {
          // 根据发布时间排序
          this.games.sort((a, b) => {
            return b.gameIntime - a.gameIntime;
          });
        } else if (this.currentKey == "low") {
          this.games.sort((a, b) => {
            return (
              b.gamePrice * b.gameDintensity - a.gamePrice * a.gameDintensity
            );
          });
        } else if (this.currentKey == "high") {
          this.games.sort((a, b) => {
            return (
              a.gamePrice * a.gameDintensity - b.gamePrice * b.gameDintensity
            );
          });
        }
      }
    },
    towillgames() {
      this.willgames = [].concat(this.willgamesCopy);
      console.log(this.willgames)
      if (this.currentWillQuery) {
        Object.keys(this.currentWillQuery).forEach((key) => {
          // if(this.currentWillQuery[key]){} //因为即将出售没有'全部'功能 所以不需要这行代码
          
          // this.willgames = this.willgames.filter((item) => {
          //   return item.features.indexOf(this.currentWillQuery[key]) >= 0;
          // });
          var arr=[];
          for(var j in this.willgames){
            if(this.currentWillQuery.willshow==this.willgames[j].wgamefeatures){
              arr.push(this.willgames[j])
            }
          }
          this.willgames=arr
        });
      }
    },
  },
};
</script>

<style>
.pageContainer {
  padding-bottom: 0.9rem;
  padding-top: 0.45rem;
  background: #f7f7f8;
}
.story_container {
  width: 6.9rem;
  padding-left: 0.15rem;
  padding-right: 0.15rem;
  max-width: 100%;
  margin: 0 auto;
}
.gamesPage_tabs {
  margin-bottom: 0.03rem;
}
.gamesPage_tabs > a {
  display: inline-block;
  font-size: 0.18rem;
  margin-right: 0.4rem;
  color: #c7c7cc;
  font-weight: 600;
}
.gamesPage_tabs > a:hover {
  opacity: 0.85;
}
a.is_active {
  color: #323232;
}
/* 筛选框 */
.gamesPage_filters {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 0.15rem;
  margin-top: -0.1rem;
  height: 0.33rem;
}
.title {
  cursor: pointer;
}
a.active {
  color: #323232;
}
</style>