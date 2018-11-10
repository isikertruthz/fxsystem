<template>
    <div class="page">
        <div class="login-content">
            <div class="login-logo">
                <h3 style="line-height:50px; padding:12px 0; font-size:28px;">企泰科技分销系统</h3>
                <img src="http://localhost/images/img/qcode.png" style="height:150px;width:150px;margin-bottom:15px;">
                <h4>扫一扫加入官方公众号立即体验</h4>
            </div>
            <div class="login">
                <img src="http://localhost/images/img/logo-new.png" style="margin:38px 0 25px 0">
                <form class="bs-example bs-example-form" role="form">
                    <div class="input-group input-width">
                        <span class="input-group-addon"><label class="fa fa-user-circle-o"></label></span>
                        <input id="user" @keyup.enter="toPassword()" type="text" class="form-control in-height" placeholder="登录账号" v-model="user">
                    </div>
                    <div class="input-group input-width">
                        <span class="input-group-addon"><label class="fa fa-key"></label></span>
                        <input id="password" type="password" autocomplete="off" class="form-control in-height" placeholder="登录密码" @keyup.enter="login()" v-model="password">
                    </div>
                </form>
                <button class="btn btn-default btn-lg btn-block input-width in-height" style="background-color:#4788f4;width:80%;color:white;line-height:20px" @click='login'>登录</button>
                <div class="text-left" style="padding:0 36px;color:#555;fon-size:12px;"><span style="cursor:pointer;font-size:12px;float:left">忘记密码</span><span style="color:red;font-size:12px;float:right">{{msg}}</span></div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            user: "",
            password: "",
            msg: ""
        }

    },
    methods: {
        login() {
            if (this.user == "" || this.password == "") {
                this.msg = "请输入正确的账号或密码"
                return
            } else {
                this.msg = ""
            }
            var info = [this.user, this.password];
            let that = this
            this.$http.post("api/main.php?ywtype=10001", info).then(response => {
                if (response.data[0].count == 1) {
                    sessionStorage.setItem("user", this.user)
                    sessionStorage.setItem("isLogin", 1)
                    that.$router.push({ path: "/admin" });
                } else {
                    this.msg = "账号不存在或密码错误"
                }
            })
        },
        toPassword() {
            $("#password").focus();
        }
    },
    mounted: function () {
        let isLogin = sessionStorage.getItem("isLogin")
        if (isLogin == null) {
            sessionStorage.setItem("isLogin", 0)
        }
        $("#user").focus();

    }
}
</script>
