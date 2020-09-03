<template>
    <div class="globalActions">
        <!-- 回到顶部/建议反馈 -->
        <div class="elevator">
            <a href="javascript:;" v-for="(v,k) of elevator" :key="k" @mouseover="moveOver($event)" @mouseleave="moveLeave($event)" @click="ele(v.fun)">
                <div>
                    <img :src="v.src" alt="">
                </div>
                <p>{{v.p}}</p>
            </a>
        </div>
        <!-- 播放器 -->
        <!-- <audio preload controls ref="audio" :src="singSong[a]"></audio> -->
        <audio preload ref="audio" :src="require('../../assets/music/'+this.$store.state.nowPlay[0].singSrc)"></audio>
        <div class="play" ref="closePlay">
            <a href="javascript:;" v-for="(v,k) of this.$store.state.nowPlay" :key="k" @click="player(v.fun,$event)">
                <img :src="v.imgSrc">
            </a>
        </div>
        <!-- 反馈 -->
        <div class="suggest" v-show="sugShow">
            <div class="wrap" @click="closeSug">
                <button @click="closeSug">x</button>
                <div class="main">
                    <div class="title">
                        <h1>反馈</h1>
                        <h2>填写反馈内容</h2>
                    </div>
                    <div class="content">
                        <div class="content-group">
                            <a class="active">BUG</a>
                            <a>建议</a>
                        </div>
                        <div class="content-group">
                            <input type="text" placeholder="邮箱（可选）">
                        </div>
                        <div class="content-group">
                            <textarea placeholder="内容" name="content" cols="30" rows="10"></textarea>
                            <p>内容不能为空</p>
                        </div>
                        <div class="content-group">
                            <input type="file">
                        </div>
                    </div>
                    <button>确认</button>
                </div>
            </div>
        </div>
        <!-- 播放列表 -->
        <v-global-actions-tab v-show="globalActionsListShow"></v-global-actions-tab>
    </div>
</template>

<script>
export default {
    name:"v-global-actions",
    data(){
        return{
            elevator:[
                {src:require('../../assets/globalActions/up.png'),p:'回到顶部',fun:'goTop'},
                {src:require('../../assets/globalActions/proposal.png'),p:'建议反馈',fun:'suggestion'}
            ],
            play:[
                {src:require('../../assets/broadcast_img/bro3.jpg'),fun:'up'},
                {src:require('../../assets/globalActions/play.png'),fun:'playTo'},
                {src:require('../../assets/globalActions/close.png'),fun:'close'}
            ],
            // 音乐
            singSong:[require("../../assets/music/天外来物.mp3"),require("../../assets/music/dxh.mp3")],
            // 反馈打开与关闭
            sugShow:false,
            a:1
        }
    },
    methods:{
        // 音乐器方法
        audio(){
            var a = this.$refs.audio;
            if(a.ended){
                this.a==1;
            }
            // console.log(a.ended)
        },
        ele(fun){
            this[fun]()
        },
        // 回到顶部
        goTop(){
            window.scroll({
                top:0,
                left:0,
                behavior:"smooth"
            })
        },
        // 建议反馈
        suggestion(){
            this.sugShow=true;
        },
        player(fun){
            this[fun]()
        },
        // 点击左侧圆形图片
        up(){
            this.playlistShow()
        },
        // 播放暂停
        playTo(e){
            // 点击播放和暂停
            // if(this.play[1].src == require('../../assets/globalActions/play.png')){
                this.play[1].src=require('../../assets/globalActions/stop.png');
                this.$store.state.nowPlay[1].imgSrc=require('../../assets/globalActions/stop.png')
                this.$refs.closePlay.children[0].children[0].className='animal'; 
                this.$refs.audio.play();
                this.$store.state.nowPlay[1].fun='playStop';
            // }else{
            //     this.play[1].src=require('../../assets/globalActions/play.png');
            //     this.$store.state.nowPlay[1].imgSrc=require('../../assets/globalActions/play.png');
            //     this.$refs.closePlay.children[0].children[0].className='';
            //     this.$refs.audio.pause(); 
            // }
        },
        playStop(e){
            this.play[1].src=require('../../assets/globalActions/play.png');
            this.$store.state.nowPlay[1].imgSrc=require('../../assets/globalActions/play.png');
            this.$refs.closePlay.children[0].children[0].className='';
            this.$refs.audio.pause(); 
            this.$store.state.nowPlay[1].fun='playTo';
        },
        // 点击关闭播放器
        close(){
            this.$refs.closePlay.style='display:none';
            this.$refs.audio.pause(); 
        },
        // 点击打开和关闭播放列表
        playlistShow(){
            this.$store.commit('global_actions_list');
        },
        // 回到顶部/建议反馈文字出现
        moveOver(e){
            event.currentTarget.children[1].style="opacity: 1;"
        },
        // 回到顶部/建议反馈文字消失
        moveLeave(e){
            event.currentTarget.children[1].style="opacity: 0;"
        },
        // 点击关闭反馈
        closeSug(){
            this.sugShow=false
        }
    },
    mounted(){
        if(this.$refs.audio.ended==true){
            console.log(1)
        }
        this.audio()
    },
    // 获取变化
    computed:{
        globalActionsListShow:function(){
            return this.$store.state.globalActionsListShow;
        }
    },
    watch:{
        
    },
}
</script>

<style scoped>
.globalActions{
    position: fixed;
    right: 20px;
    bottom: 20px;
}
.elevator{
    width: 1.7rem;
}
.elevator a{
    width: 0.4rem;
    position: relative;
    display: block;
    font-size: 0.12rem;
    margin-left: 75%;
}
.elevator a div{
    height: 0.4rem;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 0.04rem;
    background: #fff;
    box-shadow: 0 0 0.08rem rgba(0,0,0,.1);
    margin-top: 0.04rem;
}
.elevator a div img{
    width: 70%;
}
.elevator a p{
    position: absolute;
    opacity: 0;
    padding: 0.06rem 0.14rem;
    top: 12.5%;
    left: -0.9rem;
    color: #fff;
    background: #5a5a5a;
    border-radius: 0.04rem;
    transition: opacity 0.5s ease;
}
.play{
    width: 1.56rem;
    height: 0.5rem;
    display: flex;
    justify-content: space-around;
    align-items: center;
    padding: 0.07rem;
    margin-top: 0.3rem;
    border-radius: 99rem;
    font-size: 0.3rem;
    background: #fff;
    z-index: 999;
    box-shadow: 0 0 8px rgba(0,0,0,.2);
}
.play a{
    text-align: center;
}
.play a:first-child{
    width: 0.5rem;
}
/* 旋转 */
@-webkit-keyframes animal {
    0%{
        transform: rotate(0deg);
        -ms-transform: rotate(0deg);
        -webkit-transform: rotate(0deg);
    }
    100%{
         transform: rotate(360deg);
        -ms-transform: rotate(360deg);
        -webkit-transform: rotate(360deg);
    }
}
.animal{
    -webkit-animation: animal 3s infinite linear;
    -webkit-transform-origin: center center;
    -ms-transform-origin: center center;
    transform-origin: center center
}
.play a:nth-child(2){
    width: 0.3rem;
    margin-top: 5%;
}
.play a:last-child{
    width: 0.24rem;
}
.play a:first-child img{
    width: 100%;
    margin-top: 15%;
}
.play a:nth-child(2) img{
    width: 100%;
}
.play a:last-child img{
    width: 100%;
}
.play a:first-child img{
    border-radius: 50%;
}
.wrap{
    /* width: 100%;
    height: 100%;
    position: fixed;
    top: 0;
    left: 0;
    background-color: rgba(0,0,0,.5);
    z-index: 15000; */
    position: fixed;
    z-index: 15000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    overflow-x: hidden;
    overflow-y: visible;
}
.wrap>button{
    position: absolute;
    right: 1%;
    top: 1%;
    padding: 0.1rem 0.2rem;
    font-size: 0.4rem;
    background: transparent;
    border: none;
    outline: none;
    cursor: pointer;
}
.main{
    width: 4.94rem;
    height: 5rem;
    position: relative;
    font-size: 0;
    margin: -3rem auto 0 auto;
    top: 50%;
    background: #fff;
    border-radius: 0.05rem;
    padding: 0.25rem 0.35rem;
}
.main>.title{
    padding: 0.05rem 0 0.15rem;
}
.main>.title h1{
    line-height: 1.3;
    font-size: 0.2rem;
    font-weight: bold;
    margin-bottom: 0.07rem;
}
.main>.title h2{
    font-size: 0.14rem;
    margin-bottom: 0.1rem;
    color: #5a5a5a;
    font-weight: 400;
}
.content-group{
    margin-bottom: 0.16rem;
    font-size: 0.16rem;
}
.content-group a{
    padding: 6px;
    cursor: pointer;
    padding: 0.06rem 0.18rem;
}
.content-group a:first-child{
    border-radius: 0.04rem 0 0 0.04rem;
}
.content-group a:last-child{
    border-radius: 0 0.04rem 0.04rem 0;
}
.content-group>.active{
    background: #dae0e5;
    border-color:#d3d9df ;
}
.content-group>input{
    width: 100%;
    height: 0.35rem;
    padding: 0.06rem 0.18rem;
    box-sizing: border-box;
    border: 1px solid #ced4da;
    border-radius: 0.04rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;;
}
.content-group>input:focus{
    outline: 0;
    border-color: #656a78;
    box-shadow: 0 0 0 0 rgba(43,45,51,.25);
}
.content-group>textarea{
    width: 100%;
    padding: 0.06rem 0.18rem;
    box-sizing: border-box;
    font-size: 0.16rem;
    border: 1px solid #ced4da;
    border-radius: 0.04rem;
    resize: none;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
.content-group>textarea:focus{
    outline: 0;
    border-color: #656a78;
    box-shadow: 0 0 0 0 rgba(43,45,51,.25);
}
.content-group>p{
    font-size: 0.14rem;
    color: red;
    display: none;
}
.content-group>input:last-child{
    box-sizing: border-box;
    background: #f6f6f6;
}
.main>button{
    position: absolute;
    padding: 0.08rem 0.24rem;
    line-height: 1.5;
    color: #fff;
    background-color: #464646;
    border-color: #464646;
    border-radius: 0.04rem;
    cursor: pointer;
    right: 6.3%;
    bottom: 5%;
}
/* .playList>.wrap>.main{
    width: 8.5rem;
    height: 7.3rem;
    position: relative;
    background: #fff;
    margin-top: -3.7rem;
    z-index: 100;
}
.playList>.wrap>.main>.top{
    font-size: 12px;
    display: flex;
}
.playList>.wrap>.main>.top>.top-img{
    width: 30%;
}
.playList>.wrap>.main>.top>.top-title{
    width: 70%;
} */
</style>