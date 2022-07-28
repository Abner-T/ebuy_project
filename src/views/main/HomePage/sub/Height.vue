<template>
    <div class="open">
        <div class="sales-board">
            <div class="sales-board-intro">
                <h2>勇攀高峰</h2>
                <p>我们都拥有促使自己攀登的人类核心驱动力。在一些人身上，这个驱动力只是藏得比较深，
                    需要更努力去挖掘才行，但是必须挖掘出来。每个扎营者心中都有一个攀登者。身为领导者，
                    你可以引导他们提高逆商，从而让他们能够释放内心的那种卓越不凡。你也可以提供一种高逆商的企业文化，
                    这种文化将让他们个体和集体的攀登保持一致，而且会助力攀登
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
            <h2>产品说明</h2>
            <p>网站访问统计分析报告的基础数据源于网站流量统计信息， 不过价值远高于原始数据资料</p>
            <h3>用户行为指标</h3>
            <ul>
                <li>访问次数是指访客完整打开网站页面进行访问的次数，访问次数是网站访问速度的衡量标准</li>
                <li>平均访问时长是用户访问网站的平均停留时间，平均访问时长=总访问时长/访问次数。如果用户不喜欢网站的内容，可能稍微看一眼就关闭网页，平均访问时长就很短。</li>
                <li>通过各个页面浏览数的比例分析重要信息是否被用户关注， 通过对各个栏目页面浏览数量比例分析可以看出用户对哪些信息比较关注， 也可以获得访问网站首页的用户比例</li>
                <li>创建页面指标分析仪表盘</li>
            </ul>
            <h3>用户浏览网站的方式</h3>
            <ul>
                <li>用户上网设备类型</li>
                <li>用户浏览器名称和版本</li>
                <li>用户所使用的操作系统名称和版本</li>
                <li>用户所在地理区域分布状况</li>
                <li>访问者电脑分辨率和显示模式</li>
            </ul>
        </div>
    </div>
</template>

<script>
    import CounterView from "@/components/HomePage/Counter";
    import TypesView from "@/components/HomePage/Types";
    import TimerView from "@/components/HomePage/Timer";
    export default {
        name: "HeightView",
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
