-- Testes para as funções e procedimentos
DO $$
BEGIN
    -- Testa a função de duração de voo
    IF (SELECT fn_duracao_voo(1)) IS NULL THEN
        RAISE EXCEPTION 'Fail: Duração do voo não calculada';
    END IF;

    -- Testa se a ocupação de assentos esta correta
    IF (SELECT fn_assentos_ocupados(1)) < 1 THEN
        RAISE EXCEPTION 'Fail: Contagem de assentos incorreta';
    END IF;

    RAISE NOTICE 'Todos os testes passaram com sucesso!';
END $$;