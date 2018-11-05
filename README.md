# fxsystem

> A Vue.js project

## 本地安装测试流程

1. 首先安装Node.js

2. 下载项目后通过cmd进入项目跟目录，执行以下命令

``` bash
# 安装依赖文件
npm install

# 本地测试 安装后通过http://localhost:8080打开项目
npm run dev

# 编译前端vue项目 根目录生成dist文件 拷贝到服务器
npm run build

# 以下可省略 测试部分

# build for production and view the bundle analyzer report
npm run build --report

# run unit tests
npm run unit

# run all tests
npm test
```
> 项目简介

## 后台内容管理软件

### 前端

基于Vue框架  axios vue-router vuex 等插件

bootstrap3 jquery-ui iview 等组件库

ueditor富文本插件  

### 后端

基于apache2.4.9 php5.5.12 mysql5.6.17

计划用thinkphp5重写
> 项目环境


> 安装部署：


1. 新建数据库后执行 ./service/sql/webqt.sql ('./'代表当前路径，下同)

2. 配置数据库 编辑 ./service/api/constants/db.config.php下的主机名，数据库名，数据库账号和密码

3. 配置请求服务器  .config/index.js

```
    proxyTable: {
        '/apis':{
            target :'http://localhost/',  //更换请求地址
            secure :false,    //是否启用ssl 启用true 不启用false
            changeOrigin:true,
            pathRewrite:{
                '^/apis':''
            }
        }
    }
```
4. 编辑 ./src/utils/global.js
```
//const BASE_URL = '/apis';
const BASE_URL = '';   
```
