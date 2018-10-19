<template>
	<div class="sidebar-item" :class="sidebarmax?'sidebar-left3':'sidebar-left2'">
		<div class="sidebar-top"><span class="fa fa-bars" @click="handlesidebarmax" style="width:100%;"></span></div>
		<ul >
			<li v-for="item in items" :id="'sidebar'+item.id" @click="changeLinkActive(item.id,item.name)" :key="item.id" :title="item.name">
				<router-link :to="{path: item.url}" class="link-width" :class="linkActive==item.id?'active':''"><span class="fa" :class="sidebarmax?'span-pad '+item.class:item.class"></span><span v-if="sidebarmax">{{item.name}}</span></router-link>
			</li>
		</ul>
	</div>
</template>

<script type="text/javascript">
import Bus from '@/assets/bus.js'
import { mapState } from 'vuex';
export default{
	data(){
		return {
			items:[
				{
					id:"0",
					name:"店铺",
					url:"#",
					root:[{
			          id:"0",
			          name:"首页",
			          subItems:[{
			            id:"0",
			            name:"幻灯片",
						url:'/admin/lanternslide',
						table:"slide"},
			            {
			            id:"1",
			            name:"导航图标",
						url:'/admin/navigation',
						table:"navicon"},
			            {
			            id:"2",
			            name:"广告",
						url:'/admin/advert',
						table:"advert"},
			            {
			            id:"3",
			            name:"魔方推荐",
						url:'/admin/lanternslide',
						table:"slide"},
						
			            {
			            id:"4",
			            name:"商品推荐",
						url:'/admin/lanternslide',
						table:"slide"},
			            {
			            id:"5",
			            name:"排版设置",
			            url:'/admin/lanternslide',
						table:"slide"},
			            ],
			          },{
			          id:"1",
			          name:"商城",
			          subItems:[{
			            id:"6",
			            name:"内容管理",
						url:'/admin/navigation',
						table:"navicon"
			          }]
			          }
			        ],
					class:"fa-shopping-basket"
				},
				{	
					id:"1",
					name:"商品",
					url:"#",
					class:"fa-shopping-bag"
				},
				{	
					id:"2",
					name:"会员",
					url:"#",
					class:"fa-user-circle"
				},
				{	
					id:"3",
					name:"订单",
					url:"#",
					class:"fa-file-text-o"
				},
				{	
					id:"4",
					name:"门店",
					url:"#",
					class:"fa-trophy"
				},
				{	
					id:"5",
					name:"营销",
					url:"#",
					class:"fa-gift"
				},
				{	
					id:"6",
					name:"财务",
					url:"#",
					class:"fa-money"
				},
				{	
					id:"7",
					name:"数据",
					url:"#",
					class:"fa-line-chart"
				},
				{	
					id:"8",
					name:"小程序",
					url:"#",
					class:"fa-weixin color-green"
				},
				{	
					id:"9",
					name:"应用",
					url:"#",
					class:"fa-html5 color-c"
				},
				{	
					id:"10",
					name:"设置",
					url:"#",
					class:"fa-cog"
				}
			],
			linkActive : "0",
			linkActive1 :"1"
		}
	},
	// created(){
	//  	console.log(items)
	// }
	computed:{
		...mapState({
			sidebarmax : state => state.status.sidebarmax
		})
	},
	methods:{
		changeLinkActive(key,name,){
			// this.$forceUpdate()
			// this.$set(this.linkActive,key)
			// console.log(key)
			let that = this
			that.$store.commit('subSidebarVisit')
			that.$store.commit('subbsidebarLocation',name)
			that.$store.commit('haddleLocationID',key)
			that.linkActive = key
			let list = []
			that.items.forEach(function(item){
				if(item.id==key){
					list = item.root
				}
			})
			// console.log(this.$store.state.status.subSidebarList)
			// console.log(list)
			that.$store.commit('subbsidebarList',list)
			if(list != null){
				that.$store.commit('subSidebardef',list[0].subItems)
			}
			// console.log(this.$store.state.status.clickStatus)
			// console.log(Bus)
		},
		handlesidebarmax(){
			this.$storage.set("sidebarmax",!this.sidebarmax)
			this.$store.commit("handlesidebarmax")
		}
	},
	mounted: function(){
		this.$storage.set("menuList",this.items)		// this.$storage.set("visited",visited)
		if(this.$storage.get("sidebarmax")!=null){
			this.$store.commit("setsidebarmax",this.$storage.get("sidebarmax"))
		}
	}
}
</script>