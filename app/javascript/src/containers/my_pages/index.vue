<template>
  <div class="content-wrapper">
    <div v-if='articles.length'>
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
                  <div class="actions">
                    <a class="btn btn-light btn-sm" @click="destroyArticles(article.id)">削除</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
    <div v-else>
      投稿してみよう！
    </div>
    <transition name="fade">
    　<div class="message" v-if="message">
        <p class="alert alert-success">{{ message }}</p>
      </div>
    </transition>
  </div>
</template>

<script>
import MyPagesAPI from "@/api/my_pages_api"

export default {
  components: { },
  props: {
  },
  data() {
    return {
      articles: [],
      message: null
    }
  },
  mounted() {
    this.fetchArticles()
  },
  methods: {
    fetchArticles() {
      MyPagesAPI.index().then((response) => {
        this.articles = response
      })
      .catch((error) => {
        console.error(error)
      })
    },
    destroyArticles(id) {
      MyPagesAPI.destroy(id).then((response) => {
        MyPagesAPI.index().then((response) => {
          this.articles = response
        })
        .catch((error) => {
          console.error(error)
        })
        this.message = '削除されました。'
        setTimeout(() => {this.message = false;}, 3000);
      })
      .catch((error) => {
        console.log(error)
      })
    },
  }
}
</script>
