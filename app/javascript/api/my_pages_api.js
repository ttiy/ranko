import API from "./api"

export default {
  index() {
    return API.get('my_pages')
  },
  destroy(id) {
    return API.delete(`my_pages/${id}`)
  }
}