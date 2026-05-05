# ATV-02: Sistema de Passagens

Banco de dados PostgreSQL para gerenciamento de passagens (voos/transportes) com stored procedures, functions e testes automatizados.

## 🚀 Quick Start (Docker)

```bash
# Subir tudo pela primeira vez
docker-compose up -d

# Ver se os scripts SQL deram erro
docker logs -f postgres_passagens

# Resetar banco (apagar tudo e rodar scripts do zero)
docker-compose down -v && docker-compose up -d
```

## 🔌 Conexão em DBeaver / SGBD

**Credenciais:**
- Host: `localhost`
- Port: `5432`
- User: `postgres`
- Password: `postgres`
- Database: `sistema_passagens`

**Passo a passo DBeaver:**
1. `New → Database Connection → PostgreSQL`
2. Preencher os dados acima
3. Botão `Test Connection` para validar
4. `Finish`

## 📁 Estrutura SQL

- `01_schema.sql` — DDL (tabelas, índices, constraints)
- `02_procedures.sql` — Stored procedures
- `03_functions.sql` — User-defined functions
- `04_data_seed.sql` — Dados iniciais
- `05_transactions.sql` — Exemplos transacionais
- `06_test_suite.sql` — Testes das funções

## ⚠️ Troubleshooting

**Erro "port 5432 already in use":**
```bash
docker-compose down && docker-compose up -d
```

**Limpar tudo e começar do zero:**
```bash
docker-compose down -v && docker-compose up -d
```

**Ver logs do PostgreSQL:**
```bash
docker logs postgres_passagens
```

**Conectar ao container via psql:**
```bash
docker exec -it postgres_passagens psql -U postgres -d sistema_passagens
```
