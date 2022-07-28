import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeName from "@/views/main/HomePage/Home";
import LayoutView from "@/views/Layout";


Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Layout',
    component:LayoutView,
    children:[
        {
      path: '',
      name: 'Home',
      component: HomeName,
          meta:{
            isLogin:true
          },
    },
      {
        path: 'product',
        name: 'Product',
        component: ()=>import("../views/main/Product"),
        meta:{
          isLogin:true
        }
      },
      {
        path: 'params',
        name: 'Params',
        component: ()=>import("../views/main/Params"),
        meta:{
          isLogin:true
        }
      },
      {
        path: 'ad',
        name: 'ADCategory',
        component: ()=>import("../views/main/ADCategory.vue"),
        meta:{
          isLogin:true
        }
      },
      {
        path:"details",
        name:'Details',
        component:()=>import("../views/main/HomePage/sub/Details"),
        children:[
          {
            path:"openproduct",
            name:"OpenProduct",
            component:()=>import("../views/main/HomePage/sub/OpenProduct")
          },
          {
            path:"golife",
            name:"GoLife",
            component:()=>import("../views/main/HomePage/sub/GoLife")
          },
          {
            path:"height",
            name:"Height",
            component:()=>import("../views/main/HomePage/sub/Height")
          },
          {
            path:"logo",
            name:"Logo",
            component:()=>import("../views/main/HomePage/sub/Logo")
          }
        ]
      }

    ]
  },
  {
    path: '/login',
    name:'Login',
    component:()=> import("../views/Login.vue")
  }


]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
