import React, { useEffect, useState } from 'react';
import PlaceholderBlogPost from './PlaceholderBlogPost.jsx';

// NOTE: ipatch
// ref: https://css-tricks.com/creating-a-smart-navbar-with-vanilla-javascript/
//--------------------
// NOTE: ipatch, it appears current webpack settings rm below JSX comment
//

const NavbarDropdown = () => {
  return (
    <div className="dropdown">
      <button className="dropbtn">Contribute</button> 
      <div className="dropdown-content"> 
        <a href="#">Signup</a> 
        <a href="#">Login</a> 
      </div> 
    </div> 
  );
};

// export default NavbarDropdown;

const Navbar = () => {
  const [scrollingDown, setScrollingDown] = useState(false);

  const handleScroll = () => {
    const currentScrollPosition = window.scrollY || window.pageYOffset;
    setScrollingDown(currentScrollPosition > previousScrollPosition);
    previousScrollPosition = currentScrollPosition;
  };

  useEffect(() => {
    let previousScrollPosition = 0;

    const nav = document.querySelector('nav');

    const handleScroll = () => {
      const currentScrollPosition = window.scrollY || window.pageYOffset;
      setScrollingDown(currentScrollPosition > previousScrollPosition);
      previousScrollPosition = currentScrollPosition;
    };

    window.addEventListener('scroll', handleScroll);

    return () => {
      window.removeEventListener('scroll', handleScroll);
    };
  }, []);

  return (
    <> {/* use jsx commenting here */}
      <nav
        style={{
          position: 'sticky',
          top: scrollingDown ? '-100%' : '0',
          display: 'flex',
          flexWrap: 'wrap',
          justifyContent: 'space-between',
          padding: '1.5rem 2rem',
          backgroundColor: '#eaeaea',
          transition: 'top 0.3s ease',
        }}
      >
        <div className="logo">chrisrjones.com</div>
        <div className="links" style={{
          display: 'flex',
          gap: '1rem',
          }}
        >
          <a href="#">About Me</a>
          <a href="#">Contact Me</a>
          <a href="https://github.com/ipatch/dotfiles">❤ ~/.🛠🐈</a>
          <a href="#">youtube</a>
          <a href="#">linkedin</a>
          <a href="#">CV</a>
          <a href="#">Contribute</a>
          <NavbarDropdown />
        </div>
      </nav>
      <main>
        <PlaceholderBlogPost />
      </main>
    </>
  );
};

// export { Navbar };
export { Navbar, NavbarDropdown };
// export default Navbar;

