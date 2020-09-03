<template>
    <div id="transceiver">
        <div>
            <div class="transceiver_1">
                <div class="transceiver_1_top">
                    <div>
                        <p>参与者</p>
                        <div>
                            <a href="javascript:;">
                                <img src="../../assets/transceiver/tx/22.png" alt="">
                                <h3>22</h3>
                            </a>
                        </div>
                        <div>
                            <h1>{{eaasy[i].Mtitle}}</h1>
                            <p>{{eaasy[i].Mstory}}</p>
                        </div>
                        <p>
                            <span>{{eaasy[i].Mtime}}</span>
                            <span>发布于</span>
                            <a href="javascript:;">Gadio Pro</a>
                        </p>
                    </div>
                    <div></div>
                    <p></p>
                </div>
                <div class="transceiver_1_body">
                    <div>
                        <span>
                            本期时间轴制作：陈幸福<br>
                            审核：Hardy<br>
                            {{eaasy[i].Mcontent1}}
                        </span>
                        <span>
                            {{eaasy[i].Mcontent2}}
                        </span>
                    </div>
                    <div>
                        <a href="javascript:;">书影音</a>
                        <a href="javascript:;">北欧神话</a>
                    </div>
                </div>
                <div class="transceiver_1_footer">
                    <div>
                        <div>
                            <a href="javascript:;" @click="point"><img src="../../assets/transceiver/icon/dz.svg">{{eaasy[i].Pup}}</a>
                            <a href="javascript:;" @click="num"><img src="../../assets/transceiver/icon/sq.svg">{{eaasy[i].Pcomment}}</a>
                        </div>
                        <div>
                            <a href="javascript:;" @click="href"><img src="../../assets/transceiver/icon/zf.svg"></a>
                            <a href="javascript:;"><img src="../../assets/transceiver/icon/xz.svg"></a>
                        </div>
                    </div>
                    <div>
                        <div>
                            <div v-for="(v,i) of arr" :key="i">
                                <div>
                                    <a href="javascript:;">
                                        <img src="../../assets/transceiver/x/disc1.jpg" alt="">
                                    </a>
                                </div>
                                <div>
                                    <h5>说书：小北欧神话系列电台</h5>
                                    <span>5396 人关注</span>
                                </div>
                                <button @click="point">订阅</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="message" v-show="iSshow==true"><span>需要登录才能执行此操作</span></div>
            <div class="message" v-show="iScopy==true" style="z-index:999"><span>复制成功</span></div>
        </div>
        <div class="transmit" v-show="iSshow2==true" @click="lost($event)">
            <div>
                <div>
                    <h3>分享:</h3>
                    <div>
                        <button><img src="../../assets/transceiver/icon/wb.svg" alt=""></button>
                        <button><img src="../../assets/transceiver/icon/wx.svg" alt=""></button>
                    </div>
                    <div><input type="text" v-model="iSlocation"><button @click="changeCopy" v-clipboard:copy="iSlocation" 
                    v-clipboard:success="onCopy"
                    v-clipboard:error="onErrer"
                    ><img src="../../assets/transceiver/icon/copy.svg"></button></div>
                </div>
                <span @click="lost($event)">×</span>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    name:'v-transceiver',
    data(){
        return{
            eaasy:[{}],//数据库获取的数据
            arr:[1,2],
            n:0,//初始值
            i:0,//显示在页面上的值
            stage:0,//默认未登录状态 0未登录 1登录
            iSshow:false,//是否显示需要登录提示
            timer:null,//一次性定时器
            iSlocation:null,//绑定域名
            iSshow2:false,
            iScopy:false
        }
    },
    methods:{
        // 获取当前ID
        getUrlId(){
            this.i=this.$route.query.id
        },
        changeCopy(){
            this.iScopy=true
            setTimeout(()=>{
                this.iScopy=false
            }, 2000);
        },
        show(){
            this.iSshow=false
            clearTimeout(this.timer)
        },
        num() {
            if(sessionStorage.getItem('root')==null || sessionStorage.getItem('root')=='null'){
                // this.eaasy[i].Pcomment++;
                this.point();
            }else{
                this.eaasy[this.i].Pcomment+=1;
            }
        },
        point(){
            console.log(this.eaasy[this.i].Pup)
            if(sessionStorage.getItem('root')==null || sessionStorage.getItem('root')=='null'){
                this.iSshow=true;
                this.timer=setTimeout(this.show,2000);
                setTimeout(()=>{
                    this.$router.push('/login')
                }, 3000);
            }else{
                this.eaasy[this.i].Pup+=1
            }
        },
        //页面转发显示
        href(){
            this.iSshow2=true
        },
        //页面转发消失
        lost(e){
            if(e.currentTarget==e.target){
                this.iSshow2=false
            }
            
        },
        copyText(e){
            var a=this.$refs.myText.value;
            console.log(this.$refs.myText.value);
        },
        onCopy(e){
            console.log(e.text)
            console.log("您获取到了网址"+this.iSlocation)
        },
        onErrer(e){
            console.log("您未获取到网址");
        }
    },
    created(){
        this.iSlocation=window.location.href;
        // console.log(window.location.href);
        for(var i=0;i<50;i++){
            this.eaasy.push({})
        }
    },
    mounted(){
        this.axios.get('/eaasy').then((res)=>{
            this.eaasy=res.data.result;
            console.log(this.eaasy[0].Mtitle);
            console.log(this.eaasy[1].Mtitle);
        });
        this.getUrlId()
    }
}

</script>
<style scoped>
    /* 整体布局样式 */
    #transceiver{
        width: 100%;
        display: flex;
        flex-flow: column;
        box-sizing: border-box;
        /* position: relative; */
    }
    #transceiver>div:nth-child(1){
        width: 38%;
        margin: 0 auto;
        /* position: absolute; */
        padding-bottom: 5%;
        /* display: none; */
    }
    #transceiver>div>div{
        margin: 0 auto;
    }
    /* 第一部分顶部样式 */
    .transceiver_1_top>div:nth-child(1){
        margin: 0 auto ;
        padding: 0 3%;
    }
    .transceiver_1_top>div:nth-child(1)>p{
        font-size: 0.15rem;
        text-align: center;
    }
    .transceiver_1_top>div:nth-child(1)>div:nth-child(2){
        width: 20%;
        margin: 0 auto;
        position: relative;
        margin-bottom: 5%;
    }
    .transceiver_1_top>div:nth-child(1)>div>a{
        display: block;
    }
    .transceiver_1_top>div:nth-child(1)>div>a>img{
        display: block;
        width: 100%;
        border-radius: 50%;
    }
    .transceiver_1_top>div:nth-child(1)>div>a>h3{
        color: black;
        font-size: 0.15rem;
        font-weight: 100;
        margin-top: 10%;
        text-align: center;
    }
    .transceiver_1_top>div:nth-child(1)>div:hover>div{
        display: block;
    }
    .transceiver_1_top>div:nth-child(1)>div:nth-child(3)>h1{
        font-size: 0.24rem;
        font-weight: 800;
        margin-bottom: 4%;
    }
    .transceiver_1_top>div:nth-child(1)>div:nth-child(3)>p{
        font-size: 0.16rem;
    }
    .transceiver_1_top>div>p{
        margin-top: 4%;
        margin-bottom: 2%;
    }
    .transceiver_1_top>div>p>span{
        color: #bbb;
    }
    .transceiver_1_top>div>p>a{
        color: red;
    }
    /* 第一部分身体样式 */
    .transceiver_1_body{
        width: 100%;
    }
    .transceiver_1_body>div{
        padding: 0 4% 4% 4%;
        margin: 3% 0;
        font-size: 0;
    }
    .transceiver_1_body>div>span{
        text-align: left;
        font-size: 0.16rem;
        display:block; 
        white-space:pre-wrap;
        margin-bottom: 5%;
        /* text-decoration: 1tr; */
        line-height: 170%;
    }
    .transceiver_1_body>div:nth-child(2){
        text-align: left;
    }
    .transceiver_1_body>div>a{
        font-size: 0.16rem;
        color: #777;
        margin-right: 3%;
    }
    /* 第一部分底部样式 */
    .transceiver_1_footer{
        margin: 0 auto;
        margin-top: 1%;
        font-size: 0;
        text-align: left;
        padding: 0% 5% 0% 5%;
    }
    .transceiver_1_footer>div:nth-child(1){
        margin-top: 10%;
        margin-bottom: 10%;
        display: flex;
        width: 100%;
    }
    .transceiver_1_footer>div:nth-child(1)>div{
        width: 50%;
    }
    .transceiver_1_footer>div:nth-child(1)>div>a{
        margin:0% 10% 0% 5%;
        font-size: 0.2rem;
        color: black;
    }
    .transceiver_1_footer>div>div:nth-child(2){
        text-align: right;
    }
    .transceiver_1_footer>div:nth-child(1)>div>a>img{
        width: 5%;
    }
    .transceiver_1_footer>div:nth-child(2){
        width: 100%;
    }
    .transceiver_1_footer>div:nth-child(2)>div{
        display: flex;
        width: 100%;
    }
    .transceiver_1_footer>div:nth-child(2)>div>div{
        width: 50%;
        display: flex;
    }
    .transceiver_1_footer>div:nth-child(2)>div>div>div>a{
        display: block;
        width: 100%;
    }
    .transceiver_1_footer>div:nth-child(2)>div>div>div>a>img{
        width: 100%;
        border-radius: 0.04rem;
    }
    .transceiver_1_footer>div:nth-child(2)>div>div>div{
        display: flex;
        flex-flow: row wrap;
    }
    .transceiver_1_footer>div:nth-child(2)>div>div>div:nth-child(1){
        width: 20%;
        margin-right: 5%;
    }
    .transceiver_1_footer>div:nth-child(2)>div>div>div:nth-child(2){
        width: 50%;
    }
    .transceiver_1_footer>div:nth-child(2)>div>div>div>h5{
        font-size: 0.16rem;
        margin-top: 2%;
    }
    .transceiver_1_footer>div:nth-child(2)>div>div>div>span{
        font-size: 0.12rem;
    }
    .transceiver_1_footer>div:nth-child(2)>div>div>button{
        width: 20%;
        height: 0.3rem;
        margin-right: 2%;
        margin-top: 10%;
        border-radius: 20%;
        background: #464646;
        color: white;
        cursor: pointer;
    }
    .message{
        width: 2.4rem;
        height: 0.3rem;
        background-color: #000;
        font-size: 0.18rem;
        border-radius: 0.05rem;
        position: fixed;
        top: 25%;
        left: 47%;
        text-align: center;
    }
    .message>span{
        color: #fff;
        line-height: 0.3rem;
    }
    /* 页面转发效果 */
    .transmit{
        width: 100%;
        position: fixed;
        top: 0;
        background: rgba(0,0,0,.5);
        height: 120%;
        /* margin-bottom: 1%; */
        z-index: 100;
    }
    .transmit>div{
        top: 30%;
        left: 43%;
        width: 24%;
        position: fixed;
        margin-bottom: 1%;
    }
    .transmit>div>span:nth-child(2){
        position: absolute;
        right: 0.1rem;
        top: -0.05rem;
        font-size: 0.3rem;
        cursor: pointer;
    }
    .transmit>div>div{
        padding: 3%;
        font-size: 0.16rem;
        background: white;
        text-align: left;
        border-radius: 0.04rem;
    }
    .transmit>div>div>h3{
        font-size: 0.24rem;
    }
    .transmit>div>div>div{
        display: flex;
        margin-top: 0.1rem;
    }
    .transmit>div>div>div button{
        width: 20%;
        color: transparent;
        border: 0;
        outline: 0;
        margin-left: 2%;
        cursor: pointer;
    }
    .transmit>div>div>div>button>img{
        width: 100%;
    }
    .transmit>div>div>div>input{
        width: 80%;
        outline: lightskyblue thick;
    }
    .transmit>div>div>div:nth-child(3) button>img{
        width: 60%;
    }
</style>