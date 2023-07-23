/* eslint-disable quotes, no-unused-vars */

const { merge } = require('webpack-merge'); // `npm i --save-dev webpack-merge`

const baseConfig = require('./webpack.config.base.js');

const developmentConfig = require('./webpack.config.dev.js');
const productionConfig = require('./webpack.config.prod.js');

module.exports = env => {
  // let webpackConfig = {};
  switch(env) {
  case 'development':
    // webpackConfig = merge( baseConfig, developmentConfig );
    // return webpackConfig;
    return merge(baseConfig, developmentConfig);
    // return merge(expConfig);
  case 'production':
    return merge(baseConfig, productionConfig);
  default:
    throw new Error('No matching configuration was found!');
  }
};


// EXAMPLE
// REF: https://survivejs.com/webpack/developing/composing-configuration/#setting-up-webpack-merge-

// const getConfig = (mode) => {
//   switch (mode) {
//   case "production":
//     return merge(baseConfig, productionConfig, { mode });
//   case "development":
//     return merge(baseConfig, developmentConfig, { mode });
//   default:
//     throw new Error(`Trying to use an unknown mode, ${mode}`);
//   }
// };

// module.exports = getConfig(mode);
