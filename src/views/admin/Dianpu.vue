<template>
	<div class="hello" :class="subhiden?'helloa':'hellob'">
		
	</div>
</template>

<script type="text/javascript">
	export default{
		components:{},
		data(){
			return {}
		},  
		computed:{
    		subhiden(){
      		return this.$store.state.status.subSidebarVisit
    	}
  }
	}
</script>
