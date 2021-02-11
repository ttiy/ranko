var path = require('path')

function resolve (dir) {
  return path.join(__dirname, '..', '..', dir)
}

module.exports = {
  resolve: {
    alias: {
      vue: 'vue/dist/vue.js',
      '@': resolve('app/javascript')
    }
  }
}
