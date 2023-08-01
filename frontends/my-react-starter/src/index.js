import React from 'react'; // required becuz JSX
import { createRoot } from 'react-dom/client';
import { createBrowserRouter, RouterProvider, } from 'react-router-dom';
import App from './App';
import ErrorPage from './error-page.jsx';
import { AboutPage } from './about-page.jsx';

const router = createBrowserRouter([
  {
    path: '/',
    element: <App />,
    errorElement: <ErrorPage />
  },
  {
    path: '/about',
    element: <AboutPage />
  },
]);

const container = document.getElementById('app');
if (container instanceof HTMLElement) {
  const root = createRoot(container);
  root.render(
    <React.StrictMode>
      <RouterProvider router={router} />
    </React.StrictMode>
  );
} else {
  console.error('element with id "app" not found');
}

