<template>
  <div class="content-wrapper">
    <section class="content-header">
    </section>
    <section class="content-body">
      <div class="box-body">
        <div class="row">
          <div class="col-sm-12">
            <div v-for="(article, i) in articles" :key="article.id">
              <div class="item shadow p-3 mb-5 bg-white rounded">
                <p>{{ article.body }}</p>
                <p>{{ article.emotion }}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
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
