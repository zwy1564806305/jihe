<template>
  <div class="session">
    <transition name="pop">
      <div id="huo" v-show="ycz">
        <button class="error">用户名已存在</button>
      </div>
    </transition>

    <div class="sessionPage">
      <div class="sessionPage_logo">
        <img src="../../assets/login.png" alt />
      </div>
      <div class="sessionPage_input">
        <label>
          <input
            type="text"
            placeholder="昵称"
            class="input1"
            v-model="name"
            @blur="checkname"
            @focus="nc"
            maxlength="12"
          />
          <div class="hide none" v-show="n">
            <img class="warn" src="../../assets/warn.png" />
            <span>{{h}}</span>
          </div>
        </label>

        <label>
          <input
            type="text"
            placeholder="手机号"
            class="input1"
            v-model="phone"
            @blur="checkphone"
            maxlength="11"
            @focus="sjh"
          />
          <div class="hide none1" v-show="n1">
            <img class="warn" src="../../assets/warn.png" />
            <span>{{h1}}</span>
          </div>
        </label>

        <label>
          <input
            type="password"
            placeholder="密码"
            class="input2"
            v-model="pass"
            @input="eass"
            @blur="checkpass"
            @focus="mm"
          />
          <div class="hide none2" v-show="n2">
            <img class="warn" src="../../assets/warn.png" />
            <span>{{h2}}</span>
          </div>
        </label>
      </div>
      <div class="form-group">
        <a href="javascript:;">
          <label>
            <input type="checkbox" class="remember" v-model="isAgree" />
            <small>同意</small>
          </label>
        </a>
        <a tabindex="0" role="button" href="javascript:;" style="outline: 0;">
          <small class="text-fond">《机核用户使用协议》</small>
        </a>
      </div>
      <input
        type="button"
        class="btn"
        :class="{btnBg:btnState}"
        value="注册"
        style="cursor:pointer;"
        :disabled="isAgree==false"
        @click="handle"
      />
      <div class="text-cneter">
        <small style="cursor:pointer;">使用社交平台账号登录</small>
        <br />
        <div class="top">
          <router-link to="/login">
            <small>已有账号？</small>
            <small>登录</small>
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

.sessionPage_input img {
  height: 0.3rem;
  width: 0.3rem;
  z-index: 5;
}
.sessionPage_input .warn {
  margin: -0.13rem 0 0 1.9rem;
}
.hide {
  z-index: 99;
  position: relative;
  position: absolute;
}
.hide.none {
  right: 8.1rem;
  top: 3.6rem;
}
.hide.none1 {
  right: 8.1rem;
  top: 4.2rem;
}
.hide.none2 {
  right: 8.1rem;
  top: 4.8rem;
}
span {
  display: block;
  width: 2.55rem;
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
  margin-bottom: 0.25rem;
  border-bottom: 0.015rem solid #ced4da;
  padding: 0.1rem 0.2rem;
  font-size: 0.14rem;
  background-color: #fff;
  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}
/* .input2 {
  margin-top: 0.2rem;
} */
.form-group {
  /* display: flex; */
  font-size: 0.14rem;
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
  background-color: #d234;
  border-color: #d234;
  outline: 0;
  font-weight: 400;
  text-align: center;
  padding: 0.1rem 0.2rem;
  border-radius: 0.04rem;
  border: 1px solid transparent;
  transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
    border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}
.btnBg {
  /* background-color: #d234;
  border-color: #d234;*/
  background-color: #d23430;
  border-color: #d23430;
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
  font-weight: 800;
}
</style>
<script>
import axios from "axios";
export default {
  data() {
    return {
      //控制登录按钮的勾选
      isAgree: false,
      n: false,
      n1: false,
      n2: false,
      h: "",
      h1: "",
      h2: "",
      name: "",
      phone: "",
      pass: "",
      ycz: "",
    };
  },
  methods: {
    nc() {
      this.n = false;
      this.h = "";
    },
    sjh() {
      this.n1 = false;
      this.h1 = "";
    },
    mm() {
      this.n2 = false;
      this.h2 = "";
    },
    // easy() {
    //   let name = this.name;
    //   let username = /^[A-Za-z]{1,6}$/;
    //   let username1 = /^([A-Za-z]|[0-9]){4,6}$/;
    //   if (username.test(name)) {
    //     this.n = true;
    //     this.h = "用户名难度过低";
    //     return false;
    //   } else if (username1.test(name)) {
    //     this.n = true;
    //     this.h = "用户名难度适中";
    //     return false;
    //   } else {
    //     this.n = false;
    //     this.h = "";
    //     return true;
    //   }
    // },
    checkname() {
      let name = this.name;
      let userRegExp = /^[A-Za-z]\w{5,12}$/;
      if (userRegExp.test(name)) {
        this.n = false;
        this.h = "";
        return true;
      } else if (name == "") {
        this.n = true;
        this.h = "用户名不能为空";
        return false;
      } else {
        this.n = true;
        this.h = "请输入6~12位字母或数字不能以数字开头";
        return false;
      }
    },
    checkphone() {
      let phone = this.phone;
      let phoneRegExp = /^1[3-9]\d{9}$/;
      if (phoneRegExp.test(phone)) {
        this.n1 = false;
        this.h1 = "";
        return true;
      } else if (phone == "") {
        this.n1 = true;
        this.h1 = "电话号码不能为空";
        return false;
      } else {
        this.n1 = true;
        this.h1 = "请输入正确的手机号码格式";
        return false;
      }
    },
    eass() {
      let pass = this.pass;
      let pwd = /^[A-Za-z]{1,6}$/;
      let pwd1 = /^([A-Za-z]|[0-9]){4,6}$/;
      if (pwd.test(pass)) {
        this.n2 = true;
        this.h2 = "密码程度多低";
        return false;
      } else if (pwd1.test(pass)) {
        this.n2 = true;
        this.h2 = "密码程度适中";
        return false;
      } else {
        this.n2 = false;
        this.n2 = "";
        return true;
      }
    },
    checkpass() {
      let pass = this.pass;
      let passRegExp = /^[0-9A-Za-z]{6,12}$/;
      if (passRegExp.test(pass)) {
        this.n2 = false;
        this.h2 = "";
        return true;
      } else if (pass == "") {
        this.n2 = true;
        this.h2 = "密码不能为空";
        return false;
      } else {
        this.n2 = true;
        this.h2 = "请输入6位以上的字母或数字";
        return false;
      }
    },
    handle() {
      if (this.checkname() && this.checkphone() && this.checkpass()) {
        this.axios
          .post(
            "/register",
            `username=${this.name}&password=${this.pass}&phone=${this.phone}`
          )
          .then((res) => {
            console.log(res);
            if (res.data.code == 0) {
              //注册失败
              this.ycz = true;
              setTimeout(() => {
                this.ycz = false;
              }, 3000);
            } else {
              //注册成功
              this.$router.push("/login");
            }
          });
      }
    },
  },
  computed: {
    btnState() {
      return this.isAgree != false;
    },
  },
};
</script>