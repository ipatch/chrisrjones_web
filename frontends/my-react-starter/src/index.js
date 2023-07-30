import React from 'react'; // required becuz JSX
import { createRoot } from 'react-dom/client';
import App from './App';

const container = document.getElementById('app');

// NOTE: ipatch, the below line is blowing up my LSP #wtf
const root = createRoot(container);

root.render(<App />);
