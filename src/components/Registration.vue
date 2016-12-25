<template lang="html">
  <div class="" id="registration">
    <h3>Register Here</h3>
    <hr>
    <div class="row" v-for="user of users">
      <h4>user.name</h4>
      <button type="button" @click="registerUser(user)">Register</button>
    </div>
  </div>
</template>

<script>
export default {
  props:['users'],
  methods:{
    registerUser(user){
      this.$emit('userRegistered',user)
      user.registered = true
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
