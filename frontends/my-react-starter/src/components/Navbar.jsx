import React, { useEffect, useState } from 'react';

const Navbar = () => {
  const [scrollingDown, setScrollingDown] = useState(false);

  const isScrollingDown = () => {
    let currentScrolledPostion = window.scrollY || window.pageYOffset;
    let scrollingDown = currentScrolledPosition > previousScrollPosition;
    previousScrollPostion = currentScrolledPosition;
    return scrollingDown;
  };

  useEffect(() => {
    let previousScrollPosition = 0;

    const handleScroll = () => {
      setScrollingDown(isScrollingDown());
    };

    window.addEventListener('scroll', handleScroll);

    return () => {
      window.removeEvenListener('scroll', handleScroll);
    };
  }, []);

  return (
    <nav style={{ position: 'sticky', top: 0, display: 'flex', flexWrap: 'wrap', justifyContent: 'space-between', padding: '1.5rem 2rem', backgroundColor: '#eaeaea' }}>
    <div className="logo">
      chrisrjones.com
    </div>
    <div className="links">
      <a href="#">Link 1</a>
      <a href="#">Link 2</a>
      <a href="#">Link 3</a>
      <a href="#">Link 4</a>
    </div>
    </nav>
  );
};

export default Navbar;

