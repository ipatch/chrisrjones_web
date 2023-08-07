import React, { useState } from 'react';
import axios from 'axios';
import { Navbar } from './components/Navbar.jsx';
import { useAuth } from './AuthContext.jsx';
import './styles.css';

const LoginPage = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const { setIsLoggedIn } = useAuth();

  const handleLogin = async (e) => {
    e.preventDefault();

    try {
      // send POST request to localhost:3000/auth/login
      const response = await axios.post('http://localhost:3000/api/auth/login', {
        email: email,
        password: password,
      },
        {
          withCredentials: true,
        }
      );
      // if login good, handle response
      console.log(response.data);

      // DEBUG
      // console.log('api response:', response);

      // store jwt token from rails api in browser local storage
      const token = response.data.auth_token;
      localStorage.setItem('jwtToken', token);
      setIsLoggedIn(true);

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
            <label htmlFor='username'>username:</label>
            <input 
              type='text' 
              id='uname' 
              required
              value={email} 
              onChange={(e) => setEmail(e.target.value)} 
            />
          </div>
          <div>
            <label htmlFor='password'>password:</label>
            <input 
              type='password' 
              id='password' 
              required
              value={password} 
              onChange={(e) => setPassword(e.target.value)} 
            />
          </div>
          <input type='submit' value='login' />
        </form>
      </div>
      </>
    );
};

export { LoginPage };

