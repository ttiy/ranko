import axios from 'axios'
import Qs from 'qs'

 const API_BASE_PATH = '/api/v1'

 const apiSuccess = response => {
  if (response.status.toString().match(/20\d$/)) {
    return Promise.resolve(response.data)
  } else {
    return Promise.reject(response.data.message)
  }
}

const apiError = error => {
  if ([401, 422].includes(error.response.status)) {
    return Promise.reject(error.response.data)
  }
}

const setToken = (params) => {
  const tags = document.getElementsByTagName('meta');
  for (let i = 0; i < tags.length; i++) {
    if (tags[i].name === 'csrf-token') {
      params.authenticity_token = tags[i].content;
      break;
    }
  }
  return params;
}

const paramsSerializer = (params) => {
  return Qs.stringify(params, { arrayFormat: 'brackets' })
}

export default {
  get: (path, params = {}) => {
    return axios.get(`${API_BASE_PATH}/${path}`, { params, paramsSerializer }).then(apiSuccess).catch(apiError)
  },
  post: (path, params = {}) => {
    return axios.post(`${API_BASE_PATH}/${path}`, setToken(params)).then(apiSuccess).catch(apiError)
  },
  put: (path, params = {}) => {
    return axios.put(`${API_BASE_PATH}/${path}`, setToken(params)).then(apiSuccess).catch(apiError)
  },
  delete: (path, params = {}) => {
    return axios.delete(`${API_BASE_PATH}/${path}`, { params: setToken(params) }).then(apiSuccess).catch(apiError);
  }
}
