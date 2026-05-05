-- Inserção de dados: Procedures
CREATE OR REPLACE PROCEDURE sp_inserir_passageiro(p_nome VARCHAR, p_cpf VARCHAR, p_email VARCHAR, p_tel VARCHAR)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO PASSAGEIRO (nome, cpf, email, telefone) VALUES (p_nome, p_cpf, p_email, p_tel);
END; $$;

-- Insersão de voo[cite: 3]
CREATE OR REPLACE PROCEDURE sp_inserir_voo(p_num VARCHAR, p_partida TIMESTAMP, p_chegada TIMESTAMP, p_cia INT, p_aero INT, p_origem INT, p_dest INT)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO VOO (numero_voo, data_partida, data_chegada, id_companhia, id_aeronave, id_aeroporto_origem, id_aeroporto_destino)
    VALUES (p_num, p_partida, p_chegada, p_cia, p_aero, p_origem, p_dest);
END; $$;

-- Inserção de reserva[cite: 3]
CREATE OR REPLACE PROCEDURE sp_inserir_reserva(p_status VARCHAR, p_passageiro_id INT)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO RESERVA (status, id_passageiro) VALUES (p_status, p_passageiro_id);
END; $$;

-- Inserção de passagem[cite: 3]
CREATE OR REPLACE PROCEDURE sp_inserir_passagem(p_assento VARCHAR, p_classe VARCHAR, p_preco DECIMAL, p_reserva_id INT, p_voo_id INT)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO PASSAGEM (assento, classe, preco, id_reserva, id_voo) VALUES (p_assento, p_classe, p_preco, p_reserva_id, p_voo_id);
END; $$;

-- Inserção de pagamento[cite: 3]
CREATE OR REPLACE PROCEDURE sp_registrar_pagamento(p_valor DECIMAL, p_forma VARCHAR, p_reserva_id INT)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO PAGAMENTO (valor, forma_pagamento, id_reserva) VALUES (p_valor, p_forma, p_reserva_id);
END; $$;