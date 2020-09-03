<template>
    <div class="banner">
        <div @mouseleave='startTimer()' @mouseenter='closeTimer()' >
            <div v-for="(img,index) of images" :key="index" >
                <a href="javascript:;">
                    <img :src="img.Bimage" :class="{img:index==currentIndex,img2:index!==currentIndex}">
                </a>
            </div>
            <ul id="list">
                <li v-for="(item,index) of images" :key="index" @click="gotoPage(index)" :class="{'active':index==currentIndex}">
                    <ul>
                        <li></li>
                    </ul>
                </li>
            </ul>
            <ul>
                <li id="left" class="bt" @click="prevIndex()" v-show="isShow"> &lt;</li>
                <li id="right" class="bt" @click="nextIndex()" v-show="isShow">&gt;</li>
            </ul>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return {
            images:[],//轮播图图片路径
            currentIndex:0,  //默认显示图片
            timer:null,  //轮播图定时器
            isShow:true  //左右指示器显示
        }
    },
    methods:{
        // 自动轮播函数
        startLoop(){
            this.currentIndex++;
            this.changePage();
        },
        // 换页函数
        changePage(){
            // 判断currentIndex是否等于图片的长度 如果是那就返回到第一张
            // if(this.currentIndex==this.images.length){
                // this.currentIndex=0;
                // 三目
            this.currentIndex==this.images.length?this.currentIndex=0:this.currentIndex == -1?this.currentIndex=this.images.length-1:""
            // 判断currentIndex是否为-1 如果是那就返回到图片的长度-1
            // }else if(this.currentIndex == -1){
                // this.currentIndex=this.images.length-1;
            // }
        },
        // 下一页函数
        nextIndex(){
            this.currentIndex++;
            this.changePage();
            // console.log("下一页");
        },
        // 上一页函数
        prevIndex(){
            this.currentIndex--;
            this.changePage();
            // console.log("上一页");
        },
        gotoPage(index){
            this.currentIndex=index;
            // console.log(this.currentIndex)
            this.changePage();
        },
        // 清除定时器
        closeTimer(){
            clearInterval(this.timer);
            // 显示左右侧指示器
            this.isShow=true;
            // console.log("清除定时器")
        },
        // 重新设置定时器
        startTimer(){
            this.timer=setInterval(this.startLoop,3000)
            // 隐藏左右指示器
            this.isShow=false;
            // console.log("重新开始定时器");
        }
    },
    created(){
        this.timer=setInterval(this.startLoop,3000)
    },
    mounted(){
        this.axios.get('/banner').then(res=>{
            this.images = res.data.result;
            // console.log(this.images);
            for(let i=0;i<this.images.length;i++){
                this.images[i].Bimage=require('../../assets/banner/'+this.images[i].Bimage);
            }
            // console.log(this.images);
        })
    }
}
</script>
<style scoped>
    .banner{
        width: 64%;
        margin: 0 2% 0 0;
    }
    /* 轮播图盒子样式 */
    .banner>div{
        width: 100%;
        height: 100%;
        position: relative;
    }
    .banner>div>div{
        width: 100%;
        position: absolute;
    }
    .banner>div>div>.img{
        width: 100%;
    }
    /* 设置轮播动画效果 */
    .img2{
        opacity: 0;
        transition: opacity .5s ease;
    }
    .img{
        opacity: 1;
        transition: opacity .5s ease;
    }
    /* 设置圆点样式 */
    #list{
        position: absolute;
        bottom: 10%;
        display: flex;
        right: 38%;
        /* margin: 0 auto; */
    }
    #list>li{
        /* font-size: 0.15rem; */
        width: 0.15rem;
        height: 0.15rem;
        box-sizing: border-box;
        border-radius: 50%;
        color: transparent;
        background-color: white;
        text-align: center;
        margin: 0 0.2rem 0 0.2rem;
        cursor: pointer;
    }
    #list>.active{
        background-color: lightblue;
        /* border: 0.01rem solid black ; */
        transition: .5s ease;
    }
    #list>li:hover{
        border: 0.01rem solid black;
        transition: .7s ease;
    }
    /*设置箭头样式 */
    .bt{
        width: 0.3rem;
        font-size: 0.5rem;
        height: 1.5rem;
        line-height: 1.5rem;
        position: absolute;
        top: 31%;
        background: transparent;
        color: white ;
        cursor: pointer;
        
    }
    .bt:hover{
        background-color: rgba(0,0,0,0.5);
    }
    /* 设置箭头样式 */
    #left{
        left: 0;
    }
    #right{
        right: 0;
    }
    .banner>div>div>a{
        width: 100%;
    }
    .banner>div>div>a>img{
        width: 100%;
        border-radius: 0.04rem;
        position: absolute;
        top: 0;
    }
</style>