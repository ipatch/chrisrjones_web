const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  // `mode:` is defined in the `...prod.js` and `...dev.js`
  entry: ['./src/index.js'],
  output: {
    // `path:` has to be absolute NOT relative
    // path: path.join(__dirname, '../dist'),
    path: path.resolve(__dirname, 'public'),

    filename: 'app.bundle.js',
    // possible fix for firefox
    // devtoolModuleFilenameTemplate: function(info){
    //   return "file:///"+encodeURI(info.absoluteResourcePath);
    // },
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
      // moved CSS / styling test to webpack5.dev.js
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
  ],
};

