import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
// import FXSysytem from '@/views/fx_index'
import DianPu from '@/components/Dianpu'

import '@/assets/font-awesome-4.7.0/css/font-awesome.css'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
    },
    {
      path: '/dianpu',
      name: 'dianpu',
      component: DianPu
    }
  ]
})
