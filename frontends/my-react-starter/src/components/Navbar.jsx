

import React, { useEffect, useState } from 'react';

// NOTE: ipatch
// ref: https://css-tricks.com/creating-a-smart-navbar-with-vanilla-javascript/
// NOTE: ipatch, react workaround for styling css pseudo elements
// https://stackabuse.com/how-to-style-hover-in-react/
//--------------------
// NOTE: ipatch, it appears current webpack settings rm below JSX comment
//

const NavbarDropdown = () => {
  const [showDropdown, setShowDropdown] = useState(false);
  const [isHover, setIsHover] = useState(false);

  const handleMouseEnter = () => {
    setIsHover(true);
  };

  const handleMouseLeave = () => {
    setIsHover(false);
  };

  const toggleDropdown = () => {
    setShowDropdown((prev) => !prev);
  };

  const navbarDropdownContentStyle = {
    display: 'block',
    padding: '12px 16px',
    textDecoration: 'none',
    color: 'black',
    // cursor: 'pointer'
    backgroundColor: isHover ? 'lightblue' : 'rgb(0, 191, 255)',
    color: isHover ? 'red' : 'green',
  }

  return (
    <div
      className="dropdown"
      onMouseEnter={() => setShowDropdown(true)}
      onMouseLeave={() => setShowDropdown(false)}
      style={{
        position: 'relative',
        display: 'inline-block',
        // cursor: 'pointer'
      }}
    >
      <button
        className="dropbtn"
        onClick={toggleDropdown}
        style={{
          // first color is the hover color
          backgroundColor: showDropdown ? 'red' : '#04AA6D',
          border: 'none',
          textDecoration: 'none',
          display: 'block',
        }}
      >
        Contribute
      </button>
      {showDropdown && (
        <div
          className="dropdown-content"
          style={{
            display: 'block',
            position: 'absolute',
            backgroundColor: '#f1f1f1',
            minWidth: '160px',
            boxShadow: '0px 8px 16px 0px rgba(0, 0, 0, 0.2)',
            zIndex: 1,
            ':hover': {
              backgroundColor: 'red',
            },
          }}
        >
          <a
            href="#"
            onMouseEnter={handleMouseEnter}
            onMouseLeave={handleMouseLeave}
            style={navbarDropdownContentStyle}
          >
            Signup
          </a>
          <a
            href="#"
            onMouseEnter={handleMouseEnter}
            onMouseLeave={handleMouseLeave}
            style={navbarDropdownContentStyle}
          >
            Login
          </a>
        </div>
      )}
    </div>
  );
};

const Navbar = () => {
  const [scrollingDown, setScrollingDown] = useState(false);

  const handleScroll = () => {
    // TODO: ipatch how to disable lsp diagnostic warning for deprecated browser API
    // eslint-disable-next-line
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
          {/* TODO: move url into a var of some sort */}
          <a href="https://github.com/ipatch/dotfiles">❤ ~/.🛠🐈</a>
          <a href="#">youtube</a>
          <a href="#">linkedin</a>
          <a href="#">CV</a>
          <a href="#">Contribute</a>
          <NavbarDropdown />
        </div>
      </nav>
    </>
  );
};

export { Navbar, NavbarDropdown };

