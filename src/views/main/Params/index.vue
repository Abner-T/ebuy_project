<template>
    <div class="params">
        <PubHeader :searchHandle="$api.paramsSearch"></PubHeader>
        <ParamsList/>
        <PublicPagination :total="total"/>
    </div>
</template>

<script>
    import ParamsList from "@/views/main/Params/ParamsList";
    import PublicPagination from "@/components/PublicPagination";
    import PubHeader from "@/components/PubHeader";
    export default {
        name: "indexView",
        components: {PubHeader, PublicPagination, ParamsList},
        mounted() {
            this.$api.paramsTotal().then((res)=>{
                if (res.data.status===200){
                    this.total=res.data.result[0]["count(*)"]
                }
            })
        },
    }
</script>

<style scoped>
    .params{
        width: 1300px;
        margin: 0 auto;
    }
</style>
