import React from 'react';
import Hello from './components/Hello.js';
import './styles.css';
import { hot } from 'react-hot-loader';


// exp with es17 async/await features
var a = async () => {
  await console.log('hello from the future, app.js');

  console.log('app.js aysnc task done');
};
a();


class App extends React.Component {
  // cons.log
  render() {
    // print `logging` in a browser console
    // console.log('logging');
    return (
      <div>
        <h2>hello from `npm run dev5`</h2>
        <h1>Hello from App, using React and webpack!</h1>
        <h2>when running `npm run dev0` there is not hot reloading of the app</h2>
        <br />
        <h3>my new h3</h3>
        <h2>starting the app with `npm run dev2`, loads, `webpack.config.js` which uses webpack-merge to combine the `webpack.base.config.js` with the `webpack.config.dev.js` into a single config</h2>
        <br />

        <Hello />
      </div>
    );
  }
}

// preserve app state during hot reloading
export default hot(module)(App);
