import Vue from 'vue'
import Router from 'vue-router'
import routes from '@/router/routes.js'

Vue.use(Router)

const router = new Router({
//   mode: 'history',
  routes
})

router.beforeEach((to,from,next)=>{
	let isLogin = sessionStorage.getItem("isLogin")
	// console.log(isLogin)
	if(to.name!="login"){
		if(isLogin==0 || isLogin==null){
			if(confirm("请登录")){
				next("/")
				return
			}else{
				next("/")
				return
			}
		}
	}else{
		if(isLogin==1){
			if(confirm("注销当前用户?")){
				sessionStorage.removeItem("isLogin")
				sessionStorage.removeItem("user")
			}else{
				return
			}
		}
	}
	document.title = to.meta.title
	next();
})

export default router
