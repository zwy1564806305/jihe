<template>
  <div class="my-body">
    <div class="my-body-main" :class="myBodyMainMargin">
      <div class="setting">
        <v-setting></v-setting>
      </div>
      <v-footer></v-footer>
    </div>
  </div>
</template>

<script>

// 个人中心
import vSetting from './demo/setting'

export default {
  name:"v-self",
  data(){
    return{
      a:sessionStorage.getItem('root'),
      myBodyMainMargin:{
        my_body_main_max:true,
        my_body_main_min:false,
      },
    }
  },
  computed: {
    reduce: function(){
      // console.log(this.$store.state.reduce);
      return this.$store.state.reduce;
    },
  },
  watch: {
    reduce(val){
      if(this.$store.state.reduce==true) {
        // console.log(1);
        this.myBodyMainMargin.my_body_main_max=false;
        this.myBodyMainMargin.my_body_main_min=true;
      }
      else{
        // console.log(2);
        this.myBodyMainMargin.my_body_main_max=true;
        this.myBodyMainMargin.my_body_main_min=false;
      }
    },
  },
  components:{
    vSetting,
  }
}
</script>

<style>
  /* body css */
  .my-body{
    width: 100%;
    display: flex;
  }
  .my-body-main{
    flex: auto;
    transition: 0.5s linear;
  }
  .my_body_main_max{
    margin-left: 2.3rem;
    overflow: hidden;
  }
  .my_body_main_min{
    margin-left: 0.8rem;
    overflow: hidden;
  }
  .unfinsh{
    font-family: "楷书";
    margin-top: 0.4rem;
    text-align: center;
  }
</style>