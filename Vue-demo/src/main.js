// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
// import VueRouter from 'vue-router'
// import test from './components/test'
// const routes = [
//
//     { path: '/test', component: test }
//
// ]
// const router = new VueRouter ({
//   routes
// })
//
// const app = new Vue({
//     router,
//     render: h => h(App)
// }).$mount('#app')
// Vue.use(VueRouter)
// import Router from "vue-router"
Vue.config.productionTip = false
/* eslint-disable no-new */
new Vue({
  el: '#app',
  template: '<App/>',
  components: { App }
})
