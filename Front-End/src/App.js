import React from "react";
import Router from "./router";
import { BrowserRouter } from "react-router-dom";
import Header from "./components/header/index";
import "./App.css";

function App() {
  return (
    <BrowserRouter>
      <Header />
      <Router />
    </BrowserRouter>
  );
}

export default App;
