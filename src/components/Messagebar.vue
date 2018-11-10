<template>
    <div>
        <transition name="flip-list">
            <div v-if="barvisit" class="messagebar">
                <div class="" style="text-align:center;height:40px;line-height:40px;font-size:11px;  border-bottom: 1px solid #efefef;background-color:#44abf7;color:#fffffa;">
                    <span class="fa fa-commenting-o sp-pad"></span><span>消息提醒</span>
                </div>
                <div class="messbaritem" style="position:relative">
                    <span class="fa fa-calendar-minus-o pad-left-i"></span>
                    <span>订单消息</span>
                    <span class="fa fa-angle-down messbaritem-down"></span>
                </div>
                <div class="messbaritem">
                    <span class="fa fa-calendar-minus-o pad-left-i"></span>
                    <span>内部公告</span>
                    <span class="fa fa-angle-down messbaritem-down"></span>
                </div>
                <div class="messbaritem">
                    <span class="fa fa-calendar-minus-o pad-left-i"></span>
                    <span>佣金提现</span>
                    <span class="fa fa-angle-down messbaritem-down"></span>
                </div>
                <div class="messbaritem">
                    <span class="fa fa-calendar-minus-o pad-left-i"></span>
                    <span>评价</span>
                    <span class="fa fa-angle-down messbaritem-down"></span>
                </div>

                <div class="btn-change" @click='changestatus()'><span class="fa fa-angle-double-right sp-pad"></span>收起面板</div>
            </div>
        </transition>
        <transition name="flip">
            <!-- <transition name="slide-fade"> -->
            <div class="visit-bar" v-if="!barvisit" @click='changestatus()'><span class="fa fa-commenting-o sp-pad"></span>消息提醒</div>
        </transition>
    </div>
</template>

<script type="text/javascript">
export default {
    data() {
        return {}
    },
    computed: {
        barvisit() {
            return this.$store.state.status.messagebarVisit
        }
    },
    methods: {
        changestatus() {
            this.$store.commit('messagebarVisit')
        }
    }
}
</script>
