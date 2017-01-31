const Elm = require('./Main.elm');

// Require index.html so it gets copied to dist
require('./index.html');
require('./assets/styles/main.scss')

const mountNode = document.getElementById('main');

const app = Elm.Main.embed(mountNode);
