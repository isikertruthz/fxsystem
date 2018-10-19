<template>
  <!-- /admin下所有路由页面有继承该div样式，避免页面排版混乱 -->
  <div>
    <div class="comm-view" :class="commLay==240?messhiden?'pad-lefta pad-right':'pad-lefta':commLay==130?messhiden?'pad-leftb pad-right':'pad-leftb':commLay==170?messhiden?'pad-leftc pad-right':'pad-leftc':commLay==60?messhiden?'pad-leftd pad-right':'pad-leftd':''" style="position:fixed;height:0px;z-index:1" v-if="scrollth">
      <div class="content" >
        <div class="content-top" style="min-height:35px;padding-bottom:0;">
          <div class="content-thr">
            <table class="table table-striped thead-top" style="word-break:break-all;  word-wrap:break-all; font-size:13px; margin-bottom:0px; ">
                <colgroup>
                  <col style="width:5%; ">
                  <col style="width:7%; ">
                  <col style="width:8%; ">
                  <col style="width:25%; ">
                  <col style="width:30%; ">
                  <col style="width:7%; ">
                  <col style="width:14%; ">
                </colgroup>
                <thead class="title-size">
                  <tr>
                    <th class="text-center" style="border:none">选择</th>
                    <th class="text-center" style="border:none">排序</th>
                    <th class="text-center" style="border:none">{{specific}}</th>
                    <th style="border:none">标题</th>
                    <th style="border:none">链接</th>
                    <th class="text-center" style="border:none">状态</th>
                    <th class="text-center" style="border:none">操作</th>
                  </tr>
                </thead>
            </table>
          </div>
        </div>
      </div>
    </div>

  <div class="comm-view" :class="commLay==240?messhiden?'pad-lefta pad-right':'pad-lefta':commLay==130?messhiden?'pad-leftb pad-right':'pad-leftb':commLay==170?messhiden?'pad-leftc pad-right':'pad-leftc':commLay==60?messhiden?'pad-leftd pad-right':'pad-leftd':''"  style="position:absolute">
    <div class="dp-location">
      <span class="loc-bor">当前位置：<label class="page-location">{{pageLoction}}管理
        </label>
      </span>
    </div>
    <div class="content" >
      <div class="content-top">
         <div class="modal-content bor-rad" v-if="tmp" style="width:100%;outline:none;box-shadow:none;border:none" >
            <div class="modal-header">
              <h5 class="modal-title" id="myModalLabel" v-if="isEdit==0" style="padding-right:28%;font-size:17px;">
                添加{{pageLoction}}
              </h5>
              <h5 class="modal-title" id="myModalLabel" v-else style="padding-right:28%;font-size:17px;">
                编辑{{pageLoction}}
              </h5>
            </div>
            <form class="form-horizontal" style="font-size:12px; " role="form">
            <div class="modal-body" style="padding-right:25%">
              <div class="form-group mar-top-mx" :class="haserror?'has-error':''" >
                <label for="firstname" class="col-sm-2 control-label padding-le">排序:</label>
                <div class="col-sm-10 padding-l">
                  <input type="text" v-model="slide.ordernum" class="form-control" placeholder="数字越大，排名越靠前">
                </div>
              </div>
              <div class="form-group mar-top-mx">
                <label for="firstname" class="col-sm-2 control-label padding-le">{{pageLoction}}标题:</label>
                <div class="col-sm-10 padding-l">
                  <input type="text" v-model="slide.name" class="form-control" placeholder="">
                </div>
              </div>
              <div class="form-group mar-top-mx">
                <label for="firstname" class="col-sm-2 control-label padding-le">{{specific}}:</label>
                <div class="col-sm-10 padding-l">
                   <div class="input-group">
                      <input type="text" v-model="slide.imgpath" class="form-control" disabled style="cursor:default;z-index:1">
                      <input type="file" name="file" id="file" @change="fileUpload($event)" style="display:none;">
                      <span class="input-group-addon upload-pic" @click="selectPic()">选择{{specific}}</span>
                   </div>
                   <div class="text-left" style="width:82px;  margin-top:8px; border:1px #ccc solid">
                     <img  id="img-upload" :src="imgTmp" class="img-size">
                   </div>
                   <div class="text-left" style="color:#aaa; margin-top:5px; font-size:11px; ">建议尺寸:100 * 100 , 请将所有{{pageLoction}}尺寸保持一致</div>
                </div>
              </div>
              <div class="form-group mar-top-mx">
                <label for="firstname" class="col-sm-2 control-label padding-le">链接:</label>
                <div class="col-sm-10 padding-l">
                   <div class="input-group">
                      <input type="text" v-model="slide.url" class="form-control">
                      <span class="input-group-addon upload-pic">选择链接</span>
                   </div>
                </div>
              </div>
              <div class="form-group mar-top-mx">
                <label for="firstname" class="col-sm-2 control-label padding-le">状态:</label>
                <div class="col-sm-10 padding-l">
                  <div class="checkbox text-left">
                      <label><input type="radio" value="1" v-model="slide.status">显示</label>
                      <label><input type="radio" value="0" v-model="slide.status">隐藏</label>
                  </div>
                </div>
              </div>
              <div class="text-right">
              <button type="button" class="btn btn-default" data-dismiss="modal" @click="changetmp()">返回列表
              </button>
              <button type="button" class="btn btn-primary color-blue" @click='httpreq("11102")' v-if="isEdit==0">
                提交添加
              </button>
              <button type="button" class="btn btn-primary color-blue" @click='httpreq("11108")' v-else-if="isEdit==1">
                提交更改
              </button>
              </div>
            </div>
            </form>
          </div>

        <!-- 添加界面 -->
        <div v-if="!tmp">
        <div class="content-sub">
          <button type="button" class="btn btn-primary btn-sm c-blue" data-toggle="modal" data-target="#myModal" @click="addList()">
            <span class="fa fa-plus" style="padding-right:5px;position:relative;top:1px;"></span>添加{{pageLoction}}
          </button>
          <span>
          <div class="form-group dis-inblo">
            <select class="form-control sel-width" style="font-size:12px;position:absolute;top:18px;right:290px; " v-model="selectStatus">
              <option v-for="item in selList" :value="item.value" :key="item.id">{{item.name}}</option>
            </select>
          </div>
          <input type="text" v-model="keyword" class="form-control inp-hig" style="position:absolute;top:18px;right:85px;margin-top:0" placeholder="请输入关键词" id="searchp" @keyup.enter="search">
          <button type="button" class="btn btn-primary btn-sm c-blue" @click='httpreq("11107")' style="position:absolute;right:40px;top:18px;">
            搜索
          </button>

          </span>
        </div>

        <div class="content-sec" v-if='listVis'>
          未查询到相关数据
        </div>
        <div class="content-thr" v-else>
          <hr class="mar-0">
          <div class="fun-hig">
            <input type="checkbox" class="allCheck" v-model="allCheck" id="allCheck" value="">
            <button class="btn btn-success btn-xs bor-rad bt-success" @click='httpreq("11105","0")'>
              <span class="fa fa-eye pad-rig-m"></span>显示
            </button>
            <button class="btn btn-warning btn-xs bor-rad bt-warn" @click='httpreq("11105","1")'>
              <span class="fa fa-low-vision pad-rig-m"></span>隐藏
            </button>
            <button class="btn btn-danger btn-xs bor-rad bt-dang" @click='httpreq("11106")'>
              <span class="fa fa-trash-o pad-rig-m"></span>删除
            </button>
          </div>
          <hr class="mar-0">
          <div>
            <table class="table table-striped" style="word-break:break-all;  word-wrap:break-all; font-size:13px; margin-bottom:0px; ">
              <colgroup>
                <col style="width:5%; ">
                <col style="width:7%; ">
                <col style="width:8%; ">
                <col style="width:25%; ">
                <col style="width:30%; ">
                <col style="width:7%; ">
                <col style="width:14%; ">
              </colgroup>
              <thead class="title-size">
                <tr>
                  <th class="text-center" style="border:none">选择</th>
                  <th class="text-center" style="border:none">排序</th>
                  <th class="text-center" style="border:none">{{specific}}</th>
                  <th style="border:none">标题</th>
                  <th style="border:none">链接</th>
                  <th class="text-center" style="border:none">状态</th>
                  <th class="text-center" style="border:none">操作</th>
                </tr>
              </thead>
              <tbody>
                <tr  v-for='item in list' :key="item.id">
                  <td class="text-center">
                    <input type="checkbox" name="" :id="item.id" :value="item.id" v-model="selected">
                  </td>
                  <td class="text-center">{{item.ordernum}}</td>
                  <td class="text-center">
                    <span id="imglist">
                      <img :src="item.imgpath==''||item.imgpath==null?'http://www.entertry.com/imgdef.png':'http://www.entertry.com/upload/'+item.imgpath" class="img-30">
                      <span>
                        <img :src="item.imgpath==''||item.imgpath==null?'http://www.entertry.com/imgdef.png':'http://www.entertry.com/upload/'+item.imgpath" >
                      </span>
                      <div class="triangle-down"></div>
                    </span>
                  </td>
                  <td>{{item.name}}</td>
                  <td>{{item.url}}</td>
                  <td class="text-center">
                    <button class="btn btn-xs btn-success bor-rad bt-success font-size-x" title="点击隐藏" style="position: relative; " v-if="item.status==1" @click='httpreq("11104",item.id,!item.status)'>
                      <span >显示</span>
                      <span class="fa fa-spinner fa-spin load" v-if="loaddingid == item.id"></span>
                    </button>
                    <button class="btn btn-xs btn-warning bor-rad bt-warn font-size-x" v-else @click='httpreq("11104",item.id,1)' title="点击显示" style="position: relative; ">
                      隐藏
                      <span class="fa fa-spinner fa-spin load" v-if="loaddingid == item.id"></span>
                    </button>
                  </td>
                  <td class="text-center">
                    <button class="btn btn-xs btn-success bor-rad bt-success font-size-x" @click='edit(item.id)' data-toggle="modal" data-target="#myModal">
                      <span class="fa fa-edit pad-rig-m"></span>编辑
                    </button>
                    <button class="btn btn-xs btn-danger bor-rad bt-dang font-size-x" @click='httpreq("11103",item.id)'>
                      <span class="fa fa-trash-o pad-rig-m"></span>删除
                    </button>
                  </td>
                </tr>
              </tbody>
            </table>
            <hr class="mar-0">
            <div class="fun-hig" style="position:relative;">
              <span v-if="listlen">
                <input type="checkbox" class="allCheck" v-model="allCheck" id="allCheck" value="">
                <button class="btn btn-success btn-xs bor-rad bt-success" @click='httpreq("11105","0")'>
                  <span class="fa fa-eye pad-rig-m"></span>显示
                </button>
                <button class="btn btn-warning btn-xs bor-rad bt-warn" @click='httpreq("11105","1")'>
                  <span class="fa fa-low-vision pad-rig-m"></span>隐藏
                </button>
                <button class="btn btn-danger btn-xs bor-rad bt-dang" @click='httpreq("11106")'>
                  <span class="fa fa-trash-o pad-rig-m"></span>删除
                </button>
              </span>
              <span style="position:absolute;right:0;font-size:12px;margin:6px 5px 0 0; ">共 {{this.list.length}} 条记录</span>
            </div>
            <hr class="mar-0">
          </div>
        </div>
         <div class="modal-content bor-rad" v-if="tmp" style="width:100%;outline:none;box-shadow:none;border:none" >
            <div class="modal-header">
              <h5 class="modal-title" id="myModalLabel" v-if="isEdit==0" style="padding-right:28%;font-size:17px;">
                添加{{pageLoction}}
              </h5>
              <h5 class="modal-title" id="myModalLabel" v-else style="padding-right:28%;font-size:17px;">
                编辑{{pageLoction}}
              </h5>
            </div>
            <form class="form-horizontal" style="font-size:12px; " role="form">
            <div class="modal-body" style="padding-right:25%">
              <div class="form-group mar-top-mx" :class="haserror?'has-error':''" >
                <label for="firstname" class="col-sm-2 control-label padding-le">排序:</label>
                <div class="col-sm-10 padding-l">
                  <input type="text" v-model="slide.ordernum" class="form-control" placeholder="数字越大，排名越靠前">
                </div>
              </div>
              <div class="form-group mar-top-mx">
                <label for="firstname" class="col-sm-2 control-label padding-le">{{pageLoction}}标题:</label>
                <div class="col-sm-10 padding-l">
                  <input type="text" v-model="slide.name" class="form-control" placeholder="">
                </div>
              </div>
              <div class="form-group mar-top-mx">
                <label for="firstname" class="col-sm-2 control-label padding-le">{{specific}}:</label>
                <div class="col-sm-10 padding-l">
                   <div class="input-group">
                      <input type="text" v-model="slide.imgpath" class="form-control" disabled style="cursor:default;z-index:1">
                      <input type="file" name="file" id="file" @change="fileUpload($event)" style="display:none;">
                      <span class="input-group-addon upload-pic" @click="selectPic()">选择{{specific}}</span>
                   </div>
                   <div class="text-left" style="width:82px;  margin-top:8px; border:1px #ccc solid">
                     <img  id="img-upload" :src="imgTmp" class="img-size">
                   </div>
                   <div class="text-left" style="color:#aaa; margin-top:5px; font-size:11px; ">建议尺寸:100 * 100 , 请将所有{{pageLoction}}尺寸保持一致</div>
                </div>
              </div>
              <div class="form-group mar-top-mx">
                <label for="firstname" class="col-sm-2 control-label padding-le">链接:</label>
                <div class="col-sm-10 padding-l">
                   <div class="input-group">
                      <input type="text" v-model="slide.url" class="form-control">
                      <span class="input-group-addon upload-pic">选择链接</span>
                   </div>
                </div>
              </div>
              <div class="form-group mar-top-mx">
                <label for="firstname" class="col-sm-2 control-label padding-le">状态:</label>
                <div class="col-sm-10 padding-l">
                  <div class="checkbox text-left">
                      <label><input type="radio" value="1" v-model="slide.status">显示</label>
                      <label><input type="radio" value="0" v-model="slide.status">隐藏</label>
                  </div>
                </div>
              </div>
              <div class="text-right">
              <button type="button" class="btn btn-default" data-dismiss="modal" @click="changetmp()">返回列表
              </button>
              <button type="button" class="btn btn-primary color-blue" @click='httpreq("11102")' v-if="isEdit==0">
                提交添加
              </button>
              <button type="button" class="btn btn-primary color-blue" @click='httpreq("11108")' v-else-if="isEdit==1">
                提交更改
              </button>
              </div>
            </div>
            </form>
          </div>
        </div>
      </div>
    </div>
      <!-- Modal -->
      <!-- <div class="modal fade" id="myModal"> -->
        <!-- <div class="modal-dialog " style="width:65%; margin-top:80px; "> -->
        
          <!-- </div>modal-content -->
        <!-- </div>modal -->
    <!-- </div> -->
    <transition name="slide-fade">
      <div class="pro-box" v-if="proboxStatus==1">操作成功</div>
    </transition>
    <transition name="slide-fade">
      <div class="pro-box col-org" v-if="proboxStatus==2">{{warn}}</div>
    </transition>
    <transition name="slide-fade">
      <div class="pro-box " style="background-color: #eb3941;" v-if="proboxStatus==3">{{warn}}</div>
    </transition>
  </div>
</div>
</template>

<script>
export default {
  data () {
    return {
      datachange : true, // 监听刷新数据
      location:"",
      table: "",
      proboxStatus:0,
      keyword : null,
      selectStatus : "2",
      isEdit :2,
      loaddingid : "-1",
      selected: [],
      selectedTmp : [],
      allCheck :[],
      list:[],  // 返回表数据
      imgTmp: "http://www.entertry.com/imgdef.png",
      // 表结构
      slide:{ ordernum: null,name: "",imgpath: "",url: "",status: 1 },
      tmp : false,
      haserror : false,
      scrollth : false
    }
  },
  computed:{
    specific(){
      return "图片"
    },
    commLay(){
      if(this.sidebarmax && this.subhiden){
        return 240
      }else if(this.sidebarmax && !this.subhiden){
        return 130
      }else if(!this.sidebarmax && this.subhiden){
        return 170
      }else{
        return 60
      }
    },
    // 下拉列表
    selList(){
      return [{name :"状态",value : "2"},{name :"显示",value : "1"},{name :"隐藏",value : "0"}]
    },
    listVis(){
      if ( this.list.length==0 ) { return true }
        else { return false }
    },
    listlen(){
      if(this.list.length>10) {
        return true
      }else{
        return false
      }
    },
    subhiden(){
      return this.$store.state.status.subSidebarVisit
    },
    messhiden(){
      return this.$store.state.status.messagebarVisit
    },
    sidebarmax(){
      return this.$store.state.status.sidebarmax
    },
    messhiden(){
      return this.$store.state.status.messagebarVisit
    },
    pageLoction(){
      return this.$store.state.status.pageLoction
    }
  },

  watch:{
    slide:{
      handler(val){
        var tmp = /^\+?[1-9][0-9]*$/
        if (val.ordernum!=null)
          if(!tmp.test(val.ordernum) || val.ordernum>1000000 || val.ordernum<0) {
            this.proStatus(3,"请输入数值 0-10000")
            this.haserror = true
          }else{
            this.haserror = false
          }
      },
      deep:true
    },
    datachange: function () {
      this.httpreq("11101")
    },

    allCheck: function () {
      if(this.allCheck[0]==null){
        this.selected = []
      }else{
        this.selected = this.selectedTmp
      }
    }
  },

  methods:{
    changetmp(){
      this.tmp = !this.tmp
    },
    httpreq(ywtype){
      switch(ywtype){
        case "11102":
          if(!this.haserror && this.slide.ordernum!=null){
            this.slide.table = this.table
            this.$http.post("api/main.php?ywtype="+ywtype,this.slide).then(response=>{
              console.log(response)
              $("#myModal").modal('hide')
              this.dtChange()
              this.proStatus(1)
              this.tmp = false
            })
          }else{
            this.proStatus(3,"操作失败")
          }

          break 
        case "11101":
          this.$http.get("api/main.php?ywtype="+ywtype+"&tb="+this.table).then(response=>{
            this.selectedTmp = []
            this.list = response.data
            if(this.selectedTmp.length==0){
              for(var item of this.list){
                this.selectedTmp.push(item.id)
              }
            }
          })
          break 
        case "11103":
          if(confirm("确定要删除吗?")){
            this.$http.get("api/main.php?ywtype="+ywtype+"&id="+arguments[1]+"&tb="+this.table).then(response=>{
              this.dtChange()
              this.proStatus(1)
            })
          }
          break 
        case "11104":
            this.loaddingid = arguments[1] 
            this.$http.get("api/main.php?ywtype="+ywtype+"&id="+arguments[1]+"&status="+arguments[2]+"&tb="+this.table).then(response=>{
              // console.log(response) 
              for(var item of this.list){
                if (item.id==arguments[1]){
                  item.status=!item.status
                }
              }
              this.loaddingid = -1
            },response=>{
              this.loaddingid = -1
            })
            break
        case "11105":
            if(this.selected.length<=0){
              this.proStatus(2,"请选择操作选项") 
              break
            }
            this.$http.post("api/main.php?ywtype="+ywtype+"&type="+arguments[1]+"&tb="+this.table,this.selected).then(response=>{
              this.dtChange()
              this.proStatus(1)
              this.selected = []
              this.allCheck = []
            },response=>{
              this.proStatus(2)
            })
            break
        case "11106":
          if(this.selected.length<=0){
            this.proStatus(2,"请选择操作的选项") 
            break 
          }
          if(confirm("删除所选内容？")){
            this.$http.post("api/main.php?ywtype="+ywtype+"&tb="+this.table,this.selected).then(response=>{
              this.dtChange() 
              this.proStatus(1) 
              this.selected = [] 
              this.allCheck = [] 
            },response=>{
              this.proStatus(2,"操作失败") 
            })
          }
          break 
        case "11107":
          if (this.keyword != null) {
            this.$http.get("api/main.php?ywtype="+ywtype+"&keyword="+this.keyword+"&type="+this.selectStatus+"&tb="+this.table).then(response=>{
              this.list = response.data 
            })
          }
          break 
        case "11108":
          if(!this.haserror){
            this.$http.post("api/main.php?ywtype="+ywtype+"&tb="+this.table,this.slide).then(response=>{
                        $("#myModal").modal('hide') 
                        this.dtChange() 
                        this.proStatus(1) 
                        this.tmp = false;
            })
          }else{
            this.proStatus(3,"操作失败") 
          }

          break 
        default:
          break 
      }
    },

    //查询触发
    search(){
      this.httpreq("11107") 
    },

    //通知数据有变
    dtChange(){
      this.datachange = !this.datachange 
    },

    //弹出操作状态
    // 1操作成功  2操作失败
    proStatus(status,warn){  
      let that = this 
      this.warn = warn 
      that.proboxStatus = status 
      console.log(that.proboxStatus)
      setTimeout(function() {
        that.proboxStatus = 0 
        this.warn = "" 
      },1000) 
    },

    //编辑 先获取当前选择的对象
    edit(key){
      this.isEdit = 1 
      for(var item of this.list){
        if(item.id==key){
          this.slide = item
        }
      }
      this.slide.id = key 
      this.changetmp();
    },

    //选择添加时初始化对象
    addList(){
      this.isEdit = 0
      this.slide = {
        ordernum : null,
        name : "",
        imgpath :"",
        url :"",
        status : 1
      },
      this.imgTmp = "http://www.entertry.com/imgdef.png"
      this.changetmp()
    },

    //通过按钮触发上传事件，弹出选择文件窗口
    selectPic(){
      $("#file").trigger("click") 
    },

    //选完文件后触发change上传到服务器，还存在漏洞
    fileUpload(e){

      //获取文件信息
      let that = this 
      let file = e.target.files[0] 
      let fileName = that.$utils.getUID()+"."+that.$utils.getCaption(file.type,"\/") 

      //实现图片预览
      let reader = new FileReader() 
      reader.readAsDataURL(file) 
      reader.onload = function() {
          that.imgTmp = this.result
      }

      //上传图片
      let config = {
          headers: {'Content-Type': 'multipart/form-data'}
      }
      let param = new FormData() 
      param.append('file',file,fileName) //通过append向form对象添加数据
      // console.log(param.get('file'))  //FormData私有类对象，访问不到，可以通过get判断值是否传进去

      that.$http.post("api/main.php?ywtype=10002",param,config).then(response=>{
        that.slide.imgpath = fileName
      })
    },
    handleScroll(){
      var scrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop;
      console.log(scrollTop);
      if (scrollTop>157) {
        this.scrollth = true;
      }else{
        this.scrollth = false;
      }
    }
  },
  mounted: function(){
      this.dtChange() 
      this.table = this.$store.state.status.curtable
      window.addEventListener('scroll', this.handleScroll)
      $("#searchp").focus();
  },
  destroyed () {//离开该页面需要移除这个监听的事件
  window.removeEventListener('scroll', this.handleScroll)
  }
}
</script>
