<template>
    <div class="footer">
        <div class="container">
            <img src="../../assets/images/footer/logo.png" alt="机核" class="footer_logo">
            <div class="footer-body row">
                <div class="footer-body-left">
                    <div class="footer-title"></div>
                    <div class="footer-intro">
                        <p>机核从2010年开始一直致力于分享游戏玩家的生活，以及深入探讨游戏相关的文化。我们开发原创的电台以及视频节目，一直在不断寻找民间高质量的内容创作者。</p>
                        <p>我们坚信游戏不止是游戏，游戏中包含的科学，文化，历史等各个层面的知识和故事，它们同时也会辐射到二次元甚至电影的领域，这些内容非常值得分享给热爱游戏的您。</p>
                    </div>
                </div>
                <div class="footer-body-right">
                    <div class="footer-title"></div>
                    <div class="right-top">
                        <a target="_blank" href="#" v-for="(j,k) of jump" :key="k">{{j}}</a>
                    </div>
                    <div class="right-bottom">
                        <p>
                            <a target="_blank" href="#">增值电信业务经营许可证 京B2-20191060</a>
                        </p>
                        <p>
                            <a target="_blank" href="#">京ICP备17068232号-1</a>
                        </p>
                        <p>
                            <a target="_blank" href="#">网络文化经营许可证京网文[2019]1067-097号</a>
                        </p>
                        <p>
                            <a target="_blank" href="#">
                                <img src="../../assets/images/footer/guohui.png" alt="">
                                京公网安备 11010502036937号
                            </a>
                        </p>
                        <p>
                            <a target="_blank" href="#">食品经营许可证 JY11105052461621</a>
                        </p>
                        <p>
                            <a target="_blank" href="#">出版物经营许可证 新出发京零字朝190063号</a>
                        </p>
                    </div>
                </div>
            </div>
            <div class="footer-body-bottom row">
                <div class="footer-bottom-left">
                    <p>
                        <a target="_blank" href="#" v-for="(l,k) of listenMe" :key="k">{{l}}</a>
                    </p>
                </div>
                <div class="footer-bottom-right">
                    <p>Copyright © 2009 - 2020 GAMECORES. All Rights Reserved</p>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name:'v-footer',
    data(){
        return{
            jump:["知乎","微博","微信","博客","机核铺","核市","RSS"],
            listenMe:["联系我们 / CONTACT US","投稿须知","用户协议","隐私政策","工作招聘"]
        }
    }
}
</script>

<style scoped>
.footer{
    width: 100%;
    padding-top: 0.63rem;
    background: #f2f2f3;
    color: #323232;
}
.container{
    width: 65%;
    box-sizing: border-box;
    padding-right: 0.15rem;
    padding-left: 0.15rem;
    margin:0 auto;
}
.container>img{
    display: block;
    margin-bottom: 0.3rem;
    max-width: 100%;
    max-height: 0.26rem;
}
.footer-body>.footer-body-left{
    flex: 1;
    max-width: 58.33%;
    padding-left: 0.15rem;
    padding-right: 0.15rem;
}
.footer-body .footer-title{
    margin-bottom: 0.2rem;
    border-bottom: 1px solid #ced4da;
}
.footer-body>.footer-body-left>.footer-intro{
    font-size: 0.12rem;
    color: #5a5a5a;
    line-height: 2.1;
}
.footer-body>.footer-body-left>.footer-intro p{
    margin-top: 0;
    margin-bottom: 0.16rem;
}
.footer-body>.footer-body-right{
    flex: 1;
    max-width: 41.67%;
    text-align: right;
    color: #6c757d;
    font-size: 0.12rem;
    padding-left: 0.15rem;
    padding-right: 0.15rem;
}
.footer-body>.footer-body-right>.right-top{
    color: #323232;
    font-size: 0.14rem;
    margin-bottom: 0.3rem;
}
.footer-body>.footer-body-right>.right-top a{
    margin: 0 0 0 0.18rem;
}
.footer-body>.footer-body-right>.right-bottom p{
    margin-bottom: 0.16rem;
}
.footer-body-bottom{
    margin-top: 0.5rem;
}
.footer-body-bottom>.footer-bottom-left{
    width: 50%;
    box-sizing: border-box;
    color: #323232;
    font-size: 0.14rem;
    padding-left: 0.15rem;
    padding-right: 0.15rem;
}
.footer-body-bottom>.footer-bottom-left p a{
    margin: 0 0.18rem 0 0;
}
.footer-body-bottom>.footer-bottom-right{
    width: 50%;
    text-align: right;
    box-sizing: border-box;
    color: #6c757d;
    font-size: 0.12rem;
    padding-left: 0.15rem;
    padding-right: 0.15rem;
}
.row{
    display: flex;
    flex-wrap: wrap;
    margin-right: -15px;
    margin-left: -15px;
}
p{
    margin-top: 0;
    margin-bottom: 0.3rem;
}
a:hover{
    opacity: 0.85;
}
</style>