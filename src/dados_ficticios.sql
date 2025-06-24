-- Hélio Márcio Cabral Santos - 14577862
-- Gabriel Martins Monteiro - 14572099
-- Andrey Cortez Rufino - 11819487
-- Pedro Louro Fernandes - 13672446

-- =====================================================================
-- 1. Tabelas que não dependem ou dependem minimamente de outras
-- =====================================================================

-- Tabela: unidade
INSERT INTO unidade (id_unidade, cidade, estado, pais, predio_bloco) VALUES
(1, 'São Carlos', 'SP', 'Brasil', 'Bloco A - Central'),
(2, 'São Paulo', 'SP', 'Brasil', 'Edifício Principal'),
(3, 'Ribeirão Preto', 'SP', 'Brasil', 'Campus II');

-- Tabela: infraestrutura
INSERT INTO infraestrutura (id_infra, nome, descricao) VALUES
(1, 'Laboratório de Computação I', 'Equipado com 40 computadores Dell i7, 16GB RAM'),
(2, 'Biblioteca Central', 'Acervo com mais de 50.000 volumes'),
(3, 'Anfiteatro Principal', 'Capacidade para 500 pessoas, com equipamento multimídia'),
(4, 'Laboratório de Redes', 'Equipamentos Cisco para aulas práticas de redes'),
(5, 'Estúdio de Gravação', 'Utilizado para produção de material didático online');

-- Tabela: regra
INSERT INTO regra (id_regra, nome, descricao) VALUES
(1, 'Norma de Avaliação', 'A média final é composta por 2 provas e 1 trabalho.'),
(2, 'Requisito de Frequência', 'Frequência mínima de 75% para aprovação.'),
(3, 'Trancamento de Matrícula', 'O trancamento só pode ser solicitado até a 8ª semana de aula.');

-- Tabela: material_didatico
INSERT INTO material_didatico (id_material, nome, descricao) VALUES
(1, 'Slides - Aula 1 BD', 'Introdução a Bancos de Dados'),
(2, 'Lista de Exercícios - Cálculo I', 'Exercícios sobre limites e derivadas'),
(3, 'Artigo - Redes Neurais', 'Artigo científico sobre Deep Learning'),
(4, 'E-book - Sistemas Operacionais Modernos', 'Livro de Andrew S. Tanenbaum');

-- Tabela: mensagem
INSERT INTO mensagem (id_mensagem, timestamp_criacao, texto_mensagem) VALUES
(1, '2024-05-10 14:30:00', 'Olá, pessoal. A data de entrega do projeto final de Banco de Dados foi prorrogada. Aproveitem o tempo extra!'),
(2, '2024-05-12 11:00:00', 'Mariana, sua nota na P1 de IA já está disponível no sistema. Por favor, verifique.'),
(3, '2024-05-13 09:15:00', 'Lembrete: A aula de reposição de Circuitos Elétricos será no laboratório de Redes (4) esta semana.');

-- Tabela: usuario (Superclasse)
INSERT INTO usuario (id_user, nome, sobrenome, data_nascimento, sexo, telefone, email, senha, endereco, tipo_usuario, id_unidade) VALUES
-- Alunos (1-25)
(1, 'Carlos', 'Silva', '2002-05-15', 'M', '16991112221', 'carlos.silva@email.com', 'senha123', 'Rua 1, 100', 'aluno', 1),
(2, 'Ana', 'Pereira', '2003-02-20', 'F', '16991112222', 'ana.pereira@email.com', 'senha123', 'Rua 2, 200', 'aluno', 1),
(3, 'Bruno', 'Costa', '2002-11-30', 'M', '16991112223', 'bruno.costa@email.com', 'senha123', 'Rua 3, 300', 'aluno', 1),
(4, 'Mariana', 'Almeida', '2003-07-12', 'F', '16991112224', 'mariana.almeida@email.com', 'senha123', 'Rua 4, 400', 'aluno', 1),
(5, 'João', 'Ferreira', '2001-09-01', 'M', '16991112225', 'joao.ferreira@email.com', 'senha123', 'Rua 5, 500', 'aluno', 1),
(6, 'Beatriz', 'Gomes', '2002-04-18', 'F', '16991112226', 'beatriz.gomes@email.com', 'senha123', 'Rua 6, 600', 'aluno', 1),
(7, 'Lucas', 'Rodrigues', '2003-01-25', 'M', '16991112227', 'lucas.rodrigues@email.com', 'senha123', 'Rua 7, 700', 'aluno', 1),
(8, 'Laura', 'Martins', '2002-08-08', 'F', '16991112228', 'laura.martins@email.com', 'senha123', 'Rua 8, 800', 'aluno', 1),
(9, 'Guilherme', 'Alves', '2001-12-14', 'M', '16991112229', 'guilherme.alves@email.com', 'senha123', 'Rua 9, 900', 'aluno', 1),
(10, 'Sofia', 'Ribeiro', '2003-03-03', 'F', '16991112230', 'sofia.ribeiro@email.com', 'senha123', 'Rua 10, 1000', 'aluno', 1),
(11, 'Rafael', 'Carvalho', '2002-06-22', 'M', '11982223331', 'rafael.carvalho@email.com', 'senha123', 'Av. Paulista, 100', 'aluno', 2),
(12, 'Isabela', 'Monteiro', '2003-10-10', 'F', '11982223332', 'isabela.monteiro@email.com', 'senha123', 'Av. Paulista, 200', 'aluno', 2),
(13, 'Felipe', 'Barros', '2002-01-19', 'M', '11982223333', 'felipe.barros@email.com', 'senha123', 'Av. Paulista, 300', 'aluno', 2),
(14, 'Júlia', 'Nunes', '2001-05-27', 'F', '11982223334', 'julia.nunes@email.com', 'senha123', 'Av. Paulista, 400', 'aluno', 2),
(15, 'Daniel', 'Mendes', '2002-12-05', 'M', '11982223335', 'daniel.mendes@email.com', 'senha123', 'Av. Paulista, 500', 'aluno', 2),
(16, 'Manuela', 'Freitas', '2003-08-14', 'F', '16973334441', 'manuela.freitas@email.com', 'senha123', 'Rua do Café, 10', 'aluno', 3),
(17, 'André', 'Lima', '2002-03-21', 'M', '16973334442', 'andre.lima@email.com', 'senha123', 'Rua do Café, 20', 'aluno', 3),
(18, 'Lívia', 'Souza', '2003-09-09', 'F', '16973334443', 'livia.souza@email.com', 'senha123', 'Rua do Café, 30', 'aluno', 3),
(19, 'Vitor', 'Castro', '2001-07-30', 'M', '16973334444', 'vitor.castro@email.com', 'senha123', 'Rua do Café, 40', 'aluno', 3),
(20, 'Helena', 'Pinto', '2002-10-28', 'F', '16973334445', 'helena.pinto@email.com', 'senha123', 'Rua do Café, 50', 'aluno', 3),
(21, 'Pedro', 'Henrique', '2003-06-11', 'M', '16991112231', 'pedro.henrique@email.com', 'senha123', 'Rua 11, 1100', 'aluno', 1),
(22, 'Maria', 'Clara', '2002-09-05', 'F', '16991112232', 'maria.clara@email.com', 'senha123', 'Rua 12, 1200', 'aluno', 1),
(23, 'Davi', 'Luiz', '2001-04-02', 'M', '11982223336', 'davi.luiz@email.com', 'senha123', 'Av. Faria Lima, 10', 'aluno', 2),
(24, 'Lorena', 'Dias', '2003-11-17', 'F', '11982223337', 'lorena.dias@email.com', 'senha123', 'Av. Faria Lima, 20', 'aluno', 2),
(25, 'Heitor', 'Moraes', '2002-08-23', 'M', '16973334446', 'heitor.moraes@email.com', 'senha123', 'Rua dos Bandeirantes, 1', 'aluno', 3),
-- Professores (26-35)
(26, 'Marcos', 'Oliveira', '1980-03-10', 'M', '16992223331', 'marcos.oliveira@email.com', 'senha456', 'Av. Trabalhador, 10', 'professor', 1),
(27, 'Fernanda', 'Ribeiro', '1985-08-22', 'F', '16992223332', 'fernanda.ribeiro@email.com', 'senha456', 'Av. Trabalhador, 20', 'professor', 1),
(28, 'Ricardo', 'Santana', '1975-01-15', 'M', '16992223333', 'ricardo.santana@email.com', 'senha456', 'Av. Trabalhador, 30', 'professor', 1),
(29, 'Camila', 'Nogueira', '1988-12-01', 'F', '11972224441', 'camila.nogueira@email.com', 'senha456', 'Rua Augusta, 101', 'professor', 2),
(30, 'Sérgio', 'Teixeira', '1978-06-25', 'M', '11972224442', 'sergio.teixeira@email.com', 'senha456', 'Rua Augusta, 202', 'professor', 2),
(31, 'Patrícia', 'Azevedo', '1982-09-18', 'F', '16962225551', 'patricia.azevedo@email.com', 'senha456', 'Av. 9 de Julho, 30', 'professor', 3),
(32, 'Roberto', 'Moreira', '1970-11-05', 'M', '16962225552', 'roberto.moreira@email.com', 'senha456', 'Av. 9 de Julho, 40', 'professor', 3),
(33, 'Letícia', 'Barbosa', '1990-04-30', 'F', '16992223334', 'leticia.barbosa@email.com', 'senha456', 'Av. Trabalhador, 40', 'professor', 1),
(34, 'Alexandre', 'Pires', '1976-07-14', 'M', '11972224443', 'alexandre.pires@email.com', 'senha456', 'Rua Augusta, 303', 'professor', 2),
(35, 'Vanessa', 'Camargo', '1983-02-09', 'F', '16962225553', 'vanessa.camargo@email.com', 'senha456', 'Av. 9 de Julho, 50', 'professor', 3),
-- Funcionários Administrativos (36-40)
(36, 'Juliana', 'Borges', '1992-07-20', 'F', '16993334441', 'juliana.borges@email.com', 'senha789', 'Rua da Reitoria, 1', 'admin', 1),
(37, 'Márcio', 'Garcia', '1987-05-19', 'M', '11983335551', 'marcio.garcia@email.com', 'senha789', 'Praça da Sé, 2', 'admin', 2),
(38, 'Elaine', 'Lopes', '1995-10-02', 'F', '16973336661', 'elaine.lopes@email.com', 'senha789', 'Largo do Rosário, 3', 'admin', 3),
(39, 'Fernando', 'Siqueira', '1980-12-12', 'M', '16993334442', 'fernando.siqueira@email.com', 'senha789', 'Rua da Reitoria, 4', 'admin', 1),
(40, 'Cristina', 'Melo', '1998-01-28', 'F', '11983335552', 'cristina.melo@email.com', 'senha789', 'Praça da Sé, 5', 'admin', 2);

-- =====================================================================
-- 2. Tabelas que especializam usuário
-- =====================================================================

-- Tabela: aluno
INSERT INTO aluno (id_aluno, id_user) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(11, 11), (12, 12), (13, 13), (14, 14), (15, 15), (16, 16), (17, 17), (18, 18), (19, 19), (20, 20),
(21, 21), (22, 22), (23, 23), (24, 24), (25, 25);

-- Tabela: professor
INSERT INTO professor (id_professor, area_especializacao, titulacao, chefe_dept_sn, id_user) VALUES
(1, 'Banco de Dados', 'Doutorado', TRUE, 26),
(2, 'Inteligencia Artificial', 'Doutorado', FALSE, 27),
(3, 'Engenharia de Software', 'Mestrado', FALSE, 28),
(4, 'Redes de Computadores', 'Doutorado', TRUE, 29),
(5, 'Sistemas Operacionais', 'PhD', FALSE, 30),
(6, 'Calculo e Algebra', 'Doutorado', TRUE, 31),
(7, 'Fisica Quantica', 'PhD', FALSE, 32),
(8, 'Estatistica Aplicada', 'Mestrado', FALSE, 33),
(9, 'Seguranca da Informacao', 'Mestrado', FALSE, 34),
(10, 'Direito Digital', 'Especializacao', FALSE, 35);

-- Tabela: funcionario_administrativo
INSERT INTO funcionario_administrativo (id_funcionario, id_user) VALUES
(1, 36), (2, 37), (3, 38), (4, 39), (5, 40);


-- =====================================================================
-- 3. Tabelas que se relacionam com as entidades base/especializadas
-- =====================================================================

-- Tabela: departamento
INSERT INTO departamento (codigo_departamento, nome_departamento, professor_responsavel) VALUES
('SCC', 'Departamento de Ciência da Computação', 1),
('SEL', 'Departamento de Engenharia Elétrica', 4),
('SME', 'Departamento de Matemática e Estatística', 6);

-- Tabela: curso
INSERT INTO curso (codigo_curso, nome, nivel_ensino, departamento, carga_horaria_total, numero_vagas, ementa, sala_aula_padrao) VALUES
('BCC', 'Ciência da Computação', 'Graduação', 'SCC', 3200, 50, 'Ementa completa do curso de BCC...', 'Sala 3-001'),
('EESC', 'Engenharia Elétrica', 'Graduação', 'SEL', 3800, 60, 'Ementa completa do curso de EESC...', 'Sala 5-102'),
('MAT', 'Matemática Aplicada', 'Graduação', 'SME', 2800, 40, 'Ementa completa do curso de MAT...', 'Sala 1-203'),
('PPG-CC', 'Pós-Graduação em Ciência da Computação', 'Pós-Graduação', 'SCC', 800, 20, 'Ementa do programa de pós...', 'Sala 6-004');

-- Tabela: disciplina
INSERT INTO disciplina (codigo_disciplina, nome_disciplina, aulas_semanais, capacidade_turma, n_alunos_matriculados, id_unidade) VALUES
('SSC0503', 'Banco de Dados', 4, 60, 0, 1),
('SSC0650', 'Engenharia de Software I', 4, 60, 0, 1),
('SSC0710', 'Inteligência Artificial', 4, 50, 0, 1),
('SEL0333', 'Circuitos Elétricos', 6, 70, 0, 2),
('SEL0421', 'Sistemas de Controle', 4, 70, 0, 2),
('SME0120', 'Cálculo I', 6, 100, 0, 3),
('SME0340', 'Álgebra Linear', 4, 100, 0, 3),
('SME0500', 'Estatística I', 4, 80, 0, 3);

-- Tabela: aviso
INSERT INTO aviso (id_aviso, texto_aviso, timestamp_criacao, id_funcionario) VALUES
(1, 'O prazo para trancamento de matrícula foi prorrogado.', '2024-04-10 09:00:00', 1),
(2, 'A biblioteca não funcionará no próximo feriado.', '2024-05-28 15:30:00', 2),
(3, 'Manutenção programada nos sistemas acadêmicos no sábado.', '2024-06-01 11:00:00', 1);


-- =====================================================================
-- 4. Inserção em tabelas associativas e de relacionamento (M:N)
-- =====================================================================

-- Tabela: matricula (Entidade Associativa)
INSERT INTO matricula (id_aluno, codigo_disciplina, data_efetivacao, status, notas, avaliacao_aluno, comentario_aluno, bolsa_de_estudos, desconto_aplicado, confirmada) VALUES
(1, 'SSC0503', '2024-02-15', 'Cursando', NULL, NULL, NULL, FALSE, 0.0, TRUE),
(1, 'SME0120', '2024-02-15', 'Cursando', NULL, NULL, NULL, FALSE, 0.0, TRUE),
(2, 'SSC0503', '2024-02-15', 'Cursando', NULL, NULL, NULL, TRUE, 50.0, TRUE),
(2, 'SME0120', '2024-02-15', 'Cursando', NULL, NULL, NULL, TRUE, 50.0, TRUE),
(3, 'SSC0650', '2024-02-16', 'Aprovado', '8.5', 9, 'Ótima disciplina', FALSE, 0.0, TRUE),
(4, 'SSC0710', '2024-02-16', 'Cursando', NULL, NULL, NULL, FALSE, 0.0, TRUE),
(5, 'SME0120', '2023-08-01', 'Reprovado', '4.0', 5, 'Professor corre muito com a matéria', FALSE, 0.0, TRUE),
(11, 'SEL0333', '2024-02-18', 'Cursando', NULL, NULL, NULL, FALSE, 0.0, TRUE),
(12, 'SEL0333', '2024-02-18', 'Cursando', NULL, NULL, NULL, FALSE, 0.0, TRUE),
(16, 'SME0120', '2024-02-19', 'Cursando', NULL, NULL, NULL, FALSE, 0.0, TRUE),
(17, 'SME0340', '2024-02-19', 'Cursando', NULL, NULL, NULL, FALSE, 0.0, TRUE),
(20, 'SME0500', '2024-02-19', 'Cancelado', NULL, NULL, 'Cancelei por excesso de carga horária', FALSE, 0.0, FALSE),
(1, 'SSC0650', '2024-02-15', 'Cursando', NULL, NULL, NULL, FALSE, 0.0, TRUE),
(2, 'SSC0650', '2024-02-15', 'Cursando', NULL, NULL, NULL, TRUE, 50.0, TRUE),
(6, 'SSC0503', '2024-02-20', 'Cursando', NULL, NULL, NULL, false, 0, true),
(7, 'SME0120', '2024-02-20', 'Cursando', NULL, NULL, NULL, false, 0, true),
(8, 'SSC0503', '2024-02-21', 'Cursando', NULL, NULL, NULL, true, 25.0, true),
(9, 'SME0120', '2024-02-21', 'Aprovado', '9.0', 10, 'Excelente', false, 0, true),
(10, 'SME0340', '2024-02-21', 'Reprovado', '3.5', 4, 'Difícil', false, 0, true),
(13, 'SEL0421', '2024-02-22', 'Cursando', NULL, NULL, NULL, false, 0, true),
(14, 'SEL0421', '2024-02-22', 'Cursando', NULL, NULL, NULL, false, 0, true),
(15, 'SEL0333', '2023-08-10', 'Aprovado', '7.0', 7, 'Bom', false, 0, true),
(18, 'SME0340', '2024-02-25', 'Cursando', NULL, NULL, NULL, false, 0, true),
(19, 'SME0500', '2024-02-25', 'Cursando', NULL, NULL, NULL, false, 0, true),
(21, 'SSC0503', '2024-02-28', 'Cursando', NULL, NULL, NULL, false, 0, true);

-- Tabela: avaliacao_professor (Entidade Associativa)
INSERT INTO avaliacao_professor (id_aluno, id_professor, avaliacao_didatica, avaliacao_material, avaliacao_relevancia, avaliacao_infraestrutura, comentario_aluno) VALUES
(3, 3, 9, 8, 9, 7, 'O professor domina o conteúdo e é muito didático.'),
(5, 6, 6, 7, 8, 9, 'A matéria é complexa e o ritmo foi um pouco rápido demais.'),
(9, 6, 10, 10, 10, 9, 'Melhor professor de Cálculo, muito atencioso.'),
(15, 4, 8, 8, 9, 8, 'Boas aulas práticas no laboratório.');

-- Tabela: responsavel_disciplina (Relacionamento Professor <-> Disciplina)
INSERT INTO responsavel_disciplina (id_professor, codigo_disciplina) VALUES
(1, 'SSC0503'), (3, 'SSC0650'), (2, 'SSC0710'),
(4, 'SEL0333'), (5, 'SEL0421'), (6, 'SME0120'),
(6, 'SME0340'), (8, 'SME0500');

-- Tabela: composicao_curso (Relacionamento Curso <-> Disciplina)
INSERT INTO composicao_curso (codigo_curso, codigo_disciplina) VALUES
('BCC', 'SSC0503'), ('BCC', 'SSC0650'), ('BCC', 'SSC0710'),
('BCC', 'SME0120'), ('BCC', 'SME0340'),
('EESC', 'SEL0333'), ('EESC', 'SEL0421'), ('EESC', 'SME0120'),
('MAT', 'SME0120'), ('MAT', 'SME0340'), ('MAT', 'SME0500'),
('PPG-CC', 'SSC0710');

-- Tabela: curso_infra (Relacionamento Curso <-> Infraestrutura)
INSERT INTO curso_infra (codigo_curso, id_infra) VALUES
('BCC', 1), ('BCC', 2), ('BCC', 4),
('EESC', 2), ('EESC', 3);

-- Tabela: material_didatico_disciplina (Relacionamento Disciplina <-> Material)
INSERT INTO material_didatico_disciplina (codigo_disciplina, id_material) VALUES
('SSC0503', 1), ('SSC0710', 3), ('SME0120', 2),
('SEL0421', 4);

-- Tabela: regra_curso (Relacionamento Regra <-> Curso)
INSERT INTO regra_curso (codigo_curso, id_regra) VALUES
('BCC', 1), ('BCC', 2),
('EESC', 1), ('EESC', 2),
('MAT', 1), ('MAT', 2),
('PPG-CC', 1), ('PPG-CC', 2), ('PPG-CC', 3);

-- Tabela: disciplina_requisito_curso (Relacionamento Disciplina -> Curso)
INSERT INTO disciplina_requisito_curso(codigo_curso, codigo_disciplina) VALUES
('BCC','SME0120'),
('EESC', 'SME0120');

-- Tabela: curso_requisito_curso (Relacionamento Curso -> Curso)
INSERT INTO curso_requisito_curso (codigo_curso_requisitante, codigo_curso_requisitado) VALUES
('PPG-CC', 'BCC');

-- Tabela: mensagem_remetente (Relacionamento Mensagem -> Professor)
INSERT INTO mensagem_remetente (id_mensagem, id_professor) VALUES
(1, 1),
(2, 2),
(3, 4);

-- Tabela: mensagem_destinatario (Relacionamento Mensagem -> Aluno)
INSERT INTO mensagem_destinatario (id_mensagem, id_aluno) VALUES
(1, 1),
(1, 2),
(1, 6),
(2, 4),
(3, 11);