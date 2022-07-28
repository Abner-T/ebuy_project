<template>
    <div class="product">
        <ProductHeader></ProductHeader>
        <ProductList></ProductList>
        <ProductPagination></ProductPagination>
        <productAdd></productAdd>
        <ProductEditor></ProductEditor>
    </div>
</template>

<script>
    import ProductList from "@/views/main/Product/ProductList";
    import ProductPagination from "@/views/main/Product/ProductPagination";
    import ProductHeader from "@/views/main/Product/ProductHeader";
    import ProductAdd from "@/views/main/Product/ProductAdd";
    import ProductEditor from "@/views/main/Product/ProductEditor";
    export default {
        name: "IndexView",
        components: {ProductEditor, ProductAdd, ProductHeader, ProductPagination, ProductList}
    }
</script>

<style scoped>
.product{
    width: 1300px;
    margin: 0 auto;
}
</style>
