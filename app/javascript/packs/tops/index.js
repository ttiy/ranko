import Vue from 'vue'
import index from "@/src/containers/tops/index"

document.addEventListener('DOMContentLoaded', e => {
  new Vue({
    el: '#main-content',
    components: {index},
    render(createElement) {
      return createElement("index", {
        props: {}
      })
    }
  })
})
