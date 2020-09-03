import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
// 引入axios
import axios from 'axios'
import VueClipboard from 'vue-clipboard2'

Vue.use(VueClipboard)

//引入顶部搜索框 
import vTop from './components/Top'
Vue.component('v-top',vTop)
// 引入左侧导航栏
import vNav from './components/Nav'
Vue.component('v-nav',vNav)
// 引入右侧评论
import vMymsg from './components/Mymsg'
Vue.component('v-mymsg',vMymsg)
// 引入中间主题内容
import vDhd from './components/MyBody'
Vue.component('v-dhd',vDhd)
// 引入播单推荐
import vBroTab from './components/demo/BroadcastTab'
Vue.component('v-BroTab',vBroTab)
// 引入底部
import vFooter from './components/demo/footer'
Vue.component('v-footer',vFooter)
// 引入播放器
import vGlobalActions from './components/demo/globalActions'
Vue.component('v-global-actions',vGlobalActions)
// 引入播放列表
import vGlobalActionsTab from './components/demo/globalActionsTab'
Vue.component('v-global-actions-tab',vGlobalActionsTab)


axios.defaults.baseURL="http://127.0.0.1:3000"
Vue.prototype.axios = axios
Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
