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
                        <TabPane label="公司信息">
                            <Table :columns="columns7" :data="list"></Table>
                        </TabPane>
                        <TabPane label="添加公司" class="card-add-tabpane" :disabled="secdisabled">
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">公司名称：</span>
                                <!-- <Input v-model="empname" placeholder="请输入姓名..." size="large" class="card-add-input" /> -->
                                <Input type="text" v-model="tempinfo.comname" placeholder="请输入公司名称..." clearable size="default" class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span" style="float:left;padding-top:5px;">logo：</span>
                                <input id="perImage" type="file" name="file" style="width: 200px;display:none;" @change="fileUpload($event)" />
                                <img src="../../assets/images/image.png" class="card-add-img-def" v-if="tempinfo.logopath==''">
                                <img :src="imgTmp" class="card-add-img-upl" v-else>
                                <Button type="default" size="small" @click="clickUpload()">选择图片</Button>
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">公司官网：</span>
                                <!-- <Input v-model="empname" placeholder="请输入姓名..." size="large" class="card-add-input" /> -->
                                <Input type="text" v-model="tempinfo.公司官网" placeholder="格式 http://xxxx.xx或https://xxxx.xx" clearable size="default" class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span" style="float:left;padding-top:5px;">公司简介：</span>
                                <Input type="textarea" v-model="tempinfo.comintro" placeholder="公司简介" clearable class="card-add-input" style="position:relative;left:3px;" />
                            </div>
                            <div style="width:570px;text-align:right;">
                                <Button type="info" size="default" @click="changeTab()">返回</Button>
                                <Button type="success" @click="request('10001')">提交</Button>
                            </div>

                        </TabPane>
                        <TabPane label="修改信息" :disabled="enchange" class="card-add-tabpane">
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">公司名称：</span>
                                <Input type="text" v-model="tempinfo.comname" placeholder="请输入公司名称..." clearable size="default" class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span" style="float:left;padding-top:5px;">Logo：</span>
                                <input id="perImage" type="file" name="file" style="width: 200px;display:none;" @change="fileUpload($event)" />
                                <img src="../../assets/images/image.png" class="card-add-img-def" v-if="tempinfo.logopath==''">
                                <img :src="'http://localhost/upload/' + list[curindex].logopath" class="card-add-img-upl" v-else>
                                <Button type="default" size="small" @click="clickUpload()">选择图片</Button>
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">公司官网：</span>
                                <Input type="text" v-model="tempinfo.comwebsite" placeholder="格式 http://xxxxx.xx" clearable size="default" class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span" style="float:left;padding-top:5px;">公司简介：</span>
                                <Input type="textarea" v-model="tempinfo.comintro" placeholder="个人简介" clearable class="card-add-input" />
                            </div>
                            <div style="width:570px;text-align:right;">
                                <Button type="info" size="default" @click="changeTab()">返回</Button>
                                <Button type="success" @click="request('10004')">修改</Button>
                            </div>
                        </TabPane>
                        <TabPane label="动态信息" class="card-add-tabpane">
                        </TabPane>
                        <TabPane label="发表动态" class="card-add-tabpane">
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">选择公司：</span>
                                <Select v-model="dyninfo.dyncompay" class="card-add-input">
                                    <Option value="0">请选择</Option>
                                    <Option v-for="item in comlist" :value="item.id" :key="item.comid">{{item.comname}}</Option>
                                </Select>
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">上传图片：</span>
                                <div class="demo-upload-list card-add-input" v-for="item in uploadList" >
                                    <template v-if="item.status === 'finished'">
                                        <img :src="item.url">
                                        <div class="demo-upload-list-cover">
                                            <Icon type="ios-eye-outline" @click.native="handleView(item.url)"></Icon>
                                            <Icon type="ios-trash-outline" @click.native="handleRemove(item)"></Icon>
                                        </div>
                                    </template>
                                    <template v-else>
                                        <Progress v-if="item.showProgress" :percent="item.percentage" hide-info></Progress>
                                    </template>
                                </div>
                                <Upload
                                    ref="upload"
                                    :show-upload-list="false"
                                    :default-file-list="defaultList"
                                    :on-success="handleSuccess"
                                    :format="['jpg','jpeg','png']"
                                    :max-size="2048"
                                    :on-format-error="handleFormatError"
                                    :on-exceeded-size="handleMaxSize"
                                    :before-upload="handleBeforeUpload"
                                    multiple
                                    type="drag"
                                    action="apis/api/main.php?ywtype=10002"
                                    style="display: inline-block;width:58px;">
                                    <div style="width: 58px;height:58px;line-height: 58px;">
                                        <Icon type="ios-camera" size="20"></Icon>
                                    </div>
                                </Upload>
                                <Modal title="图片预览" v-model="visible">
                                    <img :src="imgName" v-if="visible" style="width: 100%">
                                </Modal>
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span" style="float:left;padding-top:5px;">动态内容：</span>
                                <Input type="textarea" v-model="dyninfo.content" placeholder="请输入动态内容..." clearable class="card-add-input" :rows='6' />
                            </div>
                            <div style="width:570px;text-align:right;">
                                <Button type="info" size="default" @click="changeTab()">返回</Button>
                                <Button type="success" @click="request('10006')">提交</Button>
                            </div>

                        </TabPane>
                        <TabPane label="配置" class="card-add-tabpane">
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">统一官网：</span>
                                <Switch v-model="istgw" style="margin-left:15px; " />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">官网地址：</span>
                                <Input type="text" v-model="tempinfo.comname" placeholder="格式hppt://xxxx.xx 支持https" clearable :disabled="!istgw" size="default" class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">统一动态图：</span>
                                <Switch v-model="istdt" style="margin-left:15px; " />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span"></span>
                                <input id="perImage" type="file" name="file" style="width: 200px;display:none;" @change="fileUpload($event)" />
                                <img src="../../assets/images/image.png" class="card-add-img-def">
                                <Button type="default" size="small" @click="clickUpload()" style="position:absolute;bottom:10px;" :disabled="!istdt">选择图片</Button>
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
import { Button, Tabs, TabPane, Table, Modal, Message, Input, Select, Option, Avatar,Upload, } from 'iview';
import Vue from 'vue'
Vue.prototype.$Modal = Modal
Vue.prototype.$Message = Message

export default {
    components: { Button, Tabs, TabPane, Table, Modal, Message, Input, Select, Option, Avatar,Upload },
    data() {
        return {
            defaultList: [
                // {
                //     'name': 'a42bdcc1178e62b4694c830f028db5c0',
                //     'url': 'https://o5wwk8baw.qnssl.com/a42bdcc1178e62b4694c830f028db5c0/avatar'
                // },
                // {
                //     'name': 'bc7521e033abdd1e92222d733590f104',
                //     'url': 'https://o5wwk8baw.qnssl.com/bc7521e033abdd1e92222d733590f104/avatar'
                // }
            ],
            imgName: '',
            visible: false,
            uploadList: [],

            dyninfo:{ imgs:[],           },
            comlist:[],
            istdt: 0,
            istgw: 0,
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
                    title: '公司名称',
                    key: 'comname',
                    align: 'center',
                },
                {
                    title: 'Logo',
                    key: 'logopath',
                    align: "center",
                    render: (h, params) => {
                        return h('div', [
                            h('Avatar', {
                                props: {
                                    shape: "square",
                                    size: "large",
                                    src: 'http://localhost/upload/' + this.list[params.index].logopath
                                },
                                style: {
                                    marginRight: '3px'
                                },
                                on: {
                                    click: () => {

                                    }
                                }
                            }, '')
                        ]);
                    }
                },
                {
                    title: '公司简介',
                    key: 'comintro',
                    align: "center"
                },
                {
                    title: '公司官网',
                    key: 'comwebsite',
                    align: "center"
                },
                {
                    title: '创建时间',
                    key: 'createdate',
                    align: "center"
                },
                {
                    title: '最近修改',
                    key: 'updatedate',
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
                id: -1,
                comname: '',
                createdate: '',
                logopath: '',
                updatedate: '',
                comintro: '',
            },
            tempinfotml: {
                id: -1,
                comname: '',
                createdate: '',
                logopath: '',
                updatedate: '',
                comintro: '',
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
        curtab: function (newval, oldval) {
            if (this.curtab != 2) {
                this.enchange = true;
                this.secdisabled = false;
            } else {
                this.secdisabled = true;
            }
            if (oldval == 2) {
                this.tempinfo = this.tempinfotml;
            }
        }
    },
    methods: {
        del(index) {
            this.request('10003', this.list[index].id, index);
            this.deleteit = false;
        },
        changeUpdateTab(key) {
            this.curindex = key;
            this.curtab = 2;
            this.tempinfo = this.list[key];
        },
        changeTab() {
            this.curtab = 0;
            this.tempinfo = this.tempinfotml;
        },
        show(index) {
            this.$Modal.info({
                title: '公司信息',
                content: `名称：${this.list[index].comname}<br>
                    添加时间：${this.list[index].createdate}<br>
                    最近修改：${this.list[index].updatedate}<br>`
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
                that.tempinfo.logopath = fileName
            })
        },
        request(ywtype) {
            let prefixurl = 'tp5/public/index.php/admin/cardcominfo/';
            let url = '';
            switch (ywtype) {
                //添加
                case '10001':
                    // console.log(this.tempinfo);
                    url = prefixurl + 'addcomitem'
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
                    console.log(this.tempinfo);
                    url = prefixurl + 'updatebyid';
                    this.$http.post(url, this.tempinfo).then(response => {
                        this.list[this.curindex].updatedate = response.data.data.updatedate;
                        this.$Message.success('修改成功');
                        this.curtab = 0;
                        this.tempinfo = this.tempinfotml;
                    }, response => {
                        this.$Message.success('修改失败');
                    });
                    break;
                case '10005':
                    url = prefixurl + 'getcominfo';
                    this.$http.get(url).then(response =>{
                        console.log(this.comlist)
                        this.comlist = response.data.data
                    })
                    break;
                case '10006':
                    prefixurl = 'tp5/public/index.php/admin/carddyn/';
                    url = prefixurl + 'AddState';
                    data = {
                        
                    }
                    this.$http.put(url,data).then(response =>{
                        console.log(this.comlist)
                    })
                    break;
                default:
                    break;
            }
        },
            handleView (name) {
                this.imgName = name;
                this.visible = true;
            },
            handleRemove (file) {
                const fileList = this.$refs.upload.fileList;
                this.$refs.upload.fileList.splice(fileList.indexOf(file), 1);
            },
            handleSuccess (res, file) {
                console.log(res);
                file.url = 'http://localhost/upload/'+ res;
                file.name = res;
            },
            handleFormatError (file) {
                this.$Notice.warning({
                    title: 'The file format is incorrect',
                    desc: 'File format of ' + file.name + ' is incorrect, please select jpg or png.'
                });
            },
            handleMaxSize (file) {
                this.$Notice.warning({
                    title: 'Exceeding file size limit',
                    desc: 'File  ' + file.name + ' is too large, no more than 2M.'
                });
            },
            handleBeforeUpload () {
                const check = this.uploadList.length < 6;
                if (!check) {
                    this.$Notice.warning({
                        title: 'Up to five pictures can be uploaded.'
                    });
                }
                return check;
            }
    },
    /* event listeners code in mounted function*/
    mounted: function () {
        this.request('10002');
        this.request('10005');

        //
        this.uploadList = this.$refs.upload.fileList;
    },
    destroyed: function () { }
}
</script>

<style>
    .demo-upload-list{
        display: inline-block;
        width: 60px;
        height: 60px;
        text-align: center;
        line-height: 60px;
        border: 1px solid transparent;
        border-radius: 4px;
        overflow: hidden;
        background: #fff;
        position: relative;
        box-shadow: 0 1px 1px rgba(0,0,0,.2);
        margin-right: 4px;
    }
    .demo-upload-list img{
        width: 100%;
        height: 100%;
    }
    .demo-upload-list-cover{
        display: none;
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        background: rgba(0,0,0,.6);
    }
    .demo-upload-list:hover .demo-upload-list-cover{
        display: block;
    }
    .demo-upload-list-cover i{
        color: #fff;
        font-size: 20px;
        cursor: pointer;
        margin: 0 2px;
    }
</style>
