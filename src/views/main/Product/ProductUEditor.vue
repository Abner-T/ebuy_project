<template>
    <vue-ueditor-wrap v-model="msg" :config="myConfig"></vue-ueditor-wrap>
</template>

<script>
    import VueUeditorWrap from 'vue-ueditor-wrap';
    export default {
        name: "ProductUEditor",
        components:{VueUeditorWrap},
        data(){
            return{
                msg:'hello',
                myConfig:{
                    //编辑器不被自动撑高
                    autoHeightEnabled:false,
                    //初始容器高度
                    initialFrameHeight:240,
                    //初始容器宽度
                    initialFrameWidth:"100%",
                    //上传文件接口
                    serverUrl:"http://localhost:3000/api/upload",
                    //UEditor资源文件存放路径
                    UEDITOR_HOME_URL:'/UEditor/'
                }
            }
        }
    }
</script>

<style scoped>

</style>
