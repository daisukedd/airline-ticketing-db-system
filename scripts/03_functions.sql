-- Calcular duração do voo[cite: 3]
CREATE OR REPLACE FUNCTION fn_duracao_voo(p_id_voo INT) RETURNS INTERVAL
LANGUAGE plpgsql AS $$
DECLARE v_duracao INTERVAL;
BEGIN
    SELECT (data_chegada - data_partida) INTO v_duracao FROM VOO WHERE id_voo = p_id_voo;
    RETURN v_duracao;
END; $$;

-- Calcular total pago por reserva[cite: 3]
CREATE OR REPLACE FUNCTION fn_total_pago_reserva(p_id_reserva INT) RETURNS DECIMAL
LANGUAGE plpgsql AS $$
DECLARE v_total DECIMAL;
BEGIN
    SELECT SUM(valor) INTO v_total FROM PAGAMENTO WHERE id_reserva = p_id_reserva;
    RETURN COALESCE(v_total, 0);
END; $$;

-- Contar passageiros distintos em um voo[cite: 3]
CREATE OR REPLACE FUNCTION fn_contar_passageiros_voo(p_id_voo INT) RETURNS INT
LANGUAGE plpgsql AS $$
DECLARE v_total INT;
BEGIN
    SELECT COUNT(DISTINCT r.id_passageiro) INTO v_total 
    FROM PASSAGEM p 
    JOIN RESERVA r ON p.id_reserva = r.id_reserva
    WHERE p.id_voo = p_id_voo;
    RETURN v_total;
END; $$;

-- Contar assentos ocupados em um voo[cite: 3]
CREATE OR REPLACE FUNCTION fn_assentos_ocupados(p_id_voo INT) RETURNS INT
LANGUAGE plpgsql AS $$
DECLARE v_qtd INT;
BEGIN
    SELECT COUNT(*) INTO v_qtd FROM PASSAGEM WHERE id_voo = p_id_voo;
    RETURN v_qtd;
END; $$;