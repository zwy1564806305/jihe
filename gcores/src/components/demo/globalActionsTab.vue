<template>
  <!-- BroadcastTab 遮罩层 -->
  <div class="BroadcastTab" @click="moveBroadcastTab">
    <!-- BroadcastTab-main 表单列表 -->
    <div class="BroadcastTab-main">
      <!-- BroadcastTab-title 头部分-->
      <div class="BroadcastTab-title">
        <!-- BroadcastTab-title 图片  -->
        <img src="../../assets/music/musicLogo.png" alt="">
        <!-- BroadcastTab-title 信息 -->
        <div class="BroadcastTab-info">
          <div>
            <h3>播放列表</h3>
            <p>唱跳rap</p>
          </div>
          <div class="BroadcastTab-info-button">
            <div>
              <button @click="love">收藏全部</button>
              <button @click="removeAllPlayList">全部移除</button>
            </div>
          </div>
        </div>
      </div>
      <!-- BroadcastTab-list 表单部分 -->
      <div class="BroadcastTab-program">
        <a href="#">歌曲</a>
        <p>总共{{song.length}}首歌</p>
      </div>
      <div class="BroadcastTab-List" v-for="(temp,k) of song" :key="k" ref="list" @click="changePlaySong(song,k,$event)">
        <ul>
          <li>
            <div>
              <img :src="song[k].BroListIgm" alt="">
              <div class="BroadcastTab-List-Info">
                <div>
                  <div>
                    <a href="javascript:;">{{song[k].BroListName}}</a>
                  </div>
                  <div>
                    <a href="javascript:;">{{song[k].BroListType}}</a>
                    <p>{{song[k].BroListDuration}}</p>
                    <p>{{song[k].Pcomment}}评论</p>
                  </div>
                </div>
                <div>
                  <a href="javascript:;"><img :src="srcPlay" ref="controlSrcPlay"></a>
                  <a href="javascript:;" class="out" @click="loveSong(k,$event)">收藏</a>
                  <a href="javascript:;" class="out" @click="removeSong(k,$event)">移除</a>
                </div>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import GlobalActions from './globalActions.vue'
export default {
    data() {
        return {
          BroadcastTab:{},
          BroadcastTab_list:[],
          BroadcastTab_list2:[],
          playList:[],
          song:[],
          // 列表播放停止图标
          play:0,
          srcPlay:require('../../assets/globalActions/play.png'),
          srcStop:require('../../assets/globalActions/stop.png')
        }
    },
    methods:{
      // 播放列表的显示与隐藏
      moveBroadcastTab(e){
        var el1=e.target;
        var el2=e.currentTarget;
        if(el1==el2){
          this.$store.commit('global_actions_list');
        }
      },
      // 移除全部
      removeAllPlayList(){
        console.log('移除全部事件')
        this.song=[];
      },
      AddPlayList(temp){
        this.$store.commit('addToPlayList',{
          BroListid:temp,
        })
      },
      // 收藏所有歌曲
      love(){
        console.log('收藏所有歌曲事件')
        console.log(this.song)
        if(sessionStorage.getItem('root')!='null' && sessionStorage.getItem('root')!=null){
          for(var i in this.song){
          var obj = this.song[i]
          console.log(obj.BroListDuration)
          this.axios.post('/loveSong',
            `AUid=${sessionStorage.getItem('root')}&ABroListid=${obj.ABroListid}&ABroListDuration=${obj.BroListDuration}&ABroListImg=${obj.oldImg}&ABroListName=${obj.BroListName}&ABroListType=${obj.BroListType}&ABsingUrl=${obj.BsingUrl}&APcomment=${obj.Pcomment}`)
          .then((res)=>{})
          }
          console.log('已登录')
          console.log(sessionStorage.getItem('root')!='null')
        }else{
          this.$router.push('/login')
        }  
      },
      // 收藏单曲
      loveSong(k,e){
        console.log('收藏单曲歌曲事件');
        // 阻止父元素播放事件发生
        e.stopPropagation();
        if(sessionStorage.getItem('root')!='null' && sessionStorage.getItem('root')!=null){
          e.target.style="color:red"
          var obj = this.song[k]
          console.log(obj.BroListDuration)
          this.axios.post('/loveSong',
            `AUid=${sessionStorage.getItem('root')}&ABroListid=${obj.ABroListid}&ABroListDuration=${obj.BroListDuration}&ABroListImg=${obj.oldImg}&ABroListName=${obj.BroListName}&ABroListType=${obj.BroListType}&ABsingUrl=${obj.BsingUrl}&APcomment=${obj.Pcomment}`)
          .then((res)=>{})
          console.log('已登录')
          console.log(sessionStorage.getItem('root')!='null')
        }else{
          this.$router.push('/login')
        }
      },
      // 移除歌曲
      removeSong(i,e){
        // 阻止父元素播放事件发生
        e.stopPropagation()
        // console.log(this.$refs.list[i],i)
        this.song.splice(i,1)
      },
      // 点击div进行播放
      changePlaySong(song,k,e){
        this.playSong(song,k,e);
        this.$parent.playTo(e)
        // 更改播放按钮图标
        // 点击进行播放/点击其他div时当前停止播放
        if(this.$refs.controlSrcPlay[k].src==this.srcPlay){
          // this.$parent.playTo(e)
          for(var i = 0;i<song.length;i++){
            this.$refs.controlSrcPlay[i].src=this.srcPlay
          }
          this.$refs.controlSrcPlay[k].src=this.srcStop;
        }else{
          // 当前切换播放和停止
          this.$parent.playStop(e)
          this.$refs.controlSrcPlay[k].src=this.srcPlay;
        }
        
      },
      // 列表播放按钮播放
      playSong(song,k,e){
        this.$store.state.nowPlay=[];
        // 图片
        // console.log(this.$refs.list[k]+',图片为'+song[k].BroListIgm);
        function create(imgSrc,singSrc,fun){
          var url = new Object();
          url.imgSrc=imgSrc;
          url.singSrc=singSrc;
          url.fun=fun;
          return url;
        }
        var a = create(song[k].BroListIgm,song[k].BsingUrl,'up');
        var b = create(require('../../assets/globalActions/play.png'),'','playTo');
        var c = create(require('../../assets/globalActions/close.png'),'','close');
        this.$store.state.nowPlay.push(a,b,c)
        // console.log(this.$store.state.nowPlay)
        // console.log('../../assets/music/'+this.$store.state.nowPlay[0].singSrc)
      },
      // 获取用户喜欢的歌曲
      getLoveSong(){
        this.axios.get('/loveSong',{params:{uid:sessionStorage.getItem('root')}})
        .then((res)=>{
          // console.log(res.data.result)
          for(var i =0; i<res.data.result.length; i++){
              var app = require('../../assets/broadcast_tab_img/' + res.data.result[i].ABroListImg);
              var pro = {
                BroListid:res.data.result[i].ABroListid,
                BroListName:res.data.result[i].ABroListName,
                BroListType:res.data.result[i].ABroListType,
                BroListDuration:res.data.result[i].ABroListDuration,
                Pcomment:res.data.result[i].APcomment,
                BsingUrl:res.data.result[i].ABsingUrl,
                BroListIgm:app,
              };
              this.song.push(pro);
            };
          // console.log(this.song)
        })
      }
    },
    computed:{
      PlayList(){
        return this.$store.state.PlayList;
      }
    },
    watch:{
      PlayList(val){
        console.log('长度为'+this.$store.state.PlayList.length);
        // 如果传入的ID为1，单加一首歌
        if(this.$store.state.PlayList.length==1){
          var BroListid = this.$store.state.PlayList[0];
          this.axios.get(`/getPlaySong`,{params:{BroListid:BroListid}})
          .then((res)=>{
            // this.song=[];
            // console.log(res.data.result)
            console.log(res.data.result[0].BroListImg)
            var app = require('../../assets/broadcast_tab_img/' + res.data.result[0].BroListImg);
            var pro = {
              BroListid:res.data.result[0].BroListid,
              BroListName:res.data.result[0].BroListName,
              BroListType:res.data.result[0].BroListType,
              BroListDuration:res.data.result[0].BroListDuration,
              Pcomment:res.data.result[0].Pcomment,
              BsingUrl:res.data.result[0].BsingUrl,
              BroListIgm:app,
              // 原图片名称
              oldImg:res.data.result[0].BroListImg
            };
            this.song.push(pro);
            // console.log(this.song[0])
          })
        }else{
          // 点击添加全部，添加所有歌曲
          var BroListidAll = this.$store.state.PlayList;
          this.axios.get('/getPlaySongAll',{params:{BroListidAll:BroListidAll}})
          .then((res)=>{
            console.log(res.data.result);
            this.song=[];
            for(var i =0; i<res.data.result.length; i++){
              var app = require('../../assets/broadcast_tab_img/' + res.data.result[i].BroListImg);
              var pro = {
                BroListid:res.data.result[i].BroListid,
                BroListName:res.data.result[i].BroListName,
                BroListType:res.data.result[i].BroListType,
                BroListDuration:res.data.result[i].BroListDuration,
                Pcomment:res.data.result[i].Pcomment,
                BsingUrl:res.data.result[i].BsingUrl,
                BroListIgm:app,
                // 原图片名称
                oldImg:res.data.result[i].BroListImg
              };
              this.song.push(pro);
            };
            console.log(this.song)
          })
        }
      }
    },
    created(){
      this.getLoveSong()
    },
    components:{
      GlobalActions
    }
}
</script>

<style>
/* BroadcastTab 遮罩层 */
.BroadcastTab{
  position:fixed;
  z-index: 15000;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  overflow-x: hidden;
  overflow-y: visible;
}
.BroadcastTab::-webkit-scrollbar{
  width: 0;
}
/* BroadcastTab-main 表单列表 */
.BroadcastTab .BroadcastTab-main{
  position: relative;
  width: 8.5rem;
  box-sizing: border-box;
  margin: 1rem auto;
  padding: 0.2rem;
  background-color: white;
  border-radius: 0.05rem;
}
/* BroadcastTab-title 头部分 */
.BroadcastTab .BroadcastTab-title{
  width: 100%;
  display: flex;
}
.BroadcastTab .BroadcastTab-title>img{
  height: 100%;
}
/* BroadcastTab-info */
.BroadcastTab-info{
  flex: auto;
  height: 1.8rem;
  display: flex;
  flex-direction: column;
  padding: 0 0.2rem;
  justify-content: space-between;
  margin-bottom: 0.2rem;
}
.BroadcastTab-info>div:first-child{
  display: flex;
  flex-direction: column;
  align-items: flex-start;
}
.BroadcastTab-info>div:first-child>h3{
  margin-bottom: 0.2rem;
  font-size: 0.24rem;
}
.BroadcastTab-info>div:first-child>p{
  text-align: left;
  font-size: 0.14rem;
  color: #8e8e93;
  font-weight: 500;
}
/* BroadcastTab-info-button */
.BroadcastTab-info-button{
  display: flex;
  outline: none;
  width: 100%;
  justify-content: space-between;
}
.BroadcastTab-info-button>div{
  font-size: 0.18rem;
}
.BroadcastTab-info-button>div>button{
  padding: 0;
  height: 0.38rem;
  border-radius: 0.19rem;
  border: 0;
  font-size: 0.16rem;
  font-weight: 500;
  background-color: #f6f6f6;
}
.BroadcastTab-info-button>div:nth-child(1)>button:first-child{
  color: white;
  background-color: #2b2d33;
  margin-right: 0.2rem;
}
.BroadcastTab-info-button>div:nth-child(1)>button:last-child{
  color: black;
}
.BroadcastTab-info-button>div:nth-child(1)>button{
  padding: 0.08rem 0.24rem;
  outline: none;
  cursor: pointer;
}
.BroadcastTab-info-button>div:nth-child(2){
  display: flex;
}
.BroadcastTab-info-button>div:nth-child(2)>button:first-child{
  margin-right: 0.2rem;
}
.BroadcastTab-info-button>div:nth-child(2)>button{
  width: 0.38rem;
  display: flex;
  justify-content: center;
  align-items: center;
  outline: none;
  cursor: pointer;
}
.BroadcastTab-info-button>div>button>img{
  width: 0.20rem;
  height: 0.20rem;
}
/* BroadcastTab-program */
.BroadcastTab-program{
  display: flex;
  justify-content: space-between;
  margin-bottom: 0.2rem;
  border-bottom: 0.01rem solid lightgrey;
  align-items: center;
}
.BroadcastTab-program>a{
  text-decoration: none;
  font-size: 0.16rem;
  padding: 0.2rem 0.05rem;
  border-bottom: 0.01rem solid black;
  color: black;
}
.BroadcastTab-program>p{
  font-size: 0.14rem;
  color: black;
}
/* BroadcastTab-List */
.BroadcastTab-List li>div{
  display: flex;
  margin-bottom: 0.2rem;
}
.BroadcastTab-List li>div>img{
  height: 100%;
}
/* BroadcastTab-List-Info */
.BroadcastTab-List-Info{
  flex: auto;
  padding-left: 0.2rem;
  display: flex;
  justify-content: space-between;
}
.BroadcastTab-List-Info>div:first-child{
  display: flex;
  flex-direction: column;
  justify-content: space-around;
}
.BroadcastTab-List-Info>div:first-child a{
  text-decoration: none;
  color: black;
  font-size: 0.15rem;
}
.BroadcastTab-List-Info>div:first-child>div:first-child{
  font-size: 0.18rem;
}
.BroadcastTab-List-Info>div:first-child>div:last-child{
  display: flex;
}
.BroadcastTab-List-Info>div:first-child>div:last-child>a{
  color: #ff3d1d;
}
.BroadcastTab-List-Info>div:first-child>div:last-child>a,
.BroadcastTab-List-Info>div:first-child>div:last-child>p{
  font-size: 0.12rem;
  margin-right: 0.1rem;
  font-weight: 400;
}
.BroadcastTab-List-Info>div:last-child{
  display: flex;
  align-items: center;
}
.BroadcastTab-List-Info>div:last-child>a{
  display: flex;
  width: 0.3rem;
  height: 50%;
  margin-left: 0.3rem;
  align-items: center;
  justify-content: center;
}
.BroadcastTab-List-Info>div:last-child img{
  width: 0.14rem;
  height: 0.14rem;
}
.out{
  font-size: 0.14rem;
}
.out:hover{
  color: red;
}
.love{
  font-size: 0.14rem;
}
.love:hover{
  color: red;
}
</style>