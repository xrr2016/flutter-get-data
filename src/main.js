import Vue from 'vue'
import VueRouter from 'vue-router'
import App from './App.vue'
// import router from './router'

Vue.use(VueRouter)

new Vue({
  App,
  render:h => h(App)
}).$mount('#app')
