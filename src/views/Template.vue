<template>
  <div class="hello" :class="subhiden?messhiden?'helloa helloc':'helloa':messhiden?'hellob helloc':'hellob'">
    <div class="dp-location">
      <span class="loc-bor">当前位置：<label style="color:#44abf7;margin-left:5px;font-size:11px;">{{pageLoction}}管理</label></span>
    </div>
    <div class="content">
      <div class="content-top">
        <div class="content-sub">
          <button type="button" class="btn btn-primary btn-sm c-blue" data-toggle="modal" data-target="#myModal"><span class="fa fa-plus" @click="addList()">添加{{pageLoction}}</span></button>
          <button type="button" class="btn btn-primary btn-sm c-blue bt-flo" @click='httpreq("11107")'>搜索</button>
          <input type="text" v-model="keyword" class="form-control inp-hig" placeholder="请输入关键词" @keyup.enter="search">
          <div class="form-group dis-inblo">
            <select class="form-control sel-width" style="font-size:12px;" v-model="selectStatus">
              <option v-for="item in selList" :value="item.value" :key="item.id">{{item.name}}</option>
            </select>
          </div>
        </div>

        <div class="content-sec" v-if='listVis'>
          未查询到相关数据
        </div>
        <div class="content-thr" v-else>
          <hr class="mar-0">
          <div class="fun-hig">
            <input type="checkbox" class="allCheck" v-model="allCheck" id="allCheck" value="">
            <button class="btn btn-success btn-xs bor-rad bt-success" @click='httpreq("11105","0")'>显示</button>
            <button class="btn btn-warning btn-xs bor-rad bt-warn" @click='httpreq("11105","1")'>隐藏</button>
            <button class="btn btn-danger btn-xs bor-rad bt-dang" @click='httpreq("11106")'>删除</button>
          </div>
          <hr class="mar-0">
          <div>
            <table class="table table-striped" style="word-break:break-all; word-wrap:break-all;font-size:13px;">
              <!-- <caption style="margin-left:5px;font-size:13px;">{{pageLoction}}列表</caption> -->
              <colgroup>
                <col style="width:5%;">
                <col style="width:7%;">
                <col style="width:8%;">
                <col style="width:25%;">
                <col style="width:30%;">
                <col style="width:7%;">
                <col style="width:14%;">
              </colgroup>
              <thead class="title-size">
                <tr>
                  <th class="text-center">选择</th>
                  <th class="text-center">排序</th>
                  <th class="text-center">{{specific}}</th>
                  <th>标题</th>
                  <th>链接</th>
                  <th class="text-center">状态</th>
                  <th class="text-center">操作</th>
                </tr>
              </thead>
              <tbody>
                <tr  v-for='item in list' :key="item.id">
                  <td class="text-center"><input type="checkbox" name="" :id="item.id" :value="item.id" v-model="selected"></td>
                  <td class="text-center">{{item.ordernum}}</td>
                  <td class="text-center"><span id="imglist"><img :src="item.imgpath==''||item.imgpath==null?'http://www.entertry.com/imgdef.png':'http://www.entertry.com/upload/'+item.imgpath" class="img-30"><span><img :src="item.imgpath==''||item.imgpath==null?'http://www.entertry.com/imgdef.png':'http://www.entertry.com/upload/'+item.imgpath" ></span><div class="triangle-down"></div></span></td>
                  <td>{{item.name}}</td>
                  <td>{{item.url}}</td>
                  <td class="text-center">
                    <button class="btn btn-xs btn-success bor-rad bt-success" title="点击隐藏" v-if="item.status==1" @click='httpreq("11104",item.id,!item.status)'>显示</button>
                    <button class="btn btn-xs btn-warning bor-rad bt-warn" v-else @click='httpreq("11104",item.id,1)' title="点击显示">隐藏</button>
                  </td>
                  <td class="text-center">
                    <button class="btn btn-xs btn-success bor-rad bt-success" @click='edit(item.id)' data-toggle="modal" data-target="#myModal"><span class="fa fa-edit" style="font-size:12px;">编辑</span></button>
                    <button class="btn btn-xs btn-danger bor-rad bt-dang" @click='httpreq("11103",item.id)'><span class="fa fa-trash-o" style="font-size:12px;">删除</span></button>
                  </td>
                </tr>
              </tbody>
            </table>
            <div style="width:100%;"><span style="float:right;font-size:12px;margin-right:5px;">共{{listLen}}条记录</span></div>
          </div>
        </div>
        </div>
      </div>
      <div class="modal fade" id="myModal">
        <div class="modal-dialog " style="width:65%;margin-top:80px;">
          <div class="modal-content bor-rad">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                &times;
              </button>
              <h4 class="modal-title" id="myModalLabel" v-if="isEdit==0">
                添加{{pageLoction}}
              </h4>
              <h4 class="modal-title" id="myModalLabel" v-else>
                编辑{{pageLoction}}
              </h4>
            </div>
            <form class="form-horizontal" style="font-size:12px;" role="form">
            <div class="modal-body">
              <div class="form-group">
                <label for="firstname" class="col-sm-2 control-label padding-le">排序:</label>
                <div class="col-sm-10 padding-l">
                  <input type="text" v-model="slide.ordernum" class="form-control" placeholder="数字越大，排名越靠前">
                </div>
              </div>
              <div class="form-group">
                <label for="firstname" class="col-sm-2 control-label padding-le">{{pageLoction}}标题:</label>
                <div class="col-sm-10 padding-l">
                  <input type="text" v-model="slide.name" class="form-control" placeholder="">
                </div>
              </div>
              <div class="form-group">
                <label for="firstname" class="col-sm-2 control-label padding-le">{{specific}}:</label>
                <div class="col-sm-10 padding-l">
                   <div class="input-group">
                      <input type="text" v-model="slide.imgpath" class="form-control" disabled>
                      <input type="file" name="file" id="file" @change="fileUpload($event)" style="display:none">
                      <span class="input-group-addon upload-pic" @click="selectPic()">选择{{specific}}</span>
                   </div>
                   <div class="text-left" style="width:82px; margin-top:8px;border:1px #ccc solid"><img  id="img-upload" :src="imgTmp" class="img-size"></div>
                   <div class="text-left" style="color:#aaa;margin-top:5px;font-size:11px;">建议尺寸:100 * 100 , 请将所有{{pageLoction}}尺寸保持一致</div>
                </div>
              </div>
              <div class="form-group">
                <label for="firstname" class="col-sm-2 control-label padding-le">链接:</label>
                <div class="col-sm-10 padding-l">
                   <div class="input-group">
                      <input type="text" v-model="slide.url" class="form-control">
                      <span class="input-group-addon upload-pic">选择链接</span>
                   </div>
                </div>
              </div>
              <div class="form-group">
                <label for="firstname" class="col-sm-2 control-label padding-le">状态:</label>
                <div class="col-sm-10 padding-l">
                  <div class="checkbox text-left">
                      <label><input type="radio" value="1" v-model="slide.status">显示</label>
                      <label><input type="radio" value="0" v-model="slide.status">隐藏</label>
                  </div>
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">关闭
              </button>
              <button type="button" class="btn btn-primary color-blue" @click='httpreq("11102")' v-if="isEdit==0">
                提交添加
              </button>
              <button type="button" class="btn btn-primary color-blue" @click='httpreq("11108")' v-else>
                提交更改
              </button>
            </div>
            </form>
          </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <transition name="slide-fade">
      <div class="pro-box" v-if="proboxStatus==1">操作成功</div>
    </transition>
    <transition name="slide-fade">
      <div class="pro-box col-org" v-if="proboxStatus==2">{{warn}}</div>
    </transition>
  </div>
</template>

<script>
export default {
  data () {
    return {
      // 监听刷新数据
      datachange : true,
      location:"",
      // 下拉列表
      selList:[{
        name :"状态",
        value : "2"
      },{
        name :"显示",
        value : "1"
      },{
        name :"隐藏",
        value : "0"
      }],
      // 返回表数据
      list:[],
      // 表结构
      slide:{
        ordernum : null,
        name : "",
        imgpath :"",
        url :"",
        status : 1
      },
      proboxStatus:0,
      selected: [],
      selectedTmp : [],
      allCheck :[],
      keyword : null,
      selectStatus : "2",
      isEdit :2,
      imgTmp :"http://www.entertry.com/imgdef.png",
      table: ""
    }
  },
  computed:{
    specific(){
      return "图片"
    },
    subhiden(){
      return this.$store.state.status.subSidebarVisit
    },
    listVis(){
      if (this.list.length==0) {
        return true
      }else{
        return false
      }
    },
    messhiden(){
      return this.$store.state.status.messagebarVisit
    },
    listLen(){
      return this.list.length;
    },
    pageLoction(){
      return this.$store.state.status.pageLoction
    }
  },
  methods:{
    httpreq(ywtype){
      switch(ywtype){
        case "11102":
          this.slide.table = this.table
          this.$http.post("api/main.php?ywtype="+ywtype,this.slide).then(response=>{
            $("#myModal").modal('hide');
            this.dtChange();
            this.proStatus(1);
          })
          break;
        case "11101":
          this.$http.get("api/main.php?ywtype="+ywtype+"&tb="+this.table).then(response=>{
            this.selectedTmp = [];
            this.list = response.data;
            if(this.selectedTmp.length==0){
              for(var item of this.list){
                this.selectedTmp.push(item.id);
              }
            }
          })
          break;
        case "11103":
          if(confirm("确定要删除吗?")){
            this.$http.get("api/main.php?ywtype="+ywtype+"&id="+arguments[1]+"&tb="+this.table).then(response=>{
              this.dtChange();
              this.proStatus(1);
            })
          }
          break;
        case "11104":
            this.$http.get("api/main.php?ywtype="+ywtype+"&id="+arguments[1]+"&status="+arguments[2]+"&tb="+this.table).then(response=>{
              for(var item of this.list){
                if (item.id==arguments[1]){
                  item.status=!item.status;
                }
              }
              this.proStatus(1);
            },response=>{
              this.proStatus(2,"操作失败");
            })
            break;
        case "11105":
            if(this.selected.length<=0){
              this.proStatus(2,"请选择操作选项");
              break;
            }
            this.$http.post("api/main.php?ywtype="+ywtype+"&type="+arguments[1]+"&tb="+this.table,this.selected).then(response=>{
              this.dtChange();
              this.proStatus(1);
              this.selected = [];
              this.allCheck = [];
            },response=>{
              this.proStatus(2);
            })
            break;
        case "11106":
          if(this.selected.length<=0){
            this.proStatus(2,"请选择操作的选项");
            break;
          }
          if(confirm("删除所选内容？")){
            this.$http.post("api/main.php?ywtype="+ywtype+"&tb="+this.table,this.selected).then(response=>{
              this.dtChange();
              this.proStatus(1);
              this.selected = [];
              this.allCheck = [];
            },response=>{
              this.proStatus(2,"操作失败");
            })
          }
          break;
        case "11107":
          if (this.keyword != null) {
            this.$http.get("api/main.php?ywtype="+ywtype+"&keyword="+this.keyword+"&type="+this.selectStatus+"&tb="+this.table).then(response=>{
              this.list = response.data;
            })
          }
          break;
        case "11108":
          this.$http.post("api/main.php?ywtype="+ywtype+"&tb="+this.table,this.slide).then(response=>{
                      $("#myModal").modal('hide');
                      this.dtChange();
                      this.proStatus(1);
          })
          break;
        default:
          break;
      }
    },
    search(){
      this.httpreq("11107");
    },
    dtChange(){
      this.datachange = !this.datachange;
    },
    // 1操作成功  2操作失败
    proStatus(status,warn){  
      let that = this;
      this.warn = warn;
      that.proboxStatus = status;
      setTimeout(function() {
        that.proboxStatus = 0;
        this.warn = "";
      },1000);
    },
    edit(key){
      this.isEdit = 1;
      for(var item of this.list){
        if(item.id==key){
          this.slide = item
        }
      }
      this.slide.id = key;
    },
    addList(){
      this.slide = {
        ordernum : null,
        name : "",
        imgpath :"",
        url :"",
        status : 1
      },
      this.isEdit = 0
      this.imgTmp = "http://www.entertry.com/imgdef.png"
    },
    selectPic(){
      $("#file").trigger("click");
    },
    fileUpload(e){
      //获取文件信息
      let that = this;
      let file = e.target.files[0];
      let fileName = that.$utils.getUID()+"."+that.$utils.getCaption(file.type,"\/");

      //实现图片预览
      let reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function() {
          that.imgTmp = this.result
      }

      //上传图片
      let config = {
          headers: {'Content-Type': 'multipart/form-data'}
      }
      let param = new FormData();
      param.append('file',file,fileName);//通过append向form对象添加数据
      // console.log(param.get('file')); //FormData私有类对象，访问不到，可以通过get判断值是否传进去

      that.$http.post("api/main.php?ywtype=10002",param,config).then(response=>{
        that.slide.imgpath = fileName
      })
    }
  },
  mounted: function(){
      this.dtChange();
      this.table = this.$store.state.status.curtable
  },
  watch:{
    datachange:function () {
      this.httpreq("11101");
    },
    allCheck:function () {
      if(this.allCheck[0]==null){
        this.selected = [];
      }else{
        this.selected = this.selectedTmp;
      }
    }
  }
}
</script>
