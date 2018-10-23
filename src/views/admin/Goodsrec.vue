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
                    <div class="text-left padding-25">
                        <div class="alert alert-primary bor-rad" style="height:48px;padding:14px 15px;min-width:780px;margin-bottom:15px;">提示: 请在下方选择要显示的商品; 不选择则将不显示; 点击拖拽更换排序</div>
                        <div class="input-group" style="width:66%;min-width:550px;margin-bottom:13px;">
                            <input type="text" id="goodsid_text" name="goodsid_text" value="" class="form-control text bor-rad" readonly="" style="height:30px;">
                            <div class="input-group-btn">
                                <button class="btn btn-primary btn-sm select_goods c-blue" type="button">选择商品</button>
                            </div>
                        </div>
                        <ul style="width:68%;max-width:900px;" id="gsrecsortable">
                            <li style="display:inline-block;position:relative;margin-right:20px;margin-bottom:8px;" title="Iwatch" class="item" data-toggle="tooltip" data-placement="right">
                                <img class="img-responsive img-thumbnail" src="http://weifx.webqt.cn/attachment/images/2/2018/06/JdDHM88Ijni82R7wdjH2HiwODdOhhj.jpg" style="width:100px;height:100px;">
                                <span class="fa fa-close" style="position:absolute;top:0;left:103px;color:#aaa"></span>
                                <span style="position:absolute;left:0px;top:72px;height:22px;background-color:black;color:white;display:inline-block;line-height:22px;width:100px;opacity: 0.5;text-align:center;overflow:hidden;" >Iwatch</span>
                            </li>
                            <li style="display:inline-block;position:relative;margin-right:20px;margin-bottom:8px;" title="Iwatch" class="item" data-toggle="tooltip" data-placement="right">
                                <img class="img-responsive img-thumbnail" src="http://weifx.webqt.cn/attachment/images/2/2018/06/JdDHM88Ijni82R7wdjH2HiwODdOhhj.jpg" style="width:100px;height:100px;">
                                <span class="fa fa-close" style="position:absolute;top:0;left:103px;color:#aaa"></span>
                                <span style="position:absolute;left:0px;top:72px;height:22px;background-color:black;color:white;display:inline-block;line-height:22px;width:100px;opacity: 0.5;text-align:center;overflow:hidden;" >Iwatch</span>
                            </li>
                            <li style="display:inline-block;position:relative;margin-right:20px;margin-bottom:8px;" title="Iwatch" class="item" data-toggle="tooltip" data-placement="right">
                                <img class="img-responsive img-thumbnail" src="http://weifx.webqt.cn/attachment/images/2/2018/06/JdDHM88Ijni82R7wdjH2HiwODdOhhj.jpg" style="width:100px;height:100px;">
                                <span class="fa fa-close" style="position:absolute;top:0;left:103px;color:#aaa"></span>
                                <span style="position:absolute;left:0px;top:72px;height:22px;background-color:black;color:white;display:inline-block;line-height:22px;width:100px;opacity: 0.5;text-align:center;overflow:hidden;" >Iwatch</span>
                            </li>
                            <li style="display:inline-block;position:relative;margin-right:20px;margin-bottom:8px;" title="Iwatch" class="item" data-toggle="tooltip" data-placement="right">
                                <img class="img-responsive img-thumbnail" src="http://weifx.webqt.cn/attachment/images/2/2018/06/JdDHM88Ijni82R7wdjH2HiwODdOhhj.jpg" style="width:100px;height:100px;">
                                <span class="fa fa-close" style="position:absolute;top:0;left:103px;color:#aaa"></span>
                                <span style="position:absolute;left:0px;top:72px;height:22px;background-color:black;color:white;display:inline-block;line-height:22px;width:100px;opacity: 0.5;text-align:center;overflow:hidden;" >Iwatch</span>
                            </li>
                            <li style="display:inline-block;position:relative;margin-right:20px;margin-bottom:8px;" title="Iwatch" class="item" data-toggle="tooltip" data-placement="right">
                                <img class="img-responsive img-thumbnail" src="http://weifx.webqt.cn/attachment/images/2/2018/06/JdDHM88Ijni82R7wdjH2HiwODdOhhj.jpg" style="width:100px;height:100px;">
                                <span class="fa fa-close" style="position:absolute;top:0;left:103px;color:#aaa"></span>
                                <span style="position:absolute;left:0px;top:72px;height:22px;background-color:black;color:white;display:inline-block;line-height:22px;width:100px;opacity: 0.5;text-align:center;overflow:hidden;" >Iwatch</span>
                            </li>
                            <li style="display:inline-block;position:relative;margin-right:20px;margin-bottom:8px;" title="Iwatch" class="item" data-toggle="tooltip" data-placement="right">
                                <img class="img-responsive img-thumbnail" src="http://weifx.webqt.cn/attachment/images/2/2018/06/JdDHM88Ijni82R7wdjH2HiwODdOhhj.jpg" style="width:100px;height:100px;">
                                <span class="fa fa-close" style="position:absolute;top:0;left:103px;color:#aaa"></span>
                                <span style="position:absolute;left:0px;top:72px;height:22px;background-color:black;color:white;display:inline-block;line-height:22px;width:100px;opacity: 0.5;text-align:center;overflow:hidden;" >Iwatch</span>
                            </li>
                            <li style="display:inline-block;position:relative;margin-right:20px;margin-bottom:8px;" title="Iwatch" class="item" data-toggle="tooltip" data-placement="right">
                                <img class="img-responsive img-thumbnail" src="http://weifx.webqt.cn/attachment/images/2/2018/06/JdDHM88Ijni82R7wdjH2HiwODdOhhj.jpg" style="width:100px;height:100px;">
                                <span class="fa fa-close" style="position:absolute;top:0;left:103px;color:#aaa"></span>
                                <span style="position:absolute;left:0px;top:72px;height:22px;background-color:black;color:white;display:inline-block;line-height:22px;width:100px;opacity: 0.5;text-align:center;overflow:hidden;" >Iwatch</span>
                            </li>
                            <li style="display:inline-block;position:relative;margin-right:20px;margin-bottom:8px;" title="Iwatch" class="item" data-toggle="tooltip" data-placement="right">
                                <img class="img-responsive img-thumbnail" src="http://weifx.webqt.cn/attachment/images/2/2018/06/JdDHM88Ijni82R7wdjH2HiwODdOhhj.jpg" style="width:100px;height:100px;">
                                <span class="fa fa-close" style="position:absolute;top:0;left:103px;color:#aaa"></span>
                                <span style="position:absolute;left:0px;top:72px;height:22px;background-color:black;color:white;display:inline-block;line-height:22px;width:100px;opacity: 0.5;text-align:center;overflow:hidden;" >Iwatch</span>
                            </li>
                            <li style="display:inline-block;position:relative;margin-right:20px;margin-bottom:8px;" title="Iwatch" class="item" data-toggle="tooltip" data-placement="right">
                                <img class="img-responsive img-thumbnail" src="http://weifx.webqt.cn/attachment/images/2/2018/06/JdDHM88Ijni82R7wdjH2HiwODdOhhj.jpg" style="width:100px;height:100px;">
                                <span class="fa fa-close" style="position:absolute;top:0;left:103px;color:#aaa"></span>
                                <span style="position:absolute;left:0px;top:72px;height:22px;background-color:black;color:white;display:inline-block;line-height:22px;width:100px;opacity: 0.5;text-align:center;overflow:hidden;" >Iwatch</span>
                            </li>
                            <li style="display:inline-block;position:relative;margin-right:20px;margin-bottom:8px;" title="Iwatch" class="item" data-toggle="tooltip" data-placement="right">
                                <img class="img-responsive img-thumbnail" src="http://weifx.webqt.cn/attachment/images/2/2018/06/JdDHM88Ijni82R7wdjH2HiwODdOhhj.jpg" style="width:100px;height:100px;">
                                <span class="fa fa-close" style="position:absolute;top:0;left:103px;color:#aaa"></span>
                                <span style="position:absolute;left:0px;top:72px;height:22px;background-color:black;color:white;display:inline-block;line-height:22px;width:100px;opacity: 0.5;text-align:center;overflow:hidden;" >Iwatch</span>
                            </li>
                        </ul>
                        <ul class="pagination pagination-sm" style="margin: 0px 0;">
                                <li><a href="#">&laquo;</a></li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">&raquo;</a></li>
                            </ul>
                        <div style="margin-top:5px;">
                            <button style="background-color:#45abf5;color:white;border:none;height:25px;width:40px;" @click="listindexchange()">保存</button>
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
    mounted: function(){
        $(".item").tooltip();
        $("#gsrecsortable").sortable({
            start: function( event, ui ) {
                $(".item").tooltip('hide');
            },
            cancel:'.fa-close'
        });
        $("#gsrecsortable").disableSelection();
    },
    destroyed: function(){}
}
</script>