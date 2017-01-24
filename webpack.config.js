const path = require("path");
const webpack = require('webpack');

const config = {
  entry: {
    app: [
      './src/index.js'
    ]
  },

  output: {
    path: path.resolve(__dirname + '/dist'),
    filename: '[name].js',
    publicPath: '/'
  },

  module: {
    loaders: [
      {
        test: /\.(css|scss)$/,
        loader : 'style!css'
      },
      {
        test:    /\.html$/,
        exclude: /node_modules/,
        loader:  'file?name=[name].[ext]',
      },
      {
        test:    /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader: 'elm-hot!elm-webpack',
      },
      {
        test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: 'url?limit=10000&mimetype=application/font-woff',
      },
      {
        test: /\.(ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: 'file',
      },
    ],

    noParse: /\.elm$/,
  },

  devServer: {
    stats: {
      colors: true,
      chunks: false
    }
  }
};

if (process.env.NODE_ENV !== 'production') {
  config.entry.app = [
    'webpack-dev-server/client?http://localhost:3000',
    ...config.entry.app
  ];
} else {
  config.plugins = [
    new webpack.optimize.DedupePlugin(),
    new webpack.optimize.UglifyJsPlugin({
      compress: {
        screw_ie8: true,
        warnings: false
      },
      mangle: {
        screw_ie8: true
      },
      output: {
        comments: false,
        screw_ie8: true
      }
    }),
    new webpack.DefinePlugin({
      'process.env': { NODE_ENV: JSON.stringify('production') }
    })
  ];
}

module.exports = config;
