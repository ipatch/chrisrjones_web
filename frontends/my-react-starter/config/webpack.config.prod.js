/* eslint-disable no-unused-vars */

// NOTE: setting up `webpack-bundle-analyzer`
const { BundleAnalyzerPlugin } = require('webpack-bundle-analyzer');

const productionConfig = {
  mode: 'production',
  plugins: [
    new BundleAnalyzerPlugin({
      analyzerMode: 'static',
      openAnalyzer: false,
      reportFilename: 'bundle_sizes.html',
    }),
  ],
  externals: {
    react: 'React',
    'react-dom': 'ReactDOM',
  },
};
