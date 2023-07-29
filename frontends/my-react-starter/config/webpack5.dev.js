const common = require('./webpack5.common.js');
const { mergeWithCustomize, customizeArray } = require('webpack-merge');

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
    ],
  },
  plugins: [
    // should not be required for webpack5
    // new webpack.HotModuleReplacementPlugin({}),
  ],
  devServer: {
    // contentBase: './dist',
    hot: true,
    // port: 0
    // open: true 
  }
});
