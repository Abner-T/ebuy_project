<template>
    <div class="swiper-size">
        <swiper :options="swiperOption">
            <swiper-slide v-for="(slide,index) in bannerImg" :key="index">
                <img :src="slide" class="swiperimg">
            </swiper-slide>
            <div class="swiper-pagination" slot="pagination"></div>
            <div class="swiper-button-prev" slot="button-prev"></div>
            <div class="swiper-button-next" slot="button-next"></div>
        </swiper>

    </div>
</template>

<script>
    export default {
        name: "HomeSwiper",
        data() {
            return {
                swiperOption: {
                    pagination: {
                        el: '.swiper-pagination',
                    },
                    autoplay:true,
                    navigation:{
                        nextEl:'.swiper-button-next',
                        prevEl:'.swiper-button-prev',
                    },
                    loop:true
                },
                    bannerImg: [
                        require("../../../assets/images/1.jpeg"),
                        require("../../../assets/images/2.jpg"),
                        require("../../../assets/images/3.jpg"),
                        require("../../../assets/images/4.jpg")
                    ]
                }
            }
        }

</script>

<style scoped>
.swiperimg{
    width: 100%;
    height: 350px;
}
    .swiper-size{
        margin-top: 15px;
    }
</style>
