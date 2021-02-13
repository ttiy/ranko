import Vue from 'vue'
import newArticle from "@/src/containers/articles/new"

document.addEventListener('DOMContentLoaded', e => {
  const userId = document.querySelector('.user-id').getAttribute('user-id')
  new Vue({
    el: '#main-content',
    components: {newArticle},
    render(createElement) {
      return createElement("newArticle", {
        props: {userId}
      })
    }
  })
})
