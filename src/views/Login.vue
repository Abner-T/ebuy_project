<template>
    <div class="background">
    <div class="login">
    <el-card class="box-card">
        <div slot="header" class="clearfix">
            <span>WT商品管理系统</span>
        </div>
        <el-tabs v-model="currentIndex" stretch @tab-click="handleTabsClick">

            <el-tab-pane label="登陆" name="login">
               <el-form :model="loginForm" status-icon ref="loginForm" :rules="rules">
                   <el-form-item label="用户名" label-width="80px" prop="username">
                       <el-input type="text" v-model="loginForm.username"></el-input>
                   </el-form-item>
                   <el-form-item label="密码" label-width="80px" prop="password">
                       <el-input type="password" v-model="loginForm.password"></el-input>
                   </el-form-item>
                   <el-form-item>
                       <el-button type="primary" @click="submitForm('loginForm')" @keyup.enter="submitForm('loginForm')">提交</el-button>
                   </el-form-item>
               </el-form>
            </el-tab-pane>

            <el-tab-pane label="注册" name="register">
                <el-form :model="registerForm" status-icon ref="registerForm" :rules="rules">
                    <el-form-item label="用户名" label-width="80px" prop="username">
                        <el-input type="text" v-model="registerForm.username"></el-input>
                    </el-form-item>
                    <el-form-item label="邮箱" label-width="80px" prop="email" :rules="[
                        { required: true, message: '请输入邮箱地址', trigger: 'blur' },
                        { type: 'email', message: '请输入正确的邮箱地址', trigger: ['blur', 'change'] }
                         ]">
                        <el-input type="text" v-model="registerForm.email"></el-input>
                    </el-form-item>
                    <el-form-item label="密码" label-width="80px" prop="password">
                        <el-input type="password" v-model="registerForm.password"></el-input>
                    </el-form-item>
                    <el-form-item label="确认密码" label-width="80px" prop="configurePassword">
                        <el-input type="password" v-model="registerForm.configurePassword"></el-input>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="submitForm('registerForm')" @keyup.enter="submitForm('registerForm')">提交</el-button>
                    </el-form-item>
                </el-form>
            </el-tab-pane>

        </el-tabs>
    </el-card>
    </div>
    </div>
</template>

<script>

    import api from "@/api";
    import {mapMutations} from "vuex"

    export default {
        name: "LoginView",
        data(){
            //验证规则
            var validateUserName=(rule, value, callback)=>{
                if (value===''){
                    callback(new Error("请输入用户名"));
                }else if(value.length<3){
                    callback(new Error("长度不够"))
                }else {
                    callback();
                }
            };
            var validatePassword=(rule, value, callback)=>{
                if (value===''){
                    callback(new Error("请输入密码"));
                } else {
                    callback();
                }
            };
            var validateConfigurePassword=(rule, value, callback)=>{
                if (value===''){
                    callback(new Error("请输入密码"));
                } else if(value!==this.registerForm.password){
                    callback(new Error("两次输入的密码不一致!"));
                }else {
                    callback();
                }
            };
            var validateEmail=(rule, value, callback)=>{
                if (value===''){
                    callback(new Error("请输入邮箱"));
                }else if(value.length<3){
                    callback(new Error("长度不够"))
                }else {
                    callback();
                }
            };
            return{
                currentIndex:'login',
                loginForm:{
                    username:'',
                    password:''
                },
                registerForm:{
                    username:'',
                    password:'',
                    configurePassword:'',
                    email:''
                },
                rules:{
                    username:[
                        {
                            validator:validateUserName,
                            trigger:'blur'
                        }
                        ],
                    password: [
                        {
                            validator:validatePassword,
                            trigger:'blur'
                        }
                        ],
                    configurePassword:[
                        {
                            validator:validateConfigurePassword,
                            trigger:'blur'
                        }
                    ],
                    email: [
                        {
                            validator:validateEmail,
                            trigger:'blur'
                        }
                    ]
                },
                activeTab:'login'
            }
        },
        methods:{
            ...mapMutations("login",["setUser"]),
         submitForm(formName){
            this.$refs[formName].validate((valid)=>{
                if (valid){
                    if (this.activeTab==='login'){
                        //登陆
                        api.login(this.loginForm).then((res)=>{
                            console.log(res.data);
                            if (res.data.status === 200){
                                    this.setUser(res.data);
                                    localStorage.setItem("vue-ego",JSON.stringify(res.data));
                                    this.$router.push('/')
                            }else {
                                const h = this.$createElement;
                                this.$notify({
                                    title: '登陆失败',
                                    message: h('i',"用户名密码错误"),
                                });
                            }
                        });
                    }
                    if (this.activeTab==='register'){
                        //注册
                        api.register(this.registerForm).then((res)=>{
                            if (res.data.status===200) {
                                const h = this.$createElement;
                                this.$notify({
                                    title: '注册成功',
                                    message: h('i',"请前往登陆页面登陆")
                                });
                            }else {
                                const h = this.$createElement;
                                this.$notify({
                                    title: '注册失败',
                                    message: h('i',"请重新注册")
                                });
                            }
                        })
                    }
                }else {
                    return;
                }
            })
         },
            handleTabsClick(tab){
                this.activeTab=tab.name;
                // console.log(tab.name)
            }
        }
    }
</script>

<style scoped lang="less">
.login{
    width: 1200px;
    margin: 0 auto;
    padding: 100px 110px;

    .box-card{
        width: 500px;
        margin: 100px auto;
    }
}
    .background{
        background-position: center center;
        background-image: url("../assets/images/06edeaf63cfb414b461a3f1c88e8b924.jpeg");
        background-repeat: no-repeat;
        background-size: 100%;
        overfloat:hidden;


    }

</style>
