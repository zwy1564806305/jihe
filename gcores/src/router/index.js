import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'

// 自己写的页面
import Vidio from '../components/demo/vidio.vue'
import Footer from '../components/demo/footer.vue'
import specialSmall from '../components/demo/specialSmall.vue'
import MainBanner from '../components/demo/MainBanner.vue'
import Setting from '../components/demo/setting.vue'
import GlobalActions from '../components/demo/globalActions.vue'
import Login from '../components/demo/Login.vue'
import Register from '../components/demo/Register.vue'
import RealTime from '../components/demo/RealTime.vue'
import Nav from '../components/Nav.vue'
import Top from '../components/Top.vue'
import Broadcast from '../components/Broadcast.vue'

// 汇总页面
// 咨讯
import NewsRouter from '../views/newsRouter.vue'
// 文章
import ArticleRouter from '../views/articleRouter.vue'
// 播单
import BroadcastRouter from '../views/broadcastRouter.vue'
// 专题
import SpecialRouter from '../views/specialRouter.vue'
// 个人中心
import SelfRouter from '../views/selfRouter.vue'
// 游戏折扣
import GameRouter from '../views/gameRouter.vue'
// 搜索
import SearchRouter from '../views/searchRouter.vue'
// 游戏页面
import GamesRouter from '../views/gamesRouter.vue'
// 未完成
import Unfinsh from '../views/unfinsh.vue'
// 详情页1
import DetailsOneRouter from '../views/detailsOneRouter.vue'
// 详情页2
import DetailsTwoRouter from '../views/detailsTwoRouter.vue'

Vue.use(VueRouter)

  const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  // 咨讯
  {
    path: '/newsRouter',
    name: 'newsRouter',
    component: NewsRouter
  },
  // 文章
  {
    path: '/articleRouter',
    name: 'articleRouter',
    component: ArticleRouter
  },
  // 播单
  {
    path: '/broadcastRouter',
    name: 'broadcastRouter',
    component: BroadcastRouter
  },
  // 专题
  {
    path: '/specialRouter',
    name: 'specialRouter',
    component: SpecialRouter
  },
  // 个人中心
  {
    path: '/selfRouter',
    name: 'selfRouter',
    component: SelfRouter
  },
  // 游戏中心
  {
    path: '/gameRouter',
    name: 'gameRouter',
    component: GameRouter
  },
  // 搜索
  {
    path: '/searchRouter',
    name: 'searchRouter',
    component: SearchRouter
  },
  // 游戏页面
  {
    path: '/gamesRouter',
    name: 'gamesRouter',
    component: GamesRouter
  },
  // 未完成
  {
    path: '/unfinsh',
    name: 'unfinsh',
    component: Unfinsh
  },
  // 详情页1
  {
    path: '/detailsOneRouter',
    name: 'detailsOneRouter',
    component: DetailsOneRouter
  },
  // 详情页2
  {
    path: '/detailsTwoRouter',
    name: 'detailsTwoRouter',
    component: DetailsTwoRouter
  },
  {
    path:'/vidio',
    name:'Vidio',
    component:Vidio
  },
  {
    path:'/footer',
    name:'Footer',
    component:Footer
  },
  {
    path:'/specialSmall',
    name:'specialSmall',
    component:specialSmall
  },
  {
    path:'/mainBanner',
    name:'MainBanner',
    component:MainBanner
  },
  {
    path:'/nav',
    name:'Nav',
    component:Nav
  },
  {
    path:'/top',
    name:'Top',
    component:Top
  },
  {
    path:'/setting',
    name:'Setting',
    component:Setting
  },
  {
    path:'/broadcast',
    name:'Broadcast',
    component:Broadcast
  },
  {
    path:'/globalActions',
    name:'GlobalActions',
    component:GlobalActions
  },
  {
    path:'/realTime',
    name:'RealTime',
    component:RealTime
  },
  {
    path:'/login',
    name:'Login',
    component:Login
  },
  {
    path:'/register',
    name:'Register',
    component:Register
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  }
]

const router = new VueRouter({
  routes
})

export default router
