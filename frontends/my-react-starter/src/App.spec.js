import React from 'react';
import { render } from 'react-testing-library';
// 'jest-dom/extend-expect' & 'react-testing-library' imports moved to `testSetup.js`
import App from './App';

describe('App', () => {
  it('Renders without error', () => {
    // it('Runs and passes', () => {
    // expect(true).toBe(true)
    // expect(true).toBe(false)
    render(<App />);
  });

  it('Fails', () => {
    expect(true).toBe(false);
  });
});
