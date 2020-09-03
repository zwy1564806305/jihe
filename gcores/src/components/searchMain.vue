<template>
  <div class="my-body">
    <div class="my-body-main" :class="myBodyMainMargin">
      <div class="discount">
        <v-search></v-search>
      </div>
      <!-- <v-footer></v-footer> -->
    </div>
  </div>
</template>

<script>

// 游戏折扣
import vSearch from './Search'

export default {
  name:"v-games",
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
    vSearch,
  }
}
</script>

<style>