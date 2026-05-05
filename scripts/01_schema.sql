-- Schema
CREATE TABLE COMPANHIA_AEREA (
    id_companhia SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    codigo_iata CHAR(3) UNIQUE,
    pais VARCHAR(100)
);

CREATE TABLE AERONAVE (
    id_aeronave SERIAL PRIMARY KEY,
    modelo VARCHAR(100),
    capacidade INT,
    id_companhia INT REFERENCES COMPANHIA_AEREA(id_companhia)
);

CREATE TABLE AEROPORTO (
    id_aeroporto SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100),
    pais VARCHAR(100),
    codigo_iata CHAR(3) UNIQUE
);

CREATE TABLE PASSAGEIRO (
    id_passageiro SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(14) UNIQUE,
    email VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE VOO (
    id_voo SERIAL PRIMARY KEY,
    numero_voo VARCHAR(10),
    data_partida TIMESTAMP,
    data_chegada TIMESTAMP,
    id_companhia INT REFERENCES COMPANHIA_AEREA(id_companhia),
    id_aeronave INT REFERENCES AERONAVE(id_aeronave),
    id_aeroporto_origem INT REFERENCES AEROPORTO(id_aeroporto),
    id_aeroporto_destino INT REFERENCES AEROPORTO(id_aeroporto)
);

CREATE TABLE RESERVA (
    id_reserva SERIAL PRIMARY KEY,
    data_reserva TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20),
    id_passageiro INT REFERENCES PASSAGEIRO(id_passageiro)
);

CREATE TABLE PASSAGEM (
    id_passagem SERIAL PRIMARY KEY,
    assento VARCHAR(10),
    classe VARCHAR(20),
    preco DECIMAL(10,2),
    id_reserva INT REFERENCES RESERVA(id_reserva),
    id_voo INT REFERENCES VOO(id_voo)
);

CREATE TABLE PAGAMENTO (
    id_pagamento SERIAL PRIMARY KEY,
    valor DECIMAL(10,2),
    forma_pagamento VARCHAR(50),
    data_pagamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_reserva INT REFERENCES RESERVA(id_reserva)
);