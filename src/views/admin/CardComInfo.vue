<template>
    <div>
        <!-- adjust 适应框架宽度 -->
        <div class="comm-view" :class="
        commLay==240?messagebarVisit?'pad-lefta pad-right':'pad-lefta':
        commLay==130?messagebarVisit?'pad-leftb pad-right':'pad-leftb':
        commLay==170?messagebarVisit?'pad-leftc pad-right':'pad-leftc':
        commLay==60?messagebarVisit?'pad-leftd pad-right':'pad-leftd':''">
            <div class="dp-location"> <!-- location -->
                <span class="loc-bor">当前位置：
                    <label class="page-location">{{pageLoction}}管理</label>
                </span>
            </div> <!-- location End -->
            <div class="content" > 
                <div class="content-top">
                    <Tabs :animated="false" style="padding:10px 20px 10px 20px;" v-model="curtab">
                        <TabPane label="公司信息">
                            <Table :columns="columns7" :data="list"></Table>
                        </TabPane>
                        <TabPane label="添加公司" class="card-add-tabpane" :disabled="secdisabled">
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">公司名称</span>
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
                                <span class="card-add-span" style="float:left;padding-top:5px;">公司简介：</span>
                                <Input type="textarea" v-model="tempinfo.comintro" placeholder="个人简介" clearable class="card-add-input" />
                            </div>
                            <div style="width:465px;text-align:right;">
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
                                <span class="card-add-span" style="float:left;padding-top:5px;">公司简介：</span>
                                <Input type="textarea" v-model="tempinfo.comintro" placeholder="个人简介" clearable class="card-add-input" />
                            </div>
                            <div style="width:465px;text-align:right;">
                                <Button type="info" size="default" @click="changeTab()">返回</Button>
                                <Button type="success" @click="request('10004')">修改</Button>
                            </div>
                        </TabPane>
                        <TabPane label="动态信息" class="card-add-tabpane">
                        </TabPane>
                        <TabPane label="发表动态" class="card-add-tabpane">
                        </TabPane>
                        <TabPane label="官网配置" class="card-add-tabpane">
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
                        <Button type="error" size="large" long   @click="del(curindex)">确定</Button>
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
import {Button,Tabs,TabPane,Table,Modal,Message,Input,Select,Option,Avatar} from 'iview';
import Vue from 'vue'
Vue.prototype.$Modal = Modal
Vue.prototype.$Message = Message

export default {
    components: {Button,Tabs,TabPane,Table,Modal,Message,Input,Select,Option,Avatar},
    data() {
        return {
            curindex : -1,
            deleteit : false,
            empname: "555",
            loading:false,
            Modal:true,
            curtab : 0,
            secdisabled : false,
            enchange : true,
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
                                        shape:"square",
                                        size:"large",
                                        src: 'http://localhost/upload/'+this.list[params.index].logopath
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
                                        type:"info",
                                        size:"small"
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
                                        type:"success",
                                        size:"small"
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
                                        type:"error",
                                        size:"small"
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
                imgTmp : "",
                tempinfo : {
                    id : -1,
                    comname : '',
                    createdate : '',
                    logopath : '',
                    updatedate : '',
                    comintro : '',
                },
                tempinfotml : {
                    id : -1,
                    comname : '',
                    createdate : '',
                    logopath : '',
                    updatedate : '',
                    comintro : '',
                }
            
        }
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
    watch: {
        curtab: function (newval,oldval) {
            if(this.curtab != 2){
                this.enchange = true;
                this.secdisabled = false;
            }else{
                this.secdisabled = true;
            }
            if(oldval==2){
                this.tempinfo = this.tempinfotml;
            }
        }
    },
    methods: {
        del(index){
            this.request('10003',this.list[index].id,index);
            this.deleteit = false;
        },
        changeUpdateTab (key) {
            this.curindex = key;
            this.curtab = 2;
            this.tempinfo = this.list[key];
        },
        changeTab () {
            this.curtab = 0;
            this.tempinfo = this.tempinfotml;
        },
        show (index) {
                this.$Modal.info({
                    title: '公司信息',
                    content: `名称：${this.list[index].comname}<br>
                    添加时间：${this.list[index].createdate}<br>
                    最近修改：${this.list[index].updatedate}<br>`
                })
            },
        remove (index) {
            this.deleteit = true;
            this.curindex = index;
        },
        clickUpload () {
            $("#perImage").trigger("click");
        },
        //上传图片
        fileUpload (e) {
            let that = this 
            let file = e.target.files[0] 
            let fileName = that.$utils.getUID()+"."+that.$utils.getCaption(file.type,"\/") 

            //实现图片预览
            let reader = new FileReader() 
            reader.readAsDataURL(file) 
            reader.onload = function() {
                that.imgTmp = this.result
            }

            //上传图片
            let config = {
                headers: {'Content-Type': 'multipart/form-data'}
            }
            let param = new FormData() 
            param.append('file',file,fileName) //通过append向form对象添加数据
            // console.log(param.get('file'))  //FormData私有类对象，访问不到，可以通过get判断值是否传进去

            that.$http.post("api/main.php?ywtype=10002",param,config).then(response=>{
                that.tempinfo.logopath = fileName
            })
        },
        request (ywtype) {
            let prefixurl = 'tp5/public/index.php/admin/cardcominfo/';
            let url = '';
            switch (ywtype) {
                //添加
                case '10001' :
                    // console.log(this.tempinfo);
                    url = prefixurl + 'addcomitem'
                    this.$http.post(url,this.tempinfo).then(response=>{
                        this.list.push(response.data.data);
                        this.curtab = 0;
                        this.$Message.success('添加成功');
                        this.tempinfo = this.tempinfotml;
                        this.imgTmp = '';
                        // console.log(this.tempinfo)
                    })
                    break;
                case  '10002' :
                    url = prefixurl + 'selectall';
                    this.$http.get(url).then(response=>{
                        console.log(response);
                        this.list = response.data.data;
                    })
                    break;
                case '10003':
                    url = prefixurl + 'delbyid';
                    let data = {
                        id : arguments[1]                        
                    };
                    this.$http.post(url,data).then(response=>{
                        this.list.splice(arguments[2],1);
                        this.$Message.success('删除成功');
                    })
                    break;
                case '10004':
                    console.log(this.tempinfo);
                    url = prefixurl + 'updatebyid';
                    this.$http.post(url,this.tempinfo).then(response=>{
                        this.list[this.curindex].updatedate = response.data.data.updatedate;
                        this.$Message.success('修改成功');
                        this.curtab = 0;
                        this.tempinfo = this.tempinfotml;
                    },response=>{
                        this.$Message.success('修改失败');
                    });
                    break;
                default:
                    break;
            }
        }
    },
    /* event listeners code in mounted function*/
    mounted: function(){
        this.request('10002');
    },
    destroyed: function(){}
}
</script>

