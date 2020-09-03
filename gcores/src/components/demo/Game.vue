<template>
    <div class="game">
        <div>
            <div class="game_div">
                <ul>
                    <li v-for="(item,k) of titles" :key="k" class="game_li">
                        <a href="javascript:">
                            <span :class="isActive==k?'active2':'active1'" @click="changes(item,k)">{{item}}</span>
                        </a>
                    </li>
                </ul>
            </div>
            
        </div>
        <Gameqb v-if="isShow==1"></Gameqb>
        <Gamewz v-else-if="isShow==2"></Gamewz>
        <Gamezx v-else-if="isShow==3"></Gamezx>
        <Gamedt v-else></Gamedt>
    </div>
</template>

<script>
import Gameqb from "./Game_qb"
import Gamewz from "./Game_wz"
import Gamedt from "./Game_dt"
import Gamezx from "./Game_zx"
export default {
    name:"v-gameser",
    data(){
        return{
            titles:["全部","文章","资讯","电台"],
            isActive:0,
            isShow:1
        }
    },
    methods:{
        changes(item,k){
            this.item=item;
            this.isActive=k;
            this.isShow=k+1;
           
        }
    },
    components:{
      Gameqb,
      Gamewz,
      Gamedt,
      Gamezx
    }
}
</script>

<style>
.game{
    width: 100%;
    background-color: #f7f7f8; 
    padding-top: 0.3rem;
}
.game>div{
    /* padding-top:0.5rem; */
    width:65%;
    margin:0 auto;
    background-color: #f7f7f8;  
}
.game_div{
    width:100%;   
    padding-bottom:0.18rem; 
    border-bottom: solid #ccc 0.01rem;
}
/* 标题样式 */
.game_div>ul{
    width:40%;
    text-align: left;
    display:flex;
}
.game_li{
    width:23%;
    margin-right: 2%;
    font-size: 0;
}
.game_li>a:hover{
    opacity: 0.8;
}
/* 默认状态样式 */
.active1{
    color:#323232;
    font-size: 0.16rem;
    border-bottom:0.05rem transparent solid;
    padding-bottom: 0.15rem;
}
/* .active{
    border-bottom:0.05rem #363636 solid !important;
} */
/* 选中状态样式 */
.active2{
    color:#323232;
    font-size: 0.16rem;
    border-bottom:0.05rem #363636 solid;
    padding-bottom: 0.15rem;
}
</style>