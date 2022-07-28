<template>
    <div>
        <HeaderNav></HeaderNav>
        <router-view></router-view>
    </div>
</template>

<script>
    import HeaderNav from "@/components/HeaderNav";
    export default {
        name: "LayoutView",
        components:{
            HeaderNav
        }
    }
</script>

<style scoped>

</style>
