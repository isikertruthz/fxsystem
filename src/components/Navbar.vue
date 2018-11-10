<template>
    <div>
        <ul class="navbar-top" :class="sidebarmax?'navbar-top3':'navbar-top2'">
            <li @click="changestatus()">
                <router-link :to="{path: '/admin' }" class="to-home"><span class="fa fa-home"></span></router-link>
            </li>
            <li class="to-home cursor-poi" id='baricon' @click="changeBarlistVisit()">
                <span class="fa fa-bars"></span>
                <div class="barlist row text-left" style="font-size:15px;" v-if="barlistVisit" @click.stop>
                    <div class="col-md-2 barlist-col">
                        <h5 style="font-weight:bold">最近访问</h5>
                        <div class="barlistitem1 cursor-poi" v-for="item in visited" :key="item.thrID" @click="openVisited(item.rootID,item.secID,item.thrID)">{{item.thrName}}<span class="fa fa-window-close nav-del-icon" @click.stop="delCurItem(item.thrID)"></span></div>
                        <div class="barlistitem1 cursor-poi color-44ab" @click="clearVisited()">清除最近访问</div>
                    </div>
                    <div class="col-md-2 barlist-col">
                        <h5 style="font-weight:bold">全部导航</h5>
                        <div class="barlistitem1 cursor-poi" v-for="item in menuList" :key="item.id" :id="'curindex'+item.id" :class="item.id==selected?'item-selected':''" @mouseover="baritemSelected(item.id)" @click="baritemSelected(item.id)">{{item.name=='设置'?'参数'+item.name:item.name+'管理'}}</div>
                    </div>
                    <div class="col-md-8 barlist-cont">
                        <span class="fa fa-close icon-close cursor-poi" title="关闭" @click="changeBarlistVisit()"></span>
                        <div style="line-height:30px;padding:55px 20px 20px 20px;font-size:12px;">
                            <span v-for="item in contList" :key="item.thrid" class="cursor-poi" style="width:100px;background-color:#f7f8fa;  padding:5px 10px;margin-right:10px; " :title="item.title" @click="openVisited(item.rootid,item.secid,item.thrid)">
                                {{item.name}}</span>
                        </div>
                    </div>
                </div>
            </li>
            <li class="navbar-search float-left">
                <input id="funseach" type="search" class="navbar-inputsea" placeholder="请输入关键词进行功能搜索..." v-model="search" @keyup.esc="exit()">
                <span class="glyphicon glyphicon-search float-left" style="height:47px;line-height:47px;margin-left:12px;"></span>
                <div class="navbar-sealist" v-if="searchList.length>0">
                    <div :key="item.name" v-for="item in searchList" class="text-left search-item cursor-poi" @click="routerTo(item.url,item.rootid,item.secid,item.thrid)">
                        {{item.root+" -> "+item.secCate+" -> "+item.name}}
                    </div>
                </div>
                <div class="navbar-listnon" v-if="search.length>0 && searchList.length==0">{{message}}</div>
            </li>
            <li href="#" id="exit" class="to-login cursor-poi" @click="logout"><span class="fa fa-power-off loginout"></span></li>
            <span class="to-login user" style="width:100px;">欢迎,{{user}}</span>
            <span class="to-login user">{{username}}</span>
        </ul>
    </div>
</template>

<script type="text/javascript">
import { mapState } from "vuex";
export default {
    data() {
        return {
            username: "企泰信息科技开发版",
            search: "",
            searchList: [],
            barlistVisit: false,
            selected: "-1",
            contList: [],
            visited: []
        };
    },
    computed: {
        user() {
            return sessionStorage.getItem("user");
        },
        message() {
            return '暂无 " ' + this.search + ' " 相关功能';
        },
        menuList() {
            return this.$storage.get("menuList");
        },
        ...mapState({
            sidebarmax: state => state.status.sidebarmax
        })
    },
    watch: {
        search(newval, oldval) {
            let obj = {};
            if (newval != "") {
                for (var item of this.$storage.get("menuList")) {
                    if (item.root) {
                        for (var secItem of item.root) {
                            if (secItem.subItems) {
                                for (var thrItem of secItem.subItems) {
                                    if (thrItem.name.search(newval.replace(/\s+/g, "")) == 0) {
                                        obj.root = item.name;
                                        obj.rootid = item.id;
                                        obj.secCate = secItem.name;
                                        obj.secid = secItem.id;
                                        obj.name = thrItem.name;
                                        obj.thrid = thrItem.id;
                                        obj.url = thrItem.url;
                                        let isadd = true;
                                        for (var serachitem of this.searchList) {
                                            if (obj.name == serachitem.name) {
                                                isadd = false;
                                            }
                                        }
                                        if (isadd) {
                                            this.searchList.push(obj);
                                        }
                                        break;
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                this.searchList = [];
            }
        },
        selected(id) {
            this.contList = [];
            // console.log(this.menuList)
            for (var item of this.menuList) {
                if (item.id == id && item.root) {
                    for (var subitem of item.root) {
                        if (subitem.subItems) {
                            for (var contitem of subitem.subItems) {
                                // console.log(contitem)
                                this.additem(
                                    item.id,
                                    subitem.id,
                                    contitem.id,
                                    contitem.name,
                                    item.name + " > " + subitem.name
                                );
                            }
                        }
                    }
                }
            }
        },
        barlistVisit() {
            let that = this;
            if (this.barlistVisit) {
                window.addEventListener("click", this.eventclick);
            }
        }
    },
    methods: {
        eventclick(e) {
            if (e.isTrusted) {
                this.barlistVisit = false;
            }
            window.removeEventListener("click", this.eventclick);
        },
        additem(rootid, secid, thrid, name, title) {
            let tmp = {};
            (tmp.rootid = rootid),
                (tmp.secid = secid),
                (tmp.thrid = thrid),
                (tmp.name = name),
                (tmp.title = title);
            this.contList.push(tmp);
        },
        changestatus() {
            this.$store.commit("subSidebarHiden");
            this.$store.commit("subbsidebarLocation", "");
            $("#funseach").focus();
        },
        logout() {
            this.$router.replace({ path: "/" });
        },
        routerTo(url, rootid, secid, thrid) {
            this.autoclick(rootid, secid, thrid);
            this.search = "";
            this.searchList = [];
        },
        changeBarlistVisit() {
            setTimeout(function () {
                $("#curindex0").click();
            }, 100);
            this.visited = this.$storage.get("visited");
            this.barlistVisit = !this.barlistVisit;
            window.removeEventListener("click", this.eventclick);
        },
        autoclick(rootid, secid, thrid) {
            this.$store.commit("setclickStatus");
            $("#sidebar" + rootid).click();
            setTimeout(function () {
                $("#secCate" + secid).click();
            }, 300);
            setTimeout(function () {
                $("#thrCate" + thrid).click();
                // console.log(rootid + secid + thrid);
            }, 500);
        },
        openVisited(rootid, secid, thrid) {
            this.autoclick(rootid, secid, thrid);
            this.barlistVisit = !this.barlistVisit;
            window.removeEventListener("click", this.eventclick);
        },
        clearVisited() {
            if (this.visited.length > 0) {
                let visited = [];
                this.visited = visited;
                this.$storage.set("visited", visited);
            }
        },
        baritemSelected(id) {
            this.selected = id;
        },
        delCurItem(id) {
            for (var index in this.visited) {
                if (this.visited[index].thrID == id) {
                    this.visited.splice(index, 1);
                }
            }
            this.$storage.set("visited", this.visited);
        },
        exit() {
            $("#exit").click();
        }
    },
    mounted: function () {
        // console.log(this.$storage.get("visited"));
        $("#funseach").focus();
    }
};
</script>
