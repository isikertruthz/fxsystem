<template>
  <div class="hello" :class="subhiden?messhiden?'helloa helloc':'helloa':messhiden?'hellob helloc':'hellob'">
    <div class="dp-location">
      <span class="loc-bor">当前位置</span>
    </div>
    <div class="content">
      <div class="content-top">
        <div class="content-sub">
          <button type="button" class="btn btn-primary btn-sm c-blue" data-toggle="modal" data-target="#myModal"><span class="fa fa-plus">添加幻灯片</span></button>
          <button type="button" class="btn btn-primary btn-sm c-blue bt-flo">搜索</span></button>
          <input type="text" name="text" class="form-control inp-hig" placeholder="请输入关键词">
          <div class="form-group dis-inblo">
            <select class="form-control sel-width">
              <option v-for="item in selList">{{item}}</option>
            </select>
          </div>
        </div>

        <div class="content-sec" v-if='listVis'>
          未查询到相关数据
        </div>
        <div class="content-thr" v-else='listVis'>
          <hr class="mar-0">
          <div class="fun-hig">
            <input type="checkbox" style="width:16px;height:16px;display:inline-block;padding-top:3px;">
            <button class="btn btn-success btn-xs bor-rad">显示</button>
            <button class="btn btn-warning btn-xs bor-rad">隐藏</button>
            <button class="btn btn-danger btn-xs bor-rad">删除</button>
          </div>
          <hr class="mar-0">
          <div>
            <table class="table table-striped" style="word-break:break-all; word-wrap:break-all;font-size:13px;">
              <!-- <caption style="margin-left:5px;font-size:13px;">幻灯片列表</caption> -->
              <colgroup>
                <col style="width:20%;">
                <col style="width:20%;">
                <col style="width:20%;">
                <col style="width:20%;">
                <col style="width:20%;">
              </colgroup>
              <thead>
                <tr>
                  <th>排序</th>
                  <th>标题</th>
                  <th>链接</th>
                  <th>状态</th>
                  <th class="text-center">操作</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for='item in list'>
                  <td>{{item.ordernum}}</td>
                  <td>{{item.name}}</td>
                  <td>{{item.url}}</td>
                  <td>
                    <button class="btn btn-xs btn-success bor-rad" style="border-radius:9px;" title="点击隐藏" v-if="item.status==1" @click='httpreq("11104",item.id,!item.status)'>显示</button>
                    <button class="btn btn-xs btn-warning bor-rad" style="border-radius:9px;" v-else="item.status" @click='httpreq("11104",item.id,1)'>隐藏</button>
                  </td>
                  <td class="text-center">
                    <button class="btn btn-xs btn-danger bor-rad" @click='httpreq("11103",item.id)'>删除</button>
                  </td>
                </tr>
              </tbody>
            </table>
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
              <h4 class="modal-title" id="myModalLabel">
                添加幻灯片
              </h4>
            </div>
            <form class="form-horizontal" style="font-size:12px;" role="form">
            <div class="modal-body">
              <div class="form-group">
                <label for="firstname" class="col-sm-2 control-label">排序:</label>
                <div class="col-sm-10">
                  <input type="text" v-model="slide.ordernum" class="form-control" placeholder="数字越大，排名越靠前">
                </div>
              </div>
              <div class="form-group">
                <label for="firstname" class="col-sm-2 control-label">幻灯片标题:</label>
                <div class="col-sm-10">
                  <input type="text" v-model="slide.name" class="form-control" placeholder="">
                </div>
              </div>
              <div class="form-group">
                <label for="firstname" class="col-sm-2 control-label">图片:</label>
                <div class="col-sm-10">
                   <div class="input-group">
                      <input type="text" v-model="slide.imgpath" class="form-control">
                      <span class="input-group-addon upload-pic">选择图片</span>
                   </div>
                   <div class="text-left" style="width:82px; margin-top:8px;border:1px #ccc solid"><img src="http://weifx.webqt.cn/addons/ewei_shopv2/static/images/default-pic.jpg" class="img-size"></div>
                   <div class="text-left" style="color:#aaa;margin-top:5px;font-size:11px;">建议尺寸:640 * 350 , 请将所有幻灯片图片尺寸保持一致</div>
                </div>
              </div>
              <div class="form-group">
                <label for="firstname" class="col-sm-2 control-label">链接:</label>
                <div class="col-sm-10">
                   <div class="input-group">
                      <input type="text" v-model="slide.url" class="form-control">
                      <span class="input-group-addon upload-pic">选择链接</span>
                   </div>
                </div>
              </div>
              <div class="form-group">
                <label for="firstname" class="col-sm-2 control-label">状态:</label>
                <div class="col-sm-10">
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
              <button type="button" class="btn btn-primary color-blue" @click='httpreq("11102")'>
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
      <div class="pro-box col-org" v-if="proboxStatus==2">操作失败</div>
    </transition>
  </div>
</template>

<script>
export default {
  data () {
    return {
      // 监听刷新数据
      datachange : true,
      location:"店铺首页",
      // 下拉列表
      selList:[
        "状态","显示","隐藏"
      ],
      // 返回表数据
      list:[""],
      // 表结构
      slide:{
        ordernum : null,
        name : "",
        imgpath :"",
        url :"",
        status : 1
      },
      proboxStatus:0
    }
  },
  computed:{
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
    }
  },
  methods:{
    httpreq(ywtype){
      switch(ywtype){
        case "11102":
          this.$http.post("api/main.php?ywtype="+ywtype,this.slide).then(response=>{
            $("#myModal").modal('hide');
            this.dtChange();
            this.proStatus(1);
          })
          break;
        case "11101":
          this.$http.get("api/main.php?ywtype="+ywtype).then(response=>{
            this.list = response.data;
          })
          break;
        case "11103":
          if(confirm("确定要删除吗?")){
            this.$http.get("api/main.php?ywtype="+ywtype+"&id="+arguments[1]).then(response=>{
              this.dtChange();
              this.proStatus(1);
            })
          }
          break;
        case "11104":
            this.$http.get("api/main.php?ywtype="+ywtype+"&id="+arguments[1]+"&status="+arguments[2]).then(response=>{
              // console.log(response);
              this.dtChange();
              this.proStatus(1);
            },response=>{
              this.proStatus(2);
            })
        default:
      }
    },
    dtChange(){
      this.datachange = !this.datachange;
    },
    // 1操作成功  2操作失败
    proStatus(status){  
      let that = this;
      that.proboxStatus = status;
      setTimeout(function() {
        that.proboxStatus = 0;
      },900);
    }
  },
  mounted: function(){
      this.dtChange();
  },
  watch:{
    datachange:function () {
      this.httpreq("11101");
    }
  }
}
</script>

<style scoped>
.dp-location{
  width: calc(100% - 50px);
  height: 60px;
  text-align: left;
  padding:0 25px;
  font-size: 0.9em;
}
.loc-bor{
  border-left: 3px solid #00AEFF;
  padding-left: 6px;
  line-height: 60px;

}
.content{
  width: 100%;

}
.content-top{
  background-color: white;
  width: calc(100% - 50px);
  margin: 0 25px;
  height: 1000px;
}
.content-sub{
  padding: 0 25px;
  /*width :calc(100% - 50px);*/
  /*background-color: #555;*/
  height: 70px;
  text-align: left;
  line-height: 70px;
}
.c-blue{
  background-color: #44ABF7;
  border-color: #44ABF7;
  display: inline-block;
  height: 30px;
  border-radius: 0px;
}
.sel-width{
  width: 80px;
  height: 30px;
/*  display: inline-block;*/
  border-radius: 0
}
.dis-inblo{
  display: inline-block;
  float: right;
  margin-top: 20px;
}
.inp-hig{
  height: 30px;
  width: 200px;
  display: inline-block;
  float: right;
  margin-top: 20px;
  margin-left: 5px;
  border-radius: 0
}
.bt-flo{
  float: right;
  margin-top: 20px;
  border-radius: 0
}
.bor-rad{
  border-radius: 0;
}
.content-sec{
  width: calc(100% - 50px);
  height: 100px;
  /*background-color: #aaa;*/
  /*text-align:right;*/
  margin: 0px 25px;
  line-height: 100px;
  border:1px solid #ddd;
  color: #aaa;
}
.content-thr{
  width: 100%;
  padding: 0 25px;
  text-align: left;
  /*padding: 7px 0;*/
}
.mar-0{
  margin: 0;
}
.fun-hig{
  height: 43px;
  padding: 5px 0;
}
.form-group input{
  height: 28px;
  border-radius: 0;
  font-size: 12px;
}
.upload-pic{
  border-radius: 0;
  background-color: #44ABF7;
  color: white;
  border-color: #44ABF7;
  cursor: pointer;
}
.color-blue{
  background-color: #44ABF7;
  border-color: #44ABF7;
  color: white;
}
.img-size{
  width:80px;
  height:80px;
}
.btn:focus,
.btn:active:focus,
.btn.active:focus,
.btn.focus,
.btn:active.focus,
.btn.active.focus {
    outline: none;          
}
.pro-box{
  background-color: green;
  position: absolute;
  top:0;
  width: 10%;
  height:35px;
  margin:0 auto;
  line-height: 35px;
  z-index: 300;
  color: white;
  left:0px;
  right: 0px;
  border-radius: 0 0 5px 5px;
  font-size: 13px;
}
.col-org{
  background-color: #f0ad4e;
}
</style>
