var path = require('path');
var baseDir = __dirname;

module.exports = {
    debug: true,
    devtool: 'source-map',
    entry: {
      'index': [ path.join(baseDir, 'main.js')]
    },
    output: {
      path: path.resolve(baseDir, 'build'),
      filename: '[name].js'
    },
    resolve: {
      root: baseDir 
    },
    module: {
      loaders: [
        {
          test: /\.jpg$/,
          loader: "url-loader",
           query: { mimetype: "image/jpg" }
        },
        {
          test: /\.js$/,
          include: /node_modules\/react-native/,
          loader: 'babel',
          query: {
            cacheDirectory: false,
            presets: ['es2015', 'stage-1', 'react']
          }
        },
        {
          test: /\.(js|jsx)$/,
          exclude: [
            path.resolve( baseDir, 'node_modules'),
          ],
          loader: 'babel',
          query: {
            cacheDirectory: false,
            presets: ['es2015', 'stage-1', 'react']
          }
        }
      ]
    }
  };
