<template>
    <div>
        <!-- adjust 适应框架宽度 -->
        <div class="comm-view" :class="commLay==240?messagebarVisit?'pad-lefta pad-right':'pad-lefta':commLay==130?messagebarVisit?'pad-leftb pad-right':'pad-leftb':commLay==170?messagebarVisit?'pad-leftc pad-right':'pad-leftc':commLay==60?messagebarVisit?'pad-leftd pad-right':'pad-leftd':''">
            <div class="dp-location"> <!-- location -->
                <span class="loc-bor">当前位置：
                    <label class="page-location">{{pageLoction}}管理</label>
                </span>
            </div> <!-- location End -->
            <div class="content" > 
                <div class="content-top">
                    <div class="text-left padding-25" >
                        <img :src="url+'cube.jpg'"  class="cube-img" alt="" style="height:110px;width:660px;">
                        <div class="alert alert-primary bor-rad" style="margin: 10px 0;height:46px;padding:13px 15px;">提示：拖动改变位置，最多添加4个，请参照上图</div>
                        <table class="table" style="margin-bottom:10px;">
                            <thead>
                                <tr>
                                    <th style="width:60px;border:none;">操作</th>
                                    <th style="border:none;">图片</th>
                                    <th style="border:none;">链接</th>
                                    <th style="width: 60px;border:none;">操作</th>
                                </tr>
                            </thead>
                            <tbody id="tbody" class="ui-sortable">
							    <tr class="cube-item">
						            <td>
                                        <a href="javascript:;" class="btn btn-default btn-sm btn-move bor-rad"><i class="fa fa-arrows"></i></a>
                                    </td>
						            <td>
							                <div class="input-group img-item">
								            <div class="input-group-addon" style="padding: 0 5px;background-color:white;border-radius: 0;">
									            <img src="http://weifx.webqt.cn/attachment/images/2/2018/10/UvrRCrPF0BCPtUKHB8ob82B8424JkV.jpg" style="height:20px;width:20px" >
								            </div>
                                            <input type="text" class="form-control" name="" value="images/2/2018/10/UvrRCrPF0BCPtUKHB8ob82B8424JkV.jpg" style="height:34px;">
											<div class="input-group-btn">
										        <button type="button" class="btn btn-default btn-select-pic bor-rad">选择图片</button>
									        </div>
											</div>
						            </td>
                                    <td>
                                        <div class="input-group form-group" style="margin: 0;">
                                                <input type="text" value="" style="height:34px;" class="form-control valid" name="" placeholder="" >
                                                <span class="input-group-btn ">
                                                    <span class="btn btn-default bor-rad">选择链接</span>
                                                </span>
                                        </div>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-danger btn-sm bor-rad" @click="delitem()"><i class="fa fa-remove"></i></button>
                                    </td>
                                </tr>
							    <tr class="cube-item">
						            <td>
                                        <a href="javascript:;" class="btn btn-default btn-sm btn-move bor-rad"><i class="fa fa-arrows"></i></a>
                                    </td>
						            <td>
							                <div class="input-group img-item">
								            <div class="input-group-addon" style="padding: 0 5px;background-color:white;border-radius: 0;">
									            <img src="http://weifx.webqt.cn/attachment/images/2/2018/10/UvrRCrPF0BCPtUKHB8ob82B8424JkV.jpg" style="height:20px;width:20px" >
								            </div>
                                            <input type="text" class="form-control" name="" style="height:34px;" value="images/2/2018/10/UvrRCrPF0BCPtUKHB8ob82B8424JkV.jpg">
											<div class="input-group-btn">
										        <button type="button" class="btn btn-default btn-select-pic bor-rad">选择图片</button>
									        </div>
											</div>
						            </td>
                                    <td>
                                        <div class="input-group form-group" style="margin: 0;">
                                                <input type="text" value="" style="height:34px;" class="form-control valid" name="" placeholder="" >
                                                <span class="input-group-btn ">
                                                    <span class="btn btn-default bor-rad">选择链接</span>
                                                </span>
                                        </div>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-danger btn-sm bor-rad" @click="delitem()"><i class="fa fa-remove"></i></button>
                                    </td>
                                </tr>
							    <tr class="cube-item">
						            <td>
                                        <a href="javascript:;" class="btn btn-default btn-sm btn-move bor-rad"><i class="fa fa-arrows"></i></a>
                                    </td>
						            <td>
							                <div class="input-group img-item">
								            <div class="input-group-addon" style="padding: 0 5px;background-color:white;border-radius: 0;">
									            <img src="http://weifx.webqt.cn/attachment/images/2/2018/10/UvrRCrPF0BCPtUKHB8ob82B8424JkV.jpg" style="height:20px;width:20px" >
								            </div>
                                            <input type="text" class="form-control" name="" style="height:34px;" value="images/2/2018/10/UvrRCrPF0BCPtUKHB8ob82B8424JkV.jpg">
											<div class="input-group-btn">
										        <button type="button" class="btn btn-default btn-select-pic bor-rad">选择图片</button>
									        </div>
											</div>
						            </td>
                                    <td>
                                        <div class="input-group form-group" style="margin: 0;">
                                                <input type="text" value="" style="height:34px;" class="form-control valid" name="" placeholder="" >
                                                <span class="input-group-btn ">
                                                    <span class="btn btn-default bor-rad">选择链接</span>
                                                </span>
                                        </div>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-danger btn-sm bor-rad" @click="delitem()"><i class="fa fa-remove"></i></button>
                                    </td>
                                </tr>
						    </tbody>
					        </table>
                            <div>
                                <button class="btn btn-primary btn-sm c-blue " style="background-color:#44abf7;height:28px;">保存</button>
                                <button type="button" class="btn btn-sm btn-default bor-rad" onclick="addCube()"><i class="fa fa-plus"></i> 添加魔方</button>
                            </div>
                    </div>
                </div>
            </div>
        </div> <!-- adjust End  -->
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
      url: "http://www.entertry.com/images/img/"
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
  methods: {},
  /* event listeners code in mounted function*/
  mounted: function() {
       var comp = $("#tbody")
        comp.sortable(
            { handle: "a" }
        );
        $("#tbody").disableSelection();
  },
  destroyed: function() {}
};
</script>