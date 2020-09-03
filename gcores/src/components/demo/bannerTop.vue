<template>
    <div class="bannerTop">
        <banner></banner>
        <div>
            <a href="javascript:;"><img :src="arr[0].Pimage" alt=""></a>
        </div>
    </div>
</template>
<script>
// 导入轮播图组件
import banner from './banner'
export default {
    data(){
        return{
            arr:[{}]
        }
    },
    components:{
        banner
    },
    mounted(){
        this.axios.get('/top').then(res=>{
            this.arr = res.data.result;
            // console.log(this.arr)
            for(let i=0;i<this.arr.length;i++){
                this.arr[i].Pimage=require('../../assets/MainBanner/d/'+this.arr[i].Pimage)
            }
        })
    }
}
</script>
<style scoped>
    .bannerTop{
        width: 100%;
        height: 50%;
        display: flex;
        margin: 0 0 1% 0;
        font-size: 0;
    }
    .bannerTop>div:nth-child(2){
        width: 30.6%;
        margin: 0 2% 0 0;
    }
    .bannerTop>div:nth-child(2)>a{
        display: block;
        width: 100%;
    }
    .bannerTop>div:nth-child(2)>a>img{
        width: 100%;
        border-radius: 0.04rem;
    }
</style>