<template>
    <div class="a">
        <div>
            <banner></banner>
            <div>
                <Pl></Pl>
            </div>        
        </div>
    </div>
</template>
<script>
import banner from './banner'
import Pl from './Pl'
export default {
    components:{
        banner,
        Pl,
    }
}
</script>
<style scoped>
    .a{
        width: 100%;
    }
    .a>div{
        width: 65%;
        margin: 0 auto;
        height: 50%;
        display: flex;
        /* margin: 0 0 1% 0; */
        /* font-size: 0; */
    }
    .a>div>div:nth-child(2){
        /* width: 100%; */
    }
</style>