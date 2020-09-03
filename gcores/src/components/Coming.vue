<template>
  <div class="gtabs gtabs-compact">
    <ul v-for="(item,index) in data" :key="index">
      <li class="filter-item" @click="changeWillshow(item.ikey,item.willValues)">{{item.willList}}</li>
      <!-- <li class="filter-item" :class="{'active':activeComing[item.willValues]===item.willValues}" @click="changeWillshow(item.willValues)">
        {{item.willList}}
      </li> -->
    </ul>
  </div>
</template>

<script type="text/javascript">
export default {
  name:'coming-box',
  props: {
    data:{
      type:Array,
      default () {
        return []
      }
    }
  },
  data() {
    return {
      activeComing:{}
    }
  },
  methods:{
    changeWillshow (key,val) {
      console.log(val)
      this.$set(this.activeComing,key,val);
      this.$emit('willshow',this.activeComing);
    }
  }
}
</script>

<style scoped>
.gtabs-compact{
    font-size: .17rem;
    font-weight: 700;
}
.gtabs{
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: relative;
    color: #363940;
    margin-bottom:.1rem ;
    white-space: nowrap;
}
.gtabs-compact::before{
    height: 0.01rem;
}
.gtabs::before{
    display: block;
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    background: #ddd;
}
.gtabs>ul{
    display: flex;
    overflow-x:auto;
    margin: 0;
    padding-left: 0;
    list-style: none;
    height: .4rem;
}
.filter-item{
    cursor: pointer;
    margin-right: .5rem;
    border-bottom:.01rem solid #ddd;
}
.filter-item:hover{
    opacity: .8;
}
.active{
    border-bottom:.02rem #f44336 solid;
    color:#f44336 ;
    transition: all .3s linear;
}
</style>