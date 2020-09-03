<template>
<div>
    <div class="sort-box">
        <a href="javascript:;" :class="{'active':activeSortKey === 'recommend'}" @click="setSortKey('recommend')">最新折扣</a>
        <a href="javascript:;" :class="{'active':activeSortKey === 'new'}" @click="setSortKey('new')">发布时间</a>
        <a href="javascript:;" @click="changePrice" :class="{'active':activeSortKey === 'low' || activeSortKey ==='high'}">
            价格 <i class="icon-up arrow" :class="sortArrow"></i>
        </a>
    </div>
  <div class="custom-control custom-switch" >
      <input  type="checkbox" v-model="isChinese" class="custom-control-input">
      <label class="custom-control-label">仅查看中文游戏</label>
  </div>
</div>
</template>

<script type="text/javascript">
export default {
    name:'sort-box',
  data() {
    return {
        // 设置a标签的值 
        activeSortKey:'',
        // 价格排序条件  默认为从低到高  hight则为由高到低
        activePrice:'low',
        isChinese:false
    }
  },
  computed:{
    //   计算  根据排序的属性 来改变价格后面那个箭头的样式 
      sortArrow () {
          if (this.activePrice == 'low'){
              return 'icon-down';
          }else {
              return 'icon-up'
          }
      }
  },
  watch: {
      isChinese (val) {
          this.$emit('getChinese',val)
      }
  },
  mounted (){ 
      this.setSortKey('recommend')
  },
  methods:{
      setSortKey (val) {
          this.activeSortKey = val,
          this.$emit('getKey',this.activeSortKey);
      },
      changePrice(){
          if (this.activeSortKey == this.activePrice){
              this.activePrice = this.activePrice ==='low'?'high':'low'
          }
          this.setSortKey(this.activePrice);
      },
    //   getchinese(item) {
    //       item.chinese =!item.chinese
    //       console.log(item)
    //       this.$emit('chinese',this.language)
    //   }
  }
}
</script>

<style scoped>
.custom-switch{
    padding-left:.15rem;
    height: 0;
    right: -5.5rem;
}
.custom-control{
    position: relative;
    display: block;
    min-height: .38rem;
}
.custom-control-input{
    position:absolute;
    left:-0.25rem;
    z-index: 3;
    width: .35rem;
    height: .2rem;
    opacity:0;
    cursor: pointer;
}
input{
    margin:0;
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
    
}
input[type=checkbox], input[type=radio]{
    box-sizing: border-box;
    padding: 0;
}
:focus{
    outline: none!important;
}
label{
    display: inline-block;
}
.custom-control-label{
    position: relative;
    margin-bottom: 0;
    vertical-align: top;
    font-size: .14rem;
}
.custom-switch .custom-control-label:before{
    left: -0.38rem;
    width:0.3359rem;
    pointer-events: all;
    border-radius: 0.1rem;
}
.custom-control-label:before{
    position: absolute;
    top: .02rem;
    display: block;
    height: .19rem;
    content: "";
}
.custom-control-label:before{
    background-color: #fff;
    border: 1px solid #adb5bd;
    transition: all .5s linear;
}
.custom-switch .custom-control-label::after{
    border-radius:.1rem ;
    background-color:#adb5bd ;
    top:0.04rem;
    left: -0.36rem;
    height: .17rem;
    width: .17rem;
    transition: all .3s linear;
}
.custom-control-label::after{
    position: absolute;
    display: block;
    content: "";
}
.custom-control-input:checked~.custom-control-label:before{
    color: #fff;
    border-color:#2b2d33 ;
    background-color: #2b2d33;
    transition: all .5s linear;
}
.custom-switch .custom-control-input:checked~.custom-control-label:after{
    background-color: #fff;
    transform: translateX(.14rem);
    transition: all .3s linear;
}
.sort-box{
    font-size: .15rem;
    font-weight: 600;
}
.sort-box>a{
    display: inline-block;
    margin-right: .3rem;
    margin-top:.3rem; 
}
.sort-box a:hover{
    color: #f44133;
}
.active{
    color:#f44336 ;
    transition: all .3s linear;
}

.icon-up{
    background-image: url('../assets/discount/icon-up.png') ;
    background-position: .1rem -.62rem;
    width: 0.16rem;
    height: .16rem;
}
.icon-down{
    background-image:url('../assets/discount/icon-down.png') ;
    background-position:  .1rem -.62rem;
    width: .16rem;
    height: .16rem;
}
a:hover,a.active .arrow{
    display: inline-block;
}
.arrow{
    display: none;
}
</style>