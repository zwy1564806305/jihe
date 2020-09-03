import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    // 通知栏信息
    msg_show:false,
    reduce:false,
    // 点击的图片
    BroadcastListNum:0,
    // 头列表
    BroadcastTab:[],
    // 小列表
    BroadcastList:[],
    // 播单显示，隐藏
    BroadcastTabShow:false,
    // 播放列表
    PlayList:[],
    // 播放列表显示隐藏
    globalActionsListShow:false,
    // 播放器默认内容
    nowPlay:[{imgSrc:require("../assets/music/musicLogo.png"),singSrc: "dxh.mp3",fun:'up'},{imgSrc:require("../assets/globalActions/play.png"),fun:'playTo'},{imgSrc:require("../assets/globalActions/close.png"),fun:'close'}],
    type:'首页',
    // 头像
    avatar:"data:image/png;base64,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"
  },
  getters:{
    getReduce(state){
      return state.reduce;
    },
    getBroadcastTab(state){
      return state.BroadcastTab;
    },
    getBroadcastList(state){
      return state.BroadcastList;
    },
    getBroadcastTabShow(state){
      return state.BroadcastTabShow;
    },
    getPlayList(state){
      return state.PlayList;
    },
    getMsg_show(state){
      return state.msg_show;
    }
  },
  mutations: {
    // changeAvatar(state){
    //   this.axios.get('/setting',{params:{uid:this.uid}})
    //   .then((res)=>{
    //     state.avatar=res.data.result[0].avatar
    //   })
    // },
    setReduce(state){
      if(state.reduce==true){
        state.reduce=false;
      }else{
        state.reduce=true;
      }
    },
    // 设置为第几张轮播
    setBroadcastListNum(state,temp){
      state.BroadcastListNum = temp.BroadcastListNum
    },
    // 是否显示播单列表
    setBroadcastTabShow(state){
      if(state.BroadcastTabShow == true){
        state.BroadcastTabShow = false;
      }else{
        state.BroadcastTabShow = true;
      }
    },
    setBroadcastTab(state,temp){
      state.BroadcastTab = temp.BroadcastTab
    },
    setBroadcastList(state,temp){
      state.BroadcastList = temp.BroadcastList;
    },
    // 清空小列表
    clearBroadcastList(state){
      state.BroadcastList = [];
    },
    // 添加到播放列表
    addToPlayList(state,temp){
      state.PlayList.push(temp.BroListid);
      // console.log(state.PlayList);
    },
    setMsg_show(state){
      if(state.msg_show==true){
        state.msg_show=false;
      }else{
        state.msg_show=true;
      }
    },
    change_page(state,payload){
      state.type = payload;
      // console.log(state.type)
    },
    // 是否显示播放列表
    global_actions_list(state){
      if(state.globalActionsListShow == true){
        state.globalActionsListShow = false;
      }else{
        state.globalActionsListShow = true;
      }
    }
  },
  actions: {
  },
  modules: {
  }
})
