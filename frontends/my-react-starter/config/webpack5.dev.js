const common = require('./webpack5.common.js');
const ReactRefreshWebpackPlugin = require('@pmmmwh/react-refresh-webpack-plugin');
const { mergeWithCustomize, customizeArray } = require('webpack-merge');

const isDevelopment = process.env.NODE_ENV !== 'production';

module.exports = mergeWithCustomize({
  customizeArray: customizeArray({
    'module.rules': 'prepend'
  })
})(common, {
  mode: 'development',
  // devtool: 'inline-source-map',
  module: {
    rules: [
      {
        test: /\.css$/,
        use: [
          'style-loader',
          'css-loader',
        ],
      },
      {
        test: /\.[jt]sx?$/,
        exclude: /node_modules/,
        use: [
          {
            loader: require.resolve('babel-loader'),
            options: {
              plugins: [ isDevelopment && require.resolve('react-refresh/babel')].filter(Boolean),
            },
          },
        ],
      },
    ],
  },
  plugins: [isDevelopment && new ReactRefreshWebpackPlugin()].filter(Boolean),
  devServer: {
    // contentBase: './dist',
    hot: true,
    // port: 0
    // open: true 
    historyApiFallback: true,
  }
});
