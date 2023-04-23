import './App.css';
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';
import { useState, useRef, useEffect } from 'react';

import Home from './views/Home';
import Portfolio from './views/Portfolio';
import Blog from './views/Blog';
import Contact from './views/Contact';
import CV from './views/CV';

function App() {
  const [color, setColor] = useState<string>('white');

  const navMenuRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const navMenu = navMenuRef.current;
  
    const handleClick = (event: Event) => {
      let targetElement: HTMLElement | null = null;

      if (event.target instanceof HTMLSpanElement) {
        targetElement = event.target.parentElement;
      } else if (event.target instanceof HTMLAnchorElement) {
        targetElement = event.target;
      }

      if (targetElement) {
        const computedStyle = window.getComputedStyle(targetElement);
        console.log(computedStyle.color);
        setColor(computedStyle.color);
      }
    };
  
    navMenu?.addEventListener("click", handleClick);
  
    return () => {
      navMenu?.removeEventListener("click", handleClick);
    };
  }, []);
  

  return (
    <Router>
      <div className={`App`}>
        <nav className='nav-menu' ref={navMenuRef}>
          <ul className='nav-menu-ul'>
            <li>
              <Link to="/" className='link-home'>
                <span className='first-name'>Matheus Duque</span>
                <span className='last-name'>Full Stack Developer</span>
              </Link>
            </li>
            <li><Link to="/portfolio" className='link-portfolio'>{'Portfolio'}</Link></li>
            <li><Link to="/blog" className='link-blog'>{'Blog'}</Link></li>
            <li><Link to="/contact" className='link-contact'>{'Contact'}</Link></li>
            <li><Link to="/cv" className='link-cv'>{'CV'}</Link></li>
            <li>
              <ul className='lang-ul'>
                <li><a href='EN'>EN</a></li>
                <li><a href='PT'>PT</a></li>
                <li><a href='SV'>SV</a></li>
              </ul>
            </li>
          </ul>
        </nav>
        <Routes>
          <Route path="/"  element={<Home/>} />
          <Route path="/portfolio" element={<Portfolio/>} />
          <Route path="/blog" element={<Blog/>} />
          <Route path="/contact" element={<Contact/>} />
          <Route path="/cv" element={<CV/>} />
        </Routes>
      </div>
      <style>{`
        .nav-menu li:not(:first-child) {
          border-left: 1px solid ${color};
        }
        .nav-menu ul {
          border-bottom: 1px solid ${color};
        }
        .lang-ul li:not(:first-child) {
          border-left: 1px solid ${color};
        }
      `}</style>
    </Router>
  );
}

export default App;
