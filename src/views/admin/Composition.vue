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
                    <ul style="padding-top:15px;font-size:12px;" id="compsearch" >
                        <li class="compsearch" style="width:530px;padding:0 160px 0  100px;margin-left:30px;" v-for="item in list" :key="item.id" :id="item.ordernum">
                            <div style="position:relative" >
                                <img :src="'https://www.entertry.com/images/img/'+item.imgpath" alt="">
                                <span style="position:absolute;left:-70px;top:3px;">{{item.name}}</span>
                                <span style="position:absolute;right:-100px;top:3px;">是否显示</span>
                                <label class ="switch switch-mini" style="position:absolute;right:-120px;top:0px;">
                                    <input type ="checkbox" :value="item.isvisited" :name="item.name" :checked="item.isvisited"/>
                                </label>
                            </div>
                        </li>
                    </ul> 
                    <div class="text-left" style="padding:10px 0 0 130px;">
                        <button style="background-color:#45abf5;color:white;border:none;height:25px;width:40px;" @click="listindexchange()">保存</button>
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
        return {
            list: []
        }
    },
    computed: {
        ...mapState({
            pageLoction : state => state.status.pageLoction,
            messagebarVisit : state => state.status.messagebarVisit,
            sidebarmax : state => state.status.sidebarmax,
            subSidebarVisit : state => state.status.subSidebarVisit,
            table : state => state.status.curtable
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
        listindexchange(){
            let serial = $("#compsearch").sortable('toArray');
            let serial1 = $("#compsearch").sortable('serialize');
            console.log(serial1);
            this.$http.post("api/main.php?ywtype=11202"+"&tb="+this.table,serial).then(response=>{
                console.log(response);
            })
        }
    },
    /* event listeners code in mounted function*/
    mounted: function(){
        var comp = $("#compsearch")
        comp.sortable( {
            update:function(){
                let serial = comp.sortable('toArray');
            }
        });
        $("#compsearch").disableSelection();

        this.$http.get("api/main.php?ywtype="+"11201"+"&tb="+this.table).then(response=>{
            this.list = response.data
        })

    },
    destroyed: function(){}
}
</script>