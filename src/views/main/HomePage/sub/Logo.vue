<template>
    <div class="open">
        <div class="sales-board">
            <div class="sales-board-intro">
                <h2>品牌营销策略</h2>
                <p>品牌营销策略简言之就是以品牌输出为核心的营销策略，包括品牌精神理念的规划、品牌视觉形象体系的规划、品牌空间形象体系的规划、品牌服务理念和行动纲领的规划、品牌传播策略与品牌通路策略的规划、公关及事件营销策略的规划等。
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
            <h2>品牌的本质</h2>
            <p>品牌并非实体，本质是消费者的普遍认知。</p>
            <h3>品牌的价值</h3>
            <ul>
                <li>品牌的价值，就是通过影响消费者的认知，进而影响消费者的选择。</li>
                <li>首先，品牌能够带来「情绪价值」，让顾客满足。</li>
                <li>其次，品牌能够带来「交易价值」，让销量提升。</li>
                <li>此外，品牌能够带来「商业价值」，让公司值钱。</li>
            </ul>
            <h3>如何提升品牌价值？</h3>
            <ul>
                <li>（1）独特销售主张理论：你必须给消费者一个选择你的理由</li>
                <li>（2）品牌形象理论：消费者买的不仅是产品功能，还有品牌形象</li>
                <li>（3）品牌定位理论：让品牌代表品类，实现消费者心理区隔</li>
                <li>（4）品牌管理理论：做品牌做营销不可不知的4P理论和4C理论</li>
                <li>（5）整合营销传播：团结所有可以团结的力量，一起为营销服务</li>
            </ul>
        </div>
    </div>
</template>

<script>
    import CounterView from "@/components/HomePage/Counter";
    import TypesView from "@/components/HomePage/Types";
    import TimerView from "@/components/HomePage/Timer";
    export default {
        name: "LogoView",
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
