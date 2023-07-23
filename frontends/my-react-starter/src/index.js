/* eslint-disable no-unused-vars */
import React from 'react'; // required becuz of JSX
import ReactDOM from 'react-dom';
import App from './App';
// import DefaultErrorBoundary from './DefaultErrorBoundary'

// if (process.env.NODE_ENV === 'development') {
//   const axe = require('react-axe');
//   axe(React, ReactDOM, 1000);
// }

// ReactDOM.render(
//   <React.StrictMode>
//     {/* <DefaultErrorBoundary> */}
//     <App />
//     {/* </DefaultErrorBoundary> */}
//   </React.StrictMode>,
//   document.getElementById('app')
// );

// exp with es17 async/await features
var a = async () => {
  await console.log('hello from the future, index.js');

  console.log('index.js aysnc task done');
};
a();


console.log('webpack you are the devil!');

ReactDOM.render(<App/>, document.getElementById('app'));
