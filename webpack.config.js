const path = require("path");
const webpack = require('webpack');
const HTMLWebpackPlugin = require('html-webpack-plugin');
const CompressionPlugin = require("compression-webpack-plugin");
const SWPrecacheWebpackPlugin = require('sw-precache-webpack-plugin');




//enviroment variable
const DEVELOPMENT = process.env.NODE_ENV === 'development';
const PRODUCTION = process.env.NODE_ENV === 'production';
const TEST = process.env.NODE_ENV === 'test'

const entry = PRODUCTION
      ?     {
              app:
              [
                '/index.js'
              ],
              vendor:
              [
                'bulma',
              ]
            }
      :
              [
                './index.js'
              ];

const plugins = PRODUCTION
      ?     [
        new webpack.optimize.CommonsChunkPlugin({name:'vendor', filename:'vendor.[hash:12].min.js'}),
        new webpack.optimize.UglifyJsPlugin({
          compress: {
            warnings: false,
            screw_ie8: true,
            dead_code: true,
            unused: true
          }
        }),
        new HTMLWebpackPlugin({
          template:'index-template.html'
        }),
        new CompressionPlugin({
          asset: "[path].gz[query]",
          algorithm: "gzip",
          test: /\.js$|\.css$|\.html$/,
          threshold: 10240,
          minRatio: 0.8
        }),
        new SWPrecacheWebpackPlugin(
          {
            cacheId: 'hapihour',
            filename: 'hapi-sw.js',
            forceDelete: true,
            minify: true,
            skipWaiting: true,
            verbose: true
          }
        )
      ]
    : [
        new webpack.NamedModulesPlugin()
      ];

//define plugins for both envs
plugins.push(
  new webpack.DefinePlugin({
    'process.env': { NODE_ENV: JSON.stringify('production') }
  })
);

const config = {
  context: __dirname + '/src',
  entry: entry,
  output: {
    path: PRODUCTION ?  '/' : '/',
    filename: PRODUCTION ? '[name].[hash:12].min.js' : '[name].js',
    publicPath: __dirname + 'dist'
  },

  module: {
    rules: [
      {
        test: /\.scss$/,
        use : ['style-loader', 'css-loader', 'sass-loader', 'postcss-loader']
      },
      {
        test:    /\.html$/,
        use: [{
          loader: 'file-loader?name=[name].[ext]'
        }],
        exclude: /node_modules/
      },
      {
        test:    /\.elm$/,
        use: ['elm-hot-loader', 'elm-webpack-loader'],
        exclude: [/elm-stuff/, /node_modules/]
      },
      {
        test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        use: [{
          loader: 'url?limit=10000&mimetype=application/font-woff'
        }]
      },
      {
        test: /\.(ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        use: [{
          loader: 'file-loader'
        }]
      },
    ],

    noParse: /\.elm$/,
  },
  plugins:plugins,
  devServer: {
    contentBase: './dist',
   inline: true,
   hot: true
 },
 devtool: 'source-map'
}



module.exports = config;
