<template>
    <div>
        <!-- adjust 适应框架宽度 -->
        <div class="comm-view" :class="commLay==240?messagebarVisit?'pad-lefta pad-right':'pad-lefta':commLay==130?messagebarVisit?'pad-leftb pad-right':'pad-leftb':commLay==170?messagebarVisit?'pad-leftc pad-right':'pad-leftc':commLay==60?messagebarVisit?'pad-leftd pad-right':'pad-leftd':''">
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
                        <div class="alert alert-primary bor-rad" style="height:48px;padding:14px 15px;min-width:780px;margin-bottom:15px;">提示: 请在下方选择要显示的商品; 不选择则将不显示; 点击拖拽更换排序</div>
                        <div class="input-group" style="width:78%;min-width:550px;margin-bottom:13px;">
                            <input type="text" id="goodsid_text" name="goodsid_text" :title="namestr" class="form-control text bor-rad" readonly v-model="namestr" style="height:30px;">
                            <div class="input-group-btn">
                                <button class="btn btn-primary btn-sm select_goods c-blue" type="button" @click="changecurindex()">选择商品</button>
                            </div>
                        </div>
                        <ul style="width:68%;max-width:650px;" id="gsrecsortable" v-show="curindex==0">
                            <li style="display:inline-block;position:relative;margin-right:20px;margin-bottom:8px;" :title="item.name" class="item" data-toggle="tooltip" data-placement="top" v-for="item in seclist" :key="item.id">
                                <img class="img-responsive img-thumbnail" :src="'http://entertry.com/upload/'+item.imgpath" style="width:100px;height:100px;">
                                <span class="fa fa-close" style="position:absolute;top:0;left:103px;color:#aaa" @click="delitem(item.id)"></span>
                                <span style="position:absolute;left:0px;top:73px;height:22px;background-color:black;color:white;display:inline-block;line-height:22px;width:100px;opacity: 0.5;text-align:center;overflow:hidden;font-size:12.8px;">{{item.name}}</span>
                            </li>

                        </ul>
                        <div style="width:100%;" v-show="!curindex">

                        </div>
                        <div class="content-sec" style="margin:0px;width:78%;text-align:center;min-width:550px;" v-show='seclist.length==0'>
                            未查询到相关数据
                        </div>
                        <!-- <ul class="pagination pagination-sm" style="margin: 0px 0;">
                                <li><a href="#">&laquo;</a></li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">&raquo;</a></li>
                        </ul>-->
                        <div style="margin-top:5px;">
                            <button v-show="curindex" style="background-color:#45abf5;color:white;border:none;height:25px;width:40px;" @click="changecurindex()">返回</button>
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
            curindex: 0,
            seclist: [],
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
        },
        namestr() {
            let temp = [];
            for (var item of this.seclist) {
                temp.push(item.name)
            }
            // console.log(temp)
            return "已推荐：" + temp.join(";")
        }
    },
    watch: {},
    methods: {
        delitem(id) {
            if (confirm("删除该商品推荐？")) {
                this.httpreq('11402', id)
            }
        },
        changecurindex() {
            this.curindex = !this.curindex;
        },
        httpreq(ywtype) {
            switch (ywtype) {
                case "11401": //查询
                    this.$http
                        .get("api/main.php?ywtype=" + ywtype + "&tb=" + this.table)
                        .then(response => {
                            //   console.log(response);
                            this.seclist = response.data;
                        });
                case "11402": //单个删除
                    this.$http
                        .get("api/main.php?ywtype=" + ywtype + "&tb=" + this.table + "&id=" + arguments[1])
                        .then(response => {
                            for (var index in this.seclist) {
                                if (this.seclist[index].id == arguments[1]) {
                                    this.seclist.splice(index, 1);
                                }
                            }
                        });
                    break;
                default:
                    break;
            }
        },
    },
    /* event listeners code in mounted function*/
    mounted: function () {
        $(".item").tooltip();
        $("#gsrecsortable").sortable({
            start: function (event, ui) {
                $(".item").tooltip("hide");
            },
            cancel: ".fa-close"
        });
        $("#gsrecsortable").disableSelection();
        this.table = this.$store.state.status.curtable;

        this.httpreq('11401');
    },
    destroyed: function () { }
};
</script>
