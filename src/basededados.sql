-- Hélio Márcio Cabral Santos - 14577862
-- Gabriel Martins Monteiro - 14572099
-- Andrey Cortez Rufino - 11819487
-- Pedro Louro Fernandes - 13672446

-- Garante um estado limpo (APAGA TODOS OS DADOS)
DROP TABLE IF EXISTS mensagem_destinatario, mensagem_remetente, curso_requisito_curso, disciplina_requisito_curso, regra_curso, material_didatico_disciplina, curso_infra, avaliacao_professor, matricula, responsavel_disciplina, composicao_curso, aviso, disciplina, curso, departamento, funcionario_administrativo, professor, aluno, usuario, mensagem, material_didatico, regra, infraestrutura, unidade CASCADE;

-- =====================================================================
-- Criação das tabelas
-- =====================================================================

CREATE TABLE unidade (
	id_unidade BIGSERIAL PRIMARY KEY,
	cidade VARCHAR(100) NOT NULL,
	estado VARCHAR(50) NOT NULL,
	pais VARCHAR(50) NOT NULL,
	predio_bloco VARCHAR(100) NOT NULL
);

CREATE TABLE infraestrutura (
	id_infra BIGSERIAL PRIMARY KEY,
	nome VARCHAR(150) NOT NULL UNIQUE,
	descricao TEXT
);

CREATE TABLE regra (
	id_regra BIGSERIAL PRIMARY KEY,
	nome VARCHAR(150) NOT NULL UNIQUE,
	descricao TEXT NOT NULL
);

CREATE TABLE material_didatico (
	id_material BIGSERIAL PRIMARY KEY,
	nome VARCHAR(150) NOT NULL,
	descricao TEXT
);

CREATE TABLE mensagem (
	id_mensagem BIGSERIAL PRIMARY KEY,
	timestamp_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	texto_mensagem TEXT NOT NULL
);

CREATE TABLE usuario (
	id_user BIGSERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	sobrenome VARCHAR(100) NOT NULL,
	data_nascimento DATE NOT NULL,
	sexo CHAR(1),
	telefone VARCHAR(20),
	email VARCHAR(150) NOT NULL UNIQUE,
	senha VARCHAR(255) NOT NULL,
	endereco TEXT,
	tipo_usuario VARCHAR(20) NOT NULL CHECK (tipo_usuario IN ('aluno', 'professor', 'admin')),
	id_unidade BIGINT NOT NULL,
	CONSTRAINT fk_usuario_unidade FOREIGN KEY (id_unidade) REFERENCES unidade(id_unidade)
);

CREATE TABLE aluno (
	id_aluno BIGSERIAL PRIMARY KEY,
	id_user BIGINT NOT NULL UNIQUE,
	CONSTRAINT fk_aluno_usuario FOREIGN KEY (id_user) REFERENCES usuario(id_user) ON DELETE CASCADE
);

CREATE TABLE professor (
	id_professor BIGSERIAL PRIMARY KEY,
	area_especializacao VARCHAR(100),
	titulacao VARCHAR(100),
	chefe_dept_sn BOOLEAN NOT NULL DEFAULT FALSE,
	id_user BIGINT NOT NULL UNIQUE,
	CONSTRAINT fk_professor_usuario FOREIGN KEY (id_user) REFERENCES usuario(id_user) ON DELETE CASCADE
);

CREATE TABLE funcionario_administrativo (
	id_funcionario BIGSERIAL PRIMARY KEY,
	id_user BIGINT NOT NULL UNIQUE,
	CONSTRAINT fk_func_admin_usuario FOREIGN KEY (id_user) REFERENCES usuario(id_user) ON DELETE CASCADE
);

CREATE TABLE departamento (
	codigo_departamento VARCHAR(10) PRIMARY KEY,
	nome_departamento VARCHAR(150) NOT NULL UNIQUE,
	professor_responsavel BIGINT UNIQUE,
	CONSTRAINT fk_depto_professor FOREIGN KEY (professor_responsavel) REFERENCES professor(id_professor)
);

CREATE TABLE curso (
	codigo_curso VARCHAR(10) PRIMARY KEY,
	nome VARCHAR(150) NOT NULL,
	nivel_ensino VARCHAR(50),
	departamento VARCHAR(10) NOT NULL,
	carga_horaria_total INT,
	numero_vagas INT,
	ementa TEXT,
	sala_aula_padrao VARCHAR(50),
	CONSTRAINT fk_curso_departamento FOREIGN KEY (departamento) REFERENCES departamento(codigo_departamento)
);

CREATE TABLE disciplina (
	codigo_disciplina VARCHAR(10) PRIMARY KEY,
	nome_disciplina VARCHAR(150) NOT NULL,
	aulas_semanais INT,
	capacidade_turma INT,
	n_alunos_matriculados INT DEFAULT 0,
	id_unidade BIGINT NOT NULL,
	CONSTRAINT fk_disciplina_unidade FOREIGN KEY (id_unidade) REFERENCES unidade(id_unidade)
);

CREATE TABLE aviso (
	id_aviso BIGSERIAL PRIMARY KEY,
	texto_aviso TEXT NOT NULL,
	timestamp_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	id_funcionario BIGINT NOT NULL,
	CONSTRAINT fk_aviso_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionario_administrativo(id_funcionario)
);

CREATE TABLE composicao_curso (
	codigo_curso VARCHAR(10) NOT NULL,
	codigo_disciplina VARCHAR(10) NOT NULL,
	PRIMARY KEY (codigo_curso, codigo_disciplina),
	CONSTRAINT fk_cc_curso FOREIGN KEY (codigo_curso) REFERENCES curso(codigo_curso) ON DELETE CASCADE,
	CONSTRAINT fk_cc_disciplina FOREIGN KEY (codigo_disciplina) REFERENCES disciplina(codigo_disciplina) ON DELETE CASCADE
);

CREATE TABLE responsavel_disciplina (
	id_professor BIGINT NOT NULL,
	codigo_disciplina VARCHAR(10) NOT NULL UNIQUE,
	PRIMARY KEY (id_professor, codigo_disciplina),
	CONSTRAINT fk_rd_professor FOREIGN KEY (id_professor) REFERENCES professor(id_professor),
	CONSTRAINT fk_rd_disciplina FOREIGN KEY (codigo_disciplina) REFERENCES disciplina(codigo_disciplina)
);

CREATE TABLE matricula (
	id_aluno BIGINT NOT NULL,
	codigo_disciplina VARCHAR(10) NOT NULL,
	data_efetivacao DATE NOT NULL,
	status VARCHAR(50) NOT NULL DEFAULT 'Cursando',
	notas NUMERIC(4,2),
	avaliacao_aluno INT,
	comentario_aluno TEXT,
	bolsa_de_estudos BOOLEAN DEFAULT FALSE,
	desconto_aplicado NUMERIC(5,2),
	confirmada BOOLEAN DEFAULT TRUE,
	PRIMARY KEY (id_aluno, codigo_disciplina, data_efetivacao),
	CONSTRAINT fk_matricula_aluno FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
	CONSTRAINT fk_matricula_disciplina FOREIGN KEY (codigo_disciplina) REFERENCES disciplina(codigo_disciplina)
);

CREATE TABLE avaliacao_professor (
	id_avaliacao BIGSERIAL PRIMARY KEY,
	id_aluno BIGINT NOT NULL,
	id_professor BIGINT NOT NULL,
	avaliacao_didatica INT,
	avaliacao_material INT,
	avaliacao_relevancia INT,
	avaliacao_infraestrutura INT,
	comentario_aluno TEXT,
	CONSTRAINT fk_aval_aluno FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
	CONSTRAINT fk_aval_professor FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

CREATE TABLE curso_infra (
	codigo_curso VARCHAR(10) NOT NULL,
	id_infra BIGINT NOT NULL,
	PRIMARY KEY (codigo_curso, id_infra),
	CONSTRAINT fk_ci_curso FOREIGN KEY (codigo_curso) REFERENCES curso(codigo_curso),
	CONSTRAINT fk_ci_infra FOREIGN KEY (id_infra) REFERENCES infraestrutura(id_infra)
);

CREATE TABLE material_didatico_disciplina (
	codigo_disciplina VARCHAR(10) NOT NULL,
	id_material BIGINT NOT NULL,
	PRIMARY KEY (codigo_disciplina, id_material),
	CONSTRAINT fk_mdd_disciplina FOREIGN KEY (codigo_disciplina) REFERENCES disciplina(codigo_disciplina),
	CONSTRAINT fk_mdd_material FOREIGN KEY (id_material) REFERENCES material_didatico(id_material)
);

CREATE TABLE regra_curso (
	codigo_curso VARCHAR(10) NOT NULL,
	id_regra BIGINT NOT NULL,
	PRIMARY KEY (codigo_curso, id_regra),
	CONSTRAINT fk_rc_curso FOREIGN KEY (codigo_curso) REFERENCES curso(codigo_curso),
	CONSTRAINT fk_rc_regra FOREIGN KEY (id_regra) REFERENCES regra(id_regra)
);

CREATE TABLE disciplina_requisito_curso (
	codigo_curso VARCHAR(10) NOT NULL,
	codigo_disciplina VARCHAR(10) NOT NULL,
	PRIMARY KEY (codigo_curso, codigo_disciplina),
	CONSTRAINT fk_drc_curso FOREIGN KEY (codigo_curso) REFERENCES curso(codigo_curso),
	CONSTRAINT fk_drc_disciplina FOREIGN KEY (codigo_disciplina) REFERENCES disciplina(codigo_disciplina)
);

CREATE TABLE curso_requisito_curso (
	codigo_curso_requisitante VARCHAR(10) NOT NULL,
	codigo_curso_requisitado VARCHAR(10) NOT NULL,
	PRIMARY KEY (codigo_curso_requisitante, codigo_curso_requisitado),
	CONSTRAINT fk_crc_requisitante FOREIGN KEY (codigo_curso_requisitante) REFERENCES curso(codigo_curso),
	CONSTRAINT fk_crc_requisitado FOREIGN KEY (codigo_curso_requisitado) REFERENCES curso(codigo_curso)
);

CREATE TABLE mensagem_remetente (
	id_mensagem BIGINT NOT NULL,
	id_professor BIGINT NOT NULL,
	PRIMARY KEY (id_mensagem, id_professor),
	CONSTRAINT fk_mr_mensagem FOREIGN KEY (id_mensagem) REFERENCES mensagem(id_mensagem),
	CONSTRAINT fk_mr_professor FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

CREATE TABLE mensagem_destinatario (
	id_mensagem BIGINT NOT NULL,
	id_aluno BIGINT NOT NULL,
	PRIMARY KEY (id_mensagem, id_aluno),
	CONSTRAINT fk_md_mensagem FOREIGN KEY (id_mensagem) REFERENCES mensagem(id_mensagem),
	CONSTRAINT fk_md_aluno FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);

-- Importação dos dados fictícios
\i dados_ficticios.sql