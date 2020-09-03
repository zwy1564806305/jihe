<template>
  <div class="mb-5">
    <div v-for="(item,index) in recomment" :key="index">
      <div class="news">
        <img class="newsPage" :src="item.Arimage" />
        <h1>{{item.Artitle}}</h1>
        <p>{{item.ArSubtitle}}</p>
      </div>
      <!--  -->
      <div class="avatar">
        <div class="hover_con" v-show="seen" @mouseleave="leave">
          <div class="hovera">
            <img :src="item.Arimagetwo" alt />
            <p>{{item.Arauthor}}</p>
            <span>565人关注</span>
          </div>
          <div class="hoverb">
            <p>TA的最新发布</p>
            <p>1.Stay in the light,《控制》</p>
            <p>DLC“AWE”开场15分钟游玩演示</p>
            <p>2.THQ Nordic母公司Embracer Group收</p>
            <p>购七家开发商其中包括4A Games</p>
            <p>3.在桌面上狙一把，《狙击精英：桌游</p>
            <p>版》开启众筹</p>
          </div>
          <div class="hoverbt">
            <button>关注</button>
            <button>私信</button>
          </div>
        </div>
        <!--  -->
        <img :src="item.Arimagetwo" @mouseenter="enter" />
        <div class="avatar_text">
          <span>{{item.Arauthor}}</span>
          <span>{{item.Artime}}</span>
          <span>发布于</span>
          <a href="javascript:;">资讯</a>
        </div>
      </div>

      <div class="story">
        <span>在今晚的“火线夜之城”第二期直播活动上，CDPR 带来了全新的《赛博朋克 2077》实机演示。并详细介绍了我们在游戏开场前的身份选择、Refused 乐队如何化身为“武侍乐队”以及游戏中三种不同枪械的详细介绍。</span>
      </div>
      <div class="story_block">
        <span>而流浪者则来自夜之城外围的荒漠，大家曾是流浪者部族或家族的一份子。流浪者永远信奉家人至上，但出于某种原因我们要离开家族前往夜之城混饭吃，而新生活也就此开始。</span>
      </div>
      <div class="story_image">
        <img src="../../assets/remmden/2b26fc12-629d-488d-a784-28c62afed9cf.jpg" />
      </div>
      <div class="story_image">
        <img src="../../assets/remmden/537b3abf-656d-4929-bc22-5157c2f94b9a.jpg" />
      </div>
      <div class="story_block">
        <span>最后，就是看着十分帅气的公司员工出身了，如果我们选择这个身份，基本就代表和夜之城的街头生活以及荒漠生活绝缘。但相反，我们将进入另一个战场，大家需要在供职的企业中一层一层地往上爬。在这样的经历中，我们能够听出人们的言外之意、能察言观色甚至能“阅读人心”。凭着这样的本事，我们在未来能够遇到的机会肯定也够多。</span>
      </div>
      <div class="story_image">
        <img src="../../assets/remmden/eb11716e-25bc-4e2c-b2ce-65b4d65c5a9d.jpg" alt />
      </div>
      <div class="story_block">
        <span>CDPR 表示，希望能把《赛博朋克 2077》打造成一款纯正的 RPG 游戏，我们在游戏中从头到尾都将扮演这一个角色。而人物的出身则会贯穿整个流程，不会仅仅影响序章的内容与玩法。官方通过举例来展示不同身份在对话中会多出的额外选项。</span>
      </div>
      <div class="story_block">
        <span>随后官方介绍了一下“恶土”，也就是流浪者的老家。恶土是环绕在夜之城之外的广袤区域，大家在游玩的过程中可以随时过去溜达溜达。当我们选择流浪者出身时，能在天边远远地看到夜之城。虽然大家可以随时去恶土“游玩”，但你未必敢去——对于游戏初期来说，恶土十分凶险。这里爆发过多场战争后来又遇到全球变暖，你在这里遇到的人无一例外都是身经百战的强者。当然了，游戏中也会讲述他们的故事。而且不仅仅是这些游荡在废土上的人们，游戏中还有更多跟赛博朋克题材相关的故事。</span>
      </div>
      <div class="story_image">
        <img src="../../assets/remmden/0d40b9dc-33c0-4371-8b9a-6523980e5b5b.jpg" />
      </div>
      <div class="story_image">
        <img src="../../assets/remmden/3e798ac2-dda1-42fb-b1d4-955cd3c7e3b7.jpg" />
      </div>
      <div class="story_block">
        <span>接下来详细介绍的人物名为“神父”，他是玩家跟夜之城之间的“中间人”。他和中介十分相似：如果谁有钱，想找人「平事儿」，他们首先就会去找中间人，比如神父；然后中间人就会去找能平事的人，比如说 V。</span>
      </div>
      <div class="story_block">
        <span>值得一提的是，中间人的地盘观念很强：神父干的是海伍德的买卖，而作为街头小子出身的 V 就在这长大，从小你就认识他。而另一位中间人大家在游戏中会更熟悉，他叫德克斯特·德肖恩，他做的是夜之城其他地方的生意。即使你选择其他出身，早晚也会碰上神父；只要你想赚钱，找神父肯定没问题的。</span>
      </div>
      <div class="story_image">
        <img src="../../assets/remmden/155594ac-1e96-4165-a143-d61598b33d58.jpg" />
      </div>
      <div class="story_image">
        <img src="../../assets/remmden/e145c94d-21a7-49a2-990e-3c3cd8e9366d.jpg" />
      </div>
      <div class="story_block">
        <span>当大家在夜之城里四处闲逛时，音乐是最不可缺少的内容。在未来的节目中，官方将细细分享游戏里的电台和原创音乐等信息。今天先看看 Refused 乐队是如何塑造强尼·银手的乐队 “武侍”的。现在已经有三首武侍乐队的歌可以在一些线上频道听到，分别是“Chippin' in”、“Never fade away”和“The Ballad of Buck Ravers”。另外官方将于稍后上线第四首歌“A Like Supreme”。</span>
      </div>
      <div class="story_image">
        <img src="../../assets/remmden/a8ea579d-f934-41b1-aa66-1efdc856d4be.jpg" />
      </div>
      <div class="story_block">
        <span>最后，官方带来了《赛博朋克 2077》武器的讲解。《赛博朋克 2077》作为一款 RPG 内核的游戏，通过很多战斗方式来把射击元素融合到一起。游戏中包含近战武器、远程武器、有攻击性的赛博义体，也有防御性的赛博义体和护甲等等装备。直播中官方针对枪械进行了讲解：首先枪械在《赛博朋克 2077》中共分为3大类：动能武器、技术武器和智能武器。其中动能武器和现在的枪械十分类似，但在2077中，动能武器可以“跳弹攻击”。即使目标躲藏在掩体后也能命中。</span>
      </div>
      <div class="story_block">
        <span>而技术武器主要是利用电磁能量来将全金属弹药推动到极速，来打穿掩体或是墙壁。智能武器会使用跟踪导弹技术来实时追踪打击目标。即使对方躲闪、逃走也会被击中，或者也可以用来击中躲在掩体后面的人。</span>
      </div>
      <div class="story_image">
        <img src="../../assets/remmden/6c82443f-1cd5-4e36-be00-bdf7aa3800a2.jpg" />
      </div>
      <div class="story_block">
        <span>随着玩家在游戏中不断展开冒险，我们的主角 V 会从一个不起眼的佣兵成长为夜之城的传奇，而 V 对武器的使用也会愈发娴熟。具体体现就是换弹速度会加快、瞄准速度和射击精度会提升、使用武器时移动得更快等等。随着大家使用枪械越来越熟练，也就能有空闲来进行一些其他的操作以应对更多挑战。</span>
      </div>
      <div class="story_image">
        <img src="../../assets/remmden/a12b9dd0-4d77-4448-ad32-776a92f3dfc7.jpg" />
      </div>
      <div class="story_block">
        <span>然后问题就来了：我们怎么从夜之城里搞到更多的武器？官方表示，除了能在军火商的品类目录中买到很多武器外，大家能拿到的最好的武器都是从敌人手里抢来的。或者探索夜之城，从隐秘的角落里发现武器。而且 CDPR 表示，武器会有四个等级：普通、精良、稀有和传奇。武器越稀有其威力就会越大。不过传奇武器会拥有独一无二的能力，但这些武器都会在其主人手上。他们都是有血有肉的角色，是不是要干掉他们，就看你的选择了。</span>
      </div>
      <div class="story_image">
        <img src="../../assets/remmden/8bbfa042-6908-4f26-9765-f81349900029.jpg" />
      </div>
      <div class="story_block">
        <span>另外武器也包含改造系统，游戏中的改造主要分两个类型。一个就是常规的改造官方称其为挂件，例如瞄准镜或是消音器等，这些挂件能够提升属性数值，为我们在战斗中带来更多胜利的可能；另一种则是软件改造，这是一种安装在武器中的小芯片，插件可以提升武器的数值，包括提高伤害、精准度和射速等，部分插件还能使枪械发生质变，例如可以获得非杀伤性弹药或者可以更快地打穿护甲的生化弹药等。</span>
      </div>
      <div class="story_image">
        <img src="../../assets/remmden/9a6e1d7a-7be8-42ba-ab54-359b0314968b.jpg" />
      </div>
      <div class="story_image">
        <img src="../../assets/remmden/d3f5671c-a879-4a0a-aedb-91ca04aa9daf.jpg" alt />
      </div>
      <div class="story_block">
        <span>随后官方还介绍了来自海啸防御系统生产的“猫又”技术狙击步枪，它可以轻松打穿墙壁。而在近距离战斗时，大家可以选用由平价火力生产的霰弹枪“杀戮”，还有来自康陶公司生产的卓式智能霰弹枪，它有八个枪管，可以独立追踪八个不同的目标。</span>
      </div>
      <div class="story_block">
        <span>以上就是本期“火线夜之城”的全部内容，让我们期待下期节目能带来怎样的精彩。</span>
      </div>
      <div class="col-12">
        <a href="javascript:;">
          <img src="../../assets/remmden/39037888-dc69-4596-bef4-68a8827e2009.jpg" />
          <h3>赛博朋克2077</h3>
          <svg
            t="1597159615393"
            class="icon"
            viewBox="0 0 1024 1024"
            version="1.1"
            xmlns="http://www.w3.org/2000/svg"
            p-id="8558"
            width="32"
            height="32"
          >
            <path
              d="M418.986667 738.133333l226.133333-226.133333-226.133333-226.133333a21.333333 21.333333 0 0 1 30.293333-29.866667l241.493333 241.493333a21.333333 21.333333 0 0 1 0 30.293334L449.28 768a21.333333 21.333333 0 0 1-30.293333-30.293333z"
              p-id="8559"
              fill="#a6b4f6"
            />
          </svg>
        </a>
      </div>
      <div class="row">
        <a href="javascript:;">游戏</a>
        <a href="javascript:;">Xbox Series X</a>
        <a href="javascript:;">PlayStation 5</a>
      </div>
      <div class="mt-5">
        <div class="text-nowrap">
          <a href="javascript:;" class="original">
            <svg
              t="1597287064016"
              class="icon"
              viewBox="0 0 1024 1024"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              p-id="13137"
              width="18"
              height="18"
            >
              <path
                d="M884.875894 423.143253 646.970506 423.143253c92.185562-340.464205-63.516616-357.853247-63.516616-357.853247-65.993017 0-52.312436 52.182476-57.3031 60.881602 0 166.502152-176.849824 296.971645-176.849824 296.971645l0 472.171899c0 46.607504 63.516616 63.393819 88.433098 63.393819l357.452111 0c33.641191 0 61.036122-88.224344 61.036122-88.224344 88.434122-300.70569 88.434122-390.177444 88.434122-390.177444C944.657442 418.179195 884.875894 423.143253 884.875894 423.143253L884.875894 423.143253 884.875894 423.143253zM884.875894 423.143253"
                p-id="13138"
              />
              <path
                d="M251.671415 423.299819 109.214912 423.299819c-29.420053 0-29.873378 28.89612-29.873378 28.89612l29.420053 476.202703c0 30.309306 30.361495 30.309306 30.361495 30.309306L262.420223 958.707948c25.686009 0 25.458835-20.049638 25.458835-20.049638L287.879058 459.411271C287.879058 422.837284 251.671415 423.299819 251.671415 423.299819L251.671415 423.299819 251.671415 423.299819zM251.671415 423.299819"
                p-id="13139"
              />
            </svg>
            <span>93</span>
          </a>
          <a href="javascript:;" class="original">
            <svg
              t="1597287019398"
              class="icon"
              viewBox="0 0 1024 1024"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              p-id="12223"
              width="18"
              height="18"
            >
              <path
                d="M224 992 544 704 864 992 864 95.744C864 60.736 835.488 32 800.288 32L287.712 32C252.736 32 224 60.544 224 95.744L224 992Z"
                p-id="12224"
              />
            </svg>
            <span>42</span>
          </a>
        </div>
        <div class="cricle">
          <a href="javascript:;">
            <svg
              t="1597160100559"
              class="icon"
              viewBox="0 0 1024 1024"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              p-id="13338"
              width="16"
              height="16"
            >
              <path
                d="M182.272 778.752c-1.536 0-3.072 0-4.608-0.512-17.408-2.56-29.696-18.432-27.648-35.84 15.872-148.992 68.608-259.072 156.16-327.68 62.976-49.664 142.848-77.312 237.056-82.432l19.456-1.024V225.28c0-41.984 38.4-51.2 58.88-30.72l239.104 243.2c30.208 30.72 28.672 62.464-1.536 93.184L626.176 768c-24.576 24.576-63.488 9.728-63.488-25.088V629.248h-24.064c-87.552 0-246.784 17.408-330.24 134.656-5.12 9.728-15.36 14.848-26.112 14.848z"
                fill="#8a8a8a"
                p-id="13339"
              />
            </svg>
          </a>
        </div>
      </div>
    </div>
  </div>
</template>
<style scoped>
.hover_con {
  position: absolute;
  bottom: 0.35rem;
  left: -1rem;
  background: #fff;
  width: 2.5rem;
  height: 3.6rem;
}
.hoverbt {
  height: 0.4rem;
  width: 2.4rem;
  display: flex;
  margin-bottom: 0.1rem;
  justify-content: space-between;
}
.hoverbt button {
  width: 1rem;
  height: 0.35rem;
  background: #fff;
  outline: 0;
  border: 0.01rem solid #000;
  border-radius: 0.04rem;
}
.hoverbt button:hover {
  background: #333;
  color: #fff;
  cursor: pointer;
}
.hoverb {
  width: 2.4rem;
  font-size: 0.13rem;
  border-bottom: 0.01rem solid #ddd;
  margin-bottom: 0.1rem;
}
.hoverb p:not(:first-child):hover {
  text-decoration: underline;
  cursor: pointer;
}
.hoverb p:first-child {
  font-weight: 600;
  margin-bottom: 0.1rem;
}
.hovera {
  height: 1.14rem;
  width: 2.4rem;
  text-align: center;
  margin-bottom: 0.1rem;
  border-bottom: 0.01rem solid #ddd;
  margin-top: 0.1rem;
  font-size: 0.14rem;
}
.hovera p {
  font-weight: 600;
}
.hovera span {
  font-size: 0.12rem;
  margin-left: 0.1rem;
}
.hovera .hover_con {
  width: 2.6rem;
  height: 3.57rem;
  padding: 0.1rem;
  background-color: #fff;
}
.mb-5 {
  box-sizing: border-box;
  font-family: PingFangSC, Open Sans, Helvetica Neue, Arial, Hiragino Sans GB,
    Microsoft YaHei, WenQuanYi Micro Hei, sans-serif;
  font-size: 0.16rem;
  font-weight: 400;
  line-height: 1.5;
  color: #323232;
  text-align: left;
  margin: 0 26.5%;
}
.newsPage {
  display: block;
  width: 95%;
  background: #ddd;
  border-radius: 0.04rem;
  border-style: none;
  margin: 0.48rem auto;
  margin-bottom: 0.48rem;
  margin-top: 0.48rem;
}
.news h1 {
  font-size: 0.32rem;
  font-weight: 600;
  width: 90%;
  color: #333;
  line-height: 0.32rem;
  margin-bottom: 0.12rem;
  background: transparent;
}
.news p {
  color: #5a5a5a;
  margin-top: 0;
  margin-bottom: 0.16rem;
}
.avatar {
  position: relative;
}
.avatar img {
  width: 0.44rem;
  height: 0.44rem;
  border-radius: 50%;
  background: #ddd;
  cursor: pointer;
}
.avatar img:hover {
  opacity: 0.8;
}
.avatar span {
  line-height: 0.22rem;
  margin-right: 0.12rem;
}
.avatar a {
  font-size: 0.15rem;
  color: #f00;
}
.avatar_text {
  margin-left: 0.6rem;
  margin-top: -0.4rem;
}
.story {
  text-align: justify;
  line-height: 1.8;
  margin: 0.5rem 0;
  /* width: 85%; */
}
.vjs {
  position: relative;
}
.vjs img {
  width: 85%;
}
.vjs button {
  outline: 0;
  background: transparent;
  border: 0;
  position: absolute;
  left: 3.4rem;
  top: 1.9rem;
}
.vjs span img {
  height: 0.6rem;
  width: 0.6rem;
  cursor: pointer;
}
.story_caption {
  text-align: center;
  font-size: 0.12px;
  color: #5a5a5a;
  width: 40%;
  display: block;
  margin: 0.03rem 2rem 0.5rem;
  text-decoration: none;
}
.story_block {
  margin: 0.5rem 0 0.5rem 0;
  /* width: 85%; */
  font-size: 0.16rem;
  line-height: 1.8;
  font-family: inherit;
}
.video-player img {
  width: 85%;
}
.story_image {
  margin: 0.4rem 0.36rem 0.4rem;
}
.story_image img {
  display: block;
  border-radius: 0.04rem;
}
.col-12 {
  width: 85%;
  padding-right: 0.15rem;
  padding-left: 0.15rem;
  background-color: #eef2fb;
  display: flex;
  position: relative;
  border-radius: 0.04rem;
}
.col-12 img {
  flex: 0 0 auto;
  width: 0.81rem;
  height: 0.38rem;
  border-radius: 0.04rem;
  object-fit: cover;
  margin: 0.1rem 0 0 0;
}
.col-12 h3 {
  position: absolute;
  bottom: 0.12rem;
  left: 1.1rem;
  font-size: 0.14rem;
  color: #2f54eb;
}
.col-12 svg {
  position: absolute;
  right: 0.1rem;
  top: 0.1rem;
}
.row a {
  color: #464646;
  display: inline-block;
  font-size: 0.14rem;
  margin: 0.2rem 0.2rem 0.1rem 0;
  padding: 0.1rem 0.12rem;
  background-color: #f6f6f6;
  line-height: 1;
  white-space: nowrap;
  border-radius: 0.04rem;
}
.row a:hover {
  opacity: 0.85;
}
.mt-5 {
  margin-top: 0.48rem;
  display: flex;
  justify-content: space-between;
  width: 85%;
}
.text-nowrap {
  white-space: nowrap;
}
.original {
  display: inline-block;
  padding: 0.1rem 0.27rem;
  height: 0.1rem;
  border-radius: 0.01rem;
  font-size: 0.15rem;
  line-height: 1;
  text-align: center;
  font-weight: 600;
  background: #f6f6f6;
  color: #5a5a5a;
  margin-right: 0.16rem;
  margin-bottom: 0.3rem;
}
.text-nowrap svg {
  margin-right: 0.15rem;
  vertical-align: middle;
}
.cricle {
  margin-left: 0.1rem;
}
</style>
<script>
import axios from "axios";
// import ccc from "../../mock-server/content";
export default {
  name: "v-content",
  data() {
    return {
      Arid: '',
      seen: false,
      recomment: [],
    };
  },
  methods: {
    // 获取id
    getId(){
      this.Arid=Number(this.$route.query.id)
      console.log(this.Arid)
    },
    enter() {
      this.seen = true;
    },
    leave: function () {
      this.seen = false;
    },
  },
  mounted() {
    // this.axios.get("/content", { params: { Arid: this.Arid } }).then((res) => {
    //   this.recomment = res.data.results;
    //   // console.log(this.recomment);
    // });
    this.getId()
  },
  watch:{
    Arid(){
      this.axios.get("/content", { params: { Arid: this.Arid } }).then((res) => {
      this.recomment = res.data.results;
    });
    }
  }
};
</script>