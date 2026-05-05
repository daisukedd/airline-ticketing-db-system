-- Seed de dados
INSERT INTO COMPANHIA_AEREA (nome, codigo_iata, pais) VALUES ('Latam', 'LA', 'Brasil');
INSERT INTO AERONAVE (modelo, capacidade, id_companhia) VALUES ('Airbus A320', 180, 1);
INSERT INTO AEROPORTO (nome, cidade, pais, codigo_iata) VALUES ('Marechal Cunha Machado', 'São Luís', 'Brasil', 'SLZ');
INSERT INTO AEROPORTO (nome, cidade, pais, codigo_iata) VALUES ('Guarulhos', 'São Paulo', 'Brasil', 'GRU');

INSERT INTO PASSAGEIRO (nome, cpf, email, telefone) 
VALUES ('Kevin Wallen', '123.456.789-00', 'kevin@email.com', '98999999999');

INSERT INTO VOO (numero_voo, data_partida, data_chegada, id_companhia, id_aeronave, id_aeroporto_origem, id_aeroporto_destino)
VALUES ('LA3452', '2026-05-10 10:00:00', '2026-05-10 13:00:00', 1, 1, 1, 2);