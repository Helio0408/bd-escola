--Hélio Márcio Cabral Santos - 14577862
--Gabriel Martins Monteiro - 14572099
--Andrey Cortez Rufino - 11819487
--Pedro Louro Fernandes - 13672446

-- Listar Alunos Atualmente Matriculados em Banco de Dados (SSC0503)
SELECT
	u.nome,
	u.sobrenome,
	u.email
FROM usuario u
JOIN aluno a ON u.id_user = a.id_user
JOIN matricula m ON a.id_aluno = m.id_aluno
WHERE m.codigo_disciplina = 'SSC0503' AND m.status = 'Cursando';

-- Calcular a média de notas do aluno 'Bruno Costa'
SELECT
	u.nome || ' ' || u.sobrenome AS nome_completo,
	ROUND(AVG(m.notas), 2) AS media_geral
FROM usuario u
JOIN aluno a ON u.id_user = a.id_user
JOIN matricula m ON a.id_aluno = m.id_aluno
WHERE u.email = 'bruno.costa@email.com'
  AND m.notas IS NOT NULL
  AND m.status IN ('Aprovado', 'Reprovado')
GROUP BY nome_completo;

-- Listar professores e suas disciplinas no curso de Ciência da Computação
SELECT DISTINCT
	d.nome_departamento,
	prof_usuario.nome || ' ' || prof_usuario.sobrenome AS nome_professor,
	disciplina.nome_disciplina
FROM departamento d
JOIN curso c ON d.codigo_departamento = c.departamento
JOIN composicao_curso cc ON c.codigo_curso = cc.codigo_curso
JOIN disciplina ON cc.codigo_disciplina = disciplina.codigo_disciplina
JOIN responsavel_disciplina rd ON disciplina.codigo_disciplina = rd.codigo_disciplina
JOIN professor p ON rd.id_professor = p.id_professor
JOIN usuario prof_usuario ON p.id_user = prof_usuario.id_user
WHERE d.codigo_departamento = 'SCC'
ORDER BY nome_professor, nome_disciplina;

-- Lista ordenada de disciplinas pela relação reprovados/aprovados
SELECT
	d.nome_disciplina,
	COUNT(*) AS total_concluintes,
	SUM(CASE WHEN m.status = 'Reprovado' THEN 1 ELSE 0 END) AS total_reprovados,
	ROUND(
		(SUM(CASE WHEN m.status = 'Reprovado' THEN 1 ELSE 0 END)::DECIMAL / COUNT(*)) * 100, 2
	) AS relacao_reprovados_aprovados
FROM disciplina d
JOIN matricula m ON d.codigo_disciplina = m.codigo_disciplina
WHERE m.status IN ('Aprovado', 'Reprovado')
GROUP BY d.nome_disciplina
HAVING COUNT(*) > 0 -- Garante que a disciplina tenha tido no mínimo 1 concluinte
ORDER BY relacao_reprovados_aprovados DESC;

-- Listar todos os materiais de estudo para o aluno 'Carlos Silva'
SELECT
	u.nome || ' ' || u.sobrenome AS aluno,
	d.nome_disciplina,
	md.nome AS nome_material,
	md.descricao
FROM usuario u
JOIN aluno a ON u.id_user = a.id_user
JOIN matricula m ON a.id_aluno = m.id_aluno
JOIN disciplina d ON m.codigo_disciplina = d.codigo_disciplina
JOIN material_didatico_disciplina mdd ON d.codigo_disciplina = mdd.codigo_disciplina
JOIN material_didatico md ON mdd.id_material = md.id_material
WHERE u.email = 'carlos.silva@email.com' AND m.status = 'Cursando';

-- Buscar um usuário específico pelo nome e sobrenome
SELECT
    nome,
    sobrenome,
    email,
    telefone,
    tipo_usuario
FROM
    usuario
WHERE
    nome = 'Ana' AND sobrenome = 'Pereira';

-- Exibir os 5 avisos mais recentes e quem os publicou
SELECT
    av.timestamp_criacao AS data_publicacao,
    av.texto_aviso,
    u.nome || ' ' || u.sobrenome AS publicado_por
FROM
    aviso av
JOIN
    funcionario_administrativo fa ON av.id_funcionario = fa.id_funcionario
JOIN
    usuario u ON fa.id_user = u.id_user
ORDER BY
    av.timestamp_criacao DESC
LIMIT 5;