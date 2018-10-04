<template>
  <div>
  <transition name="fade">
  <div class="subsidebar" v-if='isVisit'>
    <div class="subsidebar-top">{{location}}</div>
    <div class="hiddenbar" @click='changestatus()'><span class="fa fa-angle-double-left"></span></div>
    <ul>
      <div v-for='item in list' class="link-to" @click='changeindex(item.id,item.subItems)'>
        <span class="fa pad-rig " :class="item.id==dqindex?item.subItems.length>0?'fa-caret-down':'':item.subItems.length>0?'fa-caret-right':''"></span>{{item.name}}
        <!-- 二级列表 -->
        <ul>
          <li v-for='subitem in sublist' v-if='item.id==dqindex' @click.stop="changesubindex(subitem.id)" class='subitem'><router-link :to='{path:subitem.url}' :class="subitem.id==subdqindex?'subactive':'color-77'">{{subitem.name}}</router-link></li>
        </ul>
      </div>
    </ul>
  </div>
  </transition>
  <div v-if="subRig">
    <div class="visitbar" @click='changevisit()' v-if='!isVisit'><span class="fa fa-angle-double-right"></span></div>
  </div>
  </div>
</template>

<script type="text/javascript">
import Bus from '@/assets/bus.js'
	export default{
		data(){
			return {
        subdqindex:"0",
        dqindex:"0",
			  location:"店铺首页",
        list:[],
        sublist:[{
            id:"0",
            name:"幻灯片",
            url:'/'}],
      }
			},
    methods:{
      changeindex(key,list){
        if(key==this.dqindex){
          this.dqindex=''
        }else{
          this.dqindex = key
          this.sublist = list
        }
      },
      changesubindex(key){
        this.subdqindex = key
      },
      changestatus(){
        this.$store.commit('subSidebarHiden')
        // console.log('111')
      },
      changevisit(){
        this.$store.commit('subSidebarVisit')
      }
    },
    computed:{
      isVisit(){
        return this.$store.state.status.subSidebarVisit
      },
      subRig(){
        return this.$store.state.status.subRig
      }
    },
    mounted: function () {
      let that = this
      Bus.$on('list',(data)=>{
        console.log(data)
        that.list= data
      })
    }
	}
</script>

<style type="text/css">
.subsidebar{
  height:calc(100% - 50px);
  border-right: 1px solid rgba(0,0,0,0.1);
  width: 110px;
  position: fixed;
  left: 130px;
  font-size: 12px;
  top:50px;
  overflow-x: none;
  overflow-y: auto;
  background-color: white;
}
.subsidebar a:hover{
  text-decoration: none;
  color: #00AEFF;
}
.subsidebar a:focus{
  text-decoration: none;
  color: #00AEFF;
}
.subsidebar-top{
  height: 60px;
  line-height: 60px;
  width: 100%;
  border-bottom: 1px solid rgba(0,0,0,0.1);
  font-weight: bold;
}
.hiddenbar{
  background-color: #F5F7F9;
  width: 13px;
  height: 18px;
  line-height: 18px;
  position: absolute;
  right: -2px;
  top: 0px;
  border-left: 1px solid rgba(0,0,0,0.1);
  border-bottom: 1px solid rgba(0,0,0,0.1);
  cursor: pointer;
}
.visitbar{
  background-color: #F5F7F9;
  width: 13px;
  height: 22px;
  line-height: 22px;
  position: absolute;
  left: 130px;
  top: 53px;
  border-right: 1px solid rgba(0,0,0,0.1);
  border-bottom: 1px solid rgba(0,0,0,0.1);
  border-top: 1px solid rgba(0,0,0,0.1);
  cursor: pointer;
  font-size: 11px;
}
.link-to{
  display: inline-block;
  height: 45px;
  width: 100%;
  line-height: 45px;
  color: #666;
  cursor: pointer;
}
.pad-rig{
  padding-right: 10px;
}
.subitem{
  height: 40px;
  line-height: 40px;
  color: #555;
  font-size: 12px;
}
.color-77{
  color: #777;
}
.subactive{
  display: inline-block;
  color: #00AEFF;
  background-color:#EDF6FF;
  width: 100%;
  height: 100%;
}
.fade-enter-active, .fade-leave-active {
  transition: opacity .3s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}
</style>