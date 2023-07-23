/* eslint-disable no-unused-vars, indent */

module.exports = {
  mode: 'development',
  devServer: {
    overlay: true,
    host: '0.0.0.0',
    // default to port 8080 then ++ if non avail
    // port: 4445
    useLocalIp: true, // requires `host:` key
  },
  devtool: 'source-map',
};


// export default developmentConfig;
