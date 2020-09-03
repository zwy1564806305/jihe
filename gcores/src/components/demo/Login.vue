<template>
  <div class="session">
    <transition name="pop">
      <div id="huo" v-show="mm">
        <button class="error">用户名或密码错误</button>
      </div>
    </transition>

    <div class="sessionPage">
      <div class="sessionPage_logo">
        <img src="../../assets/login.png" alt />
      </div>
      <div class="sessionPage_input">
        <input
          type="text"
          placeholder="电话/邮箱/用户名"
          class="input1"
          @input="user"
          @blur="username"
          v-model="userName"
          maxlength="8"
        />
        <div v-show="Show">
          <img class="kun" src="../../assets/warn.png" />
          <span>用户名不能为空</span>
        </div>
        <input
          type="password"
          placeholder="密码"
          class="input2"
          @input="pass"
          @blur="password"
          v-model="upwd"
          maxlength="13"
        />
        <div v-show="isShow">
          <img class="kun" src="../../assets/warn.png" />
          <span>密码不能为空</span>
        </div>
      </div>
      <div class="form-group">
        <a href>
          <input type="checkbox" class="remember" />
          <small>记住我</small>
        </a>
        <a tabindex="0" role="button" href="javascript:;">
          <small class="text-fond">找回密码</small>
        </a>
      </div>
      <button type="submit" class="btn" @click="login">登录</button>
      <div class="text-cneter">
        <small>使用社交平台账号登录</small>
        <br />
        <div class="top">
          <router-link to="/register">
            <small>注册账号</small>
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>
<style scoped>
#huo.pop-enter {
  /* 元素进入页面的状态  */
  opacity: 0;
}
#huo.pop-enter-active,
#huo.pop-leave-active {
  /* 进入动画播放过程中的样式 */
  transition: all 3s linear;
}
/* #huo.pop-enter-to {
  /* 元素进入页面后的结束状态
  height: 0.5rem;
  width: 2rem;
  z-index: 666;
  position: absolute;
  top: 0.2rem;
} */
/* #huo.pop-leave {
  /* 开始离开时的起始状态 
  height: 0.5rem;
  opacity: 1;
} */
#huo.pop-leave-to {
  height: 0;
  opacity: 0;
}

.error {
  background-color: #d23430;
  outline: 0;
  border: 0.01rem solid #d23430;
  border-radius: 0.5rem;
  height: 0.5rem;
  width: 2rem;
  position: relative;
  position: absolute;
  top: 0.2rem;
  right: 8.5rem;
  margin: 0 auto;
  color: #fff;
}
.sessionPage_input .kun {
  height: 0.3rem;
  width: 0.3rem;
  z-index: 5;
  margin: -0.35rem 0 0.2rem 2.1rem;
}

span {
  display: block;
  width: 1rem;
  color: #f00;
}
#app {
  display: flex;
}
.session {
  height: 6rem;
  width: 4.7rem;
  border: 0.01rem solid transparent;
  border-radius: 0.08rem;
  margin: 0 auto;
  margin-top: 1.5rem;
  padding: 1.3rem 1rem 1rem 1rem;
  box-sizing: border-box;
  box-shadow: 0 0.1rem 0.5rem rgba(0, 0, 0, 0.4);
}
.sessionPage {
  width: 15%;
  height: 1.5rem;
  position: relative;
  position: absolute;
  font-size: 0.09rem;
}
.sessionPage_logo img {
  height: 0.3rem;
  margin-left: 0.1rem;
}
.sessionPage_input {
  margin: 0.3rem 0.1rem 0.1rem 0.1rem;
}
.input1,
.input2 {
  display: inline-block;
  width: 2rem;
  height: 0.13rem;
  outline: 0;
  border: 0;
  border-bottom: 0.015rem solid #ced4da;
  padding: 0.1rem 0.2rem;
  font-size: 0.14rem;
  background-color: #fff;
  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}
.input2 {
  margin-top: 0.2rem;
}
.form-group {
  display: flex;
  width: 2.3rem;
  justify-content: space-between;
  margin: 0.01rem 0 0.3rem 0.1rem;
}
.form-group a {
  color: #000;
}
.float-right {
  cursor: pointer;
}
.btn {
  margin: -0.1rem 0 0 0.1rem;
  display: block;
  color: #fff;
  width: 2.4rem;
  background-color: #d23430;
  border-color: #d23430;
  outline: 0;
  font-weight: 400;
  text-align: center;
  padding: 0.1rem 0.2rem;
  border-radius: 0.04rem;
  border: 1px solid transparent;
  transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
    border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}
.remember {
  vertical-align: middle;
}
.text-cneter {
  width: 2rem;
  margin: 0.18rem 0 0 0.3rem;
  text-align: center;
  color: #8e8e93;
}
.top {
  margin-top: 0.1rem;
}
.top small {
  color: #8e8e93;
}
.text-fond {
  display: inline-block;
  margin-top: 0.02rem;
}
</style>

<script>
import axios from "axios";
export default {
  name:'v-login',
  data() {
    return {
      isShow: false,
      Show: false,
      upwd: "",
      userName: "",
      mm: "",
    };
  },
  methods: {
    password() {
      if (this.upwd == "") {
        this.isShow = true;
        return false;
      } else {
        this.isShow = false;
        return true;
      }
    },
    username() {
      if (this.userName == "") {
        this.Show = true;
        return false;
      } else {
        this.Show = false;
        return true;
      }
    },
    user() {
      return (this.Show = false);
    },
    pass() {
      return (this.isShow = false);
    },
    login() {
      if (this.username() && this.password()) {
        this.axios
          .post(
            "/login",
            "username=" + this.userName + "&password=" + this.upwd
          )
          .then((res) => {
            if (res.data.code == 0) {
              this.mm = true;
              setTimeout(() => {
                this.mm = false;
              }, 3000);
            } else {
              sessionStorage.setItem('root',res.data.results[0].uid)
              this.$router.push("/");
              // this.$router.go(-1)
            }
          });
      }
    },
  },
};
</script>