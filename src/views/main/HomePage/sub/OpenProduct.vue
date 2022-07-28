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
        name: "OpenProduct",
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
