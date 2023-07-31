import React, { useState } from 'react';

const Counter = () => {
  const [count, setCount] = useState(0);

  const handleClick = () =>
    setCount(count +1);

  return(
    <>
    <button 
    onClick={handleClick}
    style={{
      // top/bottom, left/right
      margin: '2rem 6rem'
    }}>
    Click me {count}
    </button>
    </>
  );
};

export { Counter };
