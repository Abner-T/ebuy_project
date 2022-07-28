<template>
    <el-dialog title="添加产品"
               :visible.sync="dialogAddVisible"
               width="70%"
               :before-close="handleClose"
    >
            <el-form label-width="100px"
                     :model="addForm"
                     ref="addForm"
            >
                <el-form-item label="商品类目">
                    <el-button type="primary" @click="dialogCategoryHandle" class="location">类目选择</el-button>
                    <span class="tree">{{treeData.name}}</span>
                        <el-dialog
                            width="50%"
                            append-to-body
                            title="类目选择"
                            :visible.sync="dialogCategoryVisible"
                        >
                            <ProductTree @onTree="getTreeData"></ProductTree>
                                <span slot="footer" class="dialog-footer">
                                    <el-button type="primary" @click="dialogCategoryVisible = false">确 定</el-button>
                            </span>
                        </el-dialog>
                </el-form-item>
                <el-form-item label="商品名称">
                    <el-input v-model="addForm.name"/>
                </el-form-item>
                <el-form-item label="商品卖点">
                    <el-input v-model="addForm.sellPoint"/>
                </el-form-item>
                <el-form-item label="商品价格">
                    <el-input v-model="addForm.price"/>
                </el-form-item>
                <el-form-item label="商品数量">
                    <el-input v-model="addForm.num"/>
                </el-form-item>
                <el-form-item label="商品图片">
                    <el-button type="primary" @click="dialogUploadHandle" class="location">图片上传</el-button>
                    <img :src="uploadData.url" class="upload-img" alt="">
                    <el-dialog
                            width="50%"
                            append-to-body
                            title="图片上传"
                            :visible.sync="dialogUploadVisible"
                    >
                        <ProductUpload @onUpload="getOnUpload"></ProductUpload>
                        <span slot="footer" class="dialog-footer">
                                    <el-button type="primary" @click="dialogUploadVisible = false">确 定</el-button>
                            </span>
                    </el-dialog>
                </el-form-item>
                <el-form-item label="商品描述">
                    <ProductWangEditor @onEditor="getEditor"></ProductWangEditor>
                </el-form-item>
            </el-form>
            <span slot="footer" class="dialog-footer">
                 <el-button @click="dialogAddVisible = false">取 消</el-button>
                <el-button type="primary" @click="addProductHandle">确 定</el-button>
            </span>
    </el-dialog>
</template>

<script>
    import ProductTree from "@/views/main/Product/ProductTree";
    import ProductUpload from "@/views/main/Product/ProductUpload";
    import ProductWangEditor from "@/views/main/Product/ProductWangEditor";
    // import ProductUEditor from "@/views/main/Product/ProductUEditor";

    export default {
        name: "ProductAdd",
        components: {ProductWangEditor, ProductUpload, ProductTree},
        data(){
            return{
                dialogAddVisible:false,
                dialogCategoryVisible:false,
                dialogUploadVisible:false,
                addForm:{
                    name:'',
                    sellPoint:'',
                    price:'',
                    num:''
                },
                treeData:{},//类目选择
                uploadData:{},//存储图片
                editorData:''//富文本
            }
        },
        mounted() {
          this.$bus.$on("onAddEvent",flag=>{
              this.dialogAddVisible = flag
          })
        },
        methods:{
            handleClose(done) {
                this.$confirm('确认关闭？')
                    .then((_) => { // eslint-disable-line no-unused-vars
                        done();
                    })
                    .catch((_) => {}); // eslint-disable-line no-unused-vars
            },
            dialogCategoryHandle(){
                this.dialogCategoryVisible=true
            },
            dialogUploadHandle(){
                this.dialogUploadVisible=true
            },
            //读取类目数据
            getTreeData(data){
                // console.log(this.treeData.name)
                this.treeData=data
            },
            //读取图片地址
            getOnUpload(data){
                if (data.url){
                    data.url=data.url.replace("upload","http://localhost:3000")
                }
                this.uploadData=data
            },
            //接受富文本数据
            getEditor(data){
                this.editorData=data
            },
            //添加商品
            addProductHandle(){
                this.$api.insertTbItem(
                    {
                        cid:this.treeData.cid,
                        title:this.addForm.name,
                        type:this.treeData.name,
                        sellPoint: this.addForm.sellPoint,
                        price:this.addForm.price,
                        num:this.addForm.num,
                        desc:this.editorData,
                        image:this.uploadData.url
                    }
                ).then(res=>{
                    console.log(res.data);
                    if (res.data.status===200){
                        this.dialogAddVisible=false;

                    }
                }).catch(error=>{
                    console.log(error)
                })
            }
        }
    }
</script>

<style scoped>
    .location{
    float: left;
    }
    .tree{
        float: left;
        margin-left: 10px;
    }
    .upload-img{
        width: 300px;
        float: left;
        margin-left: 10px;
    }
</style>
