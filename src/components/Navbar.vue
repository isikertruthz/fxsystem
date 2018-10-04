<template>
	<ul class="navbar-top">
		<li @click="changestatus()"><router-link :to="{path: '/dianpu' }" class="to-home"><span class="fa fa-home"></span></router-link></li>
		<a href="#" class="to-home"><span class="fa fa-bars"></span></a>
		<a href="#" class="to-login"><span class="fa fa-power-off loginout"></span></a>
		<span href="#" class="to-login user">{{username}}</span></span>
	</ul>
</template>

<script type="text/javascript">
export default{
	data(){
		return {
			username:"企泰信息科技开发版"
		}
	},
	methods:{
		changestatus(){
			this.$store.commit('subSidebarHiden')
			// console.log(this.$store.state.status.subSidebarVisit)
			this.$http.get('getlist.php?menuid=1').then(response=>{
				console.log(response)
			})
		}
	}
}	
</script>

<style type="text/css">
.navbar-top{
	height: 50px;
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 1;
	padding-left:130px;
	border-bottom: 1px solid rgba(0,0,0,0.1);
	background-color: white
}
.navbar-top a:focus{
	color: #555;
}
.navbar-top a:hover{
	color: #555;
}
.to-home{
	display: inline-block;
	font-size: 18px;
	line-height: 50px;
	width: 55px;
	float: left;
	color: #555;
	border-right: 1px solid rgba(0,0,0,0.1);
}
.to-login{
	display: inline-block;
	font-size: 18px;
	line-height: 50px;
	width: 55px;
	float:right;
	border-left: 1px solid rgba(0,0,0,0.1);
	color: #aaa;
}
.user{
	color: black;
	font-size: 12px;
	width: 180px;
}
.loginout{
	color: #555;
}
.hello{
  padding-top: 50px;
  background-color: #F5F7F9;
  height: 100%;
}
.helloa{
  padding-left: 240px;
}
.hellob{
  padding-left: 130px;
}
.helloc{
  padding-right: 120px;
}
</style>