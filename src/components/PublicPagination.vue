<template>
    <div class="pagination-contain">
        <el-pagination layout="prev, pager, next, jumper"
                       :total="total"
                       :current-page.sync="currentpage"
                       :size-change="handleSizechange"
                       @current-change="handleCurrentchange"
                       background
        >

        </el-pagination>
    </div>
</template>

<script>
    export default {
        name: "ProductPagination",
        data(){
            return{
                currentpage:1,

            }
        },
        props:{
            total:{
                type:[String,Number],
                default:0
            }
        },
        methods:{
            handleSizechange(){

            },
            handleCurrentchange(val){

                this.$bus.$emit("page",val)
            }
        }
    }
</script>

<style scoped>
    .pagination-contain{
        margin-top: 20px;
    }
</style>
