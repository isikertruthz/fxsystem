<template>
  <div id="app">
    <fx-index/>
  </div>
</template>

<script>
import FxIndex from '@/views/fx_index.vue'
export default {
  components:{FxIndex},
  name: 'App'
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
