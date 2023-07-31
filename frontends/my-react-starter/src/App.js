import React from 'react';
import { Navbar, } from './components/Navbar.jsx';
import { Counter, } from './components/Counter.js';
import PlaceholderBlogPost from './components/PlaceholderBlogPost.jsx';
import './styles.css';
import '../node_modules/modern-normalize/modern-normalize.css';
// import { hot } from 'react-hot-loader';

class App extends React.Component {
  render() {
    return (
      <>
        <Navbar />
        <main>
          <Counter />
          <PlaceholderBlogPost />
        </main>
      </>
    );
  }
}

// preserve app state during hot reloading
// export default hot(module)(App);
export default App;
