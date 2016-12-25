import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const state = {
  registrations:[],
  users:[
    {id:1, name:'Max', registered:false},
    {id:2, name:'Anna', registered:false},
    {id:3, name:'Kevin', registered:false},
    {id:4, name:'Sven', registered:false}
  ]
}

export const store = new Vuex.Store({
  state : state
})
