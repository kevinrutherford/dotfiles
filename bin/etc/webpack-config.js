var path = require('path')
var WebpackNotifierPlugin = require('webpack-notifier')

module.exports = {

  context: path.resolve(__dirname, './src'),

  entry: {
    app: [ "babel-polyfill", "./index.js" ]
  },

  output: {
    path: path.resolve(__dirname, "./dist"),
    filename: "bundle.js",
    publicPath: "/"
  },

  resolve: {
    extensions: [".js", ".jsx"]
  },

  module: {

    rules: [
      {
        test: /\.js$/,
        loader: "eslint-loader",
        enforce: "pre",
        exclude: /node_modules/,
        options: { }
      }, {
        test: /\.js$/,
        loader: "babel-loader",
        exclude: /node_modules/,
        options: { presets: ["es2015", "stage-0", "react"] }
      }, {
        test: /\.less$/,
        use: ["style-loader", "css-loader", "less-loader"]
      }, {
        test: /\.(ttf|eot|svg|woff(2)?)(\?[a-z0-9]+)?$/,
        loader: "file-loader"
      }, {
        test: /\.(jpe?g|gif|png)$/,
        loader: "file-loader?name=[path][name].[ext]"
      }
    ]
  },

  plugins: [
    new WebpackNotifierPlugin({
      excludeWarnings: false,
      alwaysNotify: true
    })
  ]

}

