import React from 'react'; // required becuz JSX
import { createRoot } from 'react-dom/client';
import App from './App';

const container = document.getElementById('app');
if (container instanceof HTMLElement) {
  const root = createRoot(container);
  root.render(<App />);
} else {
  console.error('element with id "app" not found');
}

