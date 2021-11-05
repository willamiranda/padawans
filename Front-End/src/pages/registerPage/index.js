import React from "react";
import { Link } from "react-router-dom";
import "./styles.css";
import homeImage from "../../assets/homeImage.png";
import Network from "../../assets/socialnetworks.png";

export default function registerPage() {
  return (
    <div className="homePage">
      <div className="homeImage">
        <img className="img" src={homeImage} alt="uma mão sendo estendida para outra" />
      </div>
      <div className="text-center">
        <p className="welcome">Seja bem-vindo a maior plataforma de ajuda </p>
        <p className="descriptionHome">
          Somos uma plataforma de ajuda voluntária que ajuda inúmeras ONGs ao
          redor do Brasil.</p>
      </div>
     
        <div ><p className="social-networks">Entrar com:</p>
        </div>
   
      <div className="register">
        <form className="formRegister">
          <p>
            <label className="name">Nome</label>
            <br />
            <input type="text" name="name" required />
          </p>
          <p>
            <label className="surname">Sobrenome</label>
            <br />
            <input type="text" name="surname" required />
          </p>
          <p>
            <label className="email">E-mail</label>
            <br />
            <input type="email" name="email" required />
          </p>
          <p>
            <label className="password">Senha</label>
            <br />
            <input type="password" name="password" requiredc />
          </p>
          <p className="terms">
            <input type="checkbox" name="checkbox" id="checkbox" required />{" "}
            <span className="terms">
              Ao criar uma conta você automaticamente concorda com nossos{" "}
              <a href="https://google.com" target="_blank" rel="noopener noreferrer">
                Termos de Serviço, Politica de Privacidade
              </a>
            </span> .  </p>
        </form>
      <div>
        <Link className="buttonHome" to="./ONGsPage" >         
              Registrar
        </Link>
      </div> 
    </div>
    <div className="singIn">
        <p> Já possui uma conta? <a href="https://google.com" target="_blank" rel="noopener noreferrer">
            Entre aqui </a>.
        </p>
      </div>
    </div>
  );
}
