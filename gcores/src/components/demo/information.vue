<template>
    <div id="information">
        <div>
            <h2>本周最热</h2>
            <hr>
            <ul class="information_data">
                <li v-for="(i,v) of arr" :key="v">
                    <a href="javascript">
                        <img src="../../assets/information/i1.png" alt="">
                        <div>
                            <h3>浅谈玩家类型和游戏动机（一）</h3>
                            <p>
                                <span>喜欢</span>
                                ·
                                <span>评论</span>
                            </p>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</template>
<script>
export default {
    name:"v-information",
    data(){
        return{
            arr:[0,1,2,3,4,5,6,7,8,9]
        }
    }
}
</script>
<style scoped>
    #information{
        width: 100%;
        position: relative;
        box-sizing: border-box;
        text-align: left;
    }
    #information>div{
        width: 30%;
        position: absolute;
        border-radius: 0.04rem;
        right: 0;
        font-size: 0.16rem;
        padding: 1%;
        font-weight: 900;
        background-color: rgba(200, 200, 200, .3);
    }
    .information_data{
        padding: 3%;
    }
    .information_data>li{
        margin: 0 0 6% 0;
    }
    .information_data>li>a{
        display: flex;

    }
    .information_data>li>a>img{
        border-radius: 0.04rem;
    }
    .information_data>li>a>div>h3{
        color: black;
        margin-top: 2%;
        margin-bottom: 10%;
    }
    .information_data>li>a>div>p{
        color: black;
    }
    .information_data>li>a>div>p>span{
        color: black;
    }
</style>>

