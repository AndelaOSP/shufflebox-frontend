const Elm = require('./Main.elm');

// Require index.html so it gets copied to dist
require('./index.html');

const mountNode = document.getElementById('main');

const app = Elm.Main.embed(mountNode);