import React from 'react';
import { Navbar } from './components/Navbar.jsx'
import './styles.css';

const LoginPage = () => {
    return(
      <>
      <Navbar />
      <div className='login-page-container'>
        <h1>login</h1>
        <form action='#'>
          <div>
          <label htmlFor='fname'>username:</label>
          <input type='text' id='uname' name='fname' />
          </div>
          <div>
          <label htmlFor='password'>password:</label>
          <input type='text' id='password' name='password' />
          </div>
          <input type='submit' value='submit' />
        </form>
      </div>
      </>
    );
};

export { LoginPage };

