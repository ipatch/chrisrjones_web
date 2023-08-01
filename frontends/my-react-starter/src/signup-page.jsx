import React from 'react';
import { Navbar } from './components/Navbar.jsx'
import './styles.css';

const SignupPage = () => {
    return(
      <>
      <Navbar />
      <div className='about-page-container'>
        <h1>SignUp</h1>
        {/* <p> my placeholder about page</p> */}
      </div>
      </>
    );
};

export { SignupPage };

