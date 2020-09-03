<template>
    <div class="new">
        <div class="new_conent">
            <!--   v-for="(div,d) of arrDiv" :key="d" -->
            <div class="new_conent_val" >
                <div class="fir_new">
                    <h2>
                        <a href="javascript:">最新<img src="../../assets/images/advisory/zixun.png">
                        </a>
                    </h2>
                </div>
                <div class="sec_new">
                    <ul>
                        <li class="li_new" v-for="(li,k) of upNew" :key="k">
                            <div class="d1_new">
                                <div class="d1_new_div">
                                    <div>{{li.Ptitle}}</div>
                                    <div></div>
                                    <img :src="li.Pimage">
                                </div>
                            </div>
                            <div class="d2_new">
                                <a href="javascript:">{{li.Ptype}}</a>
                                <div>
                                    <div class="d2_new_hover">
                                        <div><img src="../../assets/images/newImgs/hover_tou.png"></div>
                                        <a href="javascript:">{{li.Ptype}}</a>
                                        <p>{{pNum[0]}}人订阅</p>
                                        <hr>
                                        <div><button>订阅</button></div>
                                    </div>
                                </div>
                            </div>
                            <div class="d3_new">
                                <a href="javascript:">
                                    <div>
                                        <h3>
                                         {{li.Pname}}
                                        </h3>
                                    </div>
                                </a>
                            </div>
                            <div class="d4_new">
                                <a href="javascript:">
                                    <img :src="titPhoto">
                                    <h3>{{li.Pauthor}}</h3>
                                    <span>{{li.Ptime}}小时前</span>
                                    <div class="d4_new_tou">
                                        <div>
                                            <div><img :src="titPhoto"></div>
                                        </div>
                                        <a href="javascript:">{{li.Pauthor}}</a>
                                        <p>{{watching[0]}}人关注</p>
                                        <hr>
                                        <p>TA的最新发布</p>
                                        <ul class="new_tou_ul">
                                            <li v-for="(newLi,n) of newArr" :key="n">{{newLi}}</li>
                                        </ul>
                                        <hr>
                                        <div>
                                            <button>关注</button>
                                            <button>私信</button>
                                        </div>
                                    </div>
                                </a>
                                <div class="new_zan">
                                    <span><img src="../../assets/images/newImgs/zan.png">{{li.Pup}}</span>  
                                    <span><img src="../../assets/images/newImgs/msg.png">{{li.Pcomment}}</span>
                                </div>
                                
                            </div>
                        </li>
                    </ul>
                </div>  
            </div>
            
        </div>
        <new2></new2>
        <new3></new3>
    </div>
    
</template>

<script>
import new2 from "./New2"
import new3 from "./New3"
export default {
    data(){
        return{ 
            // arrDiv:[0],
            upNew:[], //保存服务器传过来的所以数据
            pNum:[1126],  //昵称内详情订阅数
            titPhoto:[require("../../assets/images/newImgs/tou.png")],//评论用户的头像
            watching:[58],//关注该评论用户的用户数量
            newArr:["西游记","水浒传","红楼梦","三国"],//评论用户近期发表的内容
        }
         
    },
     mounted(){
         this.axios.get('/upNew').then(res=>{
        // this.upNew=res.data.results;
        // console.log(this.upNew.length);
        // console.log(this.upNew);
        let data=res.data.results;
        data.forEach(li=>{
          li.Pimage=require('../../assets/images/newImgs/'+li.Pimage)
          this.upNew.push(li)
        //   console.log(li);
        })

      })
     },
    //插入子组件 new2
    components:{
        new2,
        new3
    }, 
    //插入子组件 new3

}
</script>

<style scoped>
    .new {
    width: 100%;
    background-color: #f7f7f8;
    height: auto;
        }
    .new_conent {
    margin: 0 auto;
    width: 100%;
    height: auto;
    /* background-color: seagreen; */
        }
    .new_conent_val{
        margin:0 auto;
        width:65%;
        /* height: auto; */
        /* background-color:silver */
        margin-bottom:3%;
        padding-top: 0.3rem;
    }
    /* 左上角标题样式  开始 */
    .fir_new > h2 {
   margin: 0 0;
   margin-bottom: 1%;
   width: 80%;
   /* height: 10%; */
        }
    .fir_new > h2:hover {
   opacity: 0.9;
        }
    .fir_new > h2 > a {
  display: block;
  width: 8%;
  text-align: left;
  text-decoration: none;
  color: #323232;
  font-size: 0.18rem;
  font-weight: 600;
  line-height: 0.3rem;
  position: relative;
    }
.fir_new > h2 > a > img {
  position: absolute;
  top: 0.03rem;
}
/* 左上角标题  结束 */

/* li里第1个div 背景图样式  开始 */
.sec_new>ul{
    display: flex;
    width:100%;
}
.li_new{
    list-style: none;
    margin-right: 2%;
    width:23%;
    font-size: 0;
    background-color: #fff;
}
.d1_new{
    width: 100%;
}

.d1_new_div{
    position: relative;
    width:100%;
    cursor: pointer;
}
.d1_new_div>img{
    display: block;
    width:100%;
    border-top-left-radius: 2.5%;
    border-top-right-radius: 2.5%;
}
.d1_new_div>div:nth-child(2){
    display: none;
    position: absolute;
    width:100%;
    height: 100%;
    border-top-left-radius: 2.5%;
    border-top-right-radius: 2.5%;
    background-color: rgba(0, 0, 0, .7);
}
.d1_new_div>div:nth-child(1){
    display: none;
    position: absolute;
    padding-left:5% ;
    top:35%;
    width: 90%;
    height: 100%;
    line-height: 150%;
    font-size:0.16rem;
    color: white;
    z-index: 999;
    text-align: center;
}
.d1_new_div:hover>div:nth-child(2),.d1_new_div:hover>div:nth-child(1){
    display: block;
}
/* li里第1个div 背景图样式  结束 */

/* li里第2个div a标签样式  开始 */
.d2_new{
    width:30%;
    text-align: left;
    padding-left: 8%;
    margin-bottom: 5%;
    margin-top: 0.2rem;
    position: relative;
}
.d2_new>a{
    /* width: 100%; */
    display: block;
    text-decoration: none;
    color:red;
    font-size: 0.12rem;
}
.d2_new>div{
    position: absolute;
    top:-2.5rem;
    left:-1rem;
    display: none;
    transition:0;
}
.d2_new:hover>div{
    /* transition-delay: 1.5s; */
    display:block;
}
.d2_new_hover{
    position: relative;
    background-color: #fff;
    width: 2rem;
    height: 2.4rem;
    border:0.01rem solid #ddd;
}
.d2_new_hover>div{
    margin-left: 0.6rem;
    margin-top:0.1rem;
    width:0.8rem;
    height: 0.8rem;
}
.d2_new_hover>div:first-child>img{
    width:100%;
}
.d2_new_hover>a{
    position: absolute;
    top:1.15rem;
    left:0.6rem;
    color:#323232;
    font-size: 0.16rem;
    font-weight: 600;
    text-decoration: none;
}
.d2_new_hover>p{
    color:#8e8e8e;
    font-size: 0.14rem;
    text-align: center;
    margin-top: 0.5rem;
}
.d2_new_hover>hr{
    width: 80%;
    text-align: center;
    margin: 0.3rem 0 0 0.2rem;
    
}
.d2_new_hover>div:last-child{
    margin: 0;
    text-align: center;
    width:2rem;
    margin-top:-0.15rem;
}
.d2_new_hover>div:last-child>button{
    position: absolute;
    top:2rem;
    left:0.65rem;
    width:0.7rem;
    height: 0.3rem;
    border-radius: 0.2rem;
    outline: none;
    color:#323232;
    border: 0.01rem #323232 solid;
    background-color: white;
    cursor: pointer;
}
.d2_new_hover>div:last-child>button:hover{
    background-color: #323232;
    color:white;
}
/* li里第2个div a标签样式  结束 */

/* li里第3个div h2标签样式  开始 */
.d3_new>a{
    display: block;
    text-decoration: none;
}
.d3_new>a>div{
    width:95%;
}
.d3_new>a>div>h3{
    /* display: block; */
    margin-left: 8%;
    text-align: left;
    color:#323232;
    width: 100%;
    height: 0.3rem;
    line-height: 0.25rem;
    font-size: 0.16rem;
    font-weight: 600;

}
/* li里第3个div h2标签样式  结束 */

/* li里第4个div a标签样式  开始 */
.d3_new:hover{
    opacity: 0.8;
}
.d4_new{
    margin-top:-0.18rem;
    position: relative;
    height: 0.5rem;
}
.d4_new>a{
    text-decoration: none;
    display: block;
    margin-top: 25%;
    text-align: left;
    padding-left: 8%;
    width:1rem;
    /* overflow: hidden; */
    position: relative;
        
}
.d4_new>a>img{
    display: block;
}
.d4_new>a>h3{
    position: absolute;
    color:#5a5a5a;
    font-size: 0.12rem;
    width:85%;
    font-weight: 600;
    top: 2%;
    left:0.65rem;


}
.d4_new>a>span{
    position: absolute;
    top: 60%;
    left:0.65rem;
    display: block;
    color:#8e8e8e;
    font-size: 0.12rem;
}
.new_zan{
    width: 0.8rem;
    position: absolute;
    top:30% ;
    left:60%;
    display: flex;
}
.new_zan>span{
    display: block;
    color:#8e8e8e;
    width:100%;
    font-size: 0.13rem;
    margin-right: 0.1rem;
}
/* li里第4个div a标签样式  结束 */

/* li里第4个div 头像点开样式  开始 */
.d4_new>a:hover>div{
    display: block;
    
}
/* 调头像位置  开始 */
.d4_new>a>div{
    position: absolute;
    display: none;
    top:0.3rem;
    left:0rem;
    width:2rem;
    border:0.01rem solid #ddd;
    background-color: white;
    z-index: 99;
}
.d4_new_tou>div:first-child{
    width:2rem;
    margin-top:-0.1rem ;
}
.d4_new_tou>div:first-child>div{
    margin-left: 0.6rem;
    margin-top:0.1rem;
    width:0.8rem;
    height: 0.8rem;
}
.d4_new_tou>div:first-child>div>img{
    margin-top: 0.2rem;
    width:100%;
}
/* 调头像位置  结束 */
.d4_new_tou>a{
    position: absolute;
    top:1.15rem;
    left:35%;
    /* right:40%; */
    /* margin:0 auto; */
    /* text-align: center; */
    display: block;
    color:#323232;
    font-size: 0.16rem;
    font-weight: 600;
    text-decoration: none;
}
.d4_new_tou>p:nth-child(3){
    color:#323232;
    font-size: 0.14rem;
    text-align: center;
    margin-top: 0.65rem;
}
.d4_new_tou>hr:nth-child(4){
    width: 80%;
    text-align: center;
    margin: 0.2rem 0 0 0.2rem;
    
}
.d4_new_tou>p:nth-child(5){
    color:#323232;
    font-size: 0.14rem;
    margin-top: 0.2rem;
    margin-left: 0.18rem;
}
.new_tou_ul{
    display: flex;
    flex-flow: column;
}
.new_tou_ul>li{
    list-style: none;
    color:#8e8e8e;
    font-size: 0.14rem;
    margin-top: 0.05rem;
    margin-left: 0.18rem;

}
.d4_new_tou>hr:nth-child(7){
    width: 80%;
    text-align: center;
    margin: 0.2rem 0 0 0.2rem; 
}
.d4_new_tou>div:last-child{
    display: flex;
    justify-content: space-between;
    margin-top: 0.15rem;
    margin-left: 0.18rem;
    margin-right: 0.18rem;
    margin: 0.15rem 0.18rem 0.15rem 0.18rem;
}
.d4_new_tou>div:last-child>button{
    width:0.7rem;
    height: 0.3rem;
    border-radius: 0.2rem;
    color:#323232;
    background-color: white;
    border: #323232 solid 0.01rem;
    cursor: pointer;
}
.d4_new_tou>div:last-child>button:hover{
    background-color: #323232;
    border: #323232 solid 0.01rem;
    color:white;
}
/* li里第4个div 头像点开样式  结束 */

</style>