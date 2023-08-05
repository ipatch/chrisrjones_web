import React from 'react';
import { Navbar, } from './components/Navbar.jsx';
import { Counter, } from './components/Counter.js';
// import PlaceholderBlogPost from './components/PlaceholderBlogPost.jsx';
import { ArticlesPage } from './articles-page.jsx';
import '../node_modules/modern-normalize/modern-normalize.css';
import './styles.css';

const AppFunc = () => {
  return (
    <>
    <Navbar />
    <main>
      <Counter />
      <ArticlesPage />
    </main>
 </>
  );
};

export { AppFunc, };
