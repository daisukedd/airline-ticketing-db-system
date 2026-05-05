-- Transações e Controle de Concorrência
DO $$ 
DECLARE v_res_id INT; 
BEGIN
    INSERT INTO RESERVA (status, id_passageiro) VALUES ('CONFIRMADO', 1) RETURNING id_reserva INTO v_res_id;
    INSERT INTO PASSAGEM (assento, classe, preco, id_reserva, id_voo) VALUES ('1A', 'Primeira Classe', 2500.00, v_res_id, 1);
    INSERT INTO PAGAMENTO (valor, forma_pagamento, id_reserva) VALUES (2500.00, 'Pix', v_res_id);
    RAISE NOTICE 'Transação concluída para reserva %', v_res_id;
END $$;

-- Teste de Rollback
BEGIN;
    INSERT INTO RESERVA (status, id_passageiro) VALUES ('PENDENTE_ERRO', 1);
    -- Este comando falha (Voo inexistente) e deve disparar o ROLLBACK[cite: 2, 3]
    INSERT INTO PASSAGEM (assento, classe, preco, id_reserva, id_voo) VALUES ('99Z', 'Econômica', 100.00, 999, 999);
ROLLBACK;