<template>
    <div>
        <!-- adjust 适应框架宽度 -->
        <div class="comm-view" :class="commLay==240?messagebarVisit?'pad-lefta pad-right':'pad-lefta':commLay==130?messagebarVisit?'pad-leftb pad-right':'pad-leftb':commLay==170?messagebarVisit?'pad-leftc pad-right':'pad-leftc':commLay==60?messagebarVisit?'pad-leftd pad-right':'pad-leftd':''">
            <div class="dp-location"> <!-- location -->
                <span class="loc-bor">当前位置：
                    <label class="page-location">{{pageLoction}}管理</label>
                </span>
            </div> <!-- location End -->
            <div class="content main_content"> 
                <div class="content-top page-content">
                    <form action="" method="get" class="form-horizontal form-search" role="form">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab_1" data-toggle="tab">所有秒杀活动</a></li>
                            <li><a href="#tab_2" data-toggle="tab">未开始</a></li>
                            <li><a href="#tab_3" data-toggle="tab">进行中</a></li>
                            <li><a href="#tab_4" data-toggle="tab">已结束</a></li>
                            <li class="li_add"><a href="javascript:;"><i class="fa fa-plus i_fff"></i>添加商品</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="tab_1">
                                <div class="form-group">
                                    <label class="col-sm-1 control-label must"><i class="i_eb6060">*</i>商品名称：</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label"><i class="i_eb6060">*</i>标签：</label>
                                    <div class="col-sm-4">
                                        <select class="form-control select2">
                                            <option value="0">标签</option>
                                            <option value="1">标签</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label"><i class="i_eb6060">*</i>分类：</label>
                                    <div class="col-sm-4">
                                        <select class="form-control select2">
                                            <option value="0">分类</option>
                                            <option value="1">分类</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label"><i class="i_eb6060">*</i>状态：</label>
                                    <div class="col-sm-4 text-left">
                                        <label class="radio-inline">
                                            <input type="radio" name="name" value="0" class="valid"> 是
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="name" value="1" checked="checked" class="valid"> 否
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label"><i class="i_eb6060">*</i>选择商品：</label>
                                    <div class="col-sm-4">
                                        <!-- <div class="input-group">
                                            <input type="file" id="file" class="form_file" />
                                            <label for="file" class="form_file_label"></label>
                                        </div> -->
                                        <div class="input-file-container input-group">  
                                            <input class="input-file" id="my-file" type="file">
                                            <label tabindex="0" for="my-file" class="input-file-trigger form_file_label"></label>
                                            </div>
                                            <p class="file-return"></p>
                                        </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label must"><i class="i_eb6060">*</i>秒杀价：</label>
                                    <div class="col-sm-1">
                                        <div class="input-group input_width">
                                            <input type="text" class="form-control hasoption valid" placeholder="0" />
                                            <span class="input-group-addon">元</span>
                                        </div>
                                    </div>
                                    <label class="col-sm-1 control-label must"><i class="i_eb6060">*</i>原价：</label>
                                    <div class="col-sm-1">
                                        <div class="input-group input_width">
                                            <input type="text" class="form-control hasoption valid" placeholder="0" />
                                            <span class="input-group-addon">元</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group text-left">
                                    <label class="col-sm-1 control-label must"><i class="i_eb6060">*</i>开始时间：</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="jeinput icons" id="date_1" placeholder="YYYY-MM-DD hh:mm:ss">
                                    </div>
                                </div>
                                <div class="form-group text-left">
                                    <label class="col-sm-1 control-label must"><i class="i_eb6060">*</i>结束时间：</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="jeinput icons" id="date_2" placeholder="YYYY-MM-DD hh:mm:ss">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label must"><i class="i_eb6060">*</i>数量：</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label must"><i class="i_eb6060">*</i>限量：</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label must"><i class="i_eb6060">*</i>自动取消：</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" value="120" />
                                        <div class="help-block pull-right">抢购成功，不付款多少秒之后，自动取消资格，默认120秒(2分钟)</div>
                                    </div>
                                </div>
                                <div class="form-group text-left">
                                    <div class="col-sm-6 col-sm-offset-1 form_btn">
                                        <input type="submit" value="提交" class="btn btn_34a853">
                                        <a class="btn btn_269bf2" href="javascript:;">返回列表</a>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="tab_2">
                                <div class="form-group">
                                    <label class="col-sm-1 control-label must"><i class="i_eb6060">*</i>商品名称：</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" />
                                    </div>
                                </div>
                                <div class="form-group text-left">
                                    <div class="col-sm-6 col-sm-offset-1 form_btn">
                                        <input type="submit" value="提交" class="btn btn_34a853">
                                        <a class="btn btn_269bf2" href="javascript:;">返回列表</a>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="tab_3">
                                <div class="form-group">
                                    <label class="col-sm-1 control-label must"><i class="i_eb6060">*</i>商品名称：</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" />
                                    </div>
                                </div>
                                <div class="form-group text-left">
                                    <div class="col-sm-6 col-sm-offset-1 form_btn">
                                        <input type="submit" value="提交" class="btn btn_34a853">
                                        <a class="btn btn_269bf2" href="javascript:;">返回列表</a>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="tab_4">
                                <div class="form-group">
                                    <label class="col-sm-1 control-label must"><i class="i_eb6060">*</i>商品名称：</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" />
                                    </div>
                                </div>
                                <div class="form-group text-left">
                                    <div class="col-sm-6 col-sm-offset-1 form_btn">
                                        <input type="submit" value="提交" class="btn btn_34a853">
                                        <a class="btn btn_269bf2" href="javascript:;">返回列表</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div> <!-- adjust End  -->
    </div>
</template>

<script>
/**
 * Coded By Raccoon
 * on 2018.10.19
 */
import { mapState } from 'vuex';

export default {
    data() {
        return {}
    },
    computed: {
        ...mapState({
            pageLoction : state => state.status.pageLoction,
            messagebarVisit : state => state.status.messagebarVisit,
            sidebarmax : state => state.status.sidebarmax,
            subSidebarVisit : state => state.status.subSidebarVisit
        }),
        commLay(){
            if(this.sidebarmax && this.subSidebarVisit){
                return 240
            }else if(this.sidebarmax && !this.subSidebarVisit){
                return 130
            }else if(!this.sidebarmax && this.subSidebarVisit){
                return 170
            }else{
                return 60
            }
        }
    },
    watch: {},
    methods: {},
    /* event listeners code in mounted function*/
    mounted: function(){},
    destroyed: function(){}
}
</script>

