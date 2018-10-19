import Layout from '@/views/admin/Layout.vue'
import LanternSlide from '@/views/admin/LanternSlide.vue'
import Navigation from '@/views/admin/Navigation.vue'
import Advert from '@/views/admin/Advert.vue'

import DianPu from '@/views/admin/Dianpu.vue'

import Login from '@/views/login/Login.vue'



const adminRoutes = {
	path: '/admin', name: 'root', component: Layout, meta: {title: "企泰科技分销系统"},
	children:[
		{path: 'lanternslide', name: 'lanternslide',component:LanternSlide, meta: {title: "企泰科技分销系统"}},
		{path: 'navigation', name: 'navigation', component:Navigation, meta: {title: "企泰科技分销系统"}},
		{path: 'dianpu', name: 'dianpu', component:DianPu, meta: {title: "企泰科技分销系统"}},
		{path: 'advert', name: 'advert', component:Advert, meta: {title: "企泰科技分销系统"}}
	]
}

const loginRoutes = {
	path: '/',name: 'login', component: Login, meta: {title: "企泰科技分销系统-登录界面"}
}

export default [
	adminRoutes,loginRoutes
]
