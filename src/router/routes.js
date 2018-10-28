const Layout = () => import ('@/views/admin/Layout.vue')
const LanternSlide = () => import ('@/views/admin/LanternSlide.vue')
const Navigation = () =>import ('@/views/admin/Navigation.vue')
const Advert = () => import ('@/views/admin/Advert.vue')
const Composition = () => import ('@/views/admin/Composition.vue')
const Cube = () =>import ('@/views/admin/Cube.vue')
const Goodsrec = () => import ('@/views/admin/Goodsrec.vue')
const Notice = () => import ('@/views/admin/Notice.vue')
const Templaten = () => import ('@/views/admin/Template.vue')

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
