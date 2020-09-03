<template>
  <div class="a">
    <div class="am_card">
      <div class="h2">
            <h2 >本周最热</h2>
      </div>
      <div class="origin">
        <ul>
          <li>
            <a href="javascript:;">
              <div v-for="(item,index) in Title" :key="index">
                <h3>{{item.title}}</h3>
                <p>
                  <span>
                    {{item.xh}}
                    喜欢
                  </span>
                  •
                  <span>
                    {{item.pl}}
                    评论
                  </span>
                </p>
              </div>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
<style scoped>
.a{
  width: 31%;
}
.am_card{
margin: 0;
display: flex;
flex-direction: column;
width:100%;
height: 3.9rem;
overflow: hidden;
background: #fff;
border-radius: 0.04rem;
box-sizing: border-box;
/* border:1px solid #000; */
}
.h2{
  padding: 0 0.1rem;
  border-bottom:0.01rem solid #e6e6e6;
  line-height: 0.4rem;
  font-size: 0.18rem;
  font-weight: 700;
  color: #323232;
  text-align: left;
  box-sizing: border-box;
  margin-left:0.15rem ;
  padding:0.2rem 0 0.2rem 0.1rem  ;
}
.origin{
  height: 100%;
  /* height: 2.4rem; */
  flex: 1 1 auto;
  overflow-y: auto;
  padding-right:0.2rem;
  padding: 0.14rem;
  font-size: 0.14rem;
  font-weight: 400;
  /* line-height: 1.5; */
  text-align: left;
}
.origin li{
  margin-left:0.1rem ;
}
.origin a{
    color: #323232;
    display: block;
    overflow: hidden;
     font-weight: 600;
}
.origin p{
  color: #8e8e93;
  font-size: 0.12rem;
  font-weight: 400;
}
.origin h3{
  /* height: 0.46rem; */
  width: 3.03rem;
  margin-bottom: 0.03rem;
}
.origin div{
  padding:0 0 0.16rem;
  margin:0 0 0.16rem;
  border-bottom:0.01rem  solid  #e6e6e6;
}
.origin div:hover{
  opacity: 0.8;
}
.origin div:last-child{
  border-bottom:0;
}
</style>
<script>
export default {
  data(){
    return{
      Title:[
        {
          title:'今晚八点，在「Gfest 线上游戏联欢会」来和我们一同聚会！',
          xh:'88',
          pl:'69'
        },
        {
          title:'Project xCloud将于9月15日正式发布，首批登陆22个国家地区市场',
          xh:'14',
          pl:'22'
        },
        {
           title:'《花木兰》放弃登陆北美院线，将于9月4日上线Disney+',
          xh:'18',
          pl:'51'
        },
        {
          title:'整体风格依旧，《黑袍纠察队 第二季》正式预告片公布',
          xh:'19',
          pl:'21'
        },
        {
           title:'万代推出DX系列玩具《鬼灭之刃》日轮刀，已在日亚开启预约',
          xh:'8',
          pl:'18'
        }
      ]
    }
  }
}
</script>

