<template>
  <div>
    <section class="box-wrapper">
      <div class="box-header">
        <h1>気持ちを言葉に</h1>
      </div>

      <div class="box-body">
        <div class="field">
          <label for="article_body">内容</label>
          <textarea class="form-control" rows="10" v-model="body"></textarea>
        </div>
        <blockquote class="blockquote">
          <p>
            今日はなにがありましたか？<br>
            ゆっくり思い返してみましょう
          </p>
        </blockquote>
        <div class="field">
          <label for="article_emotion">気持ち</label>
          <input class="form-control" type="text" v-model="emotion">
        </div>
        <blockquote class="blockquote">
          <p>
            今日の日記が書けましたか？<br>
            気持ちを一文で表してみましょう
          </p>
        </blockquote>
        <div class="actions">
          <input type="submit" name="commit" value="投稿する" class="btn btn-primary" @click.prevent="submit">
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
      body: '',
      emotion: ''
    }
  },
  methods: {
    submit() {
      // FIXME: user_idのハードコーディング
      // FIXME: 投稿した後の挙動(成功・失敗時)
      ArticlesAPI.create({body: this.body, emotion: this.emotion, user_id: 1}).then((response) => {
        console.log(response)
      })
      .catch((error) => {
        console.error(error)
      });
    }
  }
}
</script>