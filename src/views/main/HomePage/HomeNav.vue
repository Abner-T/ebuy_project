<template>

            <div class="index-left-block">
                <h2>全部产品</h2>
                <div v-for="(product,index) in productList " :key="index">
                    <h3>{{product.title}}</h3>
                    <ul>
                        <li v-for="(item,index) in product.list" :key="index">
                            <a :href="item.url">{{item.name}}</a>
                            <span class="hot-tag" v-if="item.hot">Hot</span>
                        </li>
                    </ul>
                </div>
            </div>

</template>

<script>
    export default {
        name: "HomeNav",
        data(){
            return{
                productList:[
                    {
                        title:"手机应用类",
                        list:[
                            {
                                id:1,
                                name:'pp助手',
                                url:'https://www.25pp.com/',
                                hot:false
                            },
                            {
                                id:2,
                                name:'豌豆荚',
                                url:'https://www.wandoujia.com/',
                                hot:false
                            },
                            {
                                id:3,
                                name:'TapTap',
                                url:'https://www.taptap.com/',
                                hot:true
                            }
                        ]
                    },
                    {
                        title:"PC产品类",
                        list:[
                            {
                                id:1,
                                name:'WebStorm',
                                url:'https://www.jetbrains.com/webstorm/',
                                hot:false
                            },
                            {
                                id:2,
                                name:'steam',
                                url:'https://store.steampowered.com/about',
                                hot:true
                            },
                            {
                                id:3,
                                name:'postman',
                                url:'https://www.postman.com/',
                                hot:false
                            }
                        ]
                    },
                    {
                        title:"手机应用类2",
                        list:[
                            {
                                id:1,
                                name:'pp助手',
                                url:'https://www.25pp.com/',
                                hot:false
                            },
                            {
                                id:2,
                                name:'豌豆荚',
                                url:'https://www.wandoujia.com/',
                                hot:false
                            },
                            {
                                id:3,
                                name:'TapTap',
                                url:'https://www.taptap.com/',
                                hot:true
                            }
                        ]
                    }
                ]
            }
        }
    }
</script>

<style scoped lang="less">


    .index-left-block{
        margin: 15px;
        background: #ffffff;
        box-shadow:0 0 1px #dddddd;
    }
    .index-left-block .hr{
        margin-bottom: 20px;
        height: 1px;
        width: 100%;
        background: #dddddd;
    }
    .index-left-block h2{
        padding: 10px 15px;
        color: #ffff;
        background: #4fc08d;
        margin-bottom: 20px;
    }
    .index-left-block h3{
        padding: 0 15px 5px 15px;
        font-weight: bold;
        color: #222;
    }
    .index-left-block ul{
        padding: 10px 10px;
    }
    .index-left-block li{
        padding: 5px;

    }

    .hot-tag{
        background: red;
        color: #ffffff;
    }


</style>
