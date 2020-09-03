<template>
  <div class="home">
    <!-- 顶部搜索框 -->
    <v-top class="aaa"></v-top>
    <!-- 左侧导航栏 -->
    <v-nav class="bbb"></v-nav>
    <v-mymsg></v-mymsg>
    <!-- 中间主题内容 -->
    <v-search class="ccc"></v-search>
    <!-- 播放器 -->
    <v-global-actions></v-global-actions>
    
  </div>
</template>

<script>

import vSearch from '../components/Search'

export default {
  components: {
  },
  methods:{
    
  },
  components:{
    vSearch
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


