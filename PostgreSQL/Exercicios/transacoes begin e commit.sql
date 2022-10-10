SELECT numero, nome, ativo FROM banco ORDER BY numero;

UPDATE banco SET ativo = false WHERE numero = 0;

BEGIN;
UPDATE banco SET ativo = true WHERE numero = 0;
SELECT numero, nome, ativo FROM banco WHERE numero = 0;
ROLLBACK; --voltou o banco 0 pra false pois "cancelou" tudo que foi feito no bloco de código acima

BEGIN;
UPDATE banco SET ativo = true WHERE numero = 0;
COMMIT; --qnd deu commit, autenticou o código, o banco 0 agora é true de novo

SELECT id, gerente, nome FROM funcionarios;

BEGIN;
UPDATE funcionarios SET gerente = 2 WHERE id = 3;
SAVEPOINT sf_func;
UPDATE funcionarios SET gerente = null;
ROLLBACK TO sf_func;
UPDATE funcionarios SET gerente = 3 WHERE id = 5;
COMMIT;