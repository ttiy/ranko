<template>
  <div id="app">
    <div class="container">
      <h1>Hello</h1>
      <div class="content-wrapper">
        <section class="content-header">
        </section>
        <section class="content-body">
          <div class="box-body">
            <div class="row">
              <div class="col-sm-12">
                <div v-for="a in articles" :key="a.id">
                  <div class="item shadow p-3 mb-5 bg-white rounded">
                    {{ a.body }}
                    {{ a.emotion }}
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      articles: []
    }
  },
  mounted () {
    axios
      .get('/api/v1/articles.json')
      .then(response => (this.articles = response.data))
  }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/earlyaccess/hannari.css');
#app {
  font-family: 'Hannari';
}
p {
  font-size: 2em;
  text-align: center;
}
</style>