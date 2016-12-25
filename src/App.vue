<template>
  <div id="app">
      <app-registration></app-registration>
      <app-registrations @userRegistered="userUnRegistered(user)"></app-registrations>
  </div>
</template>

<script>
import Registration from './components/Registration.vue'
import Registrations from './components/Registrations.vue'
export default {
  data () {
    return {
    }
  },
  computed:{
    unRegisteredUsers(){
      return this.users.filter(user => {
         return !registered
      })
    }
  },
  components:{
    'app-registration' : Registration,
    'app-registrations' : Registrations
  },
  methods:{
    userRegistered(user){
      const date  = new Date
      this.registrations.push({
        id:user.id,
        name:user.name,
        date:`${date}.getMonth() + 1` + '/' + `${date.getDate()}`
      })
    },
    userUnRegistered(registration){
      const user  = this.users.find(user=>{
        return user.id = registration.id
      })
      user.registered = false
      this.registrations.splice(this.registrations.indexOf(registration),1)
    }
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
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
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
