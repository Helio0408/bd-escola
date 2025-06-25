-- Hélio Márcio Cabral Santos - 14577862
-- Gabriel Martins Monteiro - 14572099
-- Andrey Cortez Rufino - 11819487
-- Pedro Louro Fernandes - 13672446


DROP INDEX IF EXISTS idx_disciplina_nome_hash;
EXPLAIN ANALYZE SELECT * FROM disciplina WHERE nome_disciplina = 'Cálculo Numérico';

-- Índice HASH para busca de disciplina por nome exato
CREATE INDEX idx_disciplina_nome_hash ON disciplina USING HASH (nome_disciplina);
EXPLAIN ANALYZE SELECT * FROM disciplina WHERE nome_disciplina = 'Cálculo Numérico';


DROP INDEX IF EXISTS idx_matricula_status_notas;
EXPLAIN ANALYZE SELECT id_aluno, notas FROM matricula WHERE status = 'Aprovado' ORDER BY notas DESC LIMIT 10;

-- Índice Composto para ordenação de notas por status
CREATE INDEX idx_matricula_status_notas ON matricula(status, notas DESC);
EXPLAIN ANALYZE SELECT id_aluno, notas FROM matricula WHERE status = 'Aprovado' ORDER BY notas DESC LIMIT 10;


DROP INDEX IF EXISTS idx_matricula_bolsistas_ativos;
EXPLAIN ANALYZE SELECT id_aluno FROM matricula WHERE bolsa_de_estudos = TRUE AND status = 'Cursando';

-- Índice Parcial para encontrar bolsistas ativos rapidamente
CREATE INDEX idx_matricula_bolsistas_ativos ON matricula (id_aluno)
WHERE bolsa_de_estudos = TRUE AND status = 'Cursando';
EXPLAIN ANALYZE SELECT id_aluno FROM matricula WHERE bolsa_de_estudos = TRUE AND status = 'Cursando';