<template>
    <div class="setting">
        <div class="container">
            <h2>设置</h2>
            <div class="main">
                <div class="main-left">
                    <div>
                        <!-- 滑动占位div -->
                        <div class="blackBox" :style="{height:boxHeight}"></div>
                        <!-- 左侧内容div -->
                        <div class="main-left-container">
                            <ul>
                                <li v-for="(v,k) of setting" :key="k" :class="{active:active==k}">
                                    <a :href="v.jump">
                                        <div>
                                            <span>
                                                <img :src="v.img">
                                            </span>
                                        </div>
                                        <div>{{v.title}}</div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="main-right">
                    <!-- 编辑个人资料 -->
                    <div class="main-right-box">
                        <div class="main-right-box-title" id="person">
                            <p>编辑个人资料</p>
                        </div>
                        <div class="main-right-box-body">
                            <div class="box-body-box">
                                <div class="name">头像</div>
                                <div class="content">
                                        <input type="file" class="ove" @input="showBtn1()" @change="previewImg($event)" ref="aaaa" name="avatar">
                                    <div class="content-portrait">
                                        <img :src="avatar">
                                    </div>
                                    <div class="content-p">
                                        <p>
                                            <button>修改头像</button>
                                        </p>
                                        <p>图片格式支持 GIF、PNG、JPEG，尺寸不小于 200 PX，小于 4 MB</p>
                                    </div>
                                </div>
                            </div>
                            <div class="box-body-box">
                                <div class="name">昵称</div>
                                <div class="content mtop">
                                    <input type="text"  v-model="username" @input="showBtn1">
                                    <div>
                                        <small>支持中英文，长度不能超过 20 个字符，180天内仅支持修改一次</small>
                                    </div>
                                </div>
                            </div>
                            <div class="box-body-box">
                                <div class="name">性别</div>
                                <div class="content">
                                    <div>
                                        <label>
                                            <input type="radio" name="sex" value="1" v-model="gender" @change="showBtn1">男
                                        </label>
                                    </div>
                                    <div>
                                        <label>
                                            <input type="radio" name="sex" value="0" v-model="gender" @change="showBtn1">女
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="mar-right-box-bottom">
                                <button v-show="Btn1" @click="putData">确认修改</button>
                            </div>
                        </div>
                    </div>
                    <!-- 账号与安全 -->
                    <div class="main-right-box" id="security">
                        <div class="main-right-box-title">
                            <p>帐号与安全</p>
                        </div>
                        <div class="main-right-box-body">
                            <div class="box-body-box">
                                <div class="name">手机号</div>
                                <div class="content">
                                    <input type="text" class="phone" v-model="phone" @input="showBtn2">
                                    <span :style="{opacity:opacityPh}" class="warningPh">请输入正确手机号</span>
                                    <button>绑定手机</button>
                                </div>
                            </div>
                            <div class="box-body-box">
                                <div class="name">社交账号</div>
                                <div class="content wechat">
                                    <div>
                                        微博<input type="checkbox" @change="showBtn2">
                                    </div>
                                    <div>
                                        微信<input type="checkbox" @change="showBtn2">
                                    </div>
                                </div>
                            </div>
                            <div class="box-body-box">
                                <div class="name">密码</div>
                                <div class="content">
                                    <input type="password" class="password" v-model="password" @input="showBtn2">
                                    <span :style="{opacity:opacityPw}" class="warningPw">请输入6位以上的字母或数字</span>
                                    <button>密码设置</button>
                                </div>
                            </div>
                             <div class="mar-right-box-bottom">
                                <button v-show="Btn2" @click="phoneChange">确认修改</button>
                            </div>
                        </div>
                    </div>
                    <!-- 通知消息 -->
                    <div class="main-right-box" id="news">
                        <div class="main-right-box-title">
                            <p>通知消息</p>
                        </div>
                        <div class="main-right-box-body">
                            <div class="box-body-box">
                                <div class="name">评论与回复</div>
                                <div class="content allPeo">
                                    <label>
                                        <input type="radio" name="comment" v-model="comment" value="0" @change="showBtn3">任何人
                                    </label>
                                    <label>
                                        <input type="radio" name="comment" v-model="comment" value="1" @change="showBtn3">我关注的人
                                    </label>
                                    <label>
                                        <input type="radio" name="comment" v-model="comment" value="2" @change="showBtn3">不接收通知
                                    </label>
                                </div>
                            </div>
                            <div class="box-body-box">
                                <div class="name">关注了你</div>
                                <div class="content allPeo">
                                    <label>
                                        <input type="radio" name="follow" v-model="follow" value="0" @change="showBtn3">任何人
                                    </label>
                                    <label>
                                        <input type="radio" name="follow" v-model="follow" value="1" @change="showBtn3">不接收通知
                                    </label>
                                </div>
                            </div>
                            <div class="box-body-box">
                                <div class="name">赞了你</div>
                                <div class="content checkUp  allPeo">
                                    <label>
                                        <input type="radio" name="thank" v-model="thank" value="0" @change="showBtn3">任何人
                                    </label>
                                    <label>
                                        <input type="radio" name="thank" v-model="thank" value="1" @change="showBtn3">不接收通知
                                    </label>
                                </div>
                            </div>
                            <div class="mar-right-box-bottom">
                                <button v-show="Btn3" @click="putAdress">确认修改</button>
                            </div>
                        </div>
                    </div>
                    <!-- 申请注销 -->
                    <div class="main-right-bottom">
                        <a href="javascript:;" @click="aaaaa">点击此处</a>
                        <span>申请注销你的机核账号</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name:"v-setting",
    data(){
        return{
            setting:[
                {title:"编辑个人资料",img:require('../../assets/setting/edit.png'),jump:'#person'},
                {title:"账号与安全",img:require('../../assets/setting/notice.png'),jump:'#security'},
                {title:"通知消息",img:require('../../assets/setting/account.png'),jump:'#news'}
            ],
            boxHeight:'0px',
            active:0,
            // 用户唯一标识id
            uid:sessionStorage.getItem('root'),
            // 用户头像
            avatar:'',
            // 用户昵称
            username:'',
            // 性别
            gender:'',
            // 评论与回复
            comment:'',
            // 关注了你
            follow:'',
            // 赞了你
            thank:'',
            // 手机号框
            phone:'',
            // 密码框
            password:'',
            // 编辑个人资料按钮
            Btn1:false,
            // 账号与安全按钮
            Btn2:false,
            // 通知消息按钮
            Btn3:false,
            // 手机号警告透明度
            opacityPh:0,
            // 密码警告透明度
            opacityPw:0,
            fileName: ''
        }
    },
    methods:{
        // 滚轮事件
        menu(){
            this.scroll = document.documentElement.scrollTop || document.body.scrollTop;
            this.boxHeight=this.scroll+'px';
            // console.log(this.scroll)
            if(this.scroll>400 && this.scroll<=750){
                this.active=1;
            }else if(this.scroll>750){
                this.active=2;
            }else{
                this.active=0
            }
        },
        // 编辑个人资料按钮显示
        showBtn1(){
            this.Btn1=true;
        },
        //账号与安全按钮显示
        showBtn2(){
            this.Btn2=true;
        },
        // 通知消息按钮显示
        showBtn3(){
            this.Btn3=true;
        },
        // 预览修改的头像
        previewImg(e){
            var imgURL = "";
            var file = null;
            if(e.target.files && e.target.files[0]){
                var reader = new FileReader();
                reader.onload = (e)=>{
                    imgURL = e.target.result;
                    console.log(imgURL);
                    this.avatar = imgURL;
                };
                reader.readAsDataURL(e.target.files[0]);
                return imgURL;
            }
        },
        // 编辑个人资料，并提交到数据库
        putData(){
            var a = encodeURIComponent(this.avatar)
            this.axios.put(`/name`,`uid=${this.uid}&avatar=${a}&username=${this.username}&gender=${this.gender}`)
            .then((res)=>{
                alert('修改成功')
            })
        },
        // 修改账号与安全，并提交到数据库
        // 修改账号与安全的ajax
        putPhone(){
            this.axios.put(`/phone`,`uid=${this.uid}&phone=${this.phone}&password=${this.password}`)
            .then((res)=>{
                alert('修改成功');
            });
            
        },
        phoneChange(){
            if(this.opacityPh==0&&this.opacityPw==0){
                this.putPhone();
                
            }else{
                alert('修改失败')
            }
        },
        // 修改通知消息 ，并提交到数据库
        // 修改通知消息的ajax
        putAdress(){
            this.axios.put(`/adress`,`uid=${this.uid}&comment=${this.comment}&follow=${this.follow}&thank=${this.thank}`)
            .then((res)=>{
                alert('修改成功')
            });
        },
        // 注销账号
        deleteUser(){
            this.axios.delete(`/deleteuser`,{params:{
                uid:this.uid
            }}).then((res)=>{
                alert('删除成功');
                this.$router.push('/app')
            })
        },
        aaaaa(){
            var a=confirm('是否确定注销此账号')
            if(a){
                this.deleteUser()
            }
        }
    },
    destroyed(){
        window.removeEventListener('scroll', this.handleScroll);
    },
    created(){
        this.axios.get(`/setting?uid=${this.uid}`)
        .then((res)=>{
            if(res.data!="查询失败"){
                var results = res.data.result[0];
                // 头像
                if(results.avatar == ''){
                    this.avatar = require('../../assets/setting/logo.png')
                }else{
                    this.avatar = results.avatar;
                }
                // 昵称
                this.username = results.username;
                // 性别
                this.gender = results.gender;
                // 电话
                this.phone = results.phone;
                // 密码
                this.password = results.password;
                // 评论与回复
                this.comment = results.comment;
                // 关注了你
                this.follow = results.follow;
                // 赞了你
                this.thank = results.thank;
            }
        });
    },
    mounted(){
        window.addEventListener('scroll', this.menu,true);
    },
    watch:{
        // 监视更改手机号时候手机号的格式
        phone(){
            if(!(/^1[3456789]\d{9}$/.test(this.phone))){
                console.log(1)
                this.opacityPh=1
            }else{
                this.opacityPh=0
            }
        },
        // 监视更改面时候密码的格式
        password(){
            if(!(/^[0-9A-Za-z_]{5,12}$/.test(this.password))){
                this.opacityPw=1
            }else{
                this.opacityPw=0
            }
        }
    },
    components:{

    }
    
}
</script>

<style scoped>
.setting{
    width: 100%;
    /* 合并以后会出现可以无限下滚的BUG */
    padding:0.45rem 0 0.9rem 0;
    background: #f7f7f8
}
.container{
    width: 65%;
    margin: 0 auto;
}
.container>h2{
    font-size: 0.18rem;
    font-weight: 600;
    margin: 0 0 0.3rem;
    line-height: 1;
    color: #323232; 
}
.main{
    width: 100%;
    display: flex;
    justify-content: space-between;
}
.main>.main-left{
    width: 16%;
    background: #fff;
    border-radius: 0.04rem;
}
.main-left-container ul li a{
    width: 100%;
    height: 0.56rem;
    font-size: 0.14rem;
    font-weight: 600;
    display: flex;
    justify-content: center;
    box-sizing: border-box;
    line-height: 0.56rem;
}
.main-left-container ul li a div:first-child{
    width: 20%;
    text-align: right;
}
.main-left-container ul li a div:last-child{
    width: 60%;
    margin-left: 5%;
}
.main-left-container ul li a span img{
    width: 40%;
    margin-top: 48%;
}
.main-right{
    width: 80%;
}
.main-right>.main-right-box{
    margin-bottom: 0.3rem;
    background: #fff;
}
.main-right>.main-right-box>.main-right-box-title{
    height: 0.56rem;
    line-height: 0.56rem;
    font-size: 0.17rem;
    font-weight: 600;
    box-sizing: border-box;
    padding: 0 0.1rem 0 0.3rem;
    background: #eeeef2;
}
.main-right-box>.main-right-box-body{
    font-size: 0;
    box-sizing: border-box;
    padding: 0.3rem;
}
.main-right-box-body>.box-body-box{
    display: flex;
    font-size: 12px;
    margin-bottom: 0.2rem;
}
.main-right-box-body>.box-body-box>.name{
    width: 17%;
    font-size: 0.18rem;
    font-weight: 600;
    margin: auto 0;
    box-sizing: border-box;
    padding: 0.07rem 0.15rem;
}
.main-right-box-body>.box-body-box>.content{
    width: 83%;
    display: flex;
    position: relative;
    color: #8e8e93;
    box-sizing: border-box;
    padding: 0 0.15rem;
    flex-wrap: wrap;
}
.main-right-box-body>.box-body-box>.content .ove{
    width: 90%;
    height: 100%;
    position: absolute;
    opacity: 0;
    cursor: pointer;
}
.main-right-box-body>.box-body-box>.content>.content-portrait{
    width: 14%;
}
.main-right-box-body>.box-body-box>.content>.content-portrait img{
    width: 100%;
    height: 100%;
}
.main-right-box-body>.box-body-box>.content>.content-p{
    display: flex;
    font-size: 0.14rem;
    color: #8e8e93;
    flex-direction: column;
    justify-content: center;
    margin-left: 5%;
}
.main-right-box-body>.box-body-box>.content>.content-p button{
    color: #5a5a5a;
    background: #fff;
    border: 2px solid #e6e6e6;
    padding: 0.08rem 0.2rem;
    margin-bottom: 3%;
    border-radius: 0.2rem;
    cursor: pointer;
}
.mtop{
    margin-top: 0.18rem;
}
.main-right-box-body>.box-body-box:nth-child(2)>.content>input{
    width: 100%;
    display: block;
    padding: 0.06rem 0.18rem;
    color: #495057;
    font-size: 0.14rem;
    line-height: 1.5;
    border: 1px solid #ccc;
    border-radius: 0.04rem;
    outline: 0;
}
.main-right-box-body>.box-body-box:nth-child(2)>.content>input:focus{
    border-color: #999;
}
.main-right-box-body>.box-body-box:nth-child(3)>.content{
    font-size: 0.18rem;
    margin: auto 0;
    color: #000;
}
.main-right-box-body>.box-body-box:nth-child(3)>.content>div:first-child{
    display: inline-block;
    margin-right: 5%;
}
.main-right-box-body>.box-body-box:nth-child(3)>.content input{
    margin: auto 0;
}
.main-right-box-body>.box-body-box:nth-child(3){
    margin-bottom: 0;
}
.mar-right-box-bottom{
    font-size: 0;
    margin-top: 1%;
    margin-left: 18.5%;
}
.mar-right-box-bottom button{
    /* display: none; */
    font-size: 14px;
    box-sizing: border-box;
    border-radius: 99rem;
    background: black;
    color: #fff;
    padding: 0.06rem 0.18rem;
    line-height: 1.5;
    outline: 0;
    border: none;
    cursor: pointer;
}
.main-right-box-body>.box-body-box>.content button{
    border-radius: 0.18rem;
    border: 2px solid #e6e6e6;
    font-size: 0.14rem;
    line-height: 1.5;
    background: #fff;
    color: #5a5a5a;
    padding: 0.06rem 0.18rem;
    transition: border .3s ease-in-out;
}
.main-right-box-body>.box-body-box>.content button:hover{
    color: #323232;
    border-color: #b3b3b3
}
.main-right-box-body>.box-body-box>.wechat{
    margin: auto 0;
}
.main-right-box-body>.box-body-box>.wechat div{
    width: 50%;
    position: relative;
    display: flex;
    justify-content: space-between;
    box-sizing: border-box;
    font-size: 0.16rem;
    color: #323232;
}
.main-right-box-body>.box-body-box>.wechat input{
    margin: auto 10%;
}
.allPeo{
    font-size: 0.18rem;
    margin: auto 0;
    color: #000;
}
.main-right-box-body>.box-body-box>.allPeo label{
    font-size: 16px;
    color: #000;
    margin-right: 5%;
}
.checkUp>label>input{
    margin: 0.03rem 0.03rem 0 0.05rem !important;
}
.main-right>.main-right-bottom{
    box-sizing: border-box;
    background: #f7f7f8;
    font-size: 0.14rem;
    padding: 0 0.3rem 0.3rem;
}
.main-right>.main-right-bottom a{
    font-weight: 700;
    color: #333;
    text-decoration: underline;
    margin-left: 2%;
    margin-right: 3%;
}
.active{
    background: #cccccc;
}
.phone{
    height: 70%;
    color: #495057;
    margin: auto 0;
    padding-left: 1%;
    border: 1px solid #ccc;
    border-radius: 0.04rem;
    outline: none;
}
.phone:focus{
    border-color: #333;
}
.password{
    height: 0.28rem;
    color: #495057;
    box-sizing: content-box;
    padding-left: 1%;
    border: 1px solid #ccc;
    border-radius: 0.04rem;
    outline: none;
}
.password:focus{
    border-color: #333;
}
.warningPw{
    width: 15%;
    color:red;
    margin:auto 1%;
    font-size:0.12rem;
    transition: opacity 0.3s linear;
}
.warningPh{
    width: 15%;
    color:red;
    margin:auto 1%;
    transition: opacity 0.3s linear;
}
.blackBox{
    max-height: 934px;
}
</style>