// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import axios from 'axios' //异步请求，后台通信

import App from '@/App' //初始模板
import router from '@/router' //路由
import store from '@/store' //状态处理,组件通信

import 'iview/dist/styles/iview.css';

import '../static/jquery-ui-1.12.1/jquery-ui.min.js'
import '../static/bootstrap/css/bootstrap.min.css' //bootstrap框架
import '../static/bootstrap/js/bootstrap.min.js'
import '../static/font-awesome-4.7.0/css/font-awesome.min.css' //图标库

import '@/assets/css/common.css' //公共样式
import utils from '@/utils/utils.js' //封装的类
import storage from '@/utils/storage.js' //封装的类
import global_ from '@/utils/global' //全局常量

// import 'bootstrap/dist/css/bootstrap.min.css'
// import 'bootstrap/dist/js/bootstrap.min.js'
// import '@/assets/js/public.js'
import iView from 'iview';
Vue.use(iView); //不使用按需加载时



axios.defaults.baseURL = global_.BASE_URL
Vue.config.productionTip = false
Vue.prototype.$http = axios

Vue.prototype.$global = global_
Vue.prototype.$utils = utils
Vue.prototype.$storage = storage

/* eslint-disable no-new */
new Vue({
    el: '#app',
    router,
    store,
    components: {
        App
    },
    template: '<App/>'
})
