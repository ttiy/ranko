import Vue from 'vue'
import newArticle from "@/src/containers/articles/new"

document.addEventListener('DOMContentLoaded', e => {
  new Vue({
    el: '#main-content',
    components: {newArticle},
    render(createElement) {
      return createElement("newArticle", {
        props: {}
      })
    }
  })
})
