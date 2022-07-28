<template>
    <div class="open">
        <div class="sales-board">
            <div class="sales-board-intro">
                <h2>流量分析</h2>
                <p>网站流量分析，是指在获得网站访问量基本数据的情况下对有关数据进行统计、
                    分析，从中发现用户访问网站的规律，并将这些规律与网络营销策略等相结合，
                    从而发现网络营销活动中可能存在的问题，并为进一步修正或重新制定网络营销策略提供依据。
                    当然这样的定义是站在网络营销管理的角度来考虑的
                </p>
            </div>
            <div class="sales-board-form">
                <div class="sales-board-line-left">购买数量:</div>
                <div class="sales-board-line-right">
                    <CounterView :counterObj="counterObj"></CounterView>
                </div>
            </div>
            <div class="sales-board-form">
                <div class="sales-board-line-left">产品类型</div>
                <div class="sales-board-line-right"><TypesView :selecterData="selecterData"/></div>
            </div>
            <div class="sales-board-form">
                <div class="sales-board-line-left">有效时间:</div>
                <div class="sales-board-line-right"><TimerView :timerData="timerData"></TimerView></div>
            </div>
        </div>

        <div class="sales-board-des">
            <h3>如何做到“使命必达”</h3>
            <ul>
                <li>一、明确的目标</li>
                <li>二、正确的方法论</li>
                <li>三、强大的执行力,好的战略加上差的执行，几乎没有胜算；差的战略加上好的执行，或许可能成功。</li>

            </ul>

        </div>
    </div>
</template>

<script>
    import CounterView from "@/components/HomePage/Counter";
    import TypesView from "@/components/HomePage/Types";
    import TimerView from "@/components/HomePage/Timer";
    export default {
        name: "GoLife",
        components: {TimerView, TypesView, CounterView},
        data(){
            return{
                counterObj:{
                    min:1,
                    max:20
                },
                selecterData: [
                    {
                        value:'经典型',
                        id:1
                    },
                    {
                        value:'豪华型',
                        id:2
                    },
                    {
                        value:'至尊豪华型',
                        id:3
                    }
                ],
                timerData:[
                    {
                        value:'一个月',
                        id:1
                    },
                    {
                        value:'三个月',
                        id:3
                    },
                    {
                        value:'六个月',
                        id:6
                    },
                    {
                        value:'一年',
                        id:12
                    },
                ]
            }
        }
    }
</script>

<style scoped>
    .open{
        text-align: left;
    }
    .buy-dialog-title{
        font-weight: bold;
        font-size: 16px;
    }
    .buy-dialog-btn{
        margin-top: 20px;
    }
    .buy-dialog-table{
        width: 100%;
        margin-bottom: 20px;
    }
    .buy-dialog-table td,
    .buy-dialog-table th{
        border: 1px solid #e3e3e3;
        text-align: center;
        padding: 5px 0;
    }
    .buy-dialog-table th{
        background: #4fc08d;
        color: #ffffff;
        border: 1px solid #4fc08d;
    }
    .button{
        background: #4fc08d;
        color: #ffffff;
        display: inline-block;
        padding: 10px 20px;
        cursor: pointer;
    }
</style>
