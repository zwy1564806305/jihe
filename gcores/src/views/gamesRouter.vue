<template>
  <div class="home">
    <!-- 顶部搜索框 -->
    <v-top class="aaa"></v-top>
    <!-- 左侧导航栏 -->
    <v-nav class="bbb"></v-nav>   
    <!-- 点击消息弹出 -->
    <v-mymsg></v-mymsg>
    <!-- 中间主题内容 -->
    <!-- <v-dhd class="ccc"></v-dhd> -->
    <!-- 首页 -->
    <v-games class="ccc"></v-games>
    <!-- 播放器 -->
    <v-global-actions></v-global-actions>
    
  </div>
</template>

<script>

// 首页
import vGames from '../components/games'


export default {
  components: {
  },
  methods:{

  },
  components:{
    vGames,
  }
}
</script>

<style scoped>
.home{
  width: 100%;
}
.aaa{
  z-index: 999;
}
.bbb{
  z-index: 1000;
}
.ccc{
  margin-top: 0.6rem;
}
</style>


