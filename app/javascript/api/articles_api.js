import API from "./api"

export default {
  index() {
    return API.get('articles')
  },
  create(params) {
    return API.post('articles', params)
  }
}
