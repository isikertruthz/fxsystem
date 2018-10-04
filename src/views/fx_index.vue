<template>
	<div>
		<router-view/>
		<sidebar></sidebar>
		<navbar></navbar>
		<subsidebar></subsidebar>
		<messagebar></messagebar>
	</div>
</template>

<script type="text/javascript">
import HelloWorld from '@/components/HelloWorld'
import Sidebar from '@/components/Sidebar'
import Navbar from '@/components/Navbar'
import Subsidebar from '@/components/Subsidebar'
import Messagebar from '@/components/Messagebar'
export default{
	components:{HelloWorld,Sidebar,Navbar,Subsidebar,Messagebar}
}
</script>