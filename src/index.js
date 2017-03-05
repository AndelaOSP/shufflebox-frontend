const Elm = require('./Main.elm');

// Require index.html so it gets copied to dist
require('./index.html');
require('./assets/styles/main.scss')

const mountNode = document.getElementById('main');

const App = Elm.Main.embed(mountNode, {
  token: getToken()
});

App.ports.setToken.subscribe(setToken);
App.ports.removeToken.subscribe(removeToken);

function getToken() {
  var token = null;
  try {
    token = window.localStorage.getItem('token');
  } catch (e) {
    // Noop
  }
  return token;
}

function setToken(token) {
  try {
    window.localStorage.setItem('token', token);
  } catch (e) {
    // Noop
  }
}


function removeToken() {
  try {
    window.localStorage.removeItem('token');
  } catch (e) {
    // Noop
  }
}
