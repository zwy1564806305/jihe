<template>
    <div id="MainBanner">
        <div>
            <div>
                <bannerTop></bannerTop>
                <bannerBottom></bannerBottom>
            </div>
            
        </div>
    </div>
</template>
<script>
// 引入轮播图顶部文件
import bannerTop from './bannerTop.vue'
// 引入轮播图底部文件
import bannerBottom from './bannerBottom.vue'
export default {
    components:{
        bannerTop,
        bannerBottom
    }
}
</script>
<style scoped>
    /* 最外层div */
    #MainBanner{
        width: 100%;
        text-align: left;
    	box-sizing: border-box;
        background: #f7f7f8;
        /* background: lawngreen; */
    }
    #MainBanner>div{
        width: 65%;
        margin: 0 auto;
        position: relative;
        padding-top: 0.2rem;
        padding-bottom: 46%;
    }
    #MainBanner>div>div{
        width: 100%;
        box-shadow: 0 0 0 #ccc;
        position: absolute;
    }
</style>