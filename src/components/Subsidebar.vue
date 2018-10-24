<template>
  <div>
  <transition name="fade">
  <div class="subsidebar" :class="sidebarmax?'subsidebar-left1':'subsidebar-left2'" v-if='subSidebarVisit'>
    <div class="subsidebar-top">{{location}}</div>
    <div class="hiddenbar" @click='changestatus()'><span class="fa fa-angle-double-left"></span></div>
    <ul>
      <div v-for='item in this.subSidebarList' :id="'secCate' + item.id" class="link-to sec-cate" @click='changeindex(item.id,item.subItems)' :key="item.id">
        <span class="fa pad-rig " :class="item.id==dqindex?item.subItems.length>0?'fa-caret-down':'':item.subItems.length>0?'fa-caret-right':''">
          </span>{{item.name}}
        <!-- 二级列表 -->
        <ul @click.stop="">
          <li v-for='subitem in subSidebardef' v-if='item.id==dqindex' :id="'thrCate'+ subitem.id" @click="changesubindex(subitem.id,subitem.table,subitem.name,subitem.url,locationID,item.id,subitem.name,item.name)" class="link-to1" :key='subitem.id'><span   :class="subitem.id==subdqindex?'subactive':'color-77'" class="dis-inlblk">{{subitem.name}}</span></li>
        </ul>
      </div>
    </ul>
  </div>
  </transition>
  <div v-if="subRig">
    <div class="visitbar" :class="sidebarmax?'subsidebar-left1':'subsidebar-left2'" @click='changevisit()' v-if='!isVisit && location!=null'><span class="fa fa-angle-double-right"></span></div>
  </div>
  </div>
</template>

<script type="text/javascript">
import {mapState} from 'vuex'
// import Bus from '@/assets/bus.js'
	export default{
		data(){
			return {
        subdqindex:"-1",
        dqindex:"-1"
        }
			},
    methods:{
      changeindex(key,list){
        if(key==this.dqindex){
          this.dqindex=''
        }else{
          this.dqindex = key
          this.$store.commit('subSidebardef',list)
        }
      },
      changesubindex(key,table,pgloc,url,rootID,secID,thrName,secName){
        this.$store.commit('curTable',table)
        this.$store.commit('pgloc',pgloc)
        this.subdqindex = key
        this.$router.push({path : url})

        let obj = {
          thrID: key,
          secID: secID,
          rootID: rootID,
          thrName: thrName,
          secName: secName
        }
        if(this.$storage.get("visited") == null){
          this.$storage.set("visited",[])
        }
        let visited = this.$storage.get("visited")
        for(var item in visited){
          if(visited[item].thrID == key){
            visited.splice(item,1)
          }
        }
        visited.unshift(obj)
        if(visited.length>10){
          visited.pop()
        }
        this.$storage.set("visited",visited)
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
      location(){
        if(this.$store.state.status.location!="")
          return this.$store.state.status.location + "管理"
      },
      ...mapState({
        isVisit : state=>state.status.subSidebarVisit,
        locationID: state=>state.status.locationID,
        clickStatus: state=>state.status.clickStatus,
        subSidebardef: state=>state.status.subSidebardef,
        subSidebarList: state=>state.status.subSidebarList,
        subRig: state=>state.status.subRig,
        subSidebarVisit: state=>state.status.subSidebarVisit,
        sidebarmax: state=>state.status.sidebarmax
      })
    },
    watch:{
      clickStatus(newval,oldval){
        this.changeindex(this.dqindex,null);
      }
    }
	}
</script>