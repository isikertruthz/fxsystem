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
                        <TabPane label="员工信息">
                            <Table :columns="columns7" :data="list"></Table>
                        </TabPane>
                        <TabPane label="添加员工" class="card-add-tabpane" :disabled="secdisabled">
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">所属公司：</span>
                                <Select v-model="tempinfo.comid" class="card-add-input" @change="tempinfo.comid = $event.target.value">
                                    <Option value="0">请选择</Option>
                                    <Option value="1">企泰科技</Option>
                                </Select>
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">姓名：</span>
                                <!-- <Input v-model="empname" placeholder="请输入姓名..." size="large" class="card-add-input" /> -->
                                <Input type="text" v-model="tempinfo.empname" placeholder="请输入姓名..." clearable size="default" class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">职位：</span>
                                <Input type="text" v-model="tempinfo.emppost" placeholder="请输入职位..." clearable class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">手机：</span>
                                <Input type="text" v-model="tempinfo.mobnum" placeholder="请输入手机..." clearable name="mobnum" class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">微信：</span>
                                <Input type="text" v-model="tempinfo.wxnum" placeholder="请输入微信..." clearable class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">邮箱：</span>
                                <Input type="text" v-model="tempinfo.email" placeholder="请输入邮箱..." clearable class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">座机：</span>
                                <Input type="text" v-model="tempinfo.telphone" placeholder="请输入座机..." clearable class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">地址：</span>
                                <Input type="text" v-model="tempinfo.address" placeholder="请输入地址..." clearable class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span" style="float:left;padding-top:5px;">头像：</span>
                                <input id="perImage" type="file" name="file" style="width: 200px;display:none;" @change="fileUpload($event)" />
                                <img src="../../assets/images/image.png" class="card-add-img-def" v-if="imgTmp==''">
                                <img :src="imgTmp" class="card-add-img-upl" v-else>
                                <Button type="default" size="small" @click="clickUpload()">选择图片</Button>
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span" style="float:left;padding-top:5px;">个人简介：</span>
                                <Input type="textarea" v-model="tempinfo.intro" placeholder="个人简介" clearable class="card-add-input" />
                            </div>
                            <div style="width:570px;text-align:right;">
                                <Button type="info" size="default" @click="changeTab()">返回</Button>
                                <Button type="success" @click="request('10001')">提交</Button>
                            </div>

                        </TabPane>
                        <TabPane label="修改信息" :disabled="enchange" class="card-add-tabpane">
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">所属公司：</span>
                                <Select v-model="tempinfo.comid" class="card-add-input" @change="tempinfo.comid = $event.target.value">
                                    <Option value="0">请选择</Option>
                                    <Option value="1">企泰科技</Option>
                                </Select>
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">姓名：</span>
                                <!-- <Input v-model="empname" placeholder="请输入姓名..." size="large" class="card-add-input" /> -->
                                <Input type="text" v-model="tempinfo.empname" placeholder="请输入姓名..." clearable size="default" class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">职位：</span>
                                <Input type="text" v-model="tempinfo.emppost" placeholder="请输入职位..." clearable class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">手机：</span>
                                <Input type="text" v-model="tempinfo.mobnum" placeholder="请输入手机..." clearable name="mobnum" class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">微信：</span>
                                <Input type="text" v-model="tempinfo.wxnum" placeholder="请输入微信..." clearable class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">邮箱：</span>
                                <Input type="text" v-model="tempinfo.email" placeholder="请输入邮箱..." clearable class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">座机：</span>
                                <Input type="text" v-model="tempinfo.telphone" placeholder="请输入座机..." clearable class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">地址：</span>
                                <Input type="text" v-model="tempinfo.address" placeholder="请输入地址..." clearable class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span" style="float:left;padding-top:5px;">头像：</span>
                                <input id="perImage" type="file" name="file" style="width: 200px;display:none;" @change="fileUpload($event)" />
                                <img src="../../assets/images/image.png" class="card-add-img-def" v-if="imgTmp==''">
                                <img :src="imgTmp" class="card-add-img-upl" v-else>
                                <Button type="default" size="small" @click="clickUpload()">选择图片</Button>
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span" style="float:left;padding-top:5px;">个人简介：</span>
                                <Input type="textarea" v-model="tempinfo.intro" placeholder="个人简介" clearable class="card-add-input" />
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
import { mapState } from 'vuex';
import { Button, Tabs, TabPane, Table, Modal, Message, Input, Select, Option } from 'iview';
import Vue from 'vue'
Vue.prototype.$Modal = Modal
Vue.prototype.$Message = Message

export default {
    components: { Button, Tabs, TabPane, Table, Modal, Message, Input, Select, Option },
    data() {
        return {
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
                    title: 'ID',
                    key: 'id',
                    width: 70,
                    align: 'center',
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
                    title: '姓名',
                    key: 'empname',
                    align: 'center',
                },
                {
                    title: '职位',
                    key: 'emppost',
                    align: "center"
                },
                {
                    title: '手机',
                    key: 'mobnum',
                    align: "center"
                },
                {
                    title: '微信',
                    key: 'wxnum',
                    align: "center"
                },
                {
                    title: '邮箱',
                    key: 'email',
                    align: "center"
                },
                {
                    title: '座机',
                    key: 'telphone',
                    align: "center"
                },
                {
                    title: '地址',
                    key: 'address',
                    align: "center"
                },
                {
                    title: '头像',
                    key: 'imgpath',
                    align: "center"
                },
                {
                    title: '个人简介',
                    key: 'intro',
                    align: "center"
                },
                {
                    title: '操作',
                    key: 'action',
                    width: 200,
                    align: 'center',
                    render: (h, params) => {
                        return h('div', [
                            h('Button', {
                                props: {
                                    type: "info",
                                    size: "small"
                                },
                                style: {
                                    marginRight: '3px'
                                },
                                on: {
                                    click: () => {
                                        this.show(params.index)
                                    }
                                }
                            }, '查看'),
                            h('Button', {
                                props: {
                                    type: "success",
                                    size: "small"
                                },
                                style: {
                                    marginRight: '3px'
                                },
                                on: {
                                    click: () => {
                                        this.changeUpdateTab(params.index);
                                    }
                                }
                            }, '编辑'),
                            h('Button', {
                                props: {
                                    type: "error",
                                    size: "small"
                                },
                                style: {
                                    marginRight: '3px'
                                },
                                on: {
                                    click: () => {
                                        this.remove(params.index);
                                    }
                                }
                            }, '删除')
                        ]);
                    }
                }
            ],
            list: [],
            imgTmp: "",
            tempinfo: {
                comid: "",
                empname: "",
                emppost: "",
                mobnum: "",
                wxnum: "",
                email: "",
                telphone: "",
                address: "",
                imgpath: "",
                intro: "",
                photoimage: ""
            },
            tempinfotml: {
                comid: "",
                empname: "",
                emppost: "",
                mobnum: "",
                wxnum: "",
                email: "",
                telphone: "",
                address: "",
                imgpath: "",
                intro: "",
                photoimage: ""
            }

        }
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
            this.request('10003', this.list[index].id, index);
            this.deleteit = false;
        },
        changeUpdateTab(key) {
            this.curtab = 2
            this.tempinfo = this.list[key];
        },
        changeTab() {
            this.curtab = 0;
            this.tempinfo = this.tempinfotml;
        },
        show(index) {
            this.$Modal.info({
                title: '员工信息',
                content: `姓名：${this.list[index].empname}<br>
                    职位：${this.list[index].emppost}<br>
                    手机：${this.list[index].mobnum}<br>
                    微信：${this.list[index].wxnum}<br>
                    邮箱：${this.list[index].email}<br>
                    座机：${this.list[index].telphone}<br>
                    地址：${this.list[index].address}<br>
                    简介：${this.list[index].intro}<br>`
            })
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
            let that = this
            let file = e.target.files[0]
            let fileName = that.$utils.getUID() + "." + that.$utils.getCaption(file.type, "\/")

            //实现图片预览
            let reader = new FileReader()
            reader.readAsDataURL(file)
            reader.onload = function () {
                that.imgTmp = this.result
            }

            //上传图片
            let config = {
                headers: { 'Content-Type': 'multipart/form-data' }
            }
            let param = new FormData()
            param.append('file', file, fileName) //通过append向form对象添加数据
            // console.log(param.get('file'))  //FormData私有类对象，访问不到，可以通过get判断值是否传进去

            that.$http.post("api/main.php?ywtype=10002", param, config).then(response => {
                that.tempinfo.imgpath = fileName
            })
        },
        request(ywtype) {
            let prefixurl = 'tp5/public/index.php/admin/card/';
            let url = '';
            switch (ywtype) {
                //添加
                case '10001':
                    // console.log(this.tempinfo);
                    url = prefixurl + 'addcard'
                    this.$http.post(url, this.tempinfo).then(response => {
                        this.list.push(response.data.data);
                        this.curtab = 0;
                        this.$Message.success('添加成功');
                        this.tempinfo = this.tempinfotml;
                        this.imgTmp = '';
                        // console.log(this.tempinfo)
                    })
                    break;
                case '10002':
                    url = prefixurl + 'selectall';
                    this.$http.get(url).then(response => {
                        console.log(response);
                        this.list = response.data.data;
                    })
                    break;
                case '10003':
                    url = prefixurl + 'delbyid';
                    let data = {
                        id: arguments[1]
                    };
                    this.$http.post(url, data).then(response => {
                        this.list.splice(arguments[2], 1);
                        this.$Message.success('删除成功');
                    })
                    break;
                case '10004':
                    url = prefixurl + 'updatebyid';
                    this.$http.post(url, this.tempinfo).then(response => {
                        this.$Message.success('修改成功');
                        this.curtab = 0;
                        this.tempinfo = this.tempinfotml;
                    }, response => {
                        this.$Message.success('修改失败');
                    });
                    break;
                default:
                    break;
            }
        }
    },
    /* event listeners code in mounted function*/
    mounted: function () {
        this.request('10002');
    },
    destroyed: function () { }
}
</script>

