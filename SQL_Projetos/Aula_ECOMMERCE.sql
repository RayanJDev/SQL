drop database if exists ecommerce_db;
create database if not exists ecommerce_db;
use ecommerce_db;
-- ENDEREÇOS
create table enderecos(
endereco_id int primary key auto_increment,
logradouro varchar(120),
numero varchar(15),
complemento varchar(60),
bairro varchar(50),
cidade varchar(60),
estado char(2),
cep varchar(12)
);

-- USUARIOS
create table usuarios(
usuario_id int primary key auto_increment,
nome varchar(100) not null,
email varchar(80) not null unique,
senha varchar(255) not null,
telefone varchar(20) not null,
tipo enum('cliente','clienteVip'),
data_cadastro datetime not null,
idEndereco int not null,
foreign key (idEndereco)
references enderecos(endereco_id)
);

-- CATEGORIAS
create table categorias(
categoria_id int primary key auto_increment,
nome varchar(60),
descricao varchar(255)
);

-- PRODUTOS
create table produtos(
produtos_id int primary key auto_increment,
descricao varchar(120) not null,
categoria_id int not null,
precoCompra decimal(10,2) not null,
precoVenda decimal(10,2) not  null,
ativo boolean default true,
foreign key (categoria_id) references categorias(categoria_id)
);
alter table produtos
add column estoque int not null;

-- FORNECEDORES
create table fornecedores(
fornecedor_id int primary key auto_increment,
nome varchar(100) not null,
cnpj varchar(18) not null,
telefone varchar(20) not null,
email varchar(80)not null unique,
enderecos_id int not null,
foreign key (enderecos_id) references enderecos(endereco_id)
);

-- VENDAS
create table vendas(
venda_id int primary key auto_increment,
usuario_id int not null,
dataCompra datetime default current_timestamp,
totalCompra decimal(10,2) not null,
foreign key (usuario_id) references usuarios(usuario_id)
);
create table itens_vendas(
itens_venda int primary key auto_increment,
idVenda int not null,
produto_id int not null,
quantidade int not null,
preco_unitario decimal(10,2) not null,
foreign key (produto_id) references produtos(produtos_id)
);
-- ENDERECOS

insert into enderecos (logradouro,numero,complemento,bairro,cidade,estado,cep) values
('rua','433','casa','bairro','Belo Horizonte','MG','30587-560'),
('rua','432','casa','bairro','Belo Horizonte','MG','30587-560'),
('morro','434','casa','bairro','Belo Horizonte','SP','30587-560'),
('rua','435','casa','bairro','Belo Horizonte','ES','30587-560'),
('palacio','436','casa','bairro','Belo Horizonte','SP','30587-560'),
('ladeira','437','casa','bairro','Belo Horizonte','RJ','30587-560');

-- USUARIOS
insert into usuarios (nome,email,senha,telefone,tipo,data_cadastro,idEndereco) values
('Rayan Rodrigues','re.ro.87@gmail.com','3214','(31)98799-0101','clienteVip','2025-01-02',1),
('Renata Rodrigues','rere.ro.87@gmail.com','3214','(31)98719-0101','cliente','2025-01-02',2),
('Marcelo Rodrigues','mar.ro.87@gmail.com','3214','(31)98729-0101','cliente','2025-01-02',3),
('Wellinton Oliveira','we.ro.87@gmail.com','3214','(31)98739-0101','clienteVip','2025-01-02',4),
('Amanda Alves','am.ro.87@gmail.com','3214','(31)98749-0101','clienteVip','2025-01-02',5);


-- CATEGORIAS
insert into categorias (nome, descricao) values
('Celulares','Smartphones e acessorios'),
('Notebooks','Notebooks e Ultrabooks'),
('TVs','Televisão variados'),
('Cameras','Fotografia'),
('Livros','Literatura');

-- PRODUTOS
insert into produtos (descricao,categoria_id,precoCompra, precoVenda,ativo,estoque) values
('Intel Celeron',1,200.36,301.43,true,20),
('Intel Celeron',2,200.36,301.43,true,20),
('Intel Celeron',3,200.36,301.43,true,20),
('Intel Celeron',4,200.36,301.43,true,20),
('Intel Celeron',5,200.36,301.43,true,20);

select count(*) from enderecos;
select cep from enderecos;
select nome from usuarios;
select sum(precoCompra) from produtos;
desc vendas;
select estoque from produtos;

select sum(estoque) from produtos;
