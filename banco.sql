
#Criação da tabela Usuário
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL,
    perfil VARCHAR(30) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Ativo',
    id_aluno INT NOT NULL,
    id_professor INT NOT NULL,
    id_bibliotecario INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_professor ) REFERENCES professor(id_professor ),
    FOREIGN KEY (id_bibliotecario) REFERENCES bibliotecario(id_bibliotecario)
);

insert into aluno(nome, serie, turma, telefone) values
('jordana', '1º ano', '1b', '(44) 1232 3467'),
('maria eduarda', '1º ano' ,  '1ºb', '(44) 2033 2167'),
('kaua henrique', '1º ano', '1ºb', '(44) 9809 3234'),
('murilo ferreira', '1º ano', '1ºb', '(44) 3244 7768'),
('pedro henrique', '1º ano', '1ºb', '(44) 4453 2293');

select * from aluno;

insert into bibliotecario(nome, email) values
('jessica', 'jessica@gmail.com'),
('roger', 'roger@gmail.com'),
('regina', 'regina@gmail.com'),
('cleber', 'cleber@gmail.com'),
('pedro', 'pedro@gmail.com');

select * from bibliotecario;

insert into livro(titulo, autor, categoria, status) values
('A Metamorfose', 'Franz Kafka', 'Ficção', 'Disponível'),
('Cem Anos de Solidão', 'Gabriel García Márquez', 'Realismo mágico', 'Disponível'),
('O Alienista', 'Machado de Assis', 'Sátira', 'Indisponível'),
('Capitães da Areia', 'Jorge Amado', 'Romance', 'Disponível'),
('A Hora da Estrela', 'Clarice Lispector', 'Drama', 'Disponível');

select * from livro;

insert into professor(nome, telefone, email) values
('Carlos Oliveira', '(41) 99999-1234', 'carlos.oliveira@email.com'),
('Mariana Santos', '(41) 98888-5678', 'mariana.santos@email.com'),
('João Pereira', '(41) 97777-9012', 'joao.pereira@email.com'),
('Ana Carolina Lima', '(41) 96666-3456', 'ana.lima@email.com'),
('Rafael Souza', '(41) 95555-7890', 'rafael.souza@email.com');

select * from professor;

insert into emprestimo(data_emprestimo, data_devolucao, data_prevista_devolucao, status, id_aluno, id_livro, id_bibliotecario) values
('2026-08-01', '2026-08-07', '2026-08-08', 'Devolvido', null, null, 3),
('2026-08-03', NULL, '2026-08-10', 'Em andamento', 4, null, null),
('2026-08-05', '2026-08-12', '2026-08-12', 'Devolvido', null, null, 2),
('2026-08-08', NULL, '2026-08-15', 'Atrasado', null, null, 2),
('2026-08-10', NULL, '2026-08-17', 'Em andamento', null, 5, null);

select * from emprestimo;

ALTER TABLE usuario
MODIFY id_aluno INT NULL,
MODIFY id_professor INT NULL,
MODIFY id_bibliotecario INT NULL;
insert into usuario(nome, email, senha, perfil, status, id_aluno, id_professor, id_bibliotecario) values
('jordana', 'jordana@gmail.com', '123456', 'Aluno', 'Ativo', 1, null, null),
('maria eduarda', 'maria.eduarda@gmail.com', '123456', 'Aluno', 'Ativo', 2, null, null),
('kaua henrique', 'kaua.henrique@gmail.com', '123456', 'Aluno', 'Ativo', 3, null, null),
('murilo ferreira', 'murilo.ferreira@gmail.com', '123456', 'Aluno', 'Ativo', 4, null, null),
('pedro henrique', 'pedro.henrique@gmail.com', '123456', 'Aluno', 'Ativo', 5, null, null),

('carlos oliveira', 'carlos.oliveira@email.com', '123456', 'Professor', 'Ativo', null, 1, null),
('mariana santos', 'mariana.santos@email.com', '123456', 'Professor', 'Ativo', null, 2, null),
('joao pereira', 'joao.pereira@email.com', '123456', 'Professor', 'Ativo', null, 3, null),
('ana carolina lima', 'ana.lima@email.com', '123456', 'Professor', 'Ativo', null, 4, null),
('rafael souza', 'rafael.souza@email.com', '123456', 'Professor', 'Ativo', null, 5, null),

('jessica', 'jessica@gmail.com', '123456', 'Bibliotecario', 'Ativo', null, null, 1),
('roger', 'roger@gmail.com', '123456', 'Bibliotecario', 'Ativo', null, null, 2),
('regina', 'regina@gmail.com', '123456', 'Bibliotecario', 'Ativo', null, null, 3),
('cleber', 'cleber@gmail.com', '123456', 'Bibliotecario', 'Ativo', null, null, 4),
('pedro', 'pedro@gmail.com', '123456', 'Bibliotecario', 'Ativo', null, null, 5);
