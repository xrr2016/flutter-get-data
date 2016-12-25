import VueRouter from 'vue-router'
import Home from './components/Home.vue'
import User from './components/User.vue'

const routes = [
  {
    path:'/',
    component:Home
  },
  {
    path:'/user/:userId',
    component:User
  }
]

const router = new VueRouter({
  routes,
  mode:'history'
})

export default router
