<template>
  <div id="app">
      <app-registration @userRegistered="userRegistered"
      :users="unregisteredUsers"></app-registration>

      <app-registrations @userRegistered="userRegistered" :registrations="registrations"></app-registrations>
  </div>
</template>

<script>
import Registration from './components/Registration.vue'
import Registrations from './components/Registrations.vue'
export default {
  data () {
    return {
      registrations:[],
      users:[
        {id:1,name:'Max',registered:false},
        {id:2,name:'Anna',registered:false},
        {id:3,name:'Kevin',registered:false},
        {id:4,name:'Sven',registered:false}
      ]
    }
  },
  computed:{
    unregisteredUsers(){
      return this.users.filter(user => {
         return !registered
      })
    }
  },
  components:{
    'app-registration' : Registration,
    'app-registrations' : Registrations,
  }
}
</script>

<style scoped>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

h1, h2 {
  font-weight: normal;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}
</style>
