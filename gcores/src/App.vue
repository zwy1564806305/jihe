<template>
  <div id="app">
    <router-link to="/"></router-link>
    <router-view/>
  </div>
</template>

<script>
// import vNav from './components/Nav'
// import vTop from './components/Top'
// import vDhd from './components/MyBody'
export default {
  data(){
    return{
      main_large:false,
      main_min:true,
      widthChange:''
    }
  },
  components:{
    // vNav,
    // vTop,
    // vDhd
  },
}
</script>

<style>
#app{
  display: flex;
}
/* .aaa{
  z-index: 999;
}
.bbb{
  z-index: 1000;
}
.ccc{
  margin-top: 0.6rem;
} */
</style>
