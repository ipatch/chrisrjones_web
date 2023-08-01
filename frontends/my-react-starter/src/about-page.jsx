import React from 'react';
import { Navbar } from './components/Navbar.jsx'
import './styles.css';

const AboutPage = () => {
    return(
      <>
      <Navbar />
      <div className='about-page-container'>
        <h1>About Me</h1>
        <p> my placeholder about page</p>
      </div>
      </>
    );
};

export { AboutPage};
