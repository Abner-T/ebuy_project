<template>
    <el-menu :default-active="active"
             mode="horizontal"
             background-color="#545c64"
             text-color="#fff"
             active-text-color="#ffd04b"
                router
             @select="handleSelect"
    >
        <el-menu-item index="/">首页</el-menu-item>
        <el-menu-item index="/product">商品管理</el-menu-item>
        <el-menu-item index="/params">规格参数</el-menu-item>
        <el-menu-item index="/ad">销售管理</el-menu-item>
        <el-menu-item class="el-icon-user">
            <span class="user-name">{{user.username}}</span>
            <el-button @click="logoutHandle">退出</el-button>
        </el-menu-item>

    </el-menu>
</template>

<script>
    import {mapState,mapMutations} from "vuex"

    export default {
        name: "HeaderNav",
        data(){
            return{
                active:'/'
            }
        },
        mounted() {
          if (sessionStorage.getItem("key")){
              this.active=sessionStorage.getItem("key")
          }
        },
        methods:{
            ...mapMutations('login',["setUser"]),
            logoutHandle(){
                this.setUser({})
                localStorage.removeItem("vue-ego");
                this.$router.push("/login")
            },
            handleSelect(key){
                sessionStorage.setItem("key",key)
            }
        },
        computed:{
            ...mapState("login",["user"])
        }
    }
</script>

<style scoped lang="less">
    .el-icon-user{
        float: right !important;
        .user-name {
        color: #fff;
        margin-right: 10px;
        font-size: 15px;
        width: 40px;
        height: 40px;
        display: inline-block;
        line-height: 40px;
    }
    }
</style>
