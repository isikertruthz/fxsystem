<template>
	<div class="sidebar-item">
		<div class="sidebar-top"><span class="fa fa-bars"></span></div>
		<ul>
			<li v-for="item in items" @click="changeLinkActive(item.id)"><router-link :to="{path: item.url}" class="link-width" :class="linkActive==item.id?'active':''"><span class="fa span-pad" :class="item.class"></span>{{item.name}}</router-link></li>
		</ul>
	</div>
</template>

<script type="text/javascript">
import Bus from '@/assets/bus.js'
export default{
	data(){
		return {
			items:[
				{
					id:"0",
					name:"店铺",
					url:"/",
					root:[{
			          id:"0",
			          name:"首页",
			          subItems:[{
			            id:"0",
			            name:"幻灯片",
			            url:'/'}],
			          },{
			          id:"1",
			          name:"商城",
			          subItems:[{
			            id:"1",
			            name:"内容管理",
			            url:'/dianpu'
			          },{
			            id:"2",
			            name:"内容管理",
			            url:'/'
			          },{
			            id:"3",
			            name:"内容管理",
			            url:'/dianpu'
			          },{
			            id:"4",
			            name:"内容管理",
			            url:'/'
			          }]
			          },{
			          id:"2",
			          name:"暂空",
			          subItems:[]
			          }
			        ],
					class:"fa-shopping-basket"
				},
				{	
					id:"1",
					name:"商品",
					url:"/dianpu",
					class:"fa-shopping-bag"
				},
				{	
					id:"2",
					name:"会员",
					url:"/dianpu",
					class:"fa-user-circle"
				},
				{	
					id:"3",
					name:"订单",
					url:"/dianpu",
					class:"fa-file-text-o"
				},
				{	
					id:"4",
					name:"门店",
					url:"/dianpu",
					class:"fa-trophy"
				},
				{	
					id:"5",
					name:"营销",
					url:"/dianpu",
					class:"fa-gift"
				},
				{	
					id:"6",
					name:"财务",
					url:"/dianpu",
					class:"fa-money"
				},
				{	
					id:"7",
					name:"数据",
					url:"/dianpu",
					class:"fa-line-chart"
				},
				{	
					id:"8",
					name:"小程序",
					url:"/dianpu",
					class:"fa-weixin color-green"
				},
				{	
					id:"9",
					name:"应用",
					url:"/dianpu",
					class:"fa-html5 color-c"
				},
				{	
					id:"10",
					name:"设置",
					url:"/dianpu",
					class:"fa-cog"
				},
				{	
					id:"11",
					name:"暂空",
					url:"/dianpu",
				}
			],
			linkActive : "0",
			linkActive1 :"1"
		}
	},
	// created(){
	//  	console.log(items)
	// }
	methods:{
		changeLinkActive(key){
			// this.$forceUpdate()
			// this.$set(this.linkActive,key)
			// console.log(key)
			this.$store.commit('subSidebarVisit')
			this.linkActive = key
			let list = []
			this.items.forEach(function(item){
				if(item.id==key){
					list = item.root
				}
			})
			// console.log(list)
			Bus.$emit('list',list)
			// console.log(Bus)
		}
	}
}
</script>

<style type="text/css">
ul,li,a{
	text-decoration: none;
	list-style-type: none;
	margin: 0;
	padding:0;
}
.sidebar-item a:focus{
	text-decoration: none;
	color: white;
}
.sidebar-item a:hover{
	text-decoration: none;
	color: white;
}

.sidebar-item{
	padding-top: 50px;
	/*height: 550px;*/
}
.sidebar-item ul{
	height: 590px;
	overflow-y: scroll;
	overflow-x: hidden;
}
.link-width{
	display: inline-block;
	width: 120px;
	height: 50px;
	line-height: 50px;
	color: #CACACA;
}
.span-pad{
	padding-right: 13px;
}
.active{
	color: white;
	border-left: 3px solid #00AEFF;
	background-color:#19222E;
}
.sidebar-top{
	height: 30px;
	width: 100%;
	background-color: #28394A;
	line-height: 30px;
	font-size:12px;
	color: #7C838A;
	cursor: pointer;
}
.color-green{
	color: #09BB07;
}
.color-c{
	color: #EA6111;
}
</style>