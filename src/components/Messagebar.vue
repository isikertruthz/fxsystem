<template>
	<div >
		<transition name="slide-fade">
		<div v-if="barvisit" class="messagebar">暂空
			<div class="btn-change" @click='changestatus()'><span class="fa fa-angle-double-right sp-pad"></span>收起面板</div>
		</div>
		</transition>
		<transition name="slide-fade">
		<div class="visit-bar" v-if="!barvisit" @click='changestatus()'><span class="fa fa-commenting-o sp-pad"></span>消息提醒</div>
		</transition>
	</div>
</template>

<script type="text/javascript">
	export default{
		data(){
			return {}	
		},
		computed:{
			barvisit(){
				return this.$store.state.status.messagebarVisit
			}
		},
		methods:{
			changestatus(){
				this.$store.commit('messagebarVisit')
			}
		}
	}
</script>

<style type="text/css">
.messagebar{
	height: calc(100% - 50px);
	width: 135px;
	background-color: white;
	position: fixed;
	right: 0;
	bottom: 0;
	border-left: 1px solid rgba(0,0,0,0.1);
}
.btn-change{
	position: absolute;
	width: 100%;
	height: 35px;
	bottom: 0;
	background-color: #F0AD4E;
	color: white;
	line-height: 35px;
	cursor: pointer;
	font-size: 12px;
}
.sp-pad{
	padding-right: 5px;
}
.visit-bar{
	position: fixed;
	width: 100px;
	height: 35px;
	bottom: 0;
	right: 25px;
	background-color: #44ABF7;
	color: white;
	line-height:35px;
	cursor: pointer;
	font-size: 12px;
}
.slide-fade-enter-active {
  transition: all .1s ease;
}
.slide-fade-leave-active {
  transition: all .2s cubic-bezier(1.0, 0.5, 0.8, 1.0);
}
.slide-fade-enter, .slide-fade-leave-to
/* .slide-fade-leave-active for below version 2.1.8 */ {
  transform: translateY(-10px);
  opacity: 0;
}
</style>