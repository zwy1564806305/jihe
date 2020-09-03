<template>
    <div class="special">
        <div class="container">
            <div class="ah_section">
                <div class="title">
                    <!-- <a href="#" target="_blank"> -->
                    <!-- <a href="#" @click="abc"> -->
                    <router-link to="/specialRouter" @click="abc">
                        专题
                        <span>
                            <img src="../../assets/images/main/special/right_b.png" alt="">
                        </span>
                    </router-link>
                    <!-- </a> -->
                </div>
                <div class="content">
                    <a href="javascript:;" @click="moveLeft" v-show="this.left!=0">
                        <img src="../../assets/images/main/special/left.png" alt="">
                    </a>
                    <div class="slick-list" ref="trackWidth">
                        <div class="slick-track" :style="{left:left+'%'}" >
                            <div class="slick-current" v-for="(n,k) of arr" :key="k">
                                <a href="#" target="_blank">
                                    <img :src="n" alt="">
                                </a>
                            </div>
                        </div>
                    </div>
                    <a href="javascript:;" @click="moveRight" v-show="aShow">
                        <img src="../../assets/images/main/special/right.png" alt="">
                    </a>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
.special{
    width: 100%;
    padding-top: 0.3rem;
    background: #f7f7f8;
    box-sizing: border-box;
}
.container{
    width: 100%;
    font-size: 0;
}
.ah_section{
    width: 65%;
    margin: 0 auto;
    box-sizing: border-box;
}
.title{
    margin-bottom: 0.3rem;
}
.title a{
    font-size: 0.18rem;
    color: inherit;
    background-color: transparent;
    font-weight: 600;
    line-height: 1;
    margin-left: 1.5%;
}
.title img{
    width: 0.2rem;
    vertical-align: middle;
    margin-left: 0.05rem;
}
.content{
    width: 100%;
    position: relative;
    padding-bottom: 34%;
    height: 0;
    /* display: flex; */
    justify-content: space-between;
}
.content>a:first-child,.content>a:last-child{
    position: absolute;
    border-radius: 0.04rem;
    /* line-height: 100%; */
    height: 80%;
}
.content>a img{
    margin:130px 0;
}
.content>a:first-child{
    left: -0.6rem;
}
.content>a:last-child{
    right: -0.6rem;
}
.content>a:first-child:hover,.content>a:last-child:hover{
    background: rgba(0,0,0,.06);
    opacity: 0.85;
}
.content>a:first-child img,.content>a:last-child img{
    width: 0.3rem;
}
.slick-list{
    width: 100%;
    height: 80%;
    position: absolute;
    overflow: hidden;
}
.slick-track{
    width: 100%;
    height: 100%;
    position: absolute;
    display: flex;
    justify-content: space-between;
    transition: 0.5s all linear;
}
.slick-current{
    width: 25%;
    box-sizing: border-box;
    flex-shrink: 0;
    padding: 0 1.5%;
}
.slick-current a img{
    width: 100%;
}

</style>

<script>
export default {
    name:"v-special-small",
    data(){
        return{
            margin:"",
            arr:[
                require(`../../assets/images/main/special/1.jpg`),
                require(`../../assets/images/main/special/2.jpg`),
                require(`../../assets/images/main/special/3.jpg`),
                require(`../../assets/images/main/special/4.jpg`),
                require(`../../assets/images/main/special/5.jpg`),
                require(`../../assets/images/main/special/6.jpg`),
                require(`../../assets/images/main/special/7.jpg`),
                require(`../../assets/images/main/special/8.jpg`),
                require(`../../assets/images/main/special/8.jpg`)
                ],
            left:0,
            aShow:true
        }
    },
    methods:{
        moveLeft(){
            this.left+=100;
            this.aShow=true;
        },
        moveRight(){
            this.left-=100;
            console.log(Math.floor(this.arr.length/4))
            if(Math.ceil(this.arr.length/4-1)*100==(-this.left)){
                this.aShow=false;
            }
        },
        abc(){
            this.$store.state.type="专题"
        }
    },
    mounted(){
        // this.left
    }
}
</script>