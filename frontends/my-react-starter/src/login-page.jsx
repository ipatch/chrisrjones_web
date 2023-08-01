import React, { useState } from 'react';
import axios from 'axios';
import { Navbar } from './components/Navbar.jsx'
import './styles.css';

const LoginPage = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleLogin = async (e) => {
    e.preventDefault();

  try {
    // send POST request to localhost:3000/auth/login
    const response = await axios.post('http://localhost:3000/api/auth/login', {
      email: email,
      password: password,
    });

    // if login good, handle response
    console.log(response.data);

  } catch (error) {
    // handle error
    console.error(error);
    }
  };

    return(
      <>
      <Navbar />
      <div className='login-page-container'>
        <h1>login</h1>
        <form onSubmit={handleLogin}>
          <div>
          <label htmlFor='fname'>username:</label>
          <input type='text' id='uname' value={email} onChange={(e) => setEmail(e.target.value)} />
          </div>
          <div>
          <label htmlFor='password'>password:</label>
          <input type='password' id='password' value={password} onChange={(e) => setPassword(e.target.value)} />
          </div>
          <input type='submit' value='login' />
        </form>
      </div>
      </>
    );
};

export { LoginPage };

