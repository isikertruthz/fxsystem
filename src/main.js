// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from '@/App' //初始模板

import router from '@/router'  //路由
import store from '@/store'  //状态处理,组件通信
import axios from 'axios'	//异步请求，后台通信

import $ from 'jquery'
import '@/assets/jquery-ui-1.12.1/jquery-ui.min.js'
import '@/assets/bootstrap/css/bootstrap.min.css'  //bootstrap框架
import '@/assets/bootstrap/js/bootstrap.min.js'
import '@/assets/font-awesome-4.7.0/css/font-awesome.css'  //图标库

import '@/assets/common.css' //公共样式
import utils from '@/utils/utils.js'  //封装的类
import storage from '@/utils/storage.js'  //封装的类
import global_ from '@/constants/global'  //全局常量

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
  components: { App },
  template: '<App/>'
})
