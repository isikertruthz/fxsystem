<template>
	<div>
		<router-view></router-view>
		<sidebar></sidebar>
		<navbar></navbar>
		<subsidebar></subsidebar>
		<messagebar></messagebar>
	</div>
</template>

<script type="text/javascript">
import Sidebar from '@/components/Sidebar'
import Navbar from '@/components/Navbar'
import Subsidebar from '@/components/Subsidebar'
import Messagebar from '@/components/Messagebar'
export default{
	components:{Sidebar,Navbar,Subsidebar,Messagebar}
}
</script>