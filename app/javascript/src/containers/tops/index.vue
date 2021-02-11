<template>
  <div>
    <div v-for="(article, i) in articles" :key="article.id">
      <p>{{ article.body }}</p>
    </div>
  </div>
</template>

<script>
import ArticlesAPI from "@/api/articles_api"

export default {
  components: { },
  props: {
  },
  data() {
    return {
      articles: []
    }
  },
  mounted() {
    this.fetchArticles()
  },
  methods: {
    fetchArticles() {
      ArticlesAPI.index().then((response) => {
        this.articles = response
      })
      .catch((error) => {
        console.error(error)
      })
    }
  }
}
</script>
