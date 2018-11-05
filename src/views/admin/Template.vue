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
                            <Table :columns="columns7" :data="data6"></Table>
                        </TabPane>
                        <TabPane label="添加员工" style="text-align:left;padding-top:5px;">
                            <div style="margin:15px 0px">
                                <span style="width:80px;display:inline-block;text-align:right;">姓名：</span>
                                <Input v-model="value14" placeholder="请输入姓名..." clearable size="large" style="width: 200px" />
                            </div>
                            <div style="margin:15px 0px">
                                <span style="width:80px;display:inline-block;text-align:right;">职位：</span>
                                <Input v-model="value14" placeholder="请输入姓名..." clearable size="large" style="width: 200px" />
                            </div>
                            <div style="margin:15px 0px">
                                <span style="width:80px;display:inline-block;text-align:right;">手机：</span>
                                <Input v-model="value14" placeholder="请输入姓名..." clearable size="large" style="width: 200px" />
                            </div>
                            <div style="margin:15px 0px">
                                <span style="width:80px;display:inline-block;text-align:right;">微信：</span>
                                <Input v-model="value14" placeholder="请输入姓名..." clearable size="large" style="width: 200px" />
                            </div>
                            <div style="margin:15px 0px">
                                <span style="width:80px;display:inline-block;text-align:right;">邮箱：</span>
                                <Input v-model="value14" placeholder="请输入姓名..." clearable size="large" style="width: 200px" />
                            </div>
                            <div style="margin:15px 0px">
                                <span style="width:80px;display:inline-block;text-align:right;">座机：</span>
                                <Input v-model="value14" placeholder="请输入姓名..." clearable size="large" style="width: 200px" />
                            </div>
                            <div style="margin:15px 0px">
                                <span style="width:80px;display:inline-block;text-align:right;">地址：</span>
                                <Input v-model="value14" placeholder="请输入姓名..." clearable size="large" style="width: 200px" />
                            </div>
                            <div style="margin:15px 0px">
                                <span style="width:80px;display:inline-block;text-align:right;">头像：</span>
                                <Input v-model="value14" placeholder="请输入姓名..." clearable size="large" style="width: 200px" />
                            </div>
                            <Button type="success" size="small"> 提交 </Button>

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
import { Button, Tabs,TabPane,Table,Modal } from 'iview';
import Vue from 'vue'
Vue.prototype.$Modal = Modal

export default {
    components: {Button,Tabs,TabPane,Table,Modal},
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
                                        type: 'person'
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
                                        type: 'primary',
                                        size: 'small'
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
                                        type: 'error',
                                        size: 'small'
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
                data6: [
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
                ]
            
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
        show (index) {
                this.$Modal.info({
                    title: '员工信息',
                    content: `姓名：${this.data6[index].name}<br>年龄：${this.data6[index].age}<br>地址：${this.data6[index].address}`
                })
            },
        remove (index) {
            this.data6.splice(index, 1);
        }
    },
    /* event listeners code in mounted function*/
    mounted: function(){},
    destroyed: function(){}
}
</script>

