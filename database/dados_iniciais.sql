CREATE DATABASE biblioteca_1ano;
USE biblioteca_1ano;

#Criando usuário
CREATE USER 'biblioteca_user1'@'localhost' IDENTIFIED BY 'projeto1';

#Dar Permissão ao usuário
GRANT ALL PRIVILEGES
ON biblioteca_1ano.*
TO 'biblioteca_user1'@'localhost';

#Atualiza Permissão
FLUSH PRIVILEGES;

#Visualizar todas as bases existentes
SHOW DATABASES;

#Visualizar todos os usuários
SELECT user FROM mysql.user;

#Criação da tabela de Aluno
CREATE TABLE aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    serie VARCHAR(20) NOT NULL,
    turma VARCHAR(20) NOT NULL,
    telefone VARCHAR(20)
);

#Criação da tabela de Livro
CREATE TABLE livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    status VARCHAR(20) NOT NULL DEFAULT 'Disponível'
);

#Criação da tabela de Professor
CREATE TABLE professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL
);

#Criação da tabela de Bibliotecário
CREATE TABLE bibliotecario (
    id_bibliotecario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

#Criação da tabela de Empréstimo
CREATE TABLE emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_livro INT NOT NULL,
    id_bibliotecario INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_prevista_devolucao DATE NOT NULL,
    data_devolucao DATE,
    status VARCHAR(20) NOT NULL DEFAULT 'Emprestado',

    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro),
    FOREIGN KEY (id_bibliotecario) REFERENCES bibliotecario(id_bibliotecario)
);

#Criação da tabela Usuário
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL,
    perfil VARCHAR(30) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Ativo',
    id_aluno INT NULL,
    id_professor INT NULL,
    id_bibliotecario INT NULL,

    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor),
    FOREIGN KEY (id_bibliotecario) REFERENCES bibliotecario(id_bibliotecario)
);

#Inserindo alunos
INSERT INTO aluno(nome, serie, turma, telefone) VALUES
('jordana', '1º ano', '1b', '(44) 1232-3467'),
('maria eduarda', '1º ano', '1ºb', '(44) 2033-2167'),
('kaua henrique', '1º ano', '1ºb', '(44) 9809-3234'),
('murilo ferreira', '1º ano', '1ºb', '(44) 3244-7768'),
('pedro henrique', '1º ano', '1ºb', '(44) 4453-2293');

SELECT * FROM aluno;

#Inserindo bibliotecários
INSERT INTO bibliotecario(nome, email) VALUES
('jessica', 'jessica@gmail.com'),
('roger', 'roger@gmail.com'),
('regina', 'regina@gmail.com'),
('cleber', 'cleber@gmail.com'),
('pedro', 'pedro@gmail.com');

SELECT * FROM bibliotecario;

#Inserindo livros
INSERT INTO livro(titulo, autor, categoria, status) VALUES
('A Metamorfose', 'Franz Kafka', 'Ficção', 'Disponível'),
('Cem Anos de Solidão', 'Gabriel García Márquez', 'Realismo mágico', 'Disponível'),
('O Alienista', 'Machado de Assis', 'Sátira', 'Indisponível'),
('Capitães da Areia', 'Jorge Amado', 'Romance', 'Disponível'),
('A Hora da Estrela', 'Clarice Lispector', 'Drama', 'Disponível');

SELECT * FROM livro;

#Inserindo professores
INSERT INTO professor(nome, telefone, email) VALUES
('Carlos Oliveira', '(41) 99999-1234', 'carlos.oliveira@email.com'),
('Mariana Santos', '(41) 98888-5678', 'mariana.santos@email.com'),
('João Pereira', '(41) 97777-9012', 'joao.pereira@email.com'),
('Ana Carolina Lima', '(41) 96666-3456', 'ana.lima@email.com'),
('Rafael Souza', '(41) 95555-7890', 'rafael.souza@email.com');

SELECT * FROM professor;

#Inserindo empréstimos
INSERT INTO emprestimo
(data_emprestimo, data_devolucao, data_prevista_devolucao, status, id_aluno, id_livro, id_bibliotecario)
VALUES
('2026-08-01', '2026-08-07', '2026-08-08', 'Devolvido', 1, 1, 3),
('2026-08-03', NULL, '2026-08-10', 'Em andamento', 4, 2, 1),
('2026-08-05', '2026-08-12', '2026-08-12', 'Devolvido', 2, 3, 2),
('2026-08-08', NULL, '2026-08-15', 'Atrasado', 3, 4, 2),
('2026-08-10', NULL, '2026-08-17', 'Em andamento', 5, 5, 1);

SELECT * FROM emprestimo;

#Inserindo usuários
INSERT INTO usuario
(nome, email, senha, perfil, status, id_aluno, id_professor, id_bibliotecario)
VALUES
('jordana', 'jordana@gmail.com', '123456', 'Aluno', 'Ativo', 1, NULL, NULL),
('maria eduarda', 'maria.eduarda@gmail.com', '123456', 'Aluno', 'Ativo', 2, NULL, NULL),
('kaua henrique', 'kaua.henrique@gmail.com', '123456', 'Aluno', 'Ativo', 3, NULL, NULL),
('murilo ferreira', 'murilo.ferreira@gmail.com', '123456', 'Aluno', 'Ativo', 4, NULL, NULL),
('pedro henrique', 'pedro.henrique@gmail.com', '123456', 'Aluno', 'Ativo', 5, NULL, NULL),

('carlos oliveira', 'carlos.oliveira@email.com', '123456', 'Professor', 'Ativo', NULL, 1, NULL),
('mariana santos', 'mariana.santos@email.com', '123456', 'Professor', 'Ativo', NULL, 2, NULL),
('joao pereira', 'joao.pereira@email.com', '123456', 'Professor', 'Ativo', NULL, 3, NULL),
('ana carolina lima', 'ana.lima@email.com', '123456', 'Professor', 'Ativo', NULL, 4, NULL),
('rafael souza', 'rafael.souza@email.com', '123456', 'Professor', 'Ativo', NULL, 5, NULL),

('jessica', 'jessica@gmail.com', '123456', 'Bibliotecario', 'Ativo', NULL, NULL, 1),
('roger', 'roger@gmail.com', '123456', 'Bibliotecario', 'Ativo', NULL, NULL, 2),
('regina', 'regina@gmail.com', '123456', 'Bibliotecario', 'Ativo', NULL, NULL, 3),
('cleber', 'cleber@gmail.com', '123456', 'Bibliotecario', 'Ativo', NULL, NULL, 4),
('pedro', 'pedro@gmail.com', '123456', 'Bibliotecario', 'Ativo', NULL, NULL, 5);

SELECT * FROM usuario;
