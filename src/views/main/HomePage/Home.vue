<template>

        <div class="index-wrap">
            <div class="index-left">
                <HomeNav></HomeNav>
            </div>
            <div class="index-right">
                <HomeSwiper></HomeSwiper>
                <HomeProductList></HomeProductList>
            </div>
        </div>

</template>

<script>
    import HomeSwiper from "@/views/main/HomePage/HomeSwiper";
    import HomeNav from "@/views/main/HomePage/HomeNav";
    import HomeProductList from "@/views/main/HomePage/HomeProductList";
    export default {
        name: "HomeView",
        components:{
            HomeProductList,
        HomeNav, HomeSwiper

}
    }
</script>

<style scoped lang="less">
    .index-wrap{
        width: 1200px;
        margin: 0 auto;

    }
    .index-left{
        float: left;
        width: 300px;
        text-align: left;
    }
    .index-right{
        float: left;
        width: 900px;
    }
</style>

