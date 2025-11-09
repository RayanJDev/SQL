create database ex;
-- 1. Criação de tabela autores
create table autores(
	id_autor int auto_increment primary key,
    nome varchar(100) not null,
    nacionalidade varchar(50)
);

-- 2. Criação da tabela livros
create table livros(
	id_livros int auto_increment primary key,
	nomeLivros varchar(100),
	id_autor int not null,
	ano_publicacao int,
    titulo varchar(120) not null,
    constraint fk_livro_autor
    foreign key (id_autor)
    references autores(id_autor)
    on delete cascade
    on update cascade
);

-- 3. Criação da tabela Emprestimos
create table emprestimos(
	id_emprestimos int auto_increment primary key,
	id_livros int,
	nome_usuario varchar(100) not null,
	data_emprestimo date,
	data_devolucao date,
	constraint fk_emprestimo_livro
		foreign key(id_livros)
        references livros(id_livros)
        on delete cascade
        on update cascade
);

-- 4. Inserindo dados de teste
-- Autores
Insert Into autores (nome, nacionalidade) values
('Machado de Assis', 'Brasileiro'),
('Clarice Lispector', 'Brasileira');

-- Livros
insert into livros (titulo, id_autor, ano_publicacao) values
('Dom Casimiro', 1 , 1899),
('O Cortiço', 1, 1890),
('A hora da Estrela', 2, 1977);

-- Emprestimos
insert into emprestimos (id_livros, nome_usuario, data_devolucao) values
(1,'Joao Silva', '2025-09-15', '2025-09-29'),
(1,'Maria Santos', '2025-10-15', '2025-10-15'),
(2,'Pedro Costa', '2025-09-20', '2025-10-04'),
(3,'Ana Oliveira', '2025-10-02', '2025-10-16');

-- INSIRA A TABELA COM NOME EDITORA
create table editora(
id_editora int primary key auto_increment,
id_livros int,
id_emprestimos int,
nome_editora varchar(65) not null,
constraint fk_livros
	foreign key(id_livros)
    references livros(id_livros)
    on delete cascade
    on update cascade
);

-- 5. Verificar os dados iniciais

select * from autores;
select * from livros;
select * from emprestimos;

update autores set id_autor = 10 where id_autor = 1;
update livros set id_livros = 100 where id_livros = 1;
delete from autores where id_autor = 2;

