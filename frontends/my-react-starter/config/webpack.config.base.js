/* eslint-disable no-unused-vars, indent */

const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');
// const WebappWebpackPlugin = require('webapp-webpack-plugin');
const ExtractCssChunks = require('extract-css-chunks-webpack-plugin');

module.exports = {
    // `mode:` is defined in the `...prod.js` and `...dev.js`
    entry: ['./src/index.js'],
    output: {
      // `path:` has to be absolute NOT relative
      path: path.join(__dirname, '../dist'),
      filename: 'app.bundle.js',
    },
    module: {
      rules: [
        {
          test: /\.(js|jsx)$/,
          exclude: /node_modules/,
          use: [
            'babel-loader'
          ],
        },
        {
          test: /\.css$/,
          use: [ExtractCssChunks.loader, 'css-loader'],
        },
        {
          test: /\.(jpe?g|gif|png|svg|bmp)$/,
          use: [
            {
              loader: 'file-loader',
              options: {
                name: 'images/[name].[ext]',
              },
            },
          ],
        },
      ],
    },
    plugins: [
      new HtmlWebpackPlugin({
        // html-webpack-plugin can be used to minify an HTML document, see cra-exp for more details
        template: './src/index.html',
      }),
      // new WebappWebpackPlugin({
      //   logo: './src/images/logo.svg',
      //   cache: true,
      //   prefix: 'assets/',
      //   inject: true,
      //   favicons: {
      //     appName: 'react-starter',
      //     appDescription: null,
      //     developerName: '@ipatch',
      //     developerURL: null,
      //     icons: {
      //       coast: false,
      //       yandex: false,
      //     },
      //   },
      // }),
      new ExtractCssChunks({
        // options similar to the same options in webpackOptions.output
        // both options are optional
        filename: '[name].css',
        chunkFilename: '[id].css',
        hot: true,
        orderWarning: true,
        reloadAll: true,
        cssModules: true,
      }),
    ],
};

