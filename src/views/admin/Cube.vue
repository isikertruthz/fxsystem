<template>
  <div>
    <!-- adjust 适应框架宽度 -->
    <div
      class="comm-view"
      :class="commLay==240?messagebarVisit?'pad-lefta pad-right':'pad-lefta':commLay==130?messagebarVisit?'pad-leftb pad-right':'pad-leftb':commLay==170?messagebarVisit?'pad-leftc pad-right':'pad-leftc':commLay==60?messagebarVisit?'pad-leftd pad-right':'pad-leftd':''"
    >
      <div class="dp-location">
        <!-- location -->
        <span class="loc-bor">
          当前位置：
          <label class="page-location">{{pageLoction}}管理</label>
        </span>
      </div>
      <!-- location End -->
      <div class="content">
        <div class="content-top">
          <div class="text-left padding-25">
            <img :src="url+'cube.jpg'" class="cube-img" alt="" style="height:110px;width:660px;">
            <div
              class="alert alert-primary bor-rad"
              style="margin: 10px 0;height:46px;padding:13px 15px;"
            >提示：拖动改变位置，最多添加4个，请参照上图。删除操作不需再保存。图片路径和链接的值为空将不保存。</div>
            <table class="table" style="margin-bottom:10px;">
              <thead>
                <tr style="border-bottom:1px solid #dddddd;">
                  <th style="width:60px;border:none;">排序</th>
                  <th style="border:none;">图片</th>
                  <th style="border:none;">链接</th>
                  <th style="width:60px;border:none;">操作</th>
                </tr>
              </thead>
              <tbody id="tbody" class="ui-sortable">
                <tr class="cube-item" v-for="(item) in list" :key="item.id" :id="item.id">
                  <td>
                    <a href="javascript:;" class="btn btn-default btn-sm btn-move bor-rad">
                      <i class="fa fa-arrows"></i>
                    </a>
                  </td>
                  <td>
                    <div class="input-group img-item">
                      <div
                        class="input-group-addon"
                        style="padding: 0 5px;background-color:white;border-radius: 0;"
                      >
                        <img
                          :src="item.imgpath==''?imgtmp==''?'http://www.entertry.com/imgdef.png':imgtmp:'http://www.entertry.com/upload/'+item.imgpath"
                          style="height:20px;width:20px"
                        >
                      </div>
                      <input
                        type="text"
                        class="form-control"
                        name=""
                        :value="item.imgpath"
                        style="height:34px;"
                        disabled
                      >
                      <div class="input-group-btn">
                        <input
                          type="file"
                          name="file"
                          :id="'file'+item.id"
                          @change="fileUpload($event,item.id)"
                          style="display:none;"
                        >
                        <button
                          type="button"
                          @click="selectPic('file'+item.id)"
                          class="btn btn-default btn-select-pic bor-rad"
                        >选择图片</button>
                      </div>
                    </div>
                  </td>
                  <td>
                    <div class="input-group form-group" style="margin: 0;">
                      <input
                        type="text"
                        v-model="item.url"
                        style="height:34px;"
                        class="form-control valid"
                        name=""
                        placeholder=""
                      >
                      <span class="input-group-btn">
                        <span class="btn btn-default bor-rad">选择链接</span>
                      </span>
                    </div>
                  </td>
                  <td>
                    <button
                      type="button"
                      class="btn btn-danger btn-sm bor-rad cub-delitem"
                      @click="delitem(item.id)"
                      :data-num="item.id"
                      :id="item.id"
                    >
                      <i class="fa fa-remove"></i>
                    </button>
                  </td>
                </tr>
              </tbody>
            </table>
            <div>
              <button
                class="btn btn-primary btn-sm c-blue"
                style="background-color:#44abf7;height:28px;"
                @click="httpreq('11302')"
              >保存</button>
              <button type="button" class="btn btn-sm btn-default bor-rad" @click="addlist()">
                <i class="fa fa-plus"></i>添加魔方
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- adjust End  -->
  </div>
</template>

<script>
/**
 * Coded By name
 * on date
 */
import { mapState } from "vuex";
export default {
  data() {
    return {
      url: "http://www.entertry.com/images/img/",
      imgtmp: "",
      list: [
        {
          id: 0,
          imgpath: "",
          url: ""
        },
        {
          id: 1,
          imgpath: "",
          url: ""
        }
      ]
    };
  },
  computed: {
    ...mapState({
      pageLoction: state => state.status.pageLoction,
      messagebarVisit: state => state.status.messagebarVisit,
      sidebarmax: state => state.status.sidebarmax,
      subSidebarVisit: state => state.status.subSidebarVisit
      
    }),
    commLay() {
      if (this.sidebarmax && this.subSidebarVisit) {
        return 240;
      } else if (this.sidebarmax && !this.subSidebarVisit) {
        return 130;
      } else if (!this.sidebarmax && this.subSidebarVisit) {
        return 170;
      } else {
        return 60;
      }
    }
  },
  watch: {},
  methods: {
    selectPic(id) {
      id = "#" + id;
      $(id).trigger("click");
    },
    httpreq(ywtype) {
      switch (ywtype) {
        case "11301": //查询
          this.$http
            .get("api/main.php?ywtype=" + ywtype + "&tb=" + this.table)
            .then(response => {
              console.log(response);
              this.list = response.data;
            });

          break;
        case "11103": //删除
          let id = arguments[1];
          this.$http
            .get(
              "api/main.php?ywtype=" +
                ywtype +
                "&tb=" +
                this.table +
                "&id=" +
                id
            )
            .then(response => {
              for (var index in this.list) {
                if (this.list[index].id == id) {
                  this.list.splice(index, 1);
                }
              }
            });
          break;
        case "11302":
          let temp = [];
          let serial = $("#tbody").sortable("toArray");
          console.log(serial);
          for (var index in this.list) {
            //排序
            for (var indexs in serial) {
              if (this.list[index].id == serial[indexs]) {
                this.list[index].ordernum = indexs;
              }
            }
            //过滤
            if (this.list[index].imgpath != "" || this.list[index].url != "") {
              temp.push(this.list[index]);
            }
          }
          if (temp.length > 0) {
            this.$http
              .post("api/main.php?ywtype=" + ywtype + "&tb=" + this.table, temp)
              .then(response => {
                console.log(response);
                this.list = response.data;
              });
          }
          break;
        default:
          break;
      }
    },
    //弹出操作状态
    // 1操作成功  2操作失败
    // proStatus(status,warn){
    //     let that = this
    //     this.warn = warn
    //     that.proboxStatus = status
    //     console.log(that.proboxStatus)
    //     setTimeout(function() {
    //         that.proboxStatus = 0
    //         this.warn = ""
    //     },1000)
    // },
    delitem(id) {
      if (confirm("确定删除该魔方图片？") == 1) {
        this.httpreq("11103", id);
      }
    },
    addlist() {
      let newid = 0;
      if (this.list.length < 4) {
        for (var item of this.list) {
          if (item.id > newid) {
            newid = item.id;
          }
        }
        newid = newid + 1;
        this.list.push({
          id: newid,
          imgpath: "",
          url: ""
        });
      } else {
        console.log("error");
      }
    },
    fileUpload(e, id) {
      //获取文件信息
      let that = this;
      let file = e.target.files[0];
      let fileName =
        that.$utils.getUID() + "." + that.$utils.getCaption(file.type, "/");

      //实现图片预览
      let reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function() {
        that.imgtmp = this.result;
      };

      //上传图片
      let config = {
        headers: { "Content-Type": "multipart/form-data" }
      };
      let param = new FormData();
      param.append("file", file, fileName); //通过append向form对象添加数据
      // console.log(param.get('file'))  //FormData私有类对象，访问不到，可以通过get判断值是否传进去

      that.$http
        .post("api/main.php?ywtype=10002", param, config)
        .then(response => {
          // that.slide.imgpath = fileName
          for (var item of that.list) {
            if (item.id == id) {
              item.imgpath = fileName;
            }
          }
        });
    }
  },
  /* event listeners code in mounted function*/
  mounted: function() {
    let that = this;
    var comp = $("#tbody");
    comp.sortable({ handle: "a" });
    comp.disableSelection();
    this.table = this.$store.state.status.curtable;

    that.httpreq("11301");
  },
  destroyed: function() {}
};
</script>