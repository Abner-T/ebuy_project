import Vue from 'vue'
import App from './App.vue'
import router from "@/router"
import './plugins/element.js'
import store from './store'
import "./assets/css/common.css"
import "./router/permission"
import "./utils/init"
import VueAwesomeSwiper from 'vue-awesome-swiper'
import 'swiper/css/swiper.css'
import api from "@/api"
import "./utils/eventbus"
import * as echarts from 'echarts'
Vue.prototype.$echarts = echarts;

Vue.prototype.$api=api;
Vue.use(VueAwesomeSwiper)
Vue.config.productionTip = false

new Vue({
  render: h => h(App),
  router,
  store
}).$mount('#app')
