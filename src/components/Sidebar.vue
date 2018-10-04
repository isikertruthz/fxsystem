<template>
	<div class="sidebar-left">
<!-- 		<ul>
		<li><router-link :to="{path:'/dianpu'}">dianpu</router-link></li>
		<li><router-link :to="{path:'/'}">shouye</router-link></li>
		</ul> -->
		<sidebar-item></sidebar-item>
	</div>
</template>

<script type="text/javascript">	
import SidebarItem from '@/components/SidebarItem'
export default{
	components:{SidebarItem},
	data(){
		return {}
	}
}
</script>

<style type="text/css">
html,body{
	height: 100%;
	margin: 0;
	padding: 0;
	font-size: 14px;
}
::-webkit-scrollbar{
	width: 3px;
	height: 3px;
}
::-webkit-scrollbar-track{
	background-color: #24303C;
}
::-webkit-scrollbar-thumb{
	background-color: #888;
}
.sidebar-left{
	width: 130px;
	height: 100%;
	background-color: #24303C;
	position: fixed;
	left: 0;
	top: 0;
	z-index: 2;
	color:white;
	overflow-y: hidden;
}
</style>