import React, { useEffect, useState } from "react";
import "./styles.css";
import logo from "../../assets/logoappaz.png";
import { CSSTransition } from "react-transition-group";


export default function registerPage() {
  return (
    <header className="header">
      <img src={logo} className="logo" alt="logo da appaz"/>
      <button onClick={toggleNav} className="menuIcon">
        Menu
      </button>
            <CSSTransition
        in={!isSmallScreen || isNavVisible}
        timeout={0}
        classNames="NavAnimation"
        unmountOnExit
      >
        <nav className="Nav">
          <a href="/to-dos">Sobre</a>
          <a href="/albuns">ONGs</a>
          <a href="/to-dos">Menu</a>

        </nav>
        </CSSTransition>


    </header>
  );
}

