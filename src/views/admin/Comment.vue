<template>
    <div>
        <!-- adjust 适应框架宽度 -->
        <div class="comm-view" :class="commLay==240?messagebarVisit?'pad-lefta pad-right':'pad-lefta':commLay==130?messagebarVisit?'pad-leftb pad-right':'pad-leftb':commLay==170?messagebarVisit?'pad-leftc pad-right':'pad-leftc':commLay==60?messagebarVisit?'pad-leftd pad-right':'pad-leftd':''">
            <div class="dp-location">
                <!-- location -->
                <span class="loc-bor">当前位置：
                    <label class="page-location">{{pageLoction}}管理</label>
                </span>
            </div> <!-- location End -->
            <div class="content main_content">
                <div class="content-top page-content">
                    <form action="" method="get" class="form-horizontal form-search" role="form">
                        <div class="page-toolbar">
                            <span class="pull-left mr30">
                                <a class='btn btn-sm btn-primary' href="">
                                    <i class='fa fa-plus'></i>
                                    添加虚拟评论
                                </a>
                            </span>

                            <div class="input-group col-xs-6 col-sm-5 pull-right">
                                <input type="text" class="jeinput icons top_input" id="date_3" placeholder="YYYY-MM-DD hh:mm:ss" />
                                <span class="input-group-select">
                                    <select name="attribute" class='form-control select2'>
                                        <option value="" selected>
                                            状态
                                        </option>
                                        <option value="0">
                                            状态
                                        </option>
                                        <option value="1">
                                            状态
                                        </option>
                                    </select>
                                </span>
                                <span class="input-group-select">
                                    <select name="cate" class='form-control select2'>
                                        <option value="" selected>
                                            类型
                                        </option>
                                        <option value="0">
                                            类型
                                        </option>
                                        <option value="1">
                                            类型
                                        </option>
                                    </select>
                                </span>
                                <input type="text" class="input-sm form-control" name='keyword' value="" placeholder="ID/名称/编号/条码/商户名称">
                                <span class="input-group-btn">
                                    <button class="btn btn-primary" type="submit">
                                        搜索
                                    </button>
                                </span>
                            </div>
                        </div>
                    </form>
                    <div class="row">
                        <div class="col-md-12">
                            <!-- <div class="page-table-header">
                                <input type='checkbox' />
                                <div class="btn-group">
                                    <button class="btn btn-default btn-sm btn-operation btn_ea4335" type="button">
                                        <i class='icow icow-shanchu1'></i>删除
                                    </button>
                                </div>
                            </div> -->
                            <table class="table table-responsive table-hover table-striped">
                                <thead class="navbar-inner">
                                    <tr>
                                        <th>
                                            <input type='checkbox' />
                                        </th>
                                        <th>
                                            排序
                                        </th>
                                        <th>
                                            商品
                                        </th>
                                        <th>
                                            评论者
                                        </th>
                                        <th>
                                            评分等级
                                        </th>
                                        <th>
                                            评论状态
                                        </th>
                                        <th>
                                            审核状态
                                        </th>
                                        <th>
                                            回复状态
                                        </th>
                                        <th>
                                            评论时间
                                        </th>
                                        <th>
                                            操作
                                        </th>
                                    </tr>
                                </thead>
                                <tbody class="table_tbody">
                                    <tr>
                                        <td>
                                            <input type='checkbox' value="" />
                                        </td>
                                        <td><span class="span_1a1a1a">999</span></td>
                                        <td>
                                            <img class="table_img" src="../../assets/images/pro.jpg" />
                                            <p class="table_p">白柚白柚白柚白柚白柚白柚白柚白柚白柚白柚白柚白柚白<br />柚白柚白柚白柚白柚白柚白柚白柚白柚白柚白柚白柚白柚白柚白柚</p>
                                        </td>
                                        <td>
                                            <img class="user_img" src="../../assets/images/pro.jpg" />
                                            <span class="span_1a1a1a">用户</span>
                                        </td>
                                        <td><span class="span_f5812b">★★★★★</span></td>
                                        <td><span class="span_666">追加了评论</span></td>
                                        <td>
                                            <span class="span_ea4335">未首次回复</span> <br />
                                            <span class="span_e88740">未追加回复</span>
                                        </td>
                                        <td>
                                            <span class="span_34a853">首次评价已通过</span> <br />
                                            <span class="span_e88740">追加评价审核中</span>
                                        </td>
                                        <td><span class="span_999">2018.10.29 <br /> 09:55:03</span></td>
                                        <td class="td">
                                            <a class="btn btn-op btn-operation btn_34a853" href="javascript:;">
                                                <i class="fa fa-pencil i_20"></i>
                                            </a>
                                            <a class="btn btn-op btn-operation btn_ea4335" href="javascript:;">
                                                <i class="fa fa-trash i_20"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type='checkbox' value="" />
                                        </td>
                                        <td><span class="span_1a1a1a">999</span></td>
                                        <td>
                                            <img class="table_img" src="../../assets/images//pro.jpg" />
                                            <p class="table_p">白柚白柚白柚白柚白柚白柚白柚白柚白柚白柚白柚白柚白<br />柚白柚白柚白柚白柚白柚白柚白柚白柚白柚白柚白柚白柚白柚白柚</p>
                                        </td>
                                        <td>
                                            <img class="user_img" src="../../assets/images//pro.jpg" />
                                            <span class="span_1a1a1a">用户</span>
                                        </td>
                                        <td><span class="span_f5812b">★★★★★</span></td>
                                        <td><span class="span_666">追加了评论</span></td>
                                        <td>
                                            <span class="span_ea4335">未首次回复</span> <br />
                                            <span class="span_e88740">未追加回复</span>
                                        </td>
                                        <td>
                                            <span class="span_34a853">首次评价已通过</span> <br />
                                            <span class="span_e88740">追加评价审核中</span>
                                        </td>
                                        <td><span class="span_999">2018.10.29 <br /> 09:55:03</span></td>
                                        <td class="td">
                                            <a class="btn btn-op btn-operation btn_34a853" href="javascript:;">
                                                <i class="fa fa-pencil i_20"></i>
                                            </a>
                                            <a class="btn btn-op btn-operation btn_ea4335" href="javascript:;">
                                                <i class="fa fa-trash i_20"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type='checkbox' value="" />
                                        </td>
                                        <td><span class="span_1a1a1a">999</span></td>
                                        <td>
                                            <img class="table_img" src="../../assets/images/pro.jpg" />
                                            <p class="table_p">白柚白柚白柚白柚白柚白柚白柚白柚白柚白柚白柚白柚白<br />柚白柚白柚白柚白柚白柚白柚白柚白柚白柚白柚白柚白柚白柚白柚</p>
                                        </td>
                                        <td>
                                            <img class="user_img" src="../../assets/images/pro.jpg" />
                                            <span class="span_1a1a1a">用户</span>
                                        </td>
                                        <td><span class="span_f5812b">★★★★★</span></td>
                                        <td><span class="span_666">追加了评论</span></td>
                                        <td>
                                            <span class="span_ea4335">未首次回复</span> <br />
                                            <span class="span_e88740">未追加回复</span>
                                        </td>
                                        <td>
                                            <span class="span_34a853">首次评价已通过</span> <br />
                                            <span class="span_e88740">追加评价审核中</span>
                                        </td>
                                        <td><span class="span_999">2018.10.29 <br /> 09:55:03</span></td>
                                        <td class="td">
                                            <a class="btn btn-op btn-operation btn_34a853" href="javascript:;">
                                                <i class="fa fa-pencil i_20"></i>
                                            </a>
                                            <a class="btn btn-op btn-operation btn_ea4335" href="javascript:;">
                                                <i class="fa fa-trash i_20"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="page-table-header text-left">
                                <input type='checkbox' />
                                <div class="btn-group">
                                    <button class="btn btn-default btn-sm btn-operation btn_ea4335" type="button">
                                        <i class='icow icow-shanchu1'></i>删除
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
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
            pageLoction: state => state.status.pageLoction,
            messagebarVisit: state => state.status.messagebarVisit,
            sidebarmax: state => state.status.sidebarmax,
            subSidebarVisit: state => state.status.subSidebarVisit
        }),
        commLay() {
            if (this.sidebarmax && this.subSidebarVisit) {
                return 240
            } else if (this.sidebarmax && !this.subSidebarVisit) {
                return 130
            } else if (!this.sidebarmax && this.subSidebarVisit) {
                return 170
            } else {
                return 60
            }
        }
    },
    watch: {},
    methods: {},
    /* event listeners code in mounted function*/
    mounted: function () { },
    destroyed: function () { }
}
</script>

