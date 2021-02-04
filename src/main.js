import VueKeycloakJs from '@dsb-norge/vue-keycloak-js'
import Vue from 'vue'
import App from './App.vue'
import router from './router'

Vue.config.productionTip = false

Vue.use(VueKeycloakJs, {
  init: {
    // Use 'login-required' to always require authentication
    // If using 'login-required', there is no need for the router guards in router.js
    onLoad: 'check-sso',
    silentCheckSsoRedirectUri: window.location.origin + "/silent-check-sso.html"
  },
  config: {
    url: 'http://127.0.0.1:9902/auth',
    clientId: 'vue-client',
    realm: 'vue'
  }
})

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')

