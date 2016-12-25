<template lang="html">
  <div class="" id="registration">
    <h3>Register Here</h3>
    <hr>
    <div class="row" v-for="user of users">
      <h4>{{user.name}}</h4>
      <button type="button" @click="registerUser(user)">Register</button>
    </div>
  </div>
</template>

<script>
export default {
  methods:{
    registerUser(user){
      user.registered = true
    }
  },
  computed:{
    users(){
      return this.$store.state.users
    }
  }
}
</script>

<style lang="scss" scoped>
  #registration{
    width: 50%;
  }
</style>
