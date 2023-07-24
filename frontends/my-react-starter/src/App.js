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
  render() {
    // print `logging` in a browser console
    // console.log('logging');
    return (
      <div>
        <Hello />
      </div>
    );
  }
}

// preserve app state during hot reloading
export default hot(module)(App);
