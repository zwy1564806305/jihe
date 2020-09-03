<template>
    <div class="new">
        <div class="new_conent">
            <div class="new_conent_val">
                <div class="sec_new">
                    <ul>
                        <li class="new_firLi">
                            <div class="new_firLi_val" >
                                <a href="javascript:">
                                    <div class="firLi_div1">
                                        <div><img src="../../assets/images/newImgs/ne5.gif"></div>
                                        <div></div>
                                        <p>ISSUE 147</p>
                                        <p>g.talk</p>
                                    </div>
                                    <div class="firLi_div2">
                                        <h3>哪款游戏的音效设计让你印象深刻？</h3>
                                        <div>
                                            <button>加入讨论</button>
                                            <div>313人参与</div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li class="li_new" v-for="(li,k) of upNew2" :key="k">
                            <div class="d1_new">
                               <div class="d1_new">
                                    <div class="d1_new_div">
                                        <div>{{li.Ptitle}}</div>
                                        <div></div>
                                        <img :src="li.Pimage">
                                    </div>
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
                <div></div>
                <div></div>
            </div>
           
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{ 
            // arrDiv:[1,2],
            upNew2:[], //保存li对象
            //imgUrl:[require('../../assets/images/newImgs/ne4.jpg')],//图片路劲
            //nikeName:["知识挖掘机"],  //图片下面昵称和详情内昵称
            pNum:[1126],  //昵称内详情订阅数
            //titDescription:[" 一战中的毕苏斯基和波兰军团——正说波兰史(六十一)"],//标题详情
            titPhoto:[require("../../assets/images/newImgs/tou.png")],//评论用户的头像
            //titName:["最炫民族风"],//评论用户昵称
            //comTime:[6],//评论时间
            watching:[58],//关注该评论用户的用户数量
            newArr:["西游记","水浒传","红楼梦","三国"],//评论用户近期发表的内容
            //zan:[55], //点赞的数量
            //comment:[23]  //评论的数量
        }
         
    },
     mounted(){
         this.axios.get('/upNew2').then(res=>{
        // this.upNew=res.data.results;
        // console.log(this.upNew2.length);
        // console.log(this.upNew2);
        let data=res.data.results;
        data.forEach(li=>{
          li.Pimage=require('../../assets/images/newImgs/'+li.Pimage)
          this.upNew2.push(li)
        //   console.log(li);
        })

      })
     },
}
</script>

<style scoped>
    .new {
    width: 100%;
    /* background-color: beige; */
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
        height: auto;
        /* background-color:silver */
        margin-bottom:5% ;
    }
   
/* 第一个li样式  开始 */
.new_firLi{
    list-style: none;
    margin-right: 0.2rem;
    width:25%;
    border-radius: 0.05rem;
    font-size: 0;
    background-image:linear-gradient(to right,#4F534B,#181410);
}
.new_firLi:hover{
    opacity: 0.8;
}
.new_firLi_val>a{
    display: block;
    width: 100%;
}
.firLi_div1{
    position: relative;
}
.firLi_div1>div:first-child>img{
    width: 100%;
    border-top-left-radius:0.05rem ;
    border-top-right-radius:0.05rem ;
}
.firLi_div1>div:nth-child(2){
    position: absolute;
    top:0.1rem;
    left:0.2rem;
    width:0.04rem;
    height: 0.5rem;
    background-color: white;
    
}
.firLi_div1>p:nth-child(3){
    position: absolute;
    top:0.15rem;
    left:0.3rem;
    color:white;
    font-size: 0.13rem;
}
.firLi_div1>p:nth-child(4){
    position: absolute;
    top:0.35rem;
    left:0.3rem;
    color:white;
    font-size: 0.2rem;
    font-weight: 800;
}
.firLi_div2>div{
 display: flex;
flex-wrap: wrap;
justify-content: space-between;
/* margin-bottom: 1.5rem; */
}
.firLi_div2>h3{
    color: #fff;
    font-size: 0.15rem;
    font-weight: 600;
    margin-top:5%;
    margin-left:10%;
    margin-right: 10%;
    text-align: left;
}
.firLi_div2>div>button{
    border-radius: 0.1rem;
    background-color:rgba(255, 255, 255, .1);
    font-size: 0.14rem;
    width: 1rem;
    height: 0.35rem;
    border: 0.01rem #3D3B39 solid;
    color: #fff;
    outline: none;
    margin-top:35%;
    margin-left:0.15rem;
    cursor: pointer;
}
.firLi_div2>div>div{
    color: #fff;
    font-size: 0.14rem;
    margin-right: 0.15rem;
    margin-top:40%;
}

/* 第一个li样式  结束 */

/* li里第1个div 背景图样式  开始 */
.sec_new>ul{
    display: flex;
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
    top: 10%;
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
    z-index: 9999;
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
    left:0.6rem;
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