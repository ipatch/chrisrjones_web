import React from 'react';
import Navbar from './components/Navbar.jsx';
// import './styles.css';
import '../node_modules/modern-normalize/modern-normalize.css';
import { hot } from 'react-hot-loader';

class App extends React.Component {
  render() {
    return (
      <div>
        <Navbar />
      </div>
    );
  }
}

// preserve app state during hot reloading
export default hot(module)(App);
