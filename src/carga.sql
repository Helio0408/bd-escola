-- Hélio Márcio Cabral Santos - 14577862
-- Gabriel Martins Monteiro - 14572099
-- Andrey Cortez Rufino - 11819487
-- Pedro Louro Fernandes - 13672446


\timing on

-- Sincronizar as sequências com os dados existentes
SELECT setval('usuario_id_user_seq', (SELECT MAX(id_user) FROM usuario));
SELECT setval('aluno_id_aluno_seq', (SELECT MAX(id_aluno) FROM aluno));
SELECT setval('professor_id_professor_seq', (SELECT MAX(id_professor) FROM professor));
SELECT setval('funcionario_administrativo_id_funcionario_seq', (SELECT MAX(id_funcionario) FROM funcionario_administrativo));
SELECT setval('avaliacao_professor_id_avaliacao_seq', (SELECT MAX(id_avaliacao) FROM avaliacao_professor));

-- Armazenar o último ID de aluno existente antes da nova carga
SELECT COALESCE(MAX(id_aluno), 0) AS ultimo_id_aluno FROM aluno \gset

-- Inserir 10.000 novas disciplinas
\echo '--> Inserindo 10.000 novas disciplinas...'
INSERT INTO disciplina (codigo_disciplina, nome_disciplina, aulas_semanais, capacidade_turma, n_alunos_matriculados, id_unidade)
SELECT
    'GEN' || lpad(i::text, 5, '0'),
    'Disciplina Gerada ' || i,
    CASE WHEN random() > 0.5 THEN 4 ELSE 2 END,
    30 + floor(random() * 71)::int,
    0,
    (random() * 2 + 1)::int
FROM generate_series(1, 10000) AS i;


-- Inserir 200.000 novos usuários e seus respectivos perfis de aluno
\echo '--> Inserindo 200.000 novos usuários e alunos...'

WITH novos_usuarios AS (
    INSERT INTO usuario (nome, sobrenome, data_nascimento, sexo, telefone, email, senha, endereco, tipo_usuario, id_unidade)
    SELECT
        'Aluno_' || i,
        'Sobrenome_' || i,
        '2003-01-01'::date + (random() * 365)::int,
        CASE WHEN random() > 0.5 THEN 'M' ELSE 'F' END,
        '99999' || i,
        'aluno_' || i || '@escola.com',
        'senha_gerada',
        'Endereço Gerado ' || i,
        'aluno',
        (random() * 2 + 1)::int
    FROM generate_series(1, 200000) AS i
    RETURNING id_user
)
INSERT INTO aluno (id_user)
SELECT id_user FROM novos_usuarios;


-- Inserir matrículas para os novos alunos
\echo '--> Inserindo matrículas para simular histórico acadêmico...'

INSERT INTO matricula (id_aluno, codigo_disciplina, data_efetivacao, status, notas, bolsa_de_estudos, confirmada)
SELECT
    a.id_aluno,
    d.codigo_disciplina,
    '2022-01-01'::date + (random() * (365 * 4))::int,
    CASE
        WHEN r < 0.50 THEN 'Aprovado'
        WHEN r < 0.90 THEN 'Reprovado'
        WHEN r < 0.99 THEN 'Cursando'
        ELSE 'Cancelado'
    END AS status,
    CASE
        WHEN r < 0.50 THEN (5 + random() * 5)::numeric(4,2)
        ELSE (random() * 4.9)::numeric(4,2)
    END AS notas,
    (random() < 0.15) AS bolsa_de_estudos,
    TRUE
FROM
    (SELECT id_aluno FROM aluno WHERE id_aluno > :ultimo_id_aluno) AS a,
    LATERAL (
        SELECT codigo_disciplina FROM disciplina ORDER BY random() LIMIT (8 + floor(random() * 5))
    ) d,
    LATERAL (SELECT random()) AS r(r);


-- Atualizar estatísticas do banco de dados
\echo '--> Atualizando estatísticas do banco de dados...'
ANALYZE;
\timing off