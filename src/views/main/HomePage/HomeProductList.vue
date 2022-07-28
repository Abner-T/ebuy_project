<template>
    <div class="index-board-list">
        <div class="index-board-item"
             v-for="(item,index) in buyData"
             :key="index"
             :class="['index-board-'+item.url,{'line-last':index%2 !== 0}]">
            <div class="index-board-item-inner">
                <h2>{{item.title}}</h2>
                <p>{{item.desc}}</p>
                <div class="index-board-button">
                    <router-link :to='"/details/"+item.url' class="button">立刻了解</router-link>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "HomeProductList",
        data(){
            return{
                buyData:[
                    {
                        title:'开发产品',
                        desc:'开发产品描述',
                        url:'openproduct'
                    },
                    {
                        title: '品牌营销',
                        desc: '品牌营销帮助你的产品更好地找到定位',
                        url: 'logo'
                    },
                    {
                        title: '使命必达',
                        desc: '使命必达快速迭代永远保持最快的速度',
                        url: 'golife'
                    },
                    {
                        title: '勇攀高峰',
                        desc: '帮你勇闯高峰，到达事业巅峰',
                        url: 'height'
                    }
                ]
            }
        }
    }
</script>

<style scoped>
    .index-board-list{
        overflow: hidden;
        margin-top: 15px;

    }
    .index-board-item{
        float: left;
        width: 400px;
        background: #ffffff;
        box-shadow: 0 0 1px #dddddd;
        padding: 20px;
        margin-right: 20px;
        margin-bottom: 15px;
    }
    .index-board-item-inner{
        min-height: 125px;
        padding-left: 120px ;
    }
    .index-board-openproduct .index-board-item-inner{
        background: url(../../../assets/minlogos/可乐.png) no-repeat;
        background-size: 100px 100px;
    }
    .index-board-logo .index-board-item-inner{
        background: url(../../../assets/minlogos/珍珠奶茶.png) no-repeat;
        background-size: 100px 100px;
    }
    .index-board-golife .index-board-item-inner{
        background: url(../../../assets/minlogos/薯条.png) no-repeat;
        background-size: 100px 100px;
    }
    .index-board-height .index-board-item-inner{
        background: url(../../../assets/minlogos/雪糕.png) no-repeat;
        background-size: 100px 100px;
    }
    .index-board-item h2{
        font-size: 18px;
        font-weight: bold;
        color: #000000;
        margin-bottom: 15px;
    }
    .line-last{
        margin-right: 0;
    }
    .index-board-button{
        margin-top: 20px;
    }
    .lastest-news{
        min-height: 350px;
    }
    .button{
        background: #4fc08d;
        color: #ffffff;
        display: inline-block;
        padding: 10px 20px;
        cursor: pointer;
    }
    .index-board-item h2{
        font-size: 18px;
        font-weight: bold;
        color: #000000;
        margin-bottom: 15px;
    }
</style>
