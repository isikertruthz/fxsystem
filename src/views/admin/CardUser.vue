<template>
    <div>
        <!-- adjust 适应框架宽度 -->
        <div class="comm-view" :class="
        commLay==240?messagebarVisit?'pad-lefta pad-right':'pad-lefta':
        commLay==130?messagebarVisit?'pad-leftb pad-right':'pad-leftb':
        commLay==170?messagebarVisit?'pad-leftc pad-right':'pad-leftc':
        commLay==60?messagebarVisit?'pad-leftd pad-right':'pad-leftd':''">
            <div class="dp-location">
                <!-- location -->
                <span class="loc-bor">当前位置：
                    <label class="page-location">{{pageLoction}}管理</label>
                </span>
            </div> <!-- location End -->
            <div class="content">
                <div class="content-top">
                    <Tabs :animated="false" style="padding:10px 20px 10px 20px;" v-model="curtab">
                        <TabPane label="用户信息">
                            <Table :columns="columns7" :data="list"></Table>
                        </TabPane>
                        <TabPane label="修改信息" :disabled="enchange" class="card-add-tabpane">
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">openid：</span>
                                <!-- <Input v-model="empname" placeholder="请输入姓名..." size="large" class="card-add-input" /> -->
                                <Input type="text" v-model="tempinfo.openid" placeholder="" clearable size="default" class="card-add-input" disabled />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">用户名：</span>
                                <Input type="text" v-model="tempinfo.nickName" placeholder="请输入用户名..." clearable class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">性别：</span>
                                <Input type="text" v-model="tempinfo.gender" placeholder="请输入性别..." clearable name="" class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">省会：</span>
                                <Input type="text" v-model="tempinfo.province" placeholder="请输入省会..." clearable class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">城市：</span>
                                <Input type="text" v-model="tempinfo.city" placeholder="请输入城市..." clearable class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">语言：</span>
                                <Input type="text" v-model="tempinfo.language" placeholder="请输入语言..." clearable class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span" style="float:left;padding-top:5px;">头像：</span>
                                <input id="perImage" type="file" name="file" style="width: 200px;display:none;" @change="fileUpload($event)" />
                                <img :src="updimg" class="card-add-img-upl">
                                <Button type="default" size="small" @click="clickUpload()">选择图片</Button>
                            </div>
                            <div style="width:570px;text-align:right;">
                                <Button type="info" size="default" @click="changeTab()">返回</Button>
                                <Button type="success" @click="request('10004')">修改</Button>
                            </div>
                        </TabPane>
                    </Tabs>
                </div>
                <Modal v-model="deleteit" width="360">
                    <p slot="header" style="color:#f60;text-align:center">
                        <Icon type="ios-information-circle"></Icon>
                        <span>信息</span>
                    </p>
                    <div style="text-align:center">
                        <p>确定删除吗？</p>
                    </div>
                    <div slot="footer">
                        <Button type="error" size="large" long @click="del(curindex)">确定</Button>
                    </div>
                </Modal>
            </div>
        </div> <!-- adjust End  -->

    </div>
</template>

<script>
/**
 * Coded By Raccoon
 * on 2018.10.19
 */
import { mapState } from "vuex";
import {
    Button,
    Tabs,
    TabPane,
    Table,
    Modal,
    Message,
    Input,
    Select,
    Option,
    Avatar
} from "iview";
import Vue from "vue";
Vue.prototype.$Modal = Modal;
Vue.prototype.$Message = Message;

export default {
    components: {
        Button,
        Tabs,
        TabPane,
        Table,
        Modal,
        Message,
        Input,
        Select,
        Option,
        Avatar
    },
    data() {
        return {
            http: "http://",
            curindex: -1,
            deleteit: false,
            empname: "555",
            loading: false,
            Modal: true,
            curtab: 0,
            secdisabled: false,
            enchange: true,
            columns7: [
                {
                    title: "ID",
                    key: "id",
                    width: 70,
                    align: "center"
                    // render: (h, params) => {
                    //     return h('div', [
                    //         h('Icon', {
                    //             props: {
                    //                 type:'person'
                    //             }
                    //         }),
                    //         h('strong', params.row.name)
                    //     ]);
                    // }
                },
                {
                    title: "openid",
                    key: "openid",
                    align: "center"
                },
                {
                    title: "用户名",
                    key: "nickName",
                    align: "center"
                },
                {
                    title: "性别",
                    key: "gender",
                    align: "center"
                },
                {
                    title: "头像",
                    key: "wxnum",
                    align: "center",
                    render: (h, params) => {
                        return h("div", [
                            h(
                                "Avatar",
                                {
                                    props: {
                                        shape: "circle",
                                        size: "large",
                                        src:
                                            this.list[params.index].avatarUrl.indexOf("https://") >= 0
                                                ? this.list[params.index].avatarUrl
                                                : "http://localhost/upload/" +
                                                this.list[params.index].avatarUrl
                                    }
                                },
                                ""
                            )
                        ]);
                    }
                },
                {
                    title: "手机",
                    key: "mobnum",
                    align: "center"
                },
                {
                    title: "省会",
                    key: "province",
                    align: "center"
                },
                {
                    title: "城市",
                    key: "city",
                    align: "center"
                },
                {
                    title: "语言",
                    key: "language",
                    align: "center"
                },
                {
                    title: "添加时间",
                    key: "createdate",
                    align: "center"
                },
                {
                    title: "修改时间",
                    key: "updatedate",
                    align: "center"
                },
                {
                    title: "操作",
                    key: "action",
                    width: 200,
                    align: "center",
                    render: (h, params) => {
                        return h("div", [
                            h(
                                "Button",
                                {
                                    props: {
                                        type: "info",
                                        size: "small"
                                    },
                                    style: {
                                        marginRight: "3px"
                                    },
                                    on: {
                                        click: () => {
                                            this.show(params.index);
                                        }
                                    }
                                },
                                "查看"
                            ),
                            h(
                                "Button",
                                {
                                    props: {
                                        type: "success",
                                        size: "small"
                                    },
                                    style: {
                                        marginRight: "3px"
                                    },
                                    on: {
                                        click: () => {
                                            this.changeUpdateTab(params.index);
                                        }
                                    }
                                },
                                "编辑"
                            ),
                            h(
                                "Button",
                                {
                                    props: {
                                        type: "error",
                                        size: "small"
                                    },
                                    style: {
                                        marginRight: "3px"
                                    },
                                    on: {
                                        click: () => {
                                            this.remove(params.index);
                                        }
                                    }
                                },
                                "删除"
                            )
                        ]);
                    }
                }
            ],
            list: [],
            imgTmp: "",
            tempinfo: {
                avatarUrl: ""
            },
            tempinfotml: {
                avatarUrl: ""
            }
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
        updimg() {
            return this.imgTmp == ""
                ? this.tempinfo.avatarUrl.indexOf("http") >= 0
                    ? this.tempinfo.avatarUrl
                    : "http://localhost/upload/" + this.tempinfo.avatarUrl
                : this.imgTmp;
        }
    },
    watch: {
        curtab: function () {
            if (this.curtab != 2) {
                this.enchange = true;
                this.secdisabled = false;
            } else {
                this.secdisabled = true;
            }
        }
    },
    methods: {
        del(index) {
            this.request("10003", this.list[index].id, index);
            this.deleteit = false;
        },
        changeUpdateTab(key) {
            this.curtab = 1;
            this.tempinfo = this.list[key];
        },
        changeTab() {
            this.curtab = 0;
            this.tempinfo = this.tempinfotml;
            this.imgTmp = "";
        },
        show(index) {
            this.$Modal.info({
                title: "用户信息",
                content: `openid：${this.list[index].openid}<br>
                    用户名：${this.list[index].nickName}<br>
                    性别：${this.list[index].gender}<br>
                    手机：${this.list[index].mobnum}<br>
                    省会：${this.list[index].province}<br>
                    城市：${this.list[index].city}<br>
                    语言：${this.list[index].language}<br>
                    创建时间：${this.list[index].createdate}<br>
                    修改时间：${this.list[index].updatedate}<br>`
            });
        },
        remove(index) {
            this.deleteit = true;
            this.curindex = index;
        },
        clickUpload() {
            $("#perImage").trigger("click");
        },
        //上传图片
        fileUpload(e) {
            let that = this;
            let file = e.target.files[0];
            let fileName =
                that.$utils.getUID() + "." + that.$utils.getCaption(file.type, "/");

            //实现图片预览
            let reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onload = function () {
                that.imgTmp = this.result;
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
                    that.tempinfo.avatarurl = fileName;
                });
        },
        request(ywtype) {
            let prefixurl = "tp5/public/index.php/admin/carduser/";
            let url = "";
            switch (ywtype) {
                //添加
                case "10001":
                    // console.log(this.tempinfo);
                    url = prefixurl + "addcard";
                    this.$http.post(url, this.tempinfo).then(response => {
                        this.list.push(response.data.data);
                        this.curtab = 0;
                        this.$Message.success("添加成功");
                        this.tempinfo = this.tempinfotml;
                        this.imgTmp = "";
                        // console.log(this.tempinfo)
                    });
                    break;
                case "10002":
                    url = prefixurl + "selectall";
                    this.$http.get(url).then(response => {
                        console.log(response);
                        this.list = response.data.data;
                    });
                    break;
                case "10003":
                    url = prefixurl + "delbyid";
                    let data = {
                        id: arguments[1]
                    };
                    this.$http.post(url, data).then(response => {
                        this.list.splice(arguments[2], 1);
                        this.$Message.success("删除成功");
                    });
                    break;
                case "10004":
                    url = prefixurl + "updatebyid";
                    this.$http.post(url, this.tempinfo).then(
                        response => {
                            this.$Message.success("修改成功");
                            this.curtab = 0;
                            this.tempinfo = this.tempinfotml;
                        },
                        response => {
                            this.$Message.success("修改失败");
                        }
                    );
                    break;
                default:
                    break;
            }
        }
    },
    /* event listeners code in mounted function*/
    mounted: function () {
        this.request("10002");
    },
    destroyed: function () { }
};
</script>

