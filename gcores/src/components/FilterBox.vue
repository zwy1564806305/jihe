<template>
<div class="gtabs gtabs-compact">
    <ul v-for="(item,index) in data" :key="index">
        <li class="filter-item" @click="changeFilter(item.ikey,item.queryValues)">{{item.queryName}}</li>
        <!--                                  展示的值要等于分类传入的值 -->
        <!-- <li class="filter-item" :class="{'active':activeFilter[item.key]===info.value}" v-for="(info,ii) in item.queryList" @click="changeFilter(item.key,info.value)" :key="ii">
            {{item.queryName}}
        </li> -->
    </ul>
</div>
</template>

<script type="text/javascript">


export default {
  name:'filter-box',
  components:{
  },
  props:{
      data:{
          type:Array,
          required:true
      }
  },
  //添加筛选条件
  data () {
      return {
          activeFilter:{},
        //   key:'gamesale'
      };
  },
  methods:{
      changeFilter(key,val) {
          console.log(val)
        //   var key=this.key
          this.$set(this.activeFilter,key,val);
          //将筛选的值传递出去(触发Discount.vue里面绑定的一个事件)
          this.$emit('filter',this.activeFilter);
      },
  }
};
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
ul:last-child{
    display: none;
}
</style>