import React, { useState, useEffect, useCallback } from 'react';
import { ContainerFluid, Container, Form } from './styles';
import { Link } from 'react-router-dom';
import "./styles.css";
import api from '../../services/api';
import Select from '../../components/select/select';
import Map from "../../assets/map.png";

function FilterPage() {
  const [cities, setCities] = useState([]);
  const [ufList, setUfList] = useState([]);
  const [currentCity, setCurrentCity] = useState('');
  const [currentUf, setCurrentUf] = useState('');

  useEffect(() => {
    api.get('api/v1/localidades/estados').then((response) => {
      const ufInitials = response.data.map((uf) => uf.sigla);

      setUfList(ufInitials);
    });
  }, []);

  useEffect(() => {
    if (currentUf === '0') {
      return;
    }

    api
      .get(`api/v1/localidades/estados/${currentUf}/municipios`)
      .then((response) => {
        const cityNames = response.data.map((city) => city.nome);

        setCities(cityNames);
      });
  }, [currentUf]);

    const handleSelectUf = useCallback((event) => {
        setCurrentUf(event.target.value);
    }, []);

    const handleSelectCity = useCallback((event) => {
        setCurrentCity(event.target.value);
    }, []);

  return (
    <ContainerFluid>
      <div>       
         <p className="description">
         Encontramos algumas ONGs perto de você. É só selecionar uma e dar um match ;)
        </p>
      </div>
      <Container>
        <Form className="formSelect">
          <Select
            onChange={handleSelectUf}
            value={currentUf}
            label="Selecione o estado"
            firstOption="Estados"
            name="uf"
            id="uf"
            options={ufList}
          />

          <Select
            onChange={handleSelectCity}
            value={currentCity}
            label="Selecione a cidade"
            firstOption={currentUf ? `Cidades de ${currentUf}` : 'Cidades'}
            name="city"
            id="city"
            options={cities}
          />
          <Select
            onChange={null}
            value={null}
            label="Selecione raio de distancia"
            firstOption="Raio"
            name="0"
            id="0"
            options={0}
          />

          <Select
            onChange={null}
            value={null}
            label="Selecione categoria da ONG"
            firstOption="Causa"
            name="0"
            id="0"
            options={0}
          />
        </Form>
          <div>
            <button id="buttonSearch" type="submit" >
              Buscar
            </button>
          </div>
          <div>
            <img className="map" src={Map} alt="mapa" />
          </div>

      </Container>
    </ContainerFluid>
  );
}

export default FilterPage;