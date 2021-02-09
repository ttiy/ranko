<template>
  <div id="app">
    <table>
      <tbody>
        <div class="container">
          <div class="row">
            <div class="col-sm-12">
              <tr>
                <th>ID</th>
                <th>name</th>
                <th>birth</th>
              </tr>
              <tr v-for="a in articles" :key="a.id">
                <td>{{ a.id }}</td>
                <td>{{ a.body }}</td>
                <td>{{ a.emotion }}</td>
              </tr>
            </div>
          </div>
        </div>
      </tbody>
    </table>
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
p {
  font-size: 2em;
  text-align: center;
}
</style>