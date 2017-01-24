[![Build Status](https://travis-ci.org/AndelaOSP/shufflebox-frontend.svg?branch=develop)](https://travis-ci.org/AndelaOSP/shufflebox-frontend)
# shufflebox-frontend

## Project Setup
* Clone the repo
```bash
$ git clone https://github.com/AndelaOSP/shufflebox-frontend
```
* Install [elm](http://elm-lang.org/) if you haven't.
```bash
$ npm i -g elm
```

* Install [elm-test](https://github.com/elm-community/elm-test)
```bash
$ npm i -g elm-test
```
* At the root of the project, install the dependencies
```bash
# npm dependencies
$ npm i
# elm dependencies
$ elm package install
```

* Start the webpack dev server.
```bash
$ npm run dev
```

* Visit `localhost:3000`. You should see the text `shufflebox`. i.e from `src/Main.elm`
