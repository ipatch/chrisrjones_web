import React from 'react';
import { useRouteError } from 'react-router-dom';
import './styles.css';

export default function ErrorPage() {
  const error = useRouteError();
  console.error(error);

  return (
    <>
    <div className='error-page-container'>
    <div className='error-page-text'>
    <h1>Oops!</h1>
    <p>Sorry, an unexpected error has occurred.</p>
    <p>
    <i>{error.statusText || error.message}</i>
    </p>
    </div>
    </div>
    </>
  );
}
