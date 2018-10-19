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
