import Layout from '@/views/admin/Layout.vue'
import LanternSlide from '@/views/admin/LanternSlide.vue'
import Navigation from '@/views/admin/Navigation.vue'
import Advert from '@/views/admin/Advert.vue'
import Composition from '@/views/admin/Composition.vue'
import Cube from '@/views/admin/Cube.vue'
import Goodsrec from '@/views/admin/Goodsrec.vue'
import Notice from '@/views/admin/Notice.vue'
import Template from '@/views/admin/Template.vue'

import Login from '@/views/login/Login.vue'

const adminRoutes = {
	path: '/admin', name: 'root', component: Layout, meta: {title: "企泰科技分销系统"},
	children:[
		{path: 'lanternslide', name: 'lanternslide',component:LanternSlide, meta: {title: "企泰科技分销系统"}},
		{path: 'navigation', name: 'navigation', component:Navigation, meta: {title: "企泰科技分销系统"}},
		{path: 'advert', name: 'advert', component:Advert, meta: {title: "企泰科技分销系统"}},
		{path: 'composition', name: 'composition', component:Composition, meta: {title: "企泰科技分销系统"}},
		{path: 'template', name: 'template', component:Template, meta: {title: "企泰科技分销系统"}},
		{path: 'cube', name: 'cube', component:Cube, meta: {title: "企泰科技分销系统"}},
		{path: 'notice', name: 'notice', component:Notice, meta: {title: "企泰科技分销系统"}},
		{path: 'goodsrec', name: 'goodsrec', component:Goodsrec, meta: {title: "企泰科技分销系统"}},
	]
}

const loginRoutes = {
	path: '/',name: 'login', component: Login, meta: {title: "企泰科技分销系统-登录界面"}
}

export default [
	adminRoutes,loginRoutes
]
