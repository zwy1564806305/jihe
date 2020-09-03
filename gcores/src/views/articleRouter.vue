<template>
  <div class="home">
    <!-- 顶部搜索框 -->
    <v-top class="aaa" :abc="abc"></v-top>
    <!-- 左侧导航栏 -->
    <v-nav class="bbb"></v-nav>
    <v-mymsg></v-mymsg>
    <!-- 中间主题内容 -->
    <!-- <v-dhd class="ccc"></v-dhd> -->
    <!-- 文章 -->
    <v-wenzhang class="ccc"></v-wenzhang>
    <!-- 播放器 -->
    <v-global-actions></v-global-actions>
    
  </div>
</template>

<script>

// 首页
import vWenzhang from '../components/wenzhang'


export default {
  data(){
    return{
      abc:0
    }
  },
  components: {
  },
  methods:{

  },
  components:{
    vWenzhang
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


