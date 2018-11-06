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
                    <Tabs :animated="false" style="padding:10px 20px 10px 20px;">
                        <TabPane label="员工信息">
                            <Table :columns="columns7" :data="list"></Table>
                        </TabPane>
                        <TabPane label="添加员工" class="card-add-tabpane">
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">所属公司：</span>
                                <Select v-model="tempinfo.comid" class="card-add-input" @change="tempinfo.comid = $event.target.value">
                                    <Option class="card-add-input" value="0">请选择</Option>
                                    <Option class="card-add-input" value="1">企泰科技</Option>
                                </Select>
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">姓名：</span>
                                <Input :value="tempinfo.empname" @input="tempinfo.empname = $event.target.value" placeholder="请输入姓名..." size="large" class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">职位：</span>
                                <Input :value="tempinfo.emppost" @input="tempinfo.emppost = $event.target.value" placeholder="请输入职位..." size="large" class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">手机：</span>
                                <Input :value="tempinfo.mobnum" @input="tempinfo.mobnum = $event.target.value" placeholder="请输入手机..." name="mobnum" size="large" class="card-add-input"/>
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">微信：</span>
                                <Input :value="tempinfo.wxnum" @input="tempinfo.wxnum = $event.target.value" placeholder="请输入微信..." size="large" class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">邮箱：</span>
                                <Input :value="tempinfo.email" @input="tempinfo.email = $event.target.value" placeholder="请输入邮箱..." size="large" class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">座机：</span>
                                <Input :value="tempinfo.telphone" @input="tempinfo.telphone = $event.target.value" placeholder="请输入座机..." size="large" class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">地址：</span>
                                <Input :value="tempinfo.address" @input="tempinfo.address = $event.target.value" placeholder="请输入地址..." size="large" class="card-add-input" />
                            </div>
                            <div class="card-add-tabpane-div">
                                <span class="card-add-span">头像：</span>
                                <Input id="perImage" type="file" name="file" style="width: 200px;display:none;" @change="fileUpload($event)" />
                                <img src="../../assets/images/image.png" class="card-add-img-def" v-if="imgTmp==''">
                                <img :src="imgTmp" class="card-add-img-upl" v-else>
                                <Button type="default" size="small" @click="clickUpload()">选择图片</Button>
                            </div>
                            <div style="width:295px;text-align:right;">
                                <Button type="info" size="default">返回</Button>
                                <Button type="success" @click="request('10001')">提交</Button>
                            </div>

                        </TabPane>
                        <TabPane label="修改信息" disable>    <Button>Default</Button>
    <Button type="primary">Primary</Button>
    <Button type="dashed">Dashed</Button>
    <Button type="text">Text</Button>
    <br><br>
    <Button type="info">Info</Button>
    <Button type="success">Success</Button>
    <Button type="warning">Warning</Button>
    <Button type="error">Error</Button></TabPane>
                    </Tabs>
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
import {Button,Tabs,TabPane,Table,Modal,Message} from 'iview';
import Vue from 'vue'
Vue.prototype.$Modal = Modal
Vue.prototype.$Message = Message

export default {
    components: {Button,Tabs,TabPane,Table,Modal,Message},
    data() {
        return {
            loading:false,
            Modal:true,
            columns7: [
                    {
                        title: 'ID',
                        key: 'id',
                        width: 80,
                        align: 'center',
                        render: (h, params) => {
                            return h('div', [
                                h('Icon', {
                                    props: {
                                        type:'person'
                                    }
                                }),
                                h('strong', params.row.name)
                            ]);
                        }
                    },
                    {
                        title: '姓名',
                        key: 'empname',
                        align: 'center',
                    },
                    {
                        title: '职位',
                        key: 'mobnum',
                        align: "center"
                    },
                    {
                        title: '手机',
                        key: 'mobnum',
                        align: "center"
                    },
                    {
                        title: '微信',
                        key: 'mobnum',
                        align: "center"
                    },
                    {
                        title: '邮箱',
                        key: 'mobnum',
                        align: "center"
                    },
                    {
                        title: '座机',
                        key: 'mobnum',
                        align: "center"
                    },
                    {
                        title: '地址',
                        key: 'mobnum',
                        align: "center"
                    },
                    {
                        title: '头像',
                        key: 'mobnum',
                        align: "center"
                    },
                    {
                        title: '个人简介',
                        key: 'mobnum',
                        align: "center"
                    },
                    {
                        title: '操作',
                        key: 'wxnum',
                        width: 150,
                        align: 'center',
                        render: (h, params) => {
                            return h('div', [
                                h('Button', {
                                    props: {
                                        type:"primary",
                                        size:"small"
                                    },
                                    style: {
                                        marginRight: '5px'
                                    },
                                    on: {
                                        click: () => {
                                            this.show(params.index)
                                        }
                                    }
                                }, 'View'),
                                h('Button', {
                                    props: {
                                        type:"error",
                                        size:"small"
                                    },
                                    on: {
                                        click: () => {
                                            this.remove(params.index)
                                        }
                                    }
                                }, 'Delete')
                            ]);
                        }
                    }
                ],
                list: [
                    {
                        name: 'John Brown',
                        age: 18,
                        address: 'New York No. 1 Lake Park'
                    },
                    {
                        name: 'Jim Green',
                        age: 24,
                        address: 'London No. 1 Lake Park'
                    },
                    {
                        name: 'Joe Black',
                        age: 30,
                        address: 'Sydney No. 1 Lake Park'
                    },
                    {
                        name: 'Jon Snow',
                        age: 26,
                        address: 'Ottawa No. 2 Lake Park'
                    }
                ],
                imgTmp : "",
                tempinfo : {
                    comid:"",
                    empname:"111",
                    emppost:"",
                    mobnum:"13800000000",
                    wxnum:"",
                    email: "",
                    telphone:"",
                    address:"",
                    imgpath:"",
                    intro:"",
                    photoimage:""
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
    watch: {},
    methods: {
        onchange(e){
            this.tempinfo.mobnum = e.target.value;
            console.log(e);
        },
        show (index) {
                this.$Modal.info({
                    title: '员工信息',
                    content: `姓名：${this.list[index].name}<br>年龄：${this.list[index].age}<br>地址：${this.list[index].address}`
                })
            },
        remove (index) {
            this.list.splice(index, 1);
        },
        clickUpload() {
            $("#perImage").trigger("click");
        },
        //上传图片
        fileUpload(e) {
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
                that.tempinfo.imgpath = fileName
            })
        },
        request(ywtype){
            switch (ywtype) {
                case '10001':
                    console.log(this.tempinfo);
                    let url = 'tp5/public/index.php/admin/card/addcard'
                    this.$http.post(url,this.tempinfo).then(response=>{
                        console.log(response);
                            this.$Message.success('添加成功');
                    })
                    break;
            
                default:
                    break;
            }
        }
    },
    /* event listeners code in mounted function*/
    mounted: function(){
        $
    },
    destroyed: function(){}
}
</script>

