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
                    <div class="editor-container">
                    <UE :defaultMsg=defaultMsg :config=config ref="ue"></UE>
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
import UE from '@/components/UE.vue'
export default {
    components: {UE},
    data() {
        return {
            defaultMsg: '这里是UE测试',
            config: {
            initialFrameWidth: null,
            initialFrameHeight: 350
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
        getUEContent() {
                let content = this.$refs.ue.getUEContent();
                this.$notify({
                title: '获取成功，可在控制台查看！',
                message: content,
                type: 'success'
                });
                console.log(content)
            }
    },
    /* event listeners code in mounted function*/
    mounted: function(){},
    destroyed: function(){}
}
</script>